import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('KomodoCompiler', () {
    const coin = TWCoinType.Komodo;

    test('CompileWithSignatures', () {
      // tx on mainnet
      // https://kmdexplorer.io/tx/dab3e7a705b0f80f0cd557a1e727dc50d8ccd24ff0ae159ca8cdefda656d7c9b

      const amount = 892984972;
      const fee = 407;
      const toAddress = "RVUiqSDZEqTw9Ny4XRBsp6fgJKtmUj5nXD";
      final publicKey = TWPublicKey.createWithHexString(
        '021f5a3a5f78b1f0adbbd8685c2c32de45e00e5b83faa814db57ce410295405207',
        TWPublicKeyType.SECP256k1,
      );

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        coinType: coin.value,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "f6118b221c4e5f436d536eded8486f6b0cc6ab99ca424da120fec593304acd8c")
                  .reversed
                  .toList(),
              index: 1,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(892989042),
          ),
        ],
      );

      const utxoAddr0 = "R9TKEwwiDLA2oD7a1jt8YmCoX2cjg1pfEU";
      final script0 = TWBitcoinScript.lockScriptForAddress(utxoAddr0, coin);
      expect(hex(script0.data),
          '76a91401ea238017d65b2c5152a81146b95582b5284c2f88ac');
      input.utxo[0].script = script0.data;

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      expect(plan.error, Common.SigningError.OK);

      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(0);
      plan.branchId = [0xbb, 0x09, 0xb8, 0x76];

      input.plan = plan;

      // build preimage
      final txInputData = input.writeToBuffer();

      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.isNotEmpty, true);

      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(preSigningOutput.hashPublicKeys.length, 1);

      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      expect(hex(preImageHash),
          '09323f2c24af2cf44453aa228c213f26f40e1f87548031bad35cc4c65edc087a');

      // compile
      final signature0 = parse_hex(
          "3045022100fb6e7a940815bc0de683dd70ed85696ffe21199958161331e76954af2ba11b1b02204860632bcad9c5a3cbaa2d60c401f7616f529e4c65915f1996286d3bd54c01cb");
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature0],
        publicKeys: [publicKey.data],
      );
      final signingOutput = Bitcoin.SigningOutput.fromBuffer(outputData);
      expect(signingOutput.error, Common.SigningError.OK);
      expect(hex(signingOutput.encoded),
          '0400008085202f89018ccd4a3093c5fe20a14d42ca99abc60c6b6f48d8de6e536d435f4e1c228b11f6010000006b483045022100fb6e7a940815bc0de683dd70ed85696ffe21199958161331e76954af2ba11b1b02204860632bcad9c5a3cbaa2d60c401f7616f529e4c65915f1996286d3bd54c01cb0121021f5a3a5f78b1f0adbbd8685c2c32de45e00e5b83faa814db57ce410295405207ffffffff018cde3935000000001976a914dd90c41f2916bcfea10ed11cd10ed4db01c5be6488ac00000000000000000000000000000000000000');

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature0, signature0],
          publicKeys: [publicKey.data],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: empty signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
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
