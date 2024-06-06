import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('VergeSigner', () {
    const coin = TWCoinType.Verge;

    test('Sign', () {
      const amount = 1500000000;
      const fee = 2000000;
      const toAddress = "DQYMMpqPrnWYZaikKGTQqk5ydUaQw8nkdD";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'DAkEo5pNELZav7MRwBfEwHRG1aChgSUw6c',
        coinType: coin.coin,
        time: 1656474580,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "a5a6e147da0f1b3f6dfd1081f91b0c6e31f030ae66c4be4cf4b0db0ac8b2407d")
                  .reversed
                  .toList(),
              index: 0,
              sequence: 4294967294,
            ),
            amount: $fixnum.Int64(2500000000),
          ),
        ],
        privateKey: [
          parse_hex(
              "693dfe6f3ed717573eb10c24ebe5eb592fa3c239245cd499c487eb7b8ea7ed3a"),
        ],
      );

      final script0 = TWBitcoinScript.lockScriptForAddress(
          'DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E', coin);
      expect(hex(script0.data),
          '76a914e4839a523f120882d11eb3dda13a18e11fdcbd4a88ac');
      input.utxo[0].script = script0.data;

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(980000000);

      input.plan = plan;

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);

      expect(hex(output.encoded),
          '01000000d4cbbb62017d40b2c80adbb0f44cbec466ae30f0316e0c1bf98110fd6d3f1b0fda47e1a6a5000000006b483045022100bf1d0e5f84e70e699f45dd4822ecdbbfb1687e61ac749354a76f2afa2e13f76602202d4f5cda7177282b58f80163fead42300468670d03c5f4bb1db3b9596f2dcea301210220ee0423797a856fdd2e85876a60bf10f8696e6ae83e744f498f2173237fe23dfeffffff02002f6859000000001976a914d4d05406c3ca73cf887911f80c852a1c0773615088ac009d693a000000001976a9143d7e143a8b3c8a4aa2f51104da380edeb6c3fc2088ac00000000');
    });

    test('SignAnyoneCanPay', () {
      const amount = 1500000000;
      const fee = 2000000;
      const toAddress = "DQYMMpqPrnWYZaikKGTQqk5ydUaQw8nkdD";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.AnyoneCanPay.type |
            TWBitcoinSigHashType.Single.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'DAkEo5pNELZav7MRwBfEwHRG1aChgSUw6c',
        coinType: coin.coin,
        time: 1656474580,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "a5a6e147da0f1b3f6dfd1081f91b0c6e31f030ae66c4be4cf4b0db0ac8b2407d")
                  .reversed
                  .toList(),
              index: 0,
              sequence: 4294967294,
            ),
            amount: $fixnum.Int64(2500000000),
          ),
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "29bd442521ea303afb09ad2583f589a6527c9218c050882b6b8527bbe4d11766")
                  .reversed
                  .toList(),
              index: 0,
              sequence: 4294967294,
            ),
            amount: $fixnum.Int64(200000000),
          ),
        ],
        privateKey: [
          parse_hex(
              "693dfe6f3ed717573eb10c24ebe5eb592fa3c239245cd499c487eb7b8ea7ed3a"),
        ],
      );

      final script0 = TWBitcoinScript.lockScriptForAddress(
          'vg1qujpe553lzgyg95g7k0w6zwscuy0ae022h4q4zg', coin);
      expect(hex(script0.data), '0014e4839a523f120882d11eb3dda13a18e11fdcbd4a');
      input.utxo[0].script = script0.data;

      final script1 = TWBitcoinScript.lockScriptForAddress(
          'DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E', coin);
      expect(hex(script1.data),
          '76a914e4839a523f120882d11eb3dda13a18e11fdcbd4a88ac');
      input.utxo[1].script = script1.data;

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(1000000000);

      input.plan = plan;

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);

      expect(hex(output.encoded),
          '01000000d4cbbb620001017d40b2c80adbb0f44cbec466ae30f0316e0c1bf98110fd6d3f1b0fda47e1a6a50000000000feffffff02002f6859000000001976a914d4d05406c3ca73cf887911f80c852a1c0773615088ac00ca9a3b000000001976a9143d7e143a8b3c8a4aa2f51104da380edeb6c3fc2088ac02473044022016413b2d31c16d185cdf7c0ae343b14eee586124a8fa65bfaaec6a35eeb54e13022073e3d73d251d97fd951201ab184cdb101627317866e199ac0963b83b17e5f3bf83210220ee0423797a856fdd2e85876a60bf10f8696e6ae83e744f498f2173237fe23d00000000');
    });

    test('SignSegwit', () {
      const amount = 1500000000;
      const fee = 2000000;
      const toAddress = "DQYMMpqPrnWYZaikKGTQqk5ydUaQw8nkdD";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'DAkEo5pNELZav7MRwBfEwHRG1aChgSUw6c',
        coinType: coin.coin,
        time: 1656474580,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "a5a6e147da0f1b3f6dfd1081f91b0c6e31f030ae66c4be4cf4b0db0ac8b2407d")
                  .reversed
                  .toList(),
              index: 0,
              sequence: 4294967294,
            ),
            amount: $fixnum.Int64(2500000000),
          ),
        ],
        privateKey: [
          parse_hex(
              "693dfe6f3ed717573eb10c24ebe5eb592fa3c239245cd499c487eb7b8ea7ed3a"),
        ],
      );

      final script0 = TWBitcoinScript.lockScriptForAddress(
          'vg1qujpe553lzgyg95g7k0w6zwscuy0ae022h4q4zg', coin);
      expect(hex(script0.data), '0014e4839a523f120882d11eb3dda13a18e11fdcbd4a');
      input.utxo[0].script = script0.data;

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(980000000);

      input.plan = plan;

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);

      expect(hex(output.encoded),
          '01000000d4cbbb620001017d40b2c80adbb0f44cbec466ae30f0316e0c1bf98110fd6d3f1b0fda47e1a6a50000000000feffffff02002f6859000000001976a914d4d05406c3ca73cf887911f80c852a1c0773615088ac009d693a000000001976a9143d7e143a8b3c8a4aa2f51104da380edeb6c3fc2088ac024730440220657132a334ffbb15f6bbcd11da743756534c2c345195e19c007d67224f09703f022036cebc6442e212be80b74d5992cfd70355e603c1e538e84e02fecf49f82f2f8a01210220ee0423797a856fdd2e85876a60bf10f8696e6ae83e744f498f2173237fe23d00000000');
    });

    test('SignWithError', () {
      const amount = 1500000000;
      const toAddress = "DQYMMpqPrnWYZaikKGTQqk5ydUaQw8nkdD";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'DAkEo5pNELZav7MRwBfEwHRG1aChgSUw6c',
        coinType: coin.coin,
        time: 1656474580,
      );

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error != Common.SigningError.OK, true);

      expect(output.encoded.isEmpty, true);
    });
  });
}
