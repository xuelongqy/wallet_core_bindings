import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/Decred.pb.dart' as Decred;
import 'package:wallet_core_bindings/proto/Utxo.pb.dart' as Utxo;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

Bitcoin.SigningInput createInput() {
  const utxoValue = 39900000;
  const amount = 10000000;

  return Bitcoin.SigningInput(
    hashType: TWBitcoinSigHashType.All.value,
    amount: $fixnum.Int64(amount),
    byteFee: $fixnum.Int64(1),
    toAddress: 'Dsesp1V6DZDEtcq2behmBVKdYqKMdkh96hL',
    changeAddress: 'DsUoWCAxprdGNtKQqambFbTcSBgH1SHn9Gp',
    coinType: TWCoinType.Decred.value,
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

    test('SignV2', () {
      final privateKey = parse_hex(
          "99ed469e6b7d9f188962940d9d0f9fd8582c6c37e52394348f177ff0526b8a03");
      final txId = parse_hex(
              "c5cc3b1fc20c9e43a7d1127ba7e4802d04c16515a7eaaad58a1bc388acacfeae")
          .reversed
          .toList();
      const inAmount = 100000000;
      const outAmount1 = 10000000;
      const outAmount2 = 5000000;
      const senderAddress = "DscNJ2Ki7HUPHrLGF2teBxSda3uxKSY7Fm6";
      const toAddress = "Dsofok7qyhDLVRXcTqYdFgmGsUFSiHonbWH";

      final signing = BitcoinV2.SigningInput(
        privateKeys: [privateKey],
        chainInfo: BitcoinV2.ChainInfo(
          p2pkhPrefix: 63,
          p2shPrefix: 26,
        ),
        builder: BitcoinV2.TransactionBuilder(
          version: BitcoinV2.TransactionVersion.UseDefault,
          inputSelector: BitcoinV2.InputSelector.SelectDescending,
          fixedDustThreshold: 546.toInt64(),
          feePerVb: 10.toInt64(),
          inputs: [
            BitcoinV2.Input(
              outPoint: Utxo.OutPoint(
                hash: txId,
                vout: 0,
              ),
              value: inAmount.toInt64(),
              receiverAddress: senderAddress,
              sighashType: TWBitcoinSigHashType.All.value,
            ),
          ],
          outputs: [
            // 0.1 DCR to another address.
            BitcoinV2.Output(
              value: outAmount1.toInt64(),
              toAddress: toAddress,
            ),
            // 0.05 DCR to self.
            BitcoinV2.Output(
              value: outAmount2.toInt64(),
              toAddress: senderAddress,
            ),
          ],
          changeOutput: BitcoinV2.Output(
            toAddress: senderAddress,
          ),
        ),
      );

      final legcy = Bitcoin.SigningInput(
        coinType: TWCoinType.Decred.value,
        signingV2: signing,
      );

      final plan = legcy.toPlan(TWCoinType.Decred);
      expect(plan.error, Common.SigningError.OK);
      expect(plan.hasPlanningResultV2(), true);
      expect(plan.planningResultV2.error, Common.SigningError.OK);
      expect(plan.planningResultV2.vsizeEstimate, 289.toInt64());

      final output = legcy.signDecred();
      expect(output.hasSigningResultV2(), true);
      expect(output.signingResultV2.error, Common.SigningError.OK);
      expectHex(
        output.signingResultV2.encoded,
        '0100000001aefeacac88c31b8ad5aaeaa71565c1042d80e4a77b12d1a7439e0cc21f3bccc50000000000ffffffff03809698000000000000001976a914f90f06478396b97df24c012b922f953fa894676188ac404b4c000000000000001976a9147d15c291fb7de05a38e39121df1e02f875a49f8988acf6f310050000000000001976a9147d15c291fb7de05a38e39121df1e02f875a49f8988ac00000000000000000100e1f5050000000000000000ffffffff6b483045022100c5464db9df8196c563db40ba1f7650291c755713ad87920a70c38c15db17bc3d02201c6bc9e4f8e43fdd548b0be387dd7baf7270bced8c9da4148128a655bed52e1a01210241d97dd9273a477c3560f1c5dba9dfd49624d8718ccca5619ff4a688dfcef01b',
      );
      expectHex(
        output.signingResultV2.txid,
        '686a9057b6cf4d8aec1dd4ec0963b6f8e172d9fe90784456d2f93c403f163409',
      );
    });
  });
}
