import 'dart:math';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';
import 'tx_comparison_helper.dart';

void main() {
  group('TransactionPlan', () {
    test('OneTypical', () {
      final utxos = buildTestUTXOs([100000]);
      final byteFee = 1;
      final sigingInput = buildSigningInput(50000, byteFee, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [100000], 50000, 147), true);
    });

    test('OneInsufficient', () {
      final utxos = buildTestUTXOs([100000]);
      final sigingInput = buildSigningInput(200000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // Max is returned
      expect(verifyPlan(txPlan, [100000], 99887, 113), true);
    });

    test('OneInsufficientEqual', () {
      final utxos = buildTestUTXOs([100000]);
      final sigingInput = buildSigningInput(100000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // Max is returned
      expect(verifyPlan(txPlan, [100000], 99887, 113), true);
    });
  });
}
