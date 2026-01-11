import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

final Bitcoin.OutPoint emptyTxOutPoint = Bitcoin.OutPoint(
  hash: parse_hex(
      "1d0f172a0ecb48aee1be1f2687d2963ae33f71a1aaaaaaaaaaaaaaaaaaaaaaaa"),
  index: 0,
  sequence: UINT32_MAX,
);

Bitcoin.UnspentTransaction buildTestUTXO(int amount) {
  return Bitcoin.UnspentTransaction(
    amount: $fixnum.Int64(amount),
    script: TWBitcoinScript.createWithBytes(
            parse_hex('0014' '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1'))
        .data,
    outPoint: emptyTxOutPoint,
  );
}

List<Bitcoin.UnspentTransaction> buildTestUTXOs(List<int> amounts) {
  return amounts.map((amount) => buildTestUTXO(amount)).toList();
}

Bitcoin.SigningInput buildSigningInput(
  int amount,
  int byteFee,
  List<Bitcoin.UnspentTransaction> utxos, [
  bool useMaxAmount = false,
  TWCoinType coin = TWCoinType.Bitcoin,
  bool omitPrivateKey = false,
]) {
  final input = Bitcoin.SigningInput(
    amount: $fixnum.Int64(amount),
    byteFee: $fixnum.Int64(byteFee),
    useMaxAmount: useMaxAmount,
    coinType: coin.value,
  );
  if (!omitPrivateKey) {
    final utxoKey = TWPrivateKey.createWithData(TWData.createWithHexString(
            '619c335025c7f4012e556c2a58b2506e30b8511b53ade95ea316fd8c3286feb9')
        .bytes()!);
    final pubkey = utxoKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
    final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubkey.data));
    expectHex(utxoPubkeyHash, '1d0f172a0ecb48aee1be1f2687d2963ae33f71a1');
    input.privateKey.add(utxoKey.data);
  }

  input.utxo.addAll(utxos);
  input.toAddress = '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx';
  input.changeAddress = '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU';
  return input;
}

int sumUTXOs(List<Bitcoin.UnspentTransaction> utxos) {
  return utxos.fold(0, (sum, utxo) => sum + utxo.amount.toInt());
}

bool verifySelectedUTXOs(
    List<Bitcoin.UnspentTransaction> selected, List<int> expectedAmounts) {
  bool ret = true;
  if (selected.length != expectedAmounts.length) {
    ret = false;
    print(
        'Wrong number of selected UTXOs, ${selected.length} vs. ${expectedAmounts.length}');
  }
  int errorCount = 0;
  for (int i = 0; i < selected.length && i < expectedAmounts.length; i++) {
    if (selected[i].amount.toInt() != expectedAmounts[i]) {
      ret = false;
      ++errorCount;
      if (errorCount < 10) {
        print(
            'Wrong UTXOs amount, pos $i amount ${selected[i].amount.toInt()} expected ${expectedAmounts[i]}');
      }
    }
  }
  return ret;
}

bool verifyPlan(Bitcoin.TransactionPlan plan, List<int> utxoAmounts,
    int outputAmount, int fee,
    [Common.SigningError error = Common.SigningError.OK]) {
  bool ret = true;
  if (!verifySelectedUTXOs(plan.utxos, utxoAmounts)) {
    ret = false;
  }
  if (plan.amount.toInt() != outputAmount) {
    ret = false;
    print('Mismatch in amount, act ${plan.amount.toInt()}, exp $outputAmount');
  }
  if (plan.fee.toInt() != fee) {
    ret = false;
    print('Mismatch in fee, act ${plan.fee.toInt()}, exp $fee');
  }
  int sumExpectedUTXOs = 0;
  for (final utxoAmount in utxoAmounts) {
    sumExpectedUTXOs += utxoAmount;
  }
  if (plan.availableAmount.toInt() != sumExpectedUTXOs) {
    ret = false;
    print(
        'Mismatch in availableAmount, act ${plan.availableAmount}, exp $sumExpectedUTXOs');
  }
  int expectedChange = sumExpectedUTXOs - outputAmount - fee;
  if (plan.change.toInt() != expectedChange) {
    ret = false;
    print(
        'Mismatch in change, act ${plan.change.toInt()}, exp $expectedChange');
  }
  if (plan.error != Common.SigningError.OK) {
    if (error != Common.SigningError.OK) {
      if (plan.error != error) {
        ret = false;
        print('Mismatch in error, act ${plan.error}, exp $error');
      }
    } else {
      ret = false;
      print('Unexpected error ${plan.error}');
    }
  } else {
    if (error != Common.SigningError.OK) {
      ret = false;
      print('Missing expected error ${plan.error}');
    }
  }
  return ret;
}
