import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('HederaAddress', () {
    const coin = TWCoinType.TWCoinTypeHedera;

    test('Valid', () {
      expect(TWAnyAddress.isValid('invalid', coin), false);
      expect(
          TWAnyAddress.isValid(
              '302a300506032b65700321007df3e1ab790b28de4706d36a7aa99a0e043cb3e2c3d6ec6686e4af7f638b0860',
              coin),
          false);
      expect(TWAnyAddress.isValid('0.0.abc', coin), false);
      expect(TWAnyAddress.isValid('0.0.1', coin), true);
      expect(TWAnyAddress.isValid('0.0.1377988', coin), true);
      expect(
          TWAnyAddress.isValid(
              '0.0.302a300506032b65700321007df3e1ab790b28de4706d36a7aa99a0e043cb3e2c3d6ec6686e4af7f638b0860',
              coin),
          true);
    });

    test('FromString', () {
      final address = TWAnyAddress('0.0.1377988', coin);
      expect(address.description, '0.0.1377988');
    });
  });
}
