import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Aptos.pb.dart' as Aptos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('AptosCompiler', () {
    test('StandardTransaction', () {
      // Set up a signing input.
      final input = Aptos.SigningInput(
        sender:
            '0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30',
        sequenceNumber: $fixnum.Int64(99),
        transfer: Aptos.TransferMessage(
          to: '0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30',
          amount: $fixnum.Int64(1000),
        ),
        maxGasAmount: $fixnum.Int64(3296766),
        gasUnitPrice: $fixnum.Int64(100),
        expirationTimestampSecs: $fixnum.Int64(3664390082),
        chainId: 33,
      );

      final inputData = input.writeToBuffer();

      // Pre-hash the transaction.
      final preImageHashesData = TWTransactionCompiler.preImageHashes(
          TWCoinType.TWCoinTypeAptos, inputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final actualDataToSign = Uint8List.fromList(preSigningOutput.data);

      expect(preSigningOutput.error, Common.SigningError.OK);
      expectHex(actualDataToSign,
          'b5e97db07fa0bd0e5598aa3643a9bc6f6693bddc1a9fec9e674a461eaa00b19307968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3063000000000000000200000000000000000000000000000000000000000000000000000000000000010d6170746f735f6163636f756e74087472616e7366657200022007968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3008e803000000000000fe4d3200000000006400000000000000c2276ada0000000021');

      // Sign the pre-hash data.

      final privateKey = TWPrivateKey.createWithHexString(
          '5d996aa76b3212142792d9130796cd2e11e3c445a93118c08414df4f66bc60ec');
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519)
          .data;
      final signature =
          privateKey.sign(actualDataToSign, TWCurve.TWCurveED25519);
      expectHex(signature,
          '5707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01');

      // Compile the transaction.

      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: TWCoinType.TWCoinTypeAptos,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKey],
      );
      final output = Aptos.SigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expectHex(output.rawTxn,
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3063000000000000000200000000000000000000000000000000000000000000000000000000000000010d6170746f735f6163636f756e74087472616e7366657200022007968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3008e803000000000000fe4d3200000000006400000000000000c2276ada0000000021');
      expectHex(output.authenticator.signature,
          '5707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01');
      expectHex(output.encoded,
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3063000000000000000200000000000000000000000000000000000000000000000000000000000000010d6170746f735f6163636f756e74087472616e7366657200022007968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f3008e803000000000000fe4d3200000000006400000000000000c2276ada00000000210020ea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c405707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01');
      final expectedJson = '''
{
    "expiration_timestamp_secs": "3664390082",
    "gas_unit_price": "100",
    "max_gas_amount": "3296766",
    "payload": {
        "arguments": ["0x7968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30","1000"],
        "function": "0x1::aptos_account::transfer",
        "type": "entry_function_payload",
        "type_arguments": []
    },
    "sender": "0x7968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30",
    "sequence_number": "99",
    "signature": {
        "public_key": "0xea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c",
        "signature": "0x5707246db31e2335edc4316a7a656a11691d1d1647f6e864d1ab12f43428aaaf806cf02120d0b608cdd89c5c904af7b137432aacdd60cc53f9fad7bd33578e01",
        "type": "ed25519_signature"
    }
}
''';
      final parsedJson = output.json;
      expectJson(expectedJson, parsedJson);
    });

    test('BlindTransactionJson', () {
      // Successfully broadcasted: https://explorer.aptoslabs.com/txn/0x7efd69e7f9462774b932ce500ab51c0d0dcc004cf272e09f8ffd5804c2a84e33?network=mainnet
      final payloadJson = '''
{
    "function": "0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeSwapPoolV1::swap_exact_coins_for_coins_3_pair_entry",
    "type_arguments": [
            "0x1::aptos_coin::AptosCoin",
            "0x881ac202b1f1e6ad4efcff7a1d0579411533f2502417a19211cfc49751ddb5f4::coin::MOJO",
            "0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDT",
            "0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDC"
        ],
    "arguments": [
            "1000000",
            "49329"
        ],
    "type": "entry_function_payload"
}
''';
      final input = Aptos.SigningInput(
        sequenceNumber: $fixnum.Int64(42),
        sender:
            '0x07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30',
        gasUnitPrice: $fixnum.Int64(100),
        maxGasAmount: $fixnum.Int64(100011),
        expirationTimestampSecs: $fixnum.Int64(3664390082),
        anyEncoded: payloadJson,
        chainId: 1,
      );

      final inputData = input.writeToBuffer();

      // Pre-hash the transaction.

      final preImageHashesData = TWTransactionCompiler.preImageHashes(
          TWCoinType.TWCoinTypeAptos, inputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final actualDataToSign = Uint8List.fromList(preSigningOutput.data);

      expect(preSigningOutput.error, Common.SigningError.OK);
      expectHex(actualDataToSign,
          'b5e97db07fa0bd0e5598aa3643a9bc6f6693bddc1a9fec9e674a461eaa00b19307968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f302a000000000000000216fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c0f416e696d6553776170506f6f6c563127737761705f65786163745f636f696e735f666f725f636f696e735f335f706169725f656e747279040700000000000000000000000000000000000000000000000000000000000000010a6170746f735f636f696e094170746f73436f696e0007881ac202b1f1e6ad4efcff7a1d0579411533f2502417a19211cfc49751ddb5f404636f696e044d4f4a4f0007f22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa05617373657404555344540007f22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa056173736574045553444300020840420f000000000008b1c0000000000000ab860100000000006400000000000000c2276ada0000000001');

      // Sign the pre-hash data.

      final privateKey = TWPrivateKey.createWithHexString(
          '5d996aa76b3212142792d9130796cd2e11e3c445a93118c08414df4f66bc60ec');
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeED25519)
          .data;
      final signature =
          privateKey.sign(actualDataToSign, TWCurve.TWCurveED25519);
      expectHex(signature,
          '42cd67406e85afd1e948e7ad7f5f484fb4c60d82b267c6b6b28a92301e228b983206d2b87cd5487cf9acfb0effbd183ab90123570eb2e047cb152d337152210b');

      // Compile the transaction.

      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: TWCoinType.TWCoinTypeAptos,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKey],
      );
      final output = Aptos.SigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expectHex(output.rawTxn,
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f302a000000000000000216fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c0f416e696d6553776170506f6f6c563127737761705f65786163745f636f696e735f666f725f636f696e735f335f706169725f656e747279040700000000000000000000000000000000000000000000000000000000000000010a6170746f735f636f696e094170746f73436f696e0007881ac202b1f1e6ad4efcff7a1d0579411533f2502417a19211cfc49751ddb5f404636f696e044d4f4a4f0007f22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa05617373657404555344540007f22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa056173736574045553444300020840420f000000000008b1c0000000000000ab860100000000006400000000000000c2276ada0000000001');
      expectHex(output.authenticator.signature,
          '42cd67406e85afd1e948e7ad7f5f484fb4c60d82b267c6b6b28a92301e228b983206d2b87cd5487cf9acfb0effbd183ab90123570eb2e047cb152d337152210b');
      expectHex(output.encoded,
          '07968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f302a000000000000000216fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c0f416e696d6553776170506f6f6c563127737761705f65786163745f636f696e735f666f725f636f696e735f335f706169725f656e747279040700000000000000000000000000000000000000000000000000000000000000010a6170746f735f636f696e094170746f73436f696e0007881ac202b1f1e6ad4efcff7a1d0579411533f2502417a19211cfc49751ddb5f404636f696e044d4f4a4f0007f22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa05617373657404555344540007f22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa056173736574045553444300020840420f000000000008b1c0000000000000ab860100000000006400000000000000c2276ada00000000010020ea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c4042cd67406e85afd1e948e7ad7f5f484fb4c60d82b267c6b6b28a92301e228b983206d2b87cd5487cf9acfb0effbd183ab90123570eb2e047cb152d337152210b');
      final expectedJson = '''
{
        "expiration_timestamp_secs": "3664390082",
        "gas_unit_price": "100",
        "max_gas_amount": "100011",
        "payload": {
            "function": "0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeSwapPoolV1::swap_exact_coins_for_coins_3_pair_entry",
            "type_arguments": [
                "0x1::aptos_coin::AptosCoin",
                "0x881ac202b1f1e6ad4efcff7a1d0579411533f2502417a19211cfc49751ddb5f4::coin::MOJO",
                "0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDT",
                "0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDC"
            ],
            "arguments": [
                "1000000",
                "49329"
            ],
            "type": "entry_function_payload"
        },
        "sender": "0x7968dab936c1bad187c60ce4082f307d030d780e91e694ae03aef16aba73f30",
        "sequence_number": "42",
        "signature": {
            "public_key": "0xea526ba1710343d953461ff68641f1b7df5f23b9042ffa2d2a798d3adb3f3d6c",
            "signature": "0x42cd67406e85afd1e948e7ad7f5f484fb4c60d82b267c6b6b28a92301e228b983206d2b87cd5487cf9acfb0effbd183ab90123570eb2e047cb152d337152210b",
            "type": "ed25519_signature"
        }
}
''';
      final parsedJson = output.json;
      expectJson(expectedJson, parsedJson);
    });
  });
}
