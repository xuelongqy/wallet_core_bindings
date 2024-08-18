import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('LitecoinAddress', () {
    const coin = TWCoinType.Litecoin;

    test('deriveAddress_legacy', () {
      final pubKey = TWPublicKey.createWithHexString(
        '03b49081a4d7ad24b20e209bc6fe10491aadb5607777baf0509a036cce96025db0',
        TWPublicKeyType.SECP256k1,
      );
      final addrStr = TWAnyAddress.createWithPublicKeyDerivation(
        publicKey: pubKey,
        coin: coin,
        derivation: TWDerivation.LitecoinLegacy,
      ).description;
      expect(addrStr, 'LW6HjAU6GL9fK2LZWUA6VZCzomTdrpx3nr');

      final address =
          TWBitcoinAddress.createWithPublicKey(pubKey, coin.p2pkhPrefix);
      expect(address.description, addrStr);
    });

    test('deriveAddress_segwit', () {
      final pubKey = TWPublicKey.createWithHexString(
        '030fc2fdd1a0b5d43b31227a4b1cd57e7d35a6edc93fb12f9315e67762abeb8be0',
        TWPublicKeyType.SECP256k1,
      );
      final addrStr = TWAnyAddress.createWithPublicKeyDerivation(
        publicKey: pubKey,
        coin: coin,
        derivation: TWDerivation.BitcoinSegwit,
      ).description;
      expect(addrStr, 'ltc1q3m3ujh350qrqdl33pv7pjw0d0m9qnm6qjcjpga');

      final address = TWSegwitAddress.createWithPublicKey(coin.hrp, pubKey);
      expect(address.description, addrStr);
    });
  });
}
