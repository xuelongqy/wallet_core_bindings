import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWZcashTransaction', () {
    const coin = TWCoinType.Zcash;

    test('SaplingSigning', () {
      // tx on mainnet
      // https://explorer.zcha.in/transactions/ec9033381c1cc53ada837ef9981c03ead1c7c41700ff3a954389cfaddc949256
      const amount = 488000;
      const fee = 6000;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 't1QahNjDdibyE4EdYkawUSKBBcVTSqv64CS',
        coinType: coin.coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  "53685b8809efc50dd7d5cb0906b307a1b8aa5157baa5fc1bd6fe2d0344dd193a"),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(494000),
            script:
                parse_hex("76a914f84c7f4dd3c3dc311676444fdead6e6d290d50e388ac"),
          ),
        ],
        privateKey: [
          parse_hex(
              "a9684f5bebd0e1208aae2e02bc9e9163bd1965ad23d8538644e1df8b99b99559"),
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
        "53685b8809efc50dd7d5cb0906b307a1b8aa5157baa5fc1bd6fe2d0344dd193a"
        "00000000"
        "6b483045022100ca0be9f37a4975432a52bb65b25e483f6f93d577955290bb7fb0060a93bfc92002203e0627dff004d3c72a957dc9f8e4e0e696e69d125e4d8e275d119001924d3b48012103b243171fae5516d1dc15f9178cfcc5fdc67b0a883055c117b01ba8af29b953f6"
        "ffffffff"
        "01"
        "4072070000000000"
        "1976a91449964a736f3713d64283fd0018626ba50091c7e988ac"
        "00000000"
        "00000000"
        "0000000000000000"
        "00"
        "00"
        "00",
      );
    });

    test('BlossomSigning', () {
      // tx on mainnet
      // https://explorer.zcha.in/transactions/387939ff8eb07dd264376eeef2e126394ab139802b1d80e92b21c1a2ae54fe92
      const amount = 17615;
      const fee = 10000;
      const toAddress = "t1biXYN8wJahR76SqZTe1LBzTLf3JAsmT93";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        coinType: coin.coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "2381825cd9069a200944996257e25b9403ba3e296bbc1dd98b01019cc7028cde")
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(27615),
          ),
        ],
      );

      // real key 1p "m/44'/133'/0'/0/14"
      final utxoKey0 = TWPrivateKey.createWithHexString(
          '0x4646464646464646464646464646464646464646464646464646464646464646');
      final utxoAddr0 = coin.deriveAddress(utxoKey0);
      final script0 = TWBitcoinScript.lockScriptForAddress(utxoAddr0, coin);
      input.utxo[0].script = script0.data;
      input.privateKey.add(utxoKey0.data);

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));
        plan.amount = $fixnum.Int64(amount);
        plan.fee = $fixnum.Int64(fee);
        plan.change = $fixnum.Int64(0);

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
        "0400008085202f8901de8c02c79c01018bd91dbc6b293eba03945be25762994409209a06d95c828123000000006b483045022100e6e5071811c08d0c2e81cb8682ee36a8c6b645f5c08747acd3e828de2a4d8a9602200b13b36a838c7e8af81f2d6e7e694ede28833a480cfbaaa68a47187655298a7f0121024bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382ffffffff01cf440000000000001976a914c3bacb129d85288a3deb5890ca9b711f7f71392688ac00000000000000000000000000000000000000",
      );
    });

    test('SigningWithError', () {
      const amount = 17615;
      const toAddress = "t1biXYN8wJahR76SqZTe1LBzTLf3JAsmT93";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        coinType: coin.coin,
      );

      // Sign
      Bitcoin.SigningOutput output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error != Common.SigningError.OK, true);
    });
  });
}
