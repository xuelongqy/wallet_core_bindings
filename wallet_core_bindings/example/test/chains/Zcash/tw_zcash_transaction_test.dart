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
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 't1QahNjDdibyE4EdYkawUSKBBcVTSqv64CS',
        coinType: coin.value,
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
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        coinType: coin.value,
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

    test('Zip0317Fee', () {
      // tx on mainnet
      // https://blockchair.com/zcash/transaction/092379d65d9b33be1322b2833e20cb573f87e49f73a3537c172354453dcee3a4

      const myAddress = "t1Nx4n8MXhXVTZMY6Vx2zbxsCz5VstD9nuv";
      final myPrivateKey = parse_hex(
          "5313c6cb5767fac88a303dab4f5d96ee55b547ec99da0db7a20694ac9e395668");

      final input = Bitcoin.SigningInput(
        coinType: coin.value,
        hashType: TWBitcoinSigHashType.All.value,
        zip0317: true,
        toAddress: 't1S3JTzDWR7FzANsn3erXRPms2BfWVQgH9T',
        useMaxAmount: true,
        privateKey: [myPrivateKey],
      );

      final txHash = parse_hex(
              'f8a8bdcd4b1b3c6b69b50ebbb26921c43583bb93f20e3ccf3c650791ef969b4e')
          .reversed
          .toList();
      final redeemScript =
          TWBitcoinScript.lockScriptForAddress(myAddress, coin).data;

      addUtxo(int vout, int amount) {
        input.utxo.add(Bitcoin.UnspentTransaction(
          outPoint: Bitcoin.OutPoint(
            hash: txHash,
            index: vout,
            sequence: UINT32_MAX,
          ),
          script: redeemScript,
          amount: $fixnum.Int64(amount),
        ));
      }

      addUtxo(0, 7000);
      addUtxo(1, 1505490);
      addUtxo(2, 7100);
      addUtxo(3, 7200);
      addUtxo(4, 7300);
      addUtxo(5, 7400);
      addUtxo(6, 7500);
      addUtxo(7, 7600);
      addUtxo(8, 7700);
      addUtxo(9, 7800);
      addUtxo(10, 7900);
      addUtxo(11, 8000);
      addUtxo(12, 8001);
      addUtxo(13, 8002);
      addUtxo(14, 8003);
      addUtxo(15, 8004);

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.branchId = [0x55, 0x10, 0xe7, 0xc8];

      input.plan = plan;

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(
        hex(output.encoded),
        '0400008085202f89104e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8000000006b4830450221008697d7c738af36b6c2009eee98ab8d10356168cdab1ad3499a993e55ecf5ab56022011762fd1b95abcc55b04a13b395f00d131d2588b29cbb892fa0438920f5bc151012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8010000006b483045022100eb066fc7ab4cbdd42e6e50479bc3e4a5717f0d2c29626831b649d86d8e204df40220333b886a0eb196055f22e19dc9f01c46c57258e91b150cd5587cda1b707a1056012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8020000006b483045022100a1d2744150254ae05942c42721d89e02d0c9992b75d7db2bce3ebfe8e2e6a0e902200abe593108cf1cdddeb02403c15dc087d2dd274c2f85a63bac2248ab2ce3ef34012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8030000006b483045022100f791d7d491a20b7ebd31e0465b9adb83e5994d0fa092c4c213d1a9d97ad2fb3b02207223f97c35cd3f482ff93bdae55a4d7c3087cffd790d689777a9a32271e835c7012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8040000006a47304402204f8fa75701453de79dde52936d2526c6bd31d98d45cbe481df25fcd482054620022056221c611c6af5c66bb302ebadabe76c158aa83c47b4927e90182e6fea0bb392012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8050000006b483045022100d28ed7ea432c2d122815be053c25a044e9d02a8dc5f52e12c58d7a833627a9a90220575fa325028e0abecc2be8c40db5fd8552337dc62d3acb9a8e919dd597927b81012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8060000006b48304502210082dc355620bb855e4fd04984054858376bb28d07f97b149ab49cb7ec6c42559c022005ce1af01f00d452afbc51b8a3c1f14e681f93552e94d66906a71f1ba1c00e3c012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8070000006b483045022100d06a9e04bc6be40913fda047ba19ed24f9a4a8cbd5e338994e22609d6a1a11b202207bf5fee15e9a8c1b17095f7f804d16ba02cba5071bda3383de3ee0a46d3b1dd5012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8080000006a4730440220617f682e60ff8f7fa4784b4d318891cdbac461a99f48087034064ed813d2063f022060cb338a8ee49898ec774d431d0867b5a15382be90c685f39fde4a41af8ff0a7012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f8090000006b4830450221008e4f66cb5c69d98cc9a4f1e895fe3c645d4640f4a5f7e8337c3beea34915ab170220320e8d14cd3dbd26eab1c41eca2146089a59dafde04334cd321554183e809417012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f80a0000006b483045022100c4bbecaecdf6a9eb4a776b4f99541659dc73b8f2c28937e34e7cb637b5105d8302200092a7ae0eee8b4925e8c207c057f43f705b94e468053d4028a785f4652bc2b1012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f80b0000006b4830450221008f2228ac57a30d07cbfed7b0d39977e563d23f4f4776451f76e8b401c618f0710220095a73c8bef932d1865e55656620d3071221be279afd66f0827e39ca4eaa26d3012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f80c0000006b483045022100a52c7692a09c308ac9cd87c85afeaa37d69c661b8f7b6cdf8c02876037359cb8022006a3da236a86466add64fa6a38655d2a2b6fba05b84e25fa2583210a435be858012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f80d0000006a47304402202ce1f193c23e0262fdf62cb74c1669fa7c9e9de5a801434df43c0dc69b1d6aa1022048641ab533f539a5185136a6b2d933944703fa83ddae233297b98d6f89845792012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f80e0000006b483045022100db80a6d02c5cc9c21e94868654be891102a4e664ceab29edbd6ebc9106fc27290220509ddb845a48c2f94f4ec7995d12b01305ecc98eb49dd5b26826f6e4bd1ceaec012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff4e9b96ef9107653ccf3c0ef293bb8335c42169b2bb0eb5696b3c1b4bcdbda8f80f0000006b483045022100e40aba96f9dcaafb1ce43acf2cfec44f3c2c59340c8d0fa3cc46c6249efb27ca0220184c20c35ffd585efbb9d36049bcf60670f0120968c435dde2333631b5e1b102012103b6ced6ffee0d78974da26d910c8b36781e8598019a3982a04286384452418405ffffffff01a07f1700000000001976a914599686197c40d39a8e6272355f206a9523fab00288ac00000000000000000000000000000000000000',
      );
    });

    test('SendToTexAddress', () {
      // tx on mainnet
      // https://blockchair.com/zcash/transaction/e5f4d0c28f96c80caace4052aed4645a78badedc00cd3b071322d63c264b2885

      const myAddress = "t1a6Do9CH4umduHKtoufDDMQMypd7VYLqhH";
      final myPrivateKey = parse_hex(
          "cfa0c168cce0d041119b216f60aed343b93fde0a8736ea0bcd6254cfef0a3c79");

      final input = Bitcoin.SigningInput(
        coinType: coin.value,
        hashType: TWBitcoinSigHashType.All.value,
        zip0317: true,
        toAddress: "tex1auz6gx89x2wcku6gswdvaz2nf9x3seex6px6v0",
        changeAddress: myAddress,
        amount: $fixnum.Int64(200000),
        privateKey: [myPrivateKey],
      );

      final txHash = parse_hex(
              "d0da6ed2f89de9936ca3429110bc60a02f6e797665b8714d646fc25b45210ef2")
          .reversed
          .toList();
      final redeemScript =
          TWBitcoinScript.lockScriptForAddress(myAddress, coin).data;

      input.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: txHash,
          index: 0,
          sequence: UINT32_MAX,
        ),
        script: redeemScript,
        amount: $fixnum.Int64(2000000),
      ));

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      // Nu6BranchID
      plan.branchId = [0x55, 0x10, 0xe7, 0xc8];

      input.plan = plan;

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);

      expect(
        hex(output.encoded),
        "0400008085202f8901f20e21455bc26f644d71b86576796e2fa060bc109142a36c93e99df8d26edad0000000006b483045022100850a98be0d1a432f900bb3c34347d16ea839d4a59de288c17838f1d2ee6ec390022007e5fd53c8c31d75ca6d79b3d2874e6dd8e685e60758874e4884ace9d26eea4501210340643a2a4ea0777ce0b2529be566a3caea5598fef56c44579dadf96b586bed50ffffffff02400d0300000000001976a914ef05a418e5329d8b7348839ace8953494d18672688ac30501b00000000001976a914b1e4e13f836a6e7a33cbb20817a62da829d543e988ac00000000000000000000000000000000000000",
      );
    });

    test('SigningWithError', () {
      const amount = 17615;
      const toAddress = "t1biXYN8wJahR76SqZTe1LBzTLf3JAsmT93";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        coinType: coin.value,
      );

      // Sign
      Bitcoin.SigningOutput output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error != Common.SigningError.OK, true);
    });
  });
}
