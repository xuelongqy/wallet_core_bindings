import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('ZcashCompiler', () {
    const coin = TWCoinType.Zcash;

    test('CompileWithSignatures', () {
      // tx on mainnet
      // https://explorer.zcha.in/transactions/387939ff8eb07dd264376eeef2e126394ab139802b1d80e92b21c1a2ae54fe92
      const amount = 17615;
      const fee = 10000;
      const toAddress = "t1biXYN8wJahR76SqZTe1LBzTLf3JAsmT93";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        coinType: coin.coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "2381825cd9069a200944996257e25b9403ba3e296bbc1dd98b01019cc7028cde")
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(27615),
          ),
        ],
      );

      // real key 1p "m/44'/133'/0'/0/14"
      final utxoKey0 = TWPrivateKey.createWithHexString(
          '0x4646464646464646464646464646464646464646464646464646464646464646');
      final utxoAddr0 = coin.deriveAddress(utxoKey0);
      final script0 = TWBitcoinScript.lockScriptForAddress(utxoAddr0, coin);
      input.utxo[0].script = script0.data;
      input.privateKey.add(utxoKey0.data);

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        plan.amount = $fixnum.Int64(amount);
        plan.fee = $fixnum.Int64(fee);
        plan.change = $fixnum.Int64(0);

        input.plan = plan;
      }

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

      final preImageHash =
          Uint16List.fromList(preSigningOutput.hashPublicKeys[0].dataHash);
      expect(hex(preImageHash),
          '1472faba6529ac6d88f87f6ab881e438c3c8a17482b4a82ef13212333868258a');

      // compile
      final publicKey = utxoKey0.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final signature = parse_hex(
          "3045022100e6e5071811c08d0c2e81cb8682ee36a8c6b645f5c08747acd3e828de2a4d8a9602200b13b36a838c7e8af81f2d6e7e694ede28833a480cfbaaa68a47187655298a7f");
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final signingOutput = Bitcoin.SigningOutput.fromBuffer(outputData);
      expect(hex(signingOutput.encoded),
          '0400008085202f8901de8c02c79c01018bd91dbc6b293eba03945be25762994409209a06d95c828123000000006b483045022100e6e5071811c08d0c2e81cb8682ee36a8c6b645f5c08747acd3e828de2a4d8a9602200b13b36a838c7e8af81f2d6e7e694ede28833a480cfbaaa68a47187655298a7f0121024bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382ffffffff01cf440000000000001976a914c3bacb129d85288a3deb5890ca9b711f7f71392688ac00000000000000000000000000000000000000');

      {
        final result = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(result.encoded, signingOutput.encoded);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
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
