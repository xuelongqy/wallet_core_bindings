import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Decred.pb.dart' as Decred;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('DecredCompiler', () {
    const coin = TWCoinType.TWCoinTypeDecred;

    test('CompileWithSignatures', () {
      final utxoValue = 39900000;
      final amount = 10000000;
      final fee = 100000;

      final utxoKey = parse_hex(
          "ba005cd605d8a02e3d5dfd04234cef3a3ee4f76bfbad2722d1fb5af8e12e6764");

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'Dsesp1V6DZDEtcq2behmBVKdYqKMdkh96hL',
        changeAddress: 'DsUoWCAxprdGNtKQqambFbTcSBgH1SHn9Gp',
        coinType: coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(utxoValue),
            script:
                parse_hex("76a914b75fdec70b2e731795dd123ab40f918bf099fee088ac"),
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  "fdbfe9dd703f306794a467f175be5bd9748a7925033ea1cf9889d7cf4dd11550"),
              index: 0,
            ),
          ),
        ],
      );

      input.plan = Bitcoin.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(utxoValue),
        fee: $fixnum.Int64(fee),
        change: $fixnum.Int64(utxoValue - amount - fee),
        utxos: [
          input.utxo[0],
        ],
      );

      // build preimage
      final txInputData = input.writeToBuffer();
      expect(txInputData.length != 0, true);

      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.length != 0, true);

      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(preSigningOutput.hashPublicKeys.length, 1);

      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      expectHex(preImageHash,
          '9e4305478d1a69ee5c89a2e234d1cf270798d447d5db983b8fc3c817afddec34');

      // compile
      final publicKey = TWPrivateKey.createWithData(utxoKey)
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final signature = parse_hex(
          "304402206ee887c9239e5fff0048674bdfff2a8cfbeec6cd4a3ccebcc12fac44b24cc5ac0220718f7c760818fde18bc5ba8457d43d5a145cc4cf13d2a5557cba9107e9f4558d");
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final signingOutput = Decred.SigningOutput.fromBuffer(outputData);
      expectHex(signingOutput.encoded,
          '0100000001fdbfe9dd703f306794a467f175be5bd9748a7925033ea1cf9889d7cf4dd1155000000000000000000002809698000000000000001976a914989b1aecabf1c24e213cc0f2d8a22ffee25dd4e188ac40b6c6010000000000001976a9142a194fc92e27fef9cc2b057bc9060c580cbb484888ac000000000000000001000000000000000000000000ffffffff6a47304402206ee887c9239e5fff0048674bdfff2a8cfbeec6cd4a3ccebcc12fac44b24cc5ac0220718f7c760818fde18bc5ba8457d43d5a145cc4cf13d2a5557cba9107e9f4558d0121026cc34b92cefb3a4537b3edb0b6044c04af27c01583c577823ecc69a9a21119b6');

      {
        input.privateKey.add(utxoKey);
        final output = Decred.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expectHexBytes(output.encoded, signingOutput.encoded);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Decred.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
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
        final output = Decred.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });

    test('UtxoWithTree', () {
      final utxoValue = 10000000;
      final amount = 1000000;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'Dcur2mcGjmENx4DhNqDctW5wJCVyT3Qeqkx',
        changeAddress: 'DskhnpQqQVgoSuKeyM6Unn2CEbfaenbcJBT',
        coinType: coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            amount: $fixnum.Int64(utxoValue),
            script: TWBitcoinScript.lockScriptForAddress(
                    'DskhnpQqQVgoSuKeyM6Unn2CEbfaenbcJBT', coin)
                .data,
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "3f7b77a111634faa107c539b0c7db54e2cdbddc0c979568034aaa1ef56d2db90")
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
              tree: 1,
            ),
          ),
        ],
      );

      // build preimage
      final txInputData = input.writeToBuffer();
      expect(txInputData.length != 0, true);

      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.length != 0, true);

      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(preSigningOutput.hashPublicKeys.length, 1);

      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      expectHex(preImageHash,
          'cca7dcac2ac86f40037a51aeac7b6aaacf57e3304354449e140b698023b3fce7');
    });
  });
}
