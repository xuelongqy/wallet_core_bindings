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

    test('OneInsufficientLower100', () {
      // requested is only slightly lower than avail, not enough for fee, cannot be satisfied
      final utxos = buildTestUTXOs([100000]);
      final sigingInput = buildSigningInput(100000 - 100, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(
          verifyPlan(
              txPlan, [], 0, 0, Common.SigningError.Error_not_enough_utxos),
          true);
    });

    test('OneSufficientLower170', () {
      // requested is only slightly lower than avail, not enough for fee, cannot be satisfied
      final utxos = buildTestUTXOs([100000]);
      final sigingInput = buildSigningInput(100000 - 170, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final dustChange = 23;
      final actualFee = 147 + dustChange;
      expect(verifyPlan(txPlan, [100000], 100000 - 170, actualFee), true);
    });

    test('OneMoreRequested', () {
      final utxos = buildTestUTXOs([100000]);
      final byteFee = 1;
      final sigingInput = buildSigningInput(150000, byteFee, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // Max is returned
      expect(verifyPlan(txPlan, [100000], 99887, 113), true);
    });

    test('OneFitsExactly', () {
      final utxos = buildTestUTXOs([100000]);
      final byteFee = 1;
      final dustChange = 27;
      // Change amount is too low (less than dust), so we just waste it as the transaction fee.
      final expectedFee = 147 + dustChange;
      final sigingInput = buildSigningInput(100000 - 174, byteFee, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [100000], 100000 - 174, expectedFee), true);
    });

    test('OneFitsExactlyHighFee', () {
      final utxos = buildTestUTXOs([100000]);
      final byteFee = 10;
      final dustChange = 270;
      // Change amount is too low (less than dust), so we just waste it as the transaction fee.
      final expectedFee = 1470 + dustChange;
      final sigingInput = buildSigningInput(100000 - 1740, byteFee, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [100000], 100000 - 1740, expectedFee), true);
    });

    test('OneMissingPrivateKey', () {
      final utxos = buildTestUTXOs([100000]);
      final byteFee = 1;
      final sigingInput = buildSigningInput(
        50000,
        byteFee,
        utxos,
        false,
        TWCoinType.TWCoinTypeBitcoin,
        true,
      );

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [100000], 50000, 147), true);
    });

    test('TwoSecondEnough', () {
      final utxos = buildTestUTXOs([20000, 80000]);
      final sigingInput = buildSigningInput(70000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [80000], 70000, 147), true);
    });

    test('TwoBoth', () {
      final utxos = buildTestUTXOs([20000, 80000]);
      final sigingInput = buildSigningInput(90000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [20000, 80000], 90000, 215), true);
    });

    test('TwoFirstEnoughButSecond', () {
      final utxos = buildTestUTXOs([20000, 22000]);
      final sigingInput = buildSigningInput(18000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [22000], 18000, 147), true);
    });

    test('ThreeNoDust', () {
      final utxos = buildTestUTXOs([100000, 70000, 75000]);
      var sigingInput = buildSigningInput(100000 - 174 - 10, 1, utxos);

      // 100'000 would fit with dust; instead two UTXOs are selected not to leave dust
      var txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [75000, 100000], 100000 - 174 - 10, 215), true);

      final dustLimit = 102;
      // Now 100'000 fits with no dust
      sigingInput = buildSigningInput(100000 - 174 - dustLimit, 1, utxos);
      txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));
      expect(verifyPlan(txPlan, [100000], 100000 - 174 - dustLimit, 147), true);

      // One more and we are over dust limit
      sigingInput = buildSigningInput(100000 - 174 - dustLimit + 1, 1, utxos);
      txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));
      expect(
          verifyPlan(
              txPlan, [75000, 100000], 100000 - 174 - dustLimit + 1, 215),
          true);
    });

    test('TenThree', () {
      final utxos = buildTestUTXOs(
          [1000, 2000, 100000, 3000, 4000, 5, 000, 125000, 6000, 150000, 7000]);
      final sigingInput = buildSigningInput(300000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [100000, 125000, 150000], 300000, 283), true);
    });

    test('NonMaxAmount', () {
      final utxos = buildTestUTXOs([4000, 2000, 6000, 1000, 50000, 120000]);
      final sigingInput = buildSigningInput(10000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [50000], 10000, 147), true);
    });

    test('UnspentsInsufficient', () {
      final utxos = buildTestUTXOs([4000, 4000, 4000]);
      final sigingInput = buildSigningInput(15000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // Max is returned
      expect(verifyPlan(txPlan, [4000, 4000, 4000], 11751, 249), true);
    });

    test('SelectionSuboptimal_ExtraSmallUtxo', () {
      // Solution found 4-in-2-out {500, 600, 800, 1000} avail 2900 txamount 1570 fee 702 change 628
      // Better solution: 3-in-2-out {600, 800, 1000} avail 2400 txamount 1570 fee 566 change 264
      // Previously, with with higher fee estimation used in UTXO selection, solution found was 5-in-2-out {400, 500, 600, 800, 1000} avail 3300 txamount 1570 fee 838 change 892
      final utxos = buildTestUTXOs([400, 500, 600, 800, 1000]);
      final byteFee = 2;
      final sigingInput = buildSigningInput(1570, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 702;
      expect(
          verifyPlan(txPlan, [500, 600, 800, 1000], 1570, expectedFee), true);
      final change = 2900 - 1570 - expectedFee;
      final firstUtxo = txPlan.utxos[0].amount.toInt();
      expect(change - 204 < txPlan.utxos[0].amount.toInt(), true);
      expect(change, 628);
      expect(firstUtxo, 500);
    });

    test('Selection_Satisfied5', () {
      // 5-input case, with a 5-input solution.
      // Previously, with with higher fee estimation used in UTXO selection, no solution would be found.
      final utxos = buildTestUTXOs([400, 500, 600, 800, 1000]);
      final byteFee = 2;
      final sigingInput = buildSigningInput(1775, byteFee, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // Max is returned
      expect(verifyPlan(txPlan, [400, 500, 600, 800, 1000], 1775, 838), true);
    });

    test('Inputs5_33Req19NoDustFee2', () {
      final utxos = buildTestUTXOs([600, 1200, 6000, 8000, 10000]);
      final byteFee = 2;
      final sigingInput = buildSigningInput(19000, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 283 * byteFee;
      expect(verifyPlan(txPlan, [6000, 8000, 10000], 19000, expectedFee), true);
    });

    test('Inputs5_33Req19Dust1Fee5', () {
      final utxos = buildTestUTXOs([600, 1200, 6000, 8000, 10000]);
      final byteFee = 5;
      final sigingInput = buildSigningInput(19000, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 283 * byteFee;
      expect(verifyPlan(txPlan, [6000, 8000, 10000], 19000, expectedFee), true);
    });

    test('Inputs5_33Req19Dust1Fee9', () {
      final utxos = buildTestUTXOs([600, 1200, 6000, 8000, 10000]);
      final byteFee = 9;
      final sigingInput = buildSigningInput(19000, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 283 * byteFee;
      expect(verifyPlan(txPlan, [6000, 8000, 10000], 19000, expectedFee), true);
    });

    test('Inputs5_33Req19Fee20', () {
      final utxos = buildTestUTXOs([600, 1200, 6000, 8000, 10000]);
      final byteFee = 20;
      final sigingInput = buildSigningInput(19000, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(
          verifyPlan(
              txPlan, [], 0, 0, Common.SigningError.Error_not_enough_utxos),
          true);
    });

    test('Inputs5_33Req13Fee20', () {
      final utxos = buildTestUTXOs([600, 1200, 6000, 8000, 10000]);
      final byteFee = 20;
      final sigingInput = buildSigningInput(13000, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 283 * byteFee;
      expect(verifyPlan(txPlan, [6000, 8000, 10000], 13000, expectedFee), true);
    });

    test('NoUTXOs', () {
      final utxos = buildTestUTXOs([]);
      final sigingInput = buildSigningInput(15000, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(
          verifyPlan(
              txPlan, [], 0, 0, Common.SigningError.Error_missing_input_utxos),
          true);
    });

    test('CustomCase', () {
      final utxos = buildTestUTXOs([794121, 2289357]);
      final byteFee = 61;
      final sigingInput = buildSigningInput(2287189, byteFee, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [794121, 2289357], 2287189, 13115), true);
    });

    test('Target0', () {
      final utxos = buildTestUTXOs([2000, 3000]);
      final sigingInput = buildSigningInput(0, 1, utxos);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(
          verifyPlan(txPlan, [], 0, 0,
              Common.SigningError.Error_zero_amount_requested),
          true);
    });

    test('MaxAmount', () {
      final utxos = buildTestUTXOs([4000, 2000, 15000, 15000, 3000, 200]);
      expect(sumUTXOs(utxos), 39200);
      final byteFee = 40;
      final sigingInput = buildSigningInput(39200, byteFee, utxos);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 7240;
      expect(
          verifyPlan(txPlan, [15000, 15000], 30000 - expectedFee, expectedFee),
          true);
    });

    test('MaxAmountOne', () {
      final utxos = buildTestUTXOs([10189534]);
      final sigingInput = buildSigningInput(100, 1, utxos, true);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 113;
      expect(
          verifyPlan(txPlan, [10189534], 10189534 - expectedFee, expectedFee),
          true);
    });

    test('AmountEqualsMaxButNotUseMax', () {
      // amount is set to max, but UseMax is not set --> Max is returned
      final utxos = buildTestUTXOs([10189534]);
      final sigingInput = buildSigningInput(10189534, 1, utxos, false);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [10189534], 10189421, 113), true);
    });

    test('MaxAmountRequestedIsLower', () {
      final utxos = buildTestUTXOs([4000, 2000, 15000, 15000, 3000, 200]);
      expect(sumUTXOs(utxos), 39200);
      final byteFee = 40;
      final sigingInput = buildSigningInput(10, byteFee, utxos, true);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 7240;
      expect(
          verifyPlan(txPlan, [15000, 15000], 30000 - expectedFee, expectedFee),
          true);
    });

    test('MaxAmountRequestedZero', () {
      final utxos = buildTestUTXOs([4000, 2000, 15000, 15000, 3000, 200]);
      expect(sumUTXOs(utxos), 39200);
      final byteFee = 40;
      final sigingInput = buildSigningInput(0, byteFee, utxos, true);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 7240;
      expect(
          verifyPlan(txPlan, [15000, 15000], 30000 - expectedFee, expectedFee),
          true);
    });

    test('MaxAmountNoDustFee2', () {
      final utxos = buildTestUTXOs([400, 500, 600, 800, 1000]);
      final byteFee = 2;
      final sigingInput = buildSigningInput(100, byteFee, utxos, true);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 770;
      expect(
          verifyPlan(txPlan, [400, 500, 600, 800, 1000], 3300 - expectedFee,
              expectedFee),
          true);
    });

    test('MaxAmountDust1Fee4', () {
      final utxos = buildTestUTXOs([400, 500, 600, 800, 1000]);
      final byteFee = 4;
      final sigingInput = buildSigningInput(100, byteFee, utxos, true);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 1268;
      expect(
          verifyPlan(
              txPlan, [500, 600, 800, 1000], 2900 - expectedFee, expectedFee),
          true);
    });

    test('MaxAmountDust2Fee5', () {
      final utxos = buildTestUTXOs([400, 500, 600, 800, 1000]);
      final byteFee = 5;
      final sigingInput = buildSigningInput(100, byteFee, utxos, true);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      final expectedFee = 1245;
      expect(
          verifyPlan(txPlan, [600, 800, 1000], 2400 - expectedFee, expectedFee),
          true);
    });

    test('MaxAmountDustAllFee10', () {
      final utxos = buildTestUTXOs([400, 500, 600, 800, 1000]);
      final byteFee = 10;
      final sigingInput = buildSigningInput(100, byteFee, utxos, true);

      // UTXOs smaller than singleInputFee are not included
      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(
          verifyPlan(
              txPlan, [], 0, 0, Common.SigningError.Error_not_enough_utxos),
          true);
    });

    test('One_MaxAmount_FeeMoreThanAvailable', () {
      final utxos = buildTestUTXOs([340]);
      final byteFee = 1;
      final expectedFee = 113;
      final sigingInput = buildSigningInput(340, byteFee, utxos, true);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // Fee is reduced to availableAmount
      expect(verifyPlan(txPlan, [340], 340 - expectedFee, expectedFee), true);
    });

    test('MaxAmountDoge', () {
      final utxos = buildTestUTXOs([100000000, 2000000000, 200000000]);
      expect(sumUTXOs(utxos), 2300000000);
      final sigingInput = buildSigningInput(
          2300000000, 100, utxos, true, TWCoinType.TWCoinTypeDogecoin);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(
          verifyPlan(
              txPlan, [100000000, 2000000000, 200000000], 2299951200, 48800),
          true);
    });

    test('AmountDecred', () {
      final utxos = buildTestUTXOs([39900000]);
      final sigingInput = buildSigningInput(
          10000000, 10, utxos, false, TWCoinType.TWCoinTypeDecred);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [39900000], 10000000, 2540), true);
    });

    test('ManyUtxosNonmax_400', () {
      final n = 400;
      final byteFee = 10;
      final values = <int>[];
      int valueSum = 0;
      for (var i = 0; i < n; i++) {
        final val = (i + 1) * 100;
        values.add(val);
        valueSum += val;
      }
      final requestedAmount = valueSum ~/ 8;
      expect(requestedAmount, 1002500);

      final utxos = buildTestUTXOs(values);
      final sigingInput = buildSigningInput(
          requestedAmount, byteFee, utxos, false, TWCoinType.TWCoinTypeBitcoin);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // expected result: 27 utxos, with the largest amounts
      final subset = <int>[];
      int subsetSum = 0;
      for (int i = n - 27; i < n; ++i) {
        final val = (i + 1) * 100;
        subset.add(val);
        subsetSum += val;
      }
      expect(subset.length, 27);
      expect(subsetSum, 1044900);
      expect(verifyPlan(txPlan, subset, requestedAmount, 19150), true);
    });

    test('ManyUtxosNonmax_5000_simple', () {
      final n = 5000;
      final byteFee = 10;
      final values = <int>[];
      int valueSum = 0;
      for (var i = 0; i < n; i++) {
        final val = (i + 1) * 100;
        values.add(val);
        valueSum += val;
      }
      final requestedAmount = valueSum ~/ 20;
      expect(requestedAmount, 62512500);

      // Use Ravencoin, because of faster non-segwit estimation, and one of the original issues was with this coin.
      final utxos = buildTestUTXOs(values);
      final sigingInput = buildSigningInput(requestedAmount, byteFee, utxos,
          false, TWCoinType.TWCoinTypeRavencoin);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // expected result: 1220 utxos, with the smaller amounts (except the very small dust ones)
      final subset = <int>[];
      int subsetSum = 0;
      for (int i = 14; i < 1220 + 14; ++i) {
        final val = (i + 1) * 100;
        subset.add(val);
        subsetSum += val;
      }
      expect(subset.length, 1220);
      expect(subsetSum, 76189000);
      expect(verifyPlan(txPlan, subset, requestedAmount, 1806380), true);
    });

    test('ManyUtxosMax_400', () {
      final n = 400;
      final byteFee = 10;
      final values = <int>[];
      int valueSum = 0;
      for (var i = 0; i < n; i++) {
        final val = (i + 1) * 100;
        values.add(val);
        valueSum += val;
      }

      // Use Ravencoin, because of faster non-segwit estimation, and one of the original issues was with this coin.
      final utxos = buildTestUTXOs(values);
      final sigingInput = buildSigningInput(
          valueSum, byteFee, utxos, true, TWCoinType.TWCoinTypeRavencoin);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // all are selected, except a few smallest UTXOs are filtered out
      final dustLimit = byteFee * 148;
      final filteredValues = <int>[];
      int filteredValueSum = 0;
      for (int i = 0; i < n; ++i) {
        final val = (i + 1) * 100;
        if (val > dustLimit) {
          filteredValues.add(val);
          filteredValueSum += val;
        }
      }
      expect(valueSum, 8020000);
      expect(dustLimit, 1480);
      expect(filteredValues.length, 386);
      expect(filteredValueSum, 8009500);
      expect(verifyPlan(txPlan, filteredValues, 7437780, 571720), true);
    });

    test('ManyUtxosMax_5000_simple', () {
      final n = 5000;
      final byteFee = 10;
      final values = <int>[];
      int valueSum = 0;
      for (var i = 0; i < n; i++) {
        final val = (i + 1) * 100;
        values.add(val);
        valueSum += val;
      }

      // Use Ravencoin, because of faster non-segwit estimation, and one of the original issues was with this coin.
      final utxos = buildTestUTXOs(values);
      final sigingInput = buildSigningInput(
          valueSum, byteFee, utxos, true, TWCoinType.TWCoinTypeRavencoin);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          sigingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      // only 3000 are selected, the first ones minus a few small dust ones
      final dustLimit = byteFee * 150;
      final filteredValues = <int>[];
      int filteredValueSum = 0;
      for (int i = 0; i < 3000 + 14; ++i) {
        final val = (i + 1) * 100;
        if (val >= dustLimit) {
          filteredValues.add(val);
          filteredValueSum += val;
        }
      }
      expect(valueSum, 1250250000);
      expect(dustLimit, 1500);
      expect(filteredValues.length, 3000);
      expect(filteredValueSum, 454350000);
      expect(verifyPlan(txPlan, filteredValues, 449909560, 4440440), true);
    });

    test('OpReturn', () {
      final ownAddress = "bc1q7s0a2l4aguksehx8hf93hs9yggl6njxds6m02g";
      final toAddress = "bc1qxu5a8gtnjxw3xwdlmr2gl9d76h9fysu3zl656e";
      final utxoAmount = 342101;
      final toAmount = 300000;
      int byteFee = 126;
      final memo = TWData.createWithString(
          'SWAP:THOR.RUNE:thor1tpercamkkxec0q0jk6ltdnlqvsw29guap8wmcl:');

      final signingInput = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(toAmount),
        byteFee: $fixnum.Int64(byteFee),
        toAddress: toAddress,
        changeAddress: ownAddress,
        outputOpReturn: memo.bytes()!,
      );

      final utxo = Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
                  '30b82960291a39de3664ec4c844a815e3e680e29b4d3a919e450f0c119cf4e35')
              .reversed
              .toList(),
          index: 0,
          sequence: UINT32_MAX,
        ),
        amount: $fixnum.Int64(utxoAmount),
      );
      signingInput.utxo.addAll([utxo]);

      final txPlan = Bitcoin.TransactionPlan.fromBuffer(TWAnySigner.plan(
          signingInput.writeToBuffer(), TWCoinType.TWCoinTypeBitcoin));

      expect(verifyPlan(txPlan, [342101], 300000, 205 * byteFee), true);
      expect(txPlan.outputOpReturn.length, 59);
      expectHex(txPlan.outputOpReturn,
          '535741503a54484f522e52554e453a74686f72317470657263616d6b6b7865633071306a6b366c74646e6c7176737732396775617038776d636c3a');
      expect(txPlan.outputOpReturnIndex.hasIndex(), false);
    });
  });
}
