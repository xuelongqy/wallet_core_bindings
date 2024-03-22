import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('TWAnySignerBitcoinDiamond', () {
    final coin = TWCoinType.TWCoinTypeBitcoinDiamond;

    test('Sign', () {
      final amount = 17615;
      final fee = 10000;
      final toAddress = '1HevQVTSEc8cEpDm65UpfCdj5erd4xxBhx';

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: '1G15VvshDxwFTnahZZECJfFwEkq9fP79o8',
        coinType: coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      '1d4653041a1915b3a52d47aeaa119c8f79ed7634a93692a6e811173067464f03')
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(27615),
          ),
        ],
      );

      final script0 =
          parse_hex("76a914a48da46386ce52cccad178de900c71f06130c31088ac");
      input.utxo[0].script = script0;

      final utxoKey0 = TWPrivateKey.createWithHexString(
          'd2b9f2846d3adcead910ee0124a3ba7ae29e8a4729787d27f9bea1f532928eee');
      input.privateKey.add(utxoKey0.data);

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      {
        plan.amount = $fixnum.Int64(amount);
        plan.fee = $fixnum.Int64(fee);
        plan.change = $fixnum.Int64(0);
        final preBlockHash = parse_hex(
                "4bfa9d92e1e99e72597e1e9162bdaaab624f1bb6faa83b2f46c6777caf8d6699")
            .reversed
            .toList();
        plan.preblockhash = preBlockHash;
      }

      input.plan = plan;

      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      {
        expect(output.error, Common.SigningError.OK);
      }
      // Sing
      expectHex(output.encoded,
          '0c00000099668daf7c77c6462f3ba8fab61b4f62abaabd62911e7e59729ee9e1929dfa4b01034f4667301711e8a69236a93476ed798f9c11aaae472da5b315191a0453461d000000006a473044022078e0d3a9e1eb270ab02c15f8fcf1d3bfc95a324839690b7de4f011a4266132ff02204679e8103c4d3f0bb5192a5f53cc273732fd0e8392ab3b00dc708fd24d0160b3012102485a209514cc896f8ed736e205bc4c35bd5299ef3f9e84054475336b964c02a3ffffffff01cf440000000000001976a914b6adfbbf15c8f6fa53f1edb37054dce5c7c145c688ac00000000');
    });
  });
}
