import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('ECash', () {
    const coin = TWCoinType.ECash;

    test('Address', () {
      expect(
          TWAnyAddress.isValid(
              'pqx578nanz2h2estzmkr53zqdg6qt8xyqvh683mrz0', coin),
          true);
    });

    test('ValidAddress', () {
      const string = 'ecash:qqra3amvnyyhrltyn5h97klwe68cuw3sfcgry9hl9k';
      final address = TWAnyAddress(string, coin);
      expect(address.description, string);

      final script =
          TWBitcoinScript.lockScriptForAddress(address.description, coin);
      expect(script.size != 0, true);
    });

    test('InvalidAddress', () {
      // Wrong checksum
      expect(
          TWAnyAddress.isValid(
              'pqx578nanz2h2estzmkr53zqdg6qt8xyqvffffffff', coin),
          false);
      expect(
          TWAnyAddress.isValid(
              'ecash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvffffffff', coin),
          false);

      // Valid BCH addresses are invalid for eCash
      expect(
          TWAnyAddress.isValid('pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc',
              TWCoinType.BitcoinCash),
          true);
      expect(
          TWAnyAddress.isValid(
              'pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc', coin),
          false);

      expect(
          TWAnyAddress.isValid(
              'bitcoincash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc',
              TWCoinType.BitcoinCash),
          true);
      expect(
          TWAnyAddress.isValid(
              'bitcoincash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc', coin),
          false);

      // Wrong prefix
      expect(
          TWAnyAddress.isValid(
              'fcash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvh683mrz0', coin),
          false);

      // Wrong base 32 (characters o, i)
      expect(
          TWAnyAddress.isValid(
              'poi578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc', coin),
          false);
    });

    test('LegacyToECashAddr', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(publicKey, 0);
      final addressString = address.description;
      expect(addressString, '1PeUvjuxyf31aJKX6kCXuaqxhmG78ZUdL1');

      final ecashAddress = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final ecashAddressString = ecashAddress.description;
      expect(ecashAddressString,
          'ecash:qruxj7zq6yzpdx8dld0e9hfvt7u47zrw9gswqul42q');
    });

    test('LockScript', () {
      final address = TWAnyAddress(
          'ecash:qpk05r5kcd8uuzwqunn8rlx5xvuvzjqju564r6szft', coin);
      final data = address.data;
      final rawData = Uint8List.fromList([0x00, ...data]);

      final legacyAddress = TWBitcoinAddress.createWithData(rawData);
      final legacyString = legacyAddress.description;
      expect(legacyString, '1AwDXywmyhASpCCFWkqhySgZf8KiswFoGh');

      final keyHash = legacyAddress.data.sublist(1);
      final script = TWBitcoinScript.buildPayToPublicKeyHash(keyHash);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a9146cfa0e96c34fce09c0e4e671fcd43338c14812e588ac');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'pzukqjmcyzrkh3gsqzdcy3e3d39cqxhl3gkypy0vjg', coin);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a914b9604b7820876bc510009b8247316c4b801aff8a87');
    });

    test('ExtendedKeys', () {
      // Same test as BCH, but with the 899 derivation path
      final wallet = TWHDWallet.createWithMnemonic(
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
        passphrase: 'TREZOR',
      );
      final xprv = wallet.getExtendedPrivateKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPRV,
      );
      final xpub = wallet.getExtendedPublicKey(
        purpose: TWPurpose.BIP44,
        coin: coin,
        version: TWHDVersion.XPUB,
      );
      expect(xprv,
          'xprv9xjBcTizebJaV61xMkuMJ89vis7saMmwFgTYeF83KwinEksJ4frk7wB4mDiKiwXDCbJmgmh6Bp1FkF8SopNZhbF3B5wyX32cuDVFZtuUDvB');
      expect(xpub,
          'xpub6BiY1yFtUxrsha6RTnSMfG6fGtxMypVncuP9SdXetHFm7ZCScDAzfjVYcW32bkNCGJ5DTqawAHSTbJdTBL8wVxqUDGpxnRtukrhhBoS7Wy7');
    });

    test('DeriveFromXPub', () {
      const xpub =
          'xpub6BiY1yFtUxrsha6RTnSMfG6fGtxMypVncuP9SdXetHFm7ZCScDAzfjVYcW32bkNCGJ5DTqawAHSTbJdTBL8wVxqUDGpxnRtukrhhBoS7Wy7';
      final pubKey2 = TWHDWallet.getPublicKeyFromExtended(
        extended: xpub,
        coin: coin,
        derivationPath: "m/44'/899'/0'/0/2",
      );
      final pubKey9 = TWHDWallet.getPublicKeyFromExtended(
        extended: xpub,
        coin: coin,
        derivationPath: "m/44'/899'/0'/0/9",
      );

      final address2 = TWAnyAddress.createWithPublicKey(pubKey2, coin);
      final address2String = address2.description;

      final address9 = TWAnyAddress.createWithPublicKey(pubKey9, coin);
      final address9String = address9.description;

      expect(
          address2String, 'ecash:qpttymfhuq3v8tasfv7drlglhq6ne6zxquqltu3dcj');
      expect(
          address9String, 'ecash:qqjraw2s5pwqwzql4znjpvp4vtvy3c9gmugq62r2j7');
    });

    test('SignTransaction', () {
      const amount = 600;

      // Transaction on eCash Mainnet
      // https://blockchair.com/ecash/transaction/96ee20002b34e468f9d3c5ee54f6a8ddaa61c118889c4f35395c2cd93ba5bbb4

      final input = Bitcoin.SigningInput(
        coinType: coin.coin,
        hashType: TWBitcoinScript.hashTypeForCoin(coin),
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: 'ecash:qpmfhhledgp0jy66r5vmwjwmdfu0up7ujqpvm4v8rm',
        changeAddress: 'ecash:qz0q3xmg38sr94rw8wg45vujah7kzma3cs0tssg5fd',
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                  'e28c2b955293159898e34c6840d99bf4d390e2ee1c6f606939f18ee1e2000d05'),
              index: 2,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(5151),
            script:
                parse_hex('76a914aff1e0789e5fe316b729577665aa0a04d5b0f8c788ac'),
          ),
        ],
        privateKey: [
          parse_hex(
              '7fdafb9db5bc501f2096e7d13d331dc7a75d9594af3d251313ba8b6200f4e384')
        ],
      );

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.transaction.outputs.length, 2);
      expect(output.transaction.outputs[0].value.toInt(), amount);
      expect(output.transaction.outputs[1].value.toInt(), 4325);
      expect(output.encoded.length, 226);
      expectHex(
        output.encoded,
        "01000000"
        "01"
        "e28c2b955293159898e34c6840d99bf4d390e2ee1c6f606939f18ee1e2000d05"
        "02000000"
        "6b483045022100b70d158b43cbcded60e6977e93f9a84966bc0cec6f2dfd1463d1223a90563f0d02207548d081069de570a494d0967ba388ff02641d91cadb060587ead95a98d4e3534121038eab72ec78e639d02758e7860cdec018b49498c307791f785aa3019622f4ea5b"
        "ffffffff"
        "02"
        "5802000000000000"
        "1976a914769bdff96a02f9135a1d19b749db6a78fe07dc9088ac"
        "e510000000000000"
        "1976a9149e089b6889e032d46e3b915a3392edfd616fb1c488ac"
        "00000000",
      );
    });
  });
}
