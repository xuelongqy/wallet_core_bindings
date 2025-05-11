import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerNebl', () {
    const coin = TWCoinType.Nebl;

    test('Sign', () {
      const amount = 1500000000;
      const fee = 2000000;
      const toAddress = "NRrKgiZfT7jUdS3geoEBproA7hzZnDQAdr";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc',
        coinType: coin.value,
        time: 1656474580,
      );

      final txHash0 = parse_hex(
              "a5a6e147da0f1b3f6dfd1081f91b0c6e31f030ae66c4be4cf4b0db0ac8b2407d")
          .reversed
          .toList();

      input.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: txHash0,
          index: 0,
          sequence: 4294967294,
        ),
        amount: $fixnum.Int64(2500000000),
      ));

      final utxoKey0 = TWPrivateKey.createWithHexString(
          '4222aae79af41eade7b07ce6fd44d926ea8e3f95e51a06e85f8bdec89680cbd9');
      final script0 = TWBitcoinScript.lockScriptForAddress(
          'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc', coin);
      expect(hex(script0.data),
          '76a914ae40b2142aba5ddd10f74d9440bfda8a36cbad5b88ac');
      input.utxo[0].script = script0.data;
      input.privateKey.add(utxoKey0.data);

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));

        plan.amount = $fixnum.Int64(amount);
        plan.fee = $fixnum.Int64(fee);
        plan.change = $fixnum.Int64(980000000);

        input.plan = plan;
      }

      Bitcoin.SigningOutput output;
      {
        output = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(output.error, Common.SigningError.OK);
      }

      // Sign
      expect(hex(output.encoded),
          '01000000d4cbbb62017d40b2c80adbb0f44cbec466ae30f0316e0c1bf98110fd6d3f1b0fda47e1a6a5000000006a47304402207f77f7ed50ec56447fd108b2a9a693b2ac9f62e99b59dfa914f242510943187602204618fd9195050c763eb93644e51344f6c00e4dd93aa41bb42bce42c9e4cc53b6012103787a4c5ff72dce6d97f9b6360dc302b2d8a833e8c570dcc124a96e5f564bb524feffffff02002f6859000000001976a914412033ed457c72ca70bab5fbfdc03256bd2ce07d88ac009d693a000000001976a914ae40b2142aba5ddd10f74d9440bfda8a36cbad5b88ac00000000');
    });
  });
}
