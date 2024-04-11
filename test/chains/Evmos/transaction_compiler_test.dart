import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('EvmosCompiler', () {
    const coin = TWCoinType.TWCoinTypeNativeEvmos;

    test('CompileWithSignatures', () {
      // Successfully broadcasted: https://www.mintscan.io/evmos/transactions/02105B186FCA473C9F467B2D3BF487F6CE5DB26EE54BCD1667DDB7A2DA0E2489

      final privateKey = TWPrivateKey.createWithHexString(
          '727513ec3c54eb6fae24f2ff756bbc4c89b82945c6538bbd173613ae3de719d3');

      final input = Cosmos.SigningInput(
        privateKey: privateKey.data,
      );

      /// Step 1: Prepare transaction input (protobuf)
      input.accountNumber = $fixnum.Int64(106619981);
      input.chainId = 'evmos_9001-2';
      input.memo = '';
      input.sequence = $fixnum.Int64(0);

      final publicKey = privateKey.getPublicKey(coin);
      final pubKeyBz = publicKey.data;
      expectHex(pubKeyBz,
          '04088ac2919987d927368cb2be2ade44cd0ed3616745a9699cae264b3fc5a7c3607d99f441b8340990ee990cb3eaf560f1f0bafe600c7e94a4be8392166984f728');
      input.publicKey = pubKeyBz;

      input.messages.add(Cosmos.Message(
        sendCoinsMessage: Cosmos.Message_Send(
          fromAddress: 'evmos1d0jkrsd09c7pule43y3ylrul43lwwcqa7vpy0g',
          toAddress: 'evmos17dh3frt0m6kdd3m9lr6e6sr5zz0rz8cvxd7u5t',
          amounts: [
            Cosmos.Amount(
              denom: 'aevmos',
              amount: '10000000000000000',
            ),
          ],
        ),
      ));

      input.fee = Cosmos.Fee(
        gas: $fixnum.Int64(137840),
        amounts: [
          Cosmos.Amount(
            denom: 'aevmos',
            amount: '5513600000000000',
          ),
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
          '0a9c010a99010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e6412790a2c65766d6f733164306a6b7273643039633770756c6534337933796c72756c34336c7777637161377670793067122c65766d6f733137646833667274306d366b6464336d396c723665367372357a7a30727a3863767864377535741a1b0a066165766d6f7312113130303030303030303030303030303030127b0a570a4f0a282f65746865726d696e742e63727970746f2e76312e657468736563703235366b312e5075624b657912230a2102088ac2919987d927368cb2be2ade44cd0ed3616745a9699cae264b3fc5a7c36012040a02080112200a1a0a066165766d6f7312103535313336303030303030303030303010f0b4081a0c65766d6f735f393030312d3220cdc8eb32');
      expectHex(preImageHash,
          '9912eb629e215027b8d587939b1af72a9f70ae326bcaf48dfe77a729fc4ac632');

      final expectedTx =
          '{"mode":"BROADCAST_MODE_BLOCK","tx_bytes":"CpwBCpkBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEnkKLGV2bW9zMWQwamtyc2QwOWM3cHVsZTQzeTN5bHJ1bDQzbHd3Y3FhN3ZweTBnEixldm1vczE3ZGgzZnJ0MG02a2RkM205bHI2ZTZzcjV6ejByejhjdnhkN3U1dBobCgZhZXZtb3MSETEwMDAwMDAwMDAwMDAwMDAwEnsKVwpPCigvZXRoZXJtaW50LmNyeXB0by52MS5ldGhzZWNwMjU2azEuUHViS2V5EiMKIQIIisKRmYfZJzaMsr4q3kTNDtNhZ0WpaZyuJks/xafDYBIECgIIARIgChoKBmFldm1vcxIQNTUxMzYwMDAwMDAwMDAwMBDwtAgaQKrmMaaSKnohf3ahyCOYdRJKBKJjr4WkkA/cbn6FRdF0Gd6FHSzBP8S4v4VNiy3KC47TD0C+sUBO413gCzjo8/U="}';
      Uint8List signature;

      {
        final output = Cosmos.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expectJson(output.serialized, expectedTx);

        signature = Uint8List.fromList(output.signature);
        expectHex(signature,
            'aae631a6922a7a217f76a1c8239875124a04a263af85a4900fdc6e7e8545d17419de851d2cc13fc4b8bf854d8b2dca0b8ed30f40beb1404ee35de00b38e8f3f5');

        expect(
            publicKey.verify(
                signature: signature,
                message: Uint8List.fromList(preImageHash)),
            true);
      }

      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: protoInputData,
          signatures: TWDataVector.createWithData(signature),
          publicKeys: TWDataVector.createWithData(publicKey.data),
        );
        final output = Cosmos.SigningOutput.fromBuffer(outputData);

        expect(output.error, Common.SigningError.OK);
        expect(output.serialized, expectedTx);
        expectHexBytes(output.signature, signature);
      }
    });
  });
}
