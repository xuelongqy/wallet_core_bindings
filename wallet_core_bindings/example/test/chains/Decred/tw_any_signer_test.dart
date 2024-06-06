import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Decred.pb.dart' as Decred;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

Bitcoin.SigningInput createInput() {
  const utxoValue = 39900000;
  const amount = 10000000;

  return Bitcoin.SigningInput(
    hashType: TWBitcoinSigHashType.All.type,
    amount: $fixnum.Int64(amount),
    byteFee: $fixnum.Int64(1),
    toAddress: 'Dsesp1V6DZDEtcq2behmBVKdYqKMdkh96hL',
    changeAddress: 'DsUoWCAxprdGNtKQqambFbTcSBgH1SHn9Gp',
    coinType: TWCoinType.Decred.coin,
    utxo: [
      Bitcoin.UnspentTransaction(
        amount: $fixnum.Int64(utxoValue),
        script: parse_hex("76a914b75fdec70b2e731795dd123ab40f918bf099fee088ac"),
        outPoint: Bitcoin.OutPoint(
          hash: parse_hex(
              "fdbfe9dd703f306794a467f175be5bd9748a7925033ea1cf9889d7cf4dd11550"),
          index: 0,
        ),
      ),
    ],
    privateKey: [
      parse_hex(
          "ba005cd605d8a02e3d5dfd04234cef3a3ee4f76bfbad2722d1fb5af8e12e6764"),
    ],
  );
}

void main() {
  initTest();
  group('TWAnySignerDecred', () {
    const coin = TWCoinType.Decred;

    test('Signing', () {
      final input = createInput();

      const utxoValue = 39900000;
      const amount = 10000000;
      const fee = 100000;

      input.plan = Bitcoin.TransactionPlan(
        amount: $fixnum.Int64(amount),
        availableAmount: $fixnum.Int64(utxoValue),
        fee: $fixnum.Int64(fee),
        change: $fixnum.Int64(utxoValue - amount - fee),
        utxos: [
          input.utxo[0],
        ],
      );

      final output = Decred.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expectHex(output.encoded,
          '0100000001fdbfe9dd703f306794a467f175be5bd9748a7925033ea1cf9889d7cf4dd1155000000000000000000002809698000000000000001976a914989b1aecabf1c24e213cc0f2d8a22ffee25dd4e188ac40b6c6010000000000001976a9142a194fc92e27fef9cc2b057bc9060c580cbb484888ac000000000000000001000000000000000000000000ffffffff6a47304402206ee887c9239e5fff0048674bdfff2a8cfbeec6cd4a3ccebcc12fac44b24cc5ac0220718f7c760818fde18bc5ba8457d43d5a145cc4cf13d2a5557cba9107e9f4558d0121026cc34b92cefb3a4537b3edb0b6044c04af27c01583c577823ecc69a9a21119b6');
    });

    test('Plan', () {
      final input = createInput();

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      expect(plan.amount.toInt(), 10000000);
      expect(plan.availableAmount.toInt(), 39900000);
      expect(plan.fee.toInt(), 254);
      expect(plan.change.toInt(), 29899746);
      expect(plan.utxos.length, 1);
      expectHex(plan.branchId, '');
    });

    test('PlanAndSign', () {
      final input = createInput();

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      expect(plan.amount.toInt(), 10000000);
      expect(plan.availableAmount.toInt(), 39900000);
      expect(plan.fee.toInt(), 254);
      expect(plan.change.toInt(), 29899746);
      expect(plan.utxos.length, 1);
      expectHex(plan.branchId, '');

      // copy over plan fields
      input.plan = plan;

      final output = Decred.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.OK);
      expect(output.encoded.length, 251);
      expectHex(output.encoded,
          '0100000001fdbfe9dd703f306794a467f175be5bd9748a7925033ea1cf9889d7cf4dd1155000000000000000000002809698000000000000001976a914989b1aecabf1c24e213cc0f2d8a22ffee25dd4e188ace23bc8010000000000001976a9142a194fc92e27fef9cc2b057bc9060c580cbb484888ac000000000000000001000000000000000000000000ffffffff6a47304402203e6ee9e16d6bc36bb4242f7a4cac333a1c2a150ea16143412b88b721f6ae16bf02201019affdf815a5c22e4b0fb7e4685c4707094922d6a41354f9055d3bb0f26e630121026cc34b92cefb3a4537b3edb0b6044c04af27c01583c577823ecc69a9a21119b6');
    });

    test('SupportsJSON', () {
      expect(TWAnySigner.supportsJSON(coin), false);
    });
  });
}
