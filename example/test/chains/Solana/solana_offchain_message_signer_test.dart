import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as Compiler;
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

const _coin = TWCoinType.Solana;
const _fixtures = [
  'address_proof',
  'session_challenge',
  'session_challenge_revoke_all',
  'username_claim',
  'username_claim_no_x',
  'username_rename',
];

// Verbatim fixtures from trustwallet/wallet-core 4.8.3 (5031fe6dd),
// rust/tw_tests/tests/chains/solana/fixtures/offchain_identity/.
Map<String, dynamic> _fixture(String name) => jsonDecode(
      File('$TESTS_ROOT/chains/Solana/Data/offchain_identity/$name.json')
          .readAsStringSync(),
    ) as Map<String, dynamic>;

Solana.StructuredMessage _structured(Map<String, dynamic> fixture) {
  final message = fixture['message'] as Map<String, dynamic>;
  Solana.StructuredField field(String label, String value) =>
      Solana.StructuredField(label: label, value: value);
  String timestamp(int seconds) => DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000,
        isUtc: true,
      ).toIso8601String().replaceFirst('.000Z', 'Z');
  final fields = [field('Type', fixture['type'] as String)];
  switch (fixture['type']) {
    case 'UsernameClaim':
      fields.addAll([
        field('Username', message['username'] as String),
        field('Address', message['address'] as String),
        field('X User ID', (message['x_user_id'] as String?) ?? '-'),
      ]);
    case 'UsernameRename':
      fields.addAll([
        field('Previous Username', message['previous_username'] as String),
        field('Username', message['username'] as String),
        field('Address', message['address'] as String),
      ]);
    case 'SessionChallenge':
      fields.addAll([
        field('Address', message['address'] as String),
        field('Purpose', message['purpose'] as String),
      ]);
    case 'AddressProof':
      fields.addAll([
        field('Address', message['address'] as String),
        field(
            'Anchor', '${message['anchor_coin']}:${message['anchor_address']}'),
      ]);
    default:
      throw StateError('Unknown fixture type: ${fixture['type']}');
  }
  fields.addAll([
    field('Nonce', message['nonce'] as String),
    field('Issued At', timestamp(message['issued_at'] as int)),
    field('Expires At', timestamp(message['expires_at'] as int)),
  ]);
  return Solana.StructuredMessage(
    header: 'Trust Wallet Identity v1',
    fields: fields,
    statement: fixture['statement'] as String,
  );
}

Solana.MessageSigningInput _input(Map<String, dynamic> fixture) =>
    Solana.MessageSigningInput(
      privateKey: parse_hex((fixture['seed'] as String).substring(2)),
      messageType: Solana.MessageType.MessageType_offchain_v0,
      applicationDomain: TWHash.sha256(
        Uint8List.fromList(utf8.encode('trustwallet.identity.v1')),
      ),
      structuredMessage: _structured(fixture),
    );

Solana.MessageSigningOutput _sign(Solana.MessageSigningInput input) =>
    Solana.MessageSigningOutput.fromBuffer(
      TWMessageSigner.sign(_coin, input.writeToBuffer()),
    );

Compiler.PreSigningOutput _preimage(Solana.MessageSigningInput input) =>
    Compiler.PreSigningOutput.fromBuffer(
      TWMessageSigner.preImageHashes(_coin, input.writeToBuffer()),
    );

void main() {
  initTest();

  group('Solana offchain v0', () {
    for (final name in _fixtures) {
      test('matches upstream envelope, digest and signature: $name', () {
        final fixture = _fixture(name);
        final input = _input(fixture);
        final preimage = _preimage(input);
        expect(preimage.error, Common.SigningError.OK);
        expect(
            hex(preimage.data), (fixture['envelope'] as String).substring(2));
        expect(utf8.decode(preimage.data.sublist(85)), fixture['body']);
        expect(
          hex(TWHash.sha256(Uint8List.fromList(preimage.data))),
          (fixture['digest'] as String).substring(2),
        );
        final signed = _sign(input);
        expect(signed.error, Common.SigningError.OK);
        expect(signed.errorMessage, isEmpty);
        expect(TWBase58.decodeNoCheck(signed.signature),
            base64Decode(fixture['signature'] as String));

        final publicKey = TWBase58.decodeNoCheck(fixture['signer'] as String)!;
        final verification = Solana.MessageVerifyingInput(
          publicKey: publicKey,
          signature: signed.signature,
          messageType: input.messageType,
          applicationDomain: input.applicationDomain,
          structuredMessage: _structured(fixture),
        );
        expect(TWMessageSigner.verify(_coin, verification.writeToBuffer()),
            isTrue);
        input.clearPrivateKey();
        input.publicKey = publicKey;
        final external = _preimage(input);
        expect(external.error, Common.SigningError.OK);
        expect(external.data, preimage.data);

        verification.applicationDomain = List.filled(32, 0x42);
        expect(TWMessageSigner.verify(_coin, verification.writeToBuffer()),
            isFalse);
      });
    }

    test('raw preimage needs no key and preserves legacy message field', () {
      // Original MessageSigningInput field 2, encoded before 4.8.3.
      final input = Solana.MessageSigningInput.fromBuffer([
        0x12,
        0x0b,
        ...utf8.encode('Hello world'),
      ]);
      expect(input.messageType, Solana.MessageType.MessageType_raw);
      for (final key in <List<int>>[
        [],
        [1, 2, 3]
      ]) {
        input.privateKey = key;
        final output = _preimage(input);
        expect(output.error, Common.SigningError.OK);
        expect(output.data, utf8.encode('Hello world'));
      }
    });

    test('structured payload and raw text produce identical raw signatures',
        () {
      final fixture = _fixture('address_proof');
      final input = _input(fixture)
        ..messageType = Solana.MessageType.MessageType_raw
        ..clearApplicationDomain();
      final structured = _sign(input);
      expect(structured.error, Common.SigningError.OK);
      expect(utf8.decode(_preimage(input).data), fixture['body']);
      input.message = fixture['body'] as String;
      expect(input.hasStructuredMessage(), isFalse);
      final plain = _sign(input);
      expect(plain.error, Common.SigningError.OK);
      expect(plain.signature, structured.signature);
    });

    test('rejects missing or wrong-length application domains', () {
      for (final length in [0, 31, 33]) {
        final input = _input(_fixture('address_proof'))
          ..applicationDomain = List.filled(length, 0x11);
        final output = _sign(input);
        expect(output.error, Common.SigningError.Error_invalid_params);
        expect(output.signature, isEmpty);
      }
    });

    test('rejects an offchain preimage without a signer', () {
      final input = _input(_fixture('address_proof'))..clearPrivateKey();
      final output = _preimage(input);
      expect(output.error, Common.SigningError.Error_invalid_params);
      expect(output.errorMessage, contains('public_key'));
    });

    test('rejects forged lines and empty fields', () {
      final invalidMessages = [
        Solana.StructuredMessage(header: 'Header\nPurpose: forged'),
        Solana.StructuredMessage(statement: 'Statement\nPurpose: forged'),
        for (final value in [
          'session\nPurpose: forged',
          'a\rb',
          'a\tb',
          'a\u2028b',
          'a\u2029b',
          ''
        ])
          Solana.StructuredMessage(fields: [
            Solana.StructuredField(label: 'Purpose', value: value),
          ]),
        Solana.StructuredMessage(fields: [
          Solana.StructuredField(label: 'Purpose\nAnchor', value: 'session'),
        ]),
        Solana.StructuredMessage(fields: [
          Solana.StructuredField(label: '', value: 'session'),
        ]),
      ];
      for (final message in invalidMessages) {
        final input = _input(_fixture('address_proof'))
          ..structuredMessage = message;
        final output = _sign(input);
        expect(output.error, Common.SigningError.Error_invalid_params);
        expect(output.signature, isEmpty);
      }
    });

    test('enforces the 1147-byte body limit before encoding u16 length', () {
      for (final length in [1147, 1148, 65536]) {
        final input = _input(_fixture('address_proof'))
          ..message = List.filled(length, 'x').join();
        final output = _sign(input);
        expect(
            output.error,
            length == 1147
                ? Common.SigningError.OK
                : Common.SigningError.Error_invalid_params);
      }
    });

    test('maps explicit formats and rejects non-printable restricted ASCII',
        () {
      final input = _input(_fixture('address_proof'))..message = 'hello';
      final utf8Output = _preimage(input);
      expect(utf8Output.error, Common.SigningError.OK);
      expect(utf8Output.data[49], 1);
      input.messageFormat = Solana.MessageFormat.MessageFormat_restricted_ascii;
      final asciiOutput = _preimage(input);
      expect(asciiOutput.error, Common.SigningError.OK);
      expect(asciiOutput.data[49], 0);
      final signed = _sign(input);
      expect(signed.error, Common.SigningError.OK);
      final verification = Solana.MessageVerifyingInput(
        publicKey: TWBase58.decodeNoCheck(
            _fixture('address_proof')['signer'] as String),
        signature: signed.signature,
        message: input.message,
        messageType: input.messageType,
        applicationDomain: input.applicationDomain,
        messageFormat: input.messageFormat,
      );
      expect(
          TWMessageSigner.verify(_coin, verification.writeToBuffer()), isTrue);
      verification.messageFormat = Solana.MessageFormat.MessageFormat_utf8;
      expect(
          TWMessageSigner.verify(_coin, verification.writeToBuffer()), isFalse);
      for (final message in ['hello\nworld', 'hello\tworld', 'héllo']) {
        input.message = message;
        expect(_sign(input).error, Common.SigningError.Error_invalid_params);
      }
    });

    test('raw mode rejects envelope fields instead of silently ignoring them',
        () {
      final input = _input(_fixture('address_proof'))
        ..messageType = Solana.MessageType.MessageType_raw;
      expect(_sign(input).error, Common.SigningError.Error_invalid_params);
      input.clearApplicationDomain();
      input.messageFormat = Solana.MessageFormat.MessageFormat_restricted_ascii;
      expect(_sign(input).error, Common.SigningError.Error_invalid_params);
    });
  });
}
