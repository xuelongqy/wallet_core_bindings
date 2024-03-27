import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Binance.pb.dart' as Binance;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('BinanceCompiler', () {
    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      const coin = TWCoinType.TWCoinTypeBinance;
      // bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2
      final fromAddressData =
          TWData.createWithHexString('40c2979694bbc961023d1d27be6fc4d21a9febe6')
              .bytes()!;
      // bnb1hlly02l6ahjsgxw9wlcswnlwdhg4xhx38yxpd5
      final toAddressData =
          TWData.createWithHexString('bffe47abfaede50419c577f1074fee6dd1535cd1')
              .bytes()!;

      final txInput = Binance.SigningInput(
        chainId: 'Binance-Chain-Nile',
        sendOrder: Binance.SendOrder(
          inputs: [
            Binance.SendOrder_Input(
              address: fromAddressData,
              coins: [
                Binance.SendOrder_Token(
                  denom: 'BNB',
                  amount: $fixnum.Int64(1),
                ),
              ],
            ),
          ],
          outputs: [
            Binance.SendOrder_Output(
              address: toAddressData,
              coins: [
                Binance.SendOrder_Token(
                  denom: 'BNB',
                  amount: $fixnum.Int64(1),
                ),
              ],
            ),
          ],
        ),
      );

      final txInputData = txInput.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.length == 0, false);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expectHex(preImageHash,
          '3f3fece9059e714d303a9a1496ddade8f2c38fa78fc4cc2e505c5dbb0ea678d1');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = TWData.createWithHexString(
              '026a35920088d98c3888ca68c53dfc93f4564602606cbb87f0fe5ee533db38e502')
          .bytes()!;
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final signature = TWData.createWithHexString(
              '1b1181faec30b60a2ddaa2804c253cf264c69180ec31814929b5de62088c0c5a45e8a816d1208fc5366bb8b041781a6771248550d04094c3d7a504f9e8310679')
          .bytes()!;

      // Verify signature (pubkey & hash & signature)
      {
        expect(
            publicKey.verify(
                signature: signature,
                message: Uint8List.fromList(preImageHash)),
            true);
      }

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: TWDataVector.createWithData(signature),
        publicKeys: TWDataVector.createWithData(publicKeyData),
      );
      final ExpectedTx =
          "b801f0625dee0a462a2c87fa0a1f0a1440c2979694bbc961023d1d27be6fc4d21a9febe612070a03424e421001"
          "121f0a14bffe47abfaede50419c577f1074fee6dd1535cd112070a03424e421001126a0a26eb5ae98721026a35"
          "920088d98c3888ca68c53dfc93f4564602606cbb87f0fe5ee533db38e50212401b1181faec30b60a2ddaa2804c"
          "253cf264c69180ec31814929b5de62088c0c5a45e8a816d1208fc5366bb8b041781a6771248550d04094c3d7a5"
          "04f9e8310679";
      {
        final output = Binance.SigningOutput.fromBuffer(outputData);
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final input = Binance.SigningInput.fromBuffer(txInputData);
        final key = TWData.createWithHexString(
                '95949f757db1f57ca94a5dff23314accbe7abee89597bf6a3c7382c84d7eb832')
            .bytes()!;
        input.privateKey = key;

        final output = Binance.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: TWDataVector.createWithDataList([signature, signature]),
          publicKeys: TWDataVector.createWithData(publicKeyData),
        );
        final output = Binance.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: TWDataVector(),
          publicKeys: TWDataVector(),
        );
        final output = Binance.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}
