import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('BitcoinDiamondAddress', () {
    const coin = TWCoinType.BitcoinDiamond;

    test('Valid', () {
      expect(TWAnyAddress.isValid('1G15VvshDxwFTnahZZECJfFwEkq9fP79o8', coin),
          true);
      expect(TWAnyAddress.isValid('3PaCtJcD7sxpCf3JNPLpMNnHnwJHoBeucF', coin),
          true);
      expect(TWAnyAddress.isValid('395mRH5aV3DLHPXC4Md9cPdpiquLtTqRSX', coin),
          true);
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
          '02485a209514cc896f8ed736e205bc4c35bd5299ef3f9e84054475336b964c02a3',
          TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, '1G15VvshDxwFTnahZZECJfFwEkq9fP79o8');

      final wallet = TWHDWallet.createWithMnemonic(
          'shoot island position soft burden budget tooth cruel issue economy destroy above');
      var addr = wallet.getAddressForCoin(coin);
      expect(addr, '1KaRW9xPPtCTZ9FdaTHduCPck4YvSeEWNn');

      addr = wallet.getAddressDerivation(coin, TWDerivation.BitcoinSegwit);
      expect(addr, 'bcd1q7jh5qukuy9fc2pjm89xnyvx5dtfyvru9evw30x');
    });

    test('FromString', () {
      var address = TWAnyAddress('1G15VvshDxwFTnahZZECJfFwEkq9fP79o8', coin);
      expect(address.description, '1G15VvshDxwFTnahZZECJfFwEkq9fP79o8');

      address = TWAnyAddress('3PaCtJcD7sxpCf3JNPLpMNnHnwJHoBeucF', coin);
      expect(address.description, '3PaCtJcD7sxpCf3JNPLpMNnHnwJHoBeucF');
    });

    test('AddressData', () {
      final publicKey = TWPublicKey.createWithHexString(
          '02485a209514cc896f8ed736e205bc4c35bd5299ef3f9e84054475336b964c02a3',
          TWPublicKeyType.SECP256k1);
      var address = TWAnyAddress.createWithPublicKeyDerivation(
          publicKey: publicKey,
          coin: coin,
          derivation: TWDerivation.BitcoinSegwit);

      final data =
          TWAnyAddress('1G15VvshDxwFTnahZZECJfFwEkq9fP79o8', coin).data;
      expectHex(data, 'a48da46386ce52cccad178de900c71f06130c310');
      expectHexBytes(data, address.data);

      address = TWAnyAddress('1G15VvshDxwFTnahZZECJfFwEkq9fP79', coin);
      expect(address.pointer, 0);
    });
  });
}
