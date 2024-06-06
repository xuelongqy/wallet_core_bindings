import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';
import '../Bitcoin/tx_comparison_helper.dart';

void main() {
  initTest();
  group('GroestlcoinCompiler', () {
    const coin = TWCoinType.Groestlcoin;

    test('CompileWithSignatures', () {
      final utxoKey0 = parse_hex(
          "3c3385ddc6fd95ba7282051aeb440bc75820b8c10db5c83c052d7586e3e98e84");

      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.coin,
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(2500),
        byteFee: $fixnum.Int64(1),
        toAddress: 'grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne',
        changeAddress: '31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P',
        privateKey: [utxoKey0],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: TWBitcoinScript.createWithBytes(parse_hex(
                    "76a91498af0aaca388a7e1024f505c033626d908e3b54a88ac"))
                .data,
            amount: $fixnum.Int64(5000),
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  "9568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f"),
              index: 0,
              sequence: UINT32_MAX,
            ),
          ),
        ],
      );

      Bitcoin.TransactionPlan plan;
      {
        // try plan first
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        expect(verifyPlan(plan, [5000], 2500, 221), true);
      }

      // Supply plan for signing, to match fee of previously-created real TX
      input.plan = plan;
      input.plan.fee = $fixnum.Int64(226);
      input.plan.change = $fixnum.Int64(2274);

      // build preimage
      final txInputData = input.writeToBuffer();
      expect(txInputData.isNotEmpty, true);

      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.isNotEmpty, true);

      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(preSigningOutput.hashPublicKeys.length, 1);

      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      expectHex(preImageHash,
          '0fb3da786ad1028574f0b40ff1446515eb85cacccff3f3d0459e191b660597b3');

      // compile
      final publicKey = TWPrivateKey.createWithData(utxoKey0)
          .getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final signature = parse_hex(
          "304402202163ab98b028aa13563f0de00b785d6df81df5eac0b7c91d23f5be7ea674aa3702202bf6cd7055c6f8f697ce045b1a4f9b997cf6e5761a661d27696ac34064479d19");
      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature],
          publicKeys: [publicKey.data],
        );
        final signingOutput = Bitcoin.SigningOutput.fromBuffer(outputData);
        expectHex(
          signingOutput.encoded,
          "01000000019568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f000000"
          "006a47304402202163ab98b028aa13563f0de00b785d6df81df5eac0b7c91d23f5be7ea674aa3702"
          "202bf6cd7055c6f8f697ce045b1a4f9b997cf6e5761a661d27696ac34064479d19012103b85cc59b"
          "67c35851eb5060cfc3a759a482254553c5857075c9e247d74d412c91ffffffff02c4090000000000"
          "001600147557920fbc32a1ef4ef26bae5e8ce3f95abf09cee20800000000000017a9140055b0c94d"
          "f477ee6b9f75185dfc9aa8ce2e52e48700000000",
        );
        final output = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(output.encoded, signingOutput.encoded);
      }

      {
        // Negative: not enough signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature],
          publicKeys: [publicKey.data, publicKey.data],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
