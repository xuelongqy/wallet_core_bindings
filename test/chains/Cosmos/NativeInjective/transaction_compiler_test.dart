import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('NativeInjectiveCompiler', () {
    const coin = TWCoinType.TWCoinTypeNativeInjective;

    test('CompileWithSignatures', () {
      // Successfully broadcasted: https://www.mintscan.io/injective/transactions/B77D61590353C4AEDEAE2BBFF9E406DCF90E8D3A1A723BF22860F1E0A2617058

      final input = Cosmos.SigningInput();

      final privateKey = TWPrivateKey.createWithHexString(
          '727513ec3c54eb6fae24f2ff756bbc4c89b82945c6538bbd173613ae3de719d3');
      input.privateKey = privateKey.data;

      /// Step 1: Prepare transaction input (protobuf)
      input.accountNumber = $fixnum.Int64(88701);
      input.chainId = 'injective-1';
      input.memo = '';
      input.sequence = $fixnum.Int64(0);

      final publicKey = privateKey.getPublicKey(coin);
      final pubkeyBz = publicKey.data;
      expectHex(pubkeyBz,
          '04088ac2919987d927368cb2be2ade44cd0ed3616745a9699cae264b3fc5a7c3607d99f441b8340990ee990cb3eaf560f1f0bafe600c7e94a4be8392166984f728');
      input.publicKey = pubkeyBz;

      input.messages.add(Cosmos.Message(
        sendCoinsMessage: Cosmos.Message_Send(
          fromAddress: 'inj1d0jkrsd09c7pule43y3ylrul43lwwcqaky8w8c',
          toAddress: 'inj1xmpkmxr4as00em23tc2zgmuyy2gr4h3wgcl6vd',
          amounts: [
            Cosmos.Amount(denom: 'inj', amount: '10000000000'),
          ],
        ),
      ));
      input.fee = Cosmos.Fee(
        gas: $fixnum.Int64(110000),
        amounts: [
          Cosmos.Amount(denom: 'inj', amount: '100000000000000'),
        ],
      );

      /// Step 2: Obtain protobuf preimage hash
      input.signingMode = Cosmos.SigningMode.Protobuf;
      final protoInputData = input.writeToBuffer();

      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, protoInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);
      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;

      expectHex(preImage,
          '0a8f010a8c010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e64126c0a2a696e6a3164306a6b7273643039633770756c6534337933796c72756c34336c77776371616b7938773863122a696e6a31786d706b6d78723461733030656d32337463327a676d7579793267723468337767636c3676641a120a03696e6a120b3130303030303030303030129c010a7c0a740a2d2f696e6a6563746976652e63727970746f2e763162657461312e657468736563703235366b312e5075624b657912430a4104088ac2919987d927368cb2be2ade44cd0ed3616745a9699cae264b3fc5a7c3607d99f441b8340990ee990cb3eaf560f1f0bafe600c7e94a4be8392166984f72812040a020801121c0a160a03696e6a120f31303030303030303030303030303010b0db061a0b696e6a6563746976652d3120fdb405');
      expectHex(preImageHash,
          '57dc10c3d1893ff16e1f5a47fa4b2e96f37b9c57d98a42d88c971debb4947ec9');

      final expectedTx =
          '{"mode":"BROADCAST_MODE_BLOCK","tx_bytes":"Co8BCowBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmwKKmluajFkMGprcnNkMDljN3B1bGU0M3kzeWxydWw0M2x3d2NxYWt5OHc4YxIqaW5qMXhtcGtteHI0YXMwMGVtMjN0YzJ6Z211eXkyZ3I0aDN3Z2NsNnZkGhIKA2luahILMTAwMDAwMDAwMDASnAEKfAp0Ci0vaW5qZWN0aXZlLmNyeXB0by52MWJldGExLmV0aHNlY3AyNTZrMS5QdWJLZXkSQwpBBAiKwpGZh9knNoyyvireRM0O02FnRalpnK4mSz/Fp8NgfZn0Qbg0CZDumQyz6vVg8fC6/mAMfpSkvoOSFmmE9ygSBAoCCAESHAoWCgNpbmoSDzEwMDAwMDAwMDAwMDAwMBCw2wYaQPep7ApSEXC7VWbKlz08c6G2mxYtmc4CIFkYmZHsRAY3MzOU/xyedfrYTrEUOTlp8gmJsDbx3+0olJ6QbcAHdCE="}';

      Uint8List signature;

      {
        final output = Cosmos.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expectJson(output.serialized, expectedTx);

        signature = Uint8List.fromList(output.signature);
        expectHex(signature,
            'f7a9ec0a521170bb5566ca973d3c73a1b69b162d99ce022059189991ec440637333394ff1c9e75fad84eb114393969f20989b036f1dfed28949e906dc0077421');
        expect(
          publicKey.verify(
              signature: Uint8List.fromList(signature),
              message: Uint8List.fromList(preImageHash)),
          true,
        );
      }

      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: protoInputData,
          signatures: [Uint8List.fromList(signature)],
          publicKeys: [Uint8List.fromList(publicKey.data)],
        );

        final output = Cosmos.SigningOutput.fromBuffer(outputData);

        expect(output.error, Common.SigningError.OK);
        expect(output.serialized, expectedTx);
        expectHex(output.signature,
            'f7a9ec0a521170bb5566ca973d3c73a1b69b162d99ce022059189991ec440637333394ff1c9e75fad84eb114393969f20989b036f1dfed28949e906dc0077421');
      }
    });
  });
}
