import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('PivxAddress', () {
    const coin = TWCoinType.TWCoinTypePivx;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('DLCk9wuF3r8CRbawUhrDpDHXAGfkHAC7if', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('DSHhD6WxT5RfG2deUzVfuC1jDuRfdDpsSo', coin),
        true,
      );
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0273132ffeafdc0eec3aaef5684a320a677cc77ba43df81de944af4a7fc6de66c9',
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'D6E4vLacYhKc6RVxLNQg5j8rtWbAH8fybH');

      final wallet = TWHDWallet.createWithMnemonic(
          'shoot island position soft burden budget tooth cruel issue economy destroy above');
      final addr = wallet.getAddressForCoin(coin);
      expect(addr, 'D81AqC8zKma3Cht4TbVuh4jyVVyLkZULCm');
    });

    test('FromString', () {
      var address = TWAnyAddress('D6E4vLacYhKc6RVxLNQg5j8rtWbAH8fybH', coin);
      expect(address.description, 'D6E4vLacYhKc6RVxLNQg5j8rtWbAH8fybH');

      address = TWAnyAddress('DSHhD6WxT5RfG2deUzVfuC1jDuRfdDpsSo', coin);
      expect(address.description, 'DSHhD6WxT5RfG2deUzVfuC1jDuRfdDpsSo');
    });

    test('AddressData', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0273132ffeafdc0eec3aaef5684a320a677cc77ba43df81de944af4a7fc6de66c9',
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final address = TWCoinTypeDeriveAddressFromPublicKey(coin, publicKey);

      final data =
          TWAnyAddress('D6E4vLacYhKc6RVxLNQg5j8rtWbAH8fybH', coin).data;
      expect(hex(data), '0be8da968f9bc6c1c16b8c635544e757aade7013');
      expect(data, TWAnyAddress(address, coin).data);

      final addr2 = TWAnyAddress('1G15VvshDxwFTnahZZECJfFwEkq9fP79', coin);
      expect(addr2.pointer, nullptr);
    });
  });
}
