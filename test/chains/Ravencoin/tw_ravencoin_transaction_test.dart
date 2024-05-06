import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;

import '../../utils.dart';

void main() {
  group('RavencoinTransaction', () {
    const coin = TWCoinType.TWCoinTypeRavencoin;

    test('SignTransaction', () {
      /*
        https://iancoleman.io/bip39/
        Mnemonic - shoot island position soft burden budget tooth cruel issue economy destroy above
        m/44'/175'/0'/0/0 Address - RHoCwPc2FCQqwToYnSiAb3SrCET4zEHsbS
        m/44'/175'/0'/0/0 Private key in Base58 encoding - L1At2vQpaHCmbiu333N3kD4nbDzJgvb8hxNp5S8bQApocFYuW1rx
        m/44'/175'/0'/0/0 Private key in bytes - 75e4c520c92b3836e77dfe2715da469b71f7df86fc11ef328870735a700551fa
        utxo - https://blockbook.ravencoin.org/tx/0c7e82b44eec71d634c013e2db3cb4fa26f87fbc90eb8734da93807d23605544
        tx - https://blockbook.ravencoin.org/tx/3717b528eb4925461d9de5a596d2eefe175985740b4fda153255e10135f236a6
      */

      final utxoAmount = 100000000;
      final amount = 50000000;
      final fee = 2000000;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'RNoSGCX8SPFscj8epDaJjqEpuZa2B5in88',
        changeAddress: 'RHoCwPc2FCQqwToYnSiAb3SrCET4zEHsbS',
        coinType: coin,
      );

      final hash0 = parse_hex(
          "445560237d8093da3487eb90bc7ff826fab43cdbe213c034d671ec4eb4827e0c");
      input.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: hash0,
          index: 0,
          sequence: UINT32_MAX,
        ),
        amount: $fixnum.Int64(utxoAmount),
        script: parse_hex("76a9145d6e33f3a108bbcc586cbbe90994d5baf5a9cce488ac"),
      ));

      final utxoKey0 = parse_hex(
          '75e4c520c92b3836e77dfe2715da469b71f7df86fc11ef328870735a700551fa');
      input.privateKey.add(utxoKey0);

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(utxoAmount - amount - fee);

      input.plan = plan;

      // Sign
      final result = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(hex(result.encoded),
          '0100000001445560237d8093da3487eb90bc7ff826fab43cdbe213c034d671ec4eb4827e0c000000006b483045022100d790bdaa3c44eb5e3a422365ca5fc009c4512625222e3378f2f16e7e6ef1732a0220688c1bb995b7ff2f12729e101d7c24b6314430317e7717911fdc35c0d84f2f0d012102138724e702d25b0fdce73372ccea9734f9349442d5a9681a5f4d831036cd9429ffffffff0280f0fa02000000001976a9149451f4546e09fc2e49ef9b5303924712ec2b038e88ac006cdc02000000001976a9145d6e33f3a108bbcc586cbbe90994d5baf5a9cce488ac00000000');
    });

    test('LockScripts', () {
      // P2PKH
      // https://blockbook.ravencoin.org/tx/3717b528eb4925461d9de5a596d2eefe175985740b4fda153255e10135f236a6

      final script = TWBitcoinScript.lockScriptForAddress(
          'RNoSGCX8SPFscj8epDaJjqEpuZa2B5in88', coin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a9149451f4546e09fc2e49ef9b5303924712ec2b038e88ac');

      // P2SH
      // https://blockbook.ravencoin.org/tx/f600d07814677d1f60545c8f7f71260238595c4928d6fb87caa0f9dd732e9bb5

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'rPWwn5h4QFZNaz1XmY39rc73sdYGGDdmq1', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a914bd92088bb7e82d611a9b94fbb74a0908152b784f87');
    });
  });
}
