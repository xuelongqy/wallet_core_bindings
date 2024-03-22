import 'dart:ffi';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('BitcoinCash', () {
    // clang-format off
    test('Address', () {
      expect(
        TWAnyAddress.isValid('pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc',
            TWCoinType.TWCoinTypeBitcoinCash),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'bitcoincash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc',
            TWCoinType.TWCoinTypeBitcoinCash),
        true,
      );
    });

    test('ValidAddress', () {
      final string = 'bitcoincash:qqa2qx0d8tegw32xk8u75ws055en4x3h2u0e6k46y4';
      final address = TWAnyAddress(string, TWCoinType.TWCoinTypeBitcoinCash);
      expect(address.pointer != nullptr, true);

      final script = TWBitcoinScript.lockScriptForAddress(
          string, TWCoinType.TWCoinTypeBitcoinCash);
      expect(script.size != 0, true);
    });

    test('InvalidAddress', () {
      // Wrong checksum
      expect(
        TWAnyAddress.isValid('pqx578nanz2h2estzmkr53zqdg6qt8xyqvffffffff',
            TWCoinType.TWCoinTypeBitcoinCash),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'bitcoincash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvffffffff',
            TWCoinType.TWCoinTypeBitcoinCash),
        false,
      );

      // Valid eCash addresses are invalid for BCH
      expect(
        TWAnyAddress.isValid('pqx578nanz2h2estzmkr53zqdg6qt8xyqvh683mrz0',
            TWCoinType.TWCoinTypeECash),
        true,
      );
      expect(
        TWAnyAddress.isValid('pqx578nanz2h2estzmkr53zqdg6qt8xyqvh683mrz0',
            TWCoinType.TWCoinTypeBitcoinCash),
        false,
      );

      expect(
        TWAnyAddress.isValid('ecash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvh683mrz0',
            TWCoinType.TWCoinTypeECash),
        true,
      );
      expect(
        TWAnyAddress.isValid('ecash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvh683mrz0',
            TWCoinType.TWCoinTypeBitcoinCash),
        false,
      );

      // Wrong prefix
      expect(
        TWAnyAddress.isValid('bcash:pqx578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc',
            TWCoinType.TWCoinTypeBitcoinCash),
        false,
      );

      // Wrong base 32 (characters o, i)
      expect(
        TWAnyAddress.isValid('poi578nanz2h2estzmkr53zqdg6qt8xyqvwhn6qeyc',
            TWCoinType.TWCoinTypeBitcoinCash),
        false,
      );
    });

    test('LegacyToCashAddr', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '28071bf4e2b0340db41b807ed8a5514139e5d6427ff9d58dbd22b7ed187103a4');
      final publicKey = privateKey.getPublicKeySecp256k1(true);
      final address = TWBitcoinAddress.createWithPublicKey(publicKey, 0);
      final addressString = address.description;
      expect(addressString, '1PeUvjuxyf31aJKX6kCXuaqxhmG78ZUdL1');

      final cashAddress = TWAnyAddress.createWithPublicKey(
          publicKey: publicKey, coin: TWCoinType.TWCoinTypeBitcoinCash);
      final cashAddressString = cashAddress.description;
      expect(cashAddressString,
          'bitcoincash:qruxj7zq6yzpdx8dld0e9hfvt7u47zrw9gfr5hy0vh');
    });

    test('LockScript', () {
      final address = TWAnyAddress(
          'bitcoincash:qpk05r5kcd8uuzwqunn8rlx5xvuvzjqju5rch3tc0u',
          TWCoinType.TWCoinTypeBitcoinCash);
      final data = address.data;
      final rawData = <int>[];
      rawData.add(0x00);
      rawData.addAll(data);

      final legacyAddress =
          TWBitcoinAddress.createWithData(Uint8List.fromList(rawData));
      final legacyString = legacyAddress.description;
      expect(legacyString, '1AwDXywmyhASpCCFWkqhySgZf8KiswFoGh');

      final keyHash = Uint8List.sublistView(legacyAddress.data, 1, 21);
      final script = TWBitcoinScript.buildPayToPublicKeyHash(keyHash);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a9146cfa0e96c34fce09c0e4e671fcd43338c14812e588ac');

      final script2 = TWBitcoinScript.lockScriptForAddress(
          'pzukqjmcyzrkh3gsqzdcy3e3d39cqxhl3g0f405k5l',
          TWCoinType.TWCoinTypeBitcoinCash);
      final scriptData2 = script2.data;
      expectHex(scriptData2, 'a914b9604b7820876bc510009b8247316c4b801aff8a87');
    });

    test('ExtendedKeys', () {
      final xpub =
          'xpub6CEHLxCHR9sNtpcxtaTPLNxvnY9SQtbcFdov22riJ7jmhxmLFvXAoLbjHSzwXwNNuxC1jUP6tsHzFV9rhW9YKELfmR9pJaKFaM8C3zMPgjw';
      final pubKeys2 = TWHDWallet.getPublicKeyFromExtended(
          xpub, TWCoinType.TWCoinTypeBitcoinCash, "m/44'/145'/0'/0/2");
      final pubKeys9 = TWHDWallet.getPublicKeyFromExtended(
          xpub, TWCoinType.TWCoinTypeBitcoinCash, "m/44'/145'/0'/0/9");

      final address = TWAnyAddress.createWithPublicKey(
          publicKey: pubKeys2, coin: TWCoinType.TWCoinTypeBitcoinCash);
      final addressString = address.description;

      final address9 = TWAnyAddress.createWithPublicKey(
          publicKey: pubKeys9, coin: TWCoinType.TWCoinTypeBitcoinCash);
      final addressString9 = address9.description;

      expect(addressString,
          'bitcoincash:qq4cm0hcc4trsj98v425f4ackdq7h92rsy6zzstrgy');
      expect(addressString9,
          'bitcoincash:qqyqupaugd7mycyr87j899u02exc6t2tcg9frrqnve');
    });

    test('SignTransaction', () {
      final amount = 600;

      // Transaction on Bitcoin Cash Mainnet
      // https://blockchair.com/bitcoin-cash/transaction/96ee20002b34e468f9d3c5ee54f6a8ddaa61c118889c4f35395c2cd93ba5bbb4

      final input = Bitcoin.SigningInput(
        hashType:
            TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoinCash),
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: '1Bp9U1ogV3A14FMvKbRJms7ctyso4Z4Tcx',
        changeAddress: '1FQc5LdgGHMHEN9nwkjmz6tWkxhPpxBvBU',
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
              '7fdafb9db5bc501f2096e7d13d331dc7a75d9594af3d251313ba8b6200f4e384'),
        ],
      );

      // Sign
      final output = Bitcoin.SigningOutput.fromBuffer(TWAnySigner.sign(
          input.writeToBuffer(), TWCoinType.TWCoinTypeBitcoinCash));

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
