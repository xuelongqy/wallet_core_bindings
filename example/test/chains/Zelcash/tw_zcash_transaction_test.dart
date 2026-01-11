import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWZelcashTransaction', () {
    const coin = TWCoinType.Zelcash;

    test('Signing', () {
      // tx on mainnet
      // https://explorer.zel.zelcore.io/tx/ac5e4683ca4859daea1e91302f43e76a12d60c3e5fa955a55ee8629260655ddf
      const amount = 144995480;
      const fee = 2260;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 't1UPSwfMYLe18ezbCqnR5QgdJGznzCUYHkj',
        coinType: coin.value,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  "5e2d98ab1f4a2bf089c6d850b876d479e2bc1716d908cce66c962aa887118815"),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(144997740),
            script:
                parse_hex("76a9140170e9c060b0609774ac76144d56f59e4a15066988ac"),
          ),
        ],
        privateKey: [
          parse_hex(
              "eda043f40029e67edc6e9edba61f47795e03ad57169074ac81e898c04cc45b29"),
        ],
      );

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        plan.amount = $fixnum.Int64(amount);
        plan.fee = $fixnum.Int64(fee);
        plan.change = $fixnum.Int64(0);
        plan.branchId = [0xbb, 0x09, 0xb8, 0x76];

        input.plan = plan;
      }

      // Sign
      Bitcoin.SigningOutput output;
      {
        output = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(output.error, Common.SigningError.OK);
      }

      expect(
        hex(output.encoded),
        "04000080"
        "85202f89"
        "01"
        "5e2d98ab1f4a2bf089c6d850b876d479e2bc1716d908cce66c962aa887118815"
        "00000000"
        "6a473044022002f181eeeab108a94a99a5aa0f4aaaf2236f8ea8c0db39ebfdcff8511f55df2102206c67f325099ca5b0a82e7d5d2b5b600cf4e3c8aec90ae7655b89e14282319a6a012103eeb334e219744f26ce6bffbdc2122bc13060606a2f696a5891fb101a82c80551"
        "ffffffff"
        "01"
        "9874a40800000000"
        "1976a91473562bc6a1db9dc6effebc1ef4379942feb3cf2c88ac"
        "00000000"
        "00000000"
        "0000000000000000"
        "00"
        "00"
        "00",
      );
    });
  });
}
