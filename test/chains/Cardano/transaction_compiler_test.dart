import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cardano.pb.dart' as Cardano;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('CardanoCompiler', () {
    const coin = TWCoinType.TWCoinTypeCardano;

    test('CompileWithSignaturesAndPubKeyType', () {
      /// Prepare transaction input (protobuf)
      final input = Cardano.SigningInput(
        transferMessage: Cardano.Transfer(
          toAddress:
              'addr1qxxe304qg9py8hyyqu8evfj4wln7dnms943wsugpdzzsxnkvvjljtzuwxvx0pnwelkcruy95ujkq3aw6rl0vvg32x35qc92xkq',
          changeAddress:
              'addr1v8mv75d2evhr4kt048cx7m3f97x363ajadha8xv8dp96nuggpv8rn',
          amount: $fixnum.Int64(1850000),
        ),
        utxos: [
          Cardano.TxInput(
            address:
                'addr1v8mv75d2evhr4kt048cx7m3f97x363ajadha8xv8dp96nuggpv8rn',
            amount: $fixnum.Int64(1000000),
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  'd87f6e99c8d3a0fb22b1ea4de477f5a6d1f0e419450c2a194304371cada0ebb9'),
              outputIndex: $fixnum.Int64(0),
            ),
          ),
          Cardano.TxInput(
            address:
                'addr1v8mv75d2evhr4kt048cx7m3f97x363ajadha8xv8dp96nuggpv8rn',
            amount: $fixnum.Int64(4040957),
            outPoint: Cardano.OutPoint(
              txHash: parse_hex(
                  'd87f6e99c8d3a0fb22b1ea4de477f5a6d1f0e419450c2a194304371cada0ebb9'),
              outputIndex: $fixnum.Int64(1),
            ),
            tokenAmount: [
              Cardano.TokenAmount(
                policyId:
                    '122d15a15dc753d2b3ca9ee46c1c6ca41dda38d735942d9d259c785b',
                assetNameHex: '5454546f6b656e2d31',
                amount: intToBytes(3000000),
              ),
              Cardano.TokenAmount(
                policyId:
                    '122d15a15dc753d2b3ca9ee46c1c6ca41dda38d735942d9d259c785b',
                assetName: 'TTToken-2',
                amount: intToBytes(3000000),
              ),
              Cardano.TokenAmount(
                policyId:
                    '122d15a15dc753d2b3ca9ee46c1c6ca41dda38d735942d9d259c785b',
                assetNameHex: '5454546f6b656e2d33',
                amount: intToBytes(5000000),
              ),
            ],
          ),
        ],
      );

      final inputData = input.writeToBuffer();
      final preImageHash =
          TWTransactionCompiler.preImageHashes(coin, inputData);

      final preOut =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHash);
      expectHex(preOut.dataHash,
          '3e5a7c1d1afbc7e3ca783daba1beb12010fc4ecc748722558697509212c9f186');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "17c55d712152ccabf28215fe2d008d615f94796e098a97f1aa43d986ac3cb946");
      final publicKey = TWPublicKey.createWithData(
          publicKeyData, TWPublicKeyType.TWPublicKeyTypeED25519);
      final sig = parse_hex(
          "1096ddcfb2ad21a4c0d861ef3fabe18841e8de88105b0d8e36430d7992c588634ead4100c32b2800b31b65e014d54a8238bdda63118d829bf0bcf1b631e86f0e");

      /// Compile transaction info
      const expectedTx =
          "83a40082825820d87f6e99c8d3a0fb22b1ea4de477f5a6d1f0e419450c2a194304371cada0ebb901"
          "825820d87f6e99c8d3a0fb22b1ea4de477f5a6d1f0e419450c2a194304371cada0ebb90001828258"
          "39018d98bea0414243dc84070f96265577e7e6cf702d62e871016885034ecc64bf258b8e330cf0cd"
          "d9fdb03e10b4e4ac08f5da1fdec6222a34681a001c3a9082581d61f6cf51aacb2e3ad96fa9f06f6e"
          "292f8d1d47b2eb6fd39987684ba9f1821a002e0feea1581c122d15a15dc753d2b3ca9ee46c1c6ca4"
          "1dda38d735942d9d259c785ba3495454546f6b656e2d311a002dc6c0495454546f6b656e2d321a00"
          "2dc6c0495454546f6b656e2d331a004c4b40021a0002a0bf0300a1008182582017c55d712152ccab"
          "f28215fe2d008d615f94796e098a97f1aa43d986ac3cb94658401096ddcfb2ad21a4c0d861ef3fab"
          "e18841e8de88105b0d8e36430d7992c588634ead4100c32b2800b31b65e014d54a8238bdda63118d"
          "829bf0bcf1b631e86f0ef6";
      final outData =
          TWTransactionCompiler.compilerCompileWithSignaturesAndPubKeyType(
        coin: coin,
        txInputData: inputData,
        signatures: TWDataVector.createWithData(sig),
        publicKeys: TWDataVector.createWithData(publicKeyData),
        pubKeyType: TWPublicKeyType.TWPublicKeyTypeED25519,
      );

      {
        final output = Cardano.SigningOutput.fromBuffer(outData);
        expectHex(output.encoded, expectedTx);
      }
      {
        // Negative: inconsistent signatures & publicKeys
        final outputData =
            TWTransactionCompiler.compilerCompileWithSignaturesAndPubKeyType(
          coin: coin,
          txInputData: inputData,
          signatures: TWDataVector.createWithDataList([sig, sig]),
          publicKeys: TWDataVector.createWithData(publicKeyData),
          pubKeyType: TWPublicKeyType.TWPublicKeyTypeED25519,
        );
        final output = Cardano.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }
      {
        // Negative: empty signatures
        final outputData =
            TWTransactionCompiler.compilerCompileWithSignaturesAndPubKeyType(
          coin: coin,
          txInputData: inputData,
          signatures: TWDataVector(),
          publicKeys: TWDataVector(),
          pubKeyType: TWPublicKeyType.TWPublicKeyTypeED25519,
        );
        final output = Cardano.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
