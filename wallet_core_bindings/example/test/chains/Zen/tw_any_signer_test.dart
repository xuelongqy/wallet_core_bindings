import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerZen', () {
    const coin = TWCoinType.Zen;

    test('Sign', () {
      const amount = 10000;
      const toAddress = "zngBGZGKaaBamofSuFw5WMnvU2HQAtwGeb5";

      final blockHash = parse_hex(
              "0000000004561422697a29d424d925334db5ef2e80232306a1ad3fd35f72dc81")
          .reversed
          .toList();
      const blockHeight = 1147624;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg',
        coinType: coin.value,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "62dea4b87fd66ca8e75a199c93131827ed40fb96cd8412e3476540abb5139ea3")
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(17600),
          ),
        ],
      );

      final utxoKey0 = TWPrivateKey.createWithHexString(
          '3a8e0a528f62f4ca2c77744c8a571def2845079b50105a9f7ef6b1b823def67a');
      final utxoAddr0 = coin.deriveAddress(utxoKey0);
      expect(utxoAddr0, 'znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg');
      final script0 = TWBitcoinScript.lockScriptForAddressReplay(
        address: utxoAddr0,
        coin: coin,
        blockHash: Uint8List.fromList(blockHash),
        blockHeight: blockHeight,
      );
      input.utxo[0].script = script0.data;
      input.privateKey.add(utxoKey0.data);

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));

        expect(plan.fee.toInt(), 226);

        plan.preblockhash = blockHash;
        plan.preblockheight = $fixnum.Int64(blockHeight);

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
        "0100000001a39e13b5ab406547e31284cd96fb40ed271813939c195ae7a86cd67fb8a4de62000000006a473044022014d687c0bee0b7b584db2eecbbf73b545ee255c42b8edf0944665df3fa882cfe02203bce2412d93c5a56cb4806ddd8297ff05f8fc121306e870bae33377a58a02f05012102b4ac9056d20c52ac11b0d7e83715dd3eac851cfc9cb64b8546d9ea0d4bb3bdfeffffffff0210270000000000003f76a914a58d22659b1082d1fa8698fc51996b43281bfce788ac2081dc725fd33fada1062323802eefb54d3325d924d4297a69221456040000000003e88211b4ce1c0000000000003f76a914cf83669620de8bbdf2cefcdc5b5113195603c56588ac2081dc725fd33fada1062323802eefb54d3325d924d4297a69221456040000000003e88211b400000000",
      );
    });

    test('SignWithError', () {
      const amount = 10000;
      const toAddress = "zngBGZGKaaBamofSuFw5WMnvU2HQAtwGeb5";

      final blockHash = parse_hex(
              "0000000004561422697a29d424d925334db5ef2e80232306a1ad3fd35f72dc81")
          .reversed
          .toList();
      const blockHeight = 1147624;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'znk19H1wcARcCa7TM6zgmJUbWoWWtZ8k5cg',
        coinType: coin.value,
      );

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));

        plan.preblockhash = blockHash;
        plan.preblockheight = $fixnum.Int64(blockHeight);

        input.plan = plan;
      }

      // Sign
      Bitcoin.SigningOutput output;
      {
        output = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(output.error != Common.SigningError.OK, true);
      }
    });
  });
}
