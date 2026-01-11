import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Utxo.pb.dart' as Utxo;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';
import '../Bitcoin/tx_comparison_helper.dart';

void main() {
  initTest();
  group('GroestlcoinSigning', () {
    const coin = TWCoinType.Groestlcoin;

    test('SignP2WPKH', () {
      final utxoKey0 = parse_hex(
          "dc334e7347f2f9f72fce789b11832bdf78adf0158bc6617e6d2d2a530a0d4bc6");

      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.value,
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(2500),
        byteFee: $fixnum.Int64(1),
        toAddress: '31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P',
        changeAddress: 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM',
        privateKey: [utxoKey0],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: TWBitcoinScript.createWithBytes(
                    parse_hex("00147557920fbc32a1ef4ef26bae5e8ce3f95abf09ce"))
                .data,
            amount: $fixnum.Int64(4774),
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  "9568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f"),
              index: 1,
              sequence: UINT32_MAX,
            ),
          ),
        ],
      );

      Bitcoin.TransactionPlan plan;
      {
        // try plan first
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        expect(verifyPlan(plan, [4774], 2500, 145), true);
      }

      // Supply plan for signing, to match fee of previously-created real TX
      input.plan = plan;
      input.plan.fee = $fixnum.Int64(226);
      input.plan.change = $fixnum.Int64(2048);

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://blockbook.groestlcoin.org/tx/40b539c578934c9863a93c966e278fbeb3e67b0da4eb9e3030092c1b717e7a64
      expect(output.transaction.outputs.length, 2);
      expect(output.transaction.outputs[0].value.toInt(), 2500);
      expect(output.transaction.outputs[1].value.toInt(), 2048);
      expectHex(output.encoded,
          '010000000001019568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f0100000000ffffffff02c40900000000000017a9140055b0c94df477ee6b9f75185dfc9aa8ce2e52e48700080000000000001976a91498af0aaca388a7e1024f505c033626d908e3b54a88ac024830450221009bbd0228dcb7343828633ded99d216555d587b74db40c4a46f560187eca222dd022032364cf6dbf9c0213076beb6b4a20935d4e9c827a551c3f6f8cbb22d8b464467012102e9c9b9b76e982ad8fa9a7f48470eafbeeba9bf6d287579318c517db5157d936e00000000');
    });

    test('SignP2PKH', () {
      final utxoKey0 = parse_hex(
          "3c3385ddc6fd95ba7282051aeb440bc75820b8c10db5c83c052d7586e3e98e84");

      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.value,
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(2500),
        byteFee: $fixnum.Int64(1),
        toAddress: 'grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne',
        changeAddress: '31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P',
        privateKey: [utxoKey0],
        utxo: [
          Bitcoin.UnspentTransaction(
            script: TWBitcoinScript.createWithBytes(parse_hex(
                    "76a91498af0aaca388a7e1024f505c033626d908e3b54a88ac"))
                .data,
            amount: $fixnum.Int64(5000),
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  "9568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f"),
              index: 0,
              sequence: UINT32_MAX,
            ),
          ),
        ],
      );

      Bitcoin.TransactionPlan plan;
      {
        // try plan first
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        expect(verifyPlan(plan, [5000], 2500, 221), true);
      }

      // Supply plan for signing, to match fee of previously-created real TX
      input.plan = plan;
      input.plan.fee = $fixnum.Int64(226);
      input.plan.change = $fixnum.Int64(2274);

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://blockbook.groestlcoin.org/tx/74a0dd12bc178cfcc1e0982a2a5b2c01a50e41abbb63beb031bcd21b3e28eac0
      expect(output.transaction.outputs.length, 2);
      expect(output.transaction.outputs[0].value.toInt(), 2500);
      expect(output.transaction.outputs[1].value.toInt(), 2274);
      expectHex(output.encoded,
          '01000000019568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f000000006a47304402202163ab98b028aa13563f0de00b785d6df81df5eac0b7c91d23f5be7ea674aa3702202bf6cd7055c6f8f697ce045b1a4f9b997cf6e5761a661d27696ac34064479d19012103b85cc59b67c35851eb5060cfc3a759a482254553c5857075c9e247d74d412c91ffffffff02c4090000000000001600147557920fbc32a1ef4ef26bae5e8ce3f95abf09cee20800000000000017a9140055b0c94df477ee6b9f75185dfc9aa8ce2e52e48700000000');
    });

    test('SignWithError', () {
      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.value,
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(2500),
        byteFee: $fixnum.Int64(1),
        toAddress: 'grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne',
        changeAddress: '31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P',
      );

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error != Common.SigningError.OK, true);

      final result = Bitcoin.PreSigningOutput.fromBuffer(
          TWTransactionCompiler.preImageHashes(coin, input.writeToBuffer()));
      expect(result.error != Common.SigningError.OK, true);
    });

    test('SignP2SH_P2WPKH', () {
      final utxoKey0 = TWPrivateKey.createWithHexString(
          '302fc195a8fc96c5a581471e67e4c1ac2efda252f76ad5c77a53764c70d58f91');
      final pubKey0 = utxoKey0.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final utxoPubkeyHash = TWHash.ripemd(TWHash.sha256(pubKey0.data));
      expectHex(utxoPubkeyHash, '2fc7d70acef142d1f7b5ef2f20b1a9b759797674');

      // TX outputs
      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.value,
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(5000),
        byteFee: $fixnum.Int64(1),
        toAddress: 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM',
        changeAddress: 'grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne',
        privateKey: [utxoKey0.data],
      );

      final redeemScript =
          TWBitcoinScript.buildPayToWitnessPubkeyHash(utxoPubkeyHash);
      final scriptHash = TWHash.ripemd(TWHash.sha256(redeemScript.data));
      expectHex(scriptHash, '0055b0c94df477ee6b9f75185dfc9aa8ce2e52e4');
      input.scripts[hex(scriptHash)] = redeemScript.data;

      input.utxo.add(Bitcoin.UnspentTransaction(
        script: TWBitcoinScript.createWithBytes(
                parse_hex("a9140055b0c94df477ee6b9f75185dfc9aa8ce2e52e487"))
            .data,
        amount: $fixnum.Int64(10000),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              "fdae0772d7d1d33804a6b1ca0e391668b116bb7a70028427d3d82232189ce863"),
          index: 0,
          sequence: UINT32_MAX,
        ),
      ));

      Bitcoin.TransactionPlan plan;
      {
        // try plan first
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        expect(verifyPlan(plan, [10000], 5000, 167), true);
      }

      // Supply plan for signing, to match fee of previously-created real TX
      input.plan = plan;
      input.plan.fee = $fixnum.Int64(226);
      input.plan.change = $fixnum.Int64(4774);

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://blockbook.groestlcoin.org/tx/8f4ecc7844e19aa1d3183e47eee89d795f9e7c875a55ec0203946d6c9eb06895
      expect(output.transaction.outputs.length, 2);
      expect(output.transaction.outputs[0].value.toInt(), 5000);
      expect(output.transaction.outputs[1].value.toInt(), 4774);
      expectHex(output.encoded,
          '01000000000101fdae0772d7d1d33804a6b1ca0e391668b116bb7a70028427d3d82232189ce86300000000171600142fc7d70acef142d1f7b5ef2f20b1a9b759797674ffffffff0288130000000000001976a91498af0aaca388a7e1024f505c033626d908e3b54a88aca6120000000000001600147557920fbc32a1ef4ef26bae5e8ce3f95abf09ce024730440220614df57babf74029afaa6dda202afa47d3555cca7a0f20a22e466aeb7029e7d002207974b4c16f346811aff6720d09b9c58d0c4e01e8d258c3d203cc3c1ad228c61a012102fb6ad115761ea928f1367befb2bee79c0b3497314b45e0b734cd150f0601706c00000000');
    });

    test('PlanP2WPKH', () {
      final utxoKey0 = parse_hex(
          'dc334e7347f2f9f72fce789b11832bdf78adf0158bc6617e6d2d2a530a0d4bc6');

      // TX outputs
      final input = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.value,
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(2500),
        byteFee: $fixnum.Int64(1),
        toAddress: '31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P',
        changeAddress: 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM',
        privateKey: [utxoKey0],
      );

      input.utxo.add(Bitcoin.UnspentTransaction(
        script: TWBitcoinScript.createWithBytes(
                parse_hex("00147557920fbc32a1ef4ef26bae5e8ce3f95abf09ce"))
            .data,
        amount: $fixnum.Int64(4774),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              "9568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f"),
          index: 1,
          sequence: UINT32_MAX,
        ),
      ));

      Bitcoin.TransactionPlan plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      expect(verifyPlan(plan, [4774], 2500, 145), true);
      expectHex(plan.branchId, '');
    });

    // Tests the BitcoinV2 API through the legacy `SigningInput`.
    // Successfully broadcasted: https://blockbook.groestlcoin.org/tx/40b539c578934c9863a93c966e278fbeb3e67b0da4eb9e3030092c1b717e7a64
    test('SignV2P2WPKH', () {
      final privateKey = parse_hex(
          "dc334e7347f2f9f72fce789b11832bdf78adf0158bc6617e6d2d2a530a0d4bc6");
      final txId = parse_hex(
              "8f4ecc7844e19aa1d3183e47eee89d795f9e7c875a55ec0203946d6c9eb06895")
          .reversed
          .toList();
      const inAmount = 4774;
      const outAmount = 2500;
      const changeAmount = 2048;
      const senderAddress = "grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne";
      const toAddress = "31inaRqambLsd9D7Ke4USZmGEVd3PHkh7P";
      const changeAddress = "Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM";

      // TX outputs
      final signing = BitcoinV2.SigningInput(
        privateKeys: [privateKey],
        chainInfo: BitcoinV2.ChainInfo(
          p2pkhPrefix: 36,
          p2shPrefix: 5,
        ),
        builder: BitcoinV2.TransactionBuilder(
          version: BitcoinV2.TransactionVersion.UseDefault,
          inputSelector: BitcoinV2.InputSelector.UseAll,
          fixedDustThreshold: 546.toInt64(),
          inputs: [
            BitcoinV2.Input(
              outPoint: Utxo.OutPoint(
                hash: txId,
                vout: 1,
              ),
              value: inAmount.toInt64(),
              receiverAddress: senderAddress,
              sighashType: TWBitcoinSigHashType.All.value,
            ),
          ],
          outputs: [
            BitcoinV2.Output(
              value: outAmount.toInt64(),
              toAddress: toAddress,
            ),
            BitcoinV2.Output(
              value: changeAmount.toInt64(),
              toAddress: changeAddress,
            ),
          ],
        ),
      );

      final legacy = Bitcoin.SigningInput(
        coinType: TWCoinType.Groestlcoin.value,
        signingV2: signing,
      );

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(legacy.writeToBuffer(), coin));

      expect(plan.error, Common.SigningError.OK);
      expect(plan.hasPlanningResultV2(), true);
      expect(plan.planningResultV2.error, Common.SigningError.OK);
      expect(plan.planningResultV2.vsizeEstimate.toInt(), 145);

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(legacy.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(output.hasSigningResultV2(), true);
      expect(output.signingResultV2.error, Common.SigningError.OK);
      expectHex(
        output.signingResultV2.encoded,
        '010000000001019568b09e6c6d940302ec555a877c9e5f799de8ee473e18d3a19ae14478cc4e8f0100000000ffffffff02c40900000000000017a9140055b0c94df477ee6b9f75185dfc9aa8ce2e52e48700080000000000001976a91498af0aaca388a7e1024f505c033626d908e3b54a88ac024830450221009bbd0228dcb7343828633ded99d216555d587b74db40c4a46f560187eca222dd022032364cf6dbf9c0213076beb6b4a20935d4e9c827a551c3f6f8cbb22d8b464467012102e9c9b9b76e982ad8fa9a7f48470eafbeeba9bf6d287579318c517db5157d936e00000000',
      );
      expectHex(
        output.signingResultV2.txid,
        '40b539c578934c9863a93c966e278fbeb3e67b0da4eb9e3030092c1b717e7a64',
      );
    });
  });
}
