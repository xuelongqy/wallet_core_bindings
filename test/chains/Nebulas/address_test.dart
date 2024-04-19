import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('NeblAddress', () {
    const coin = TWCoinType.TWCoinTypeNebulas;

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid('abc', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('a1TgpFZWCMmFd2sphb6RKsCvsEyMCNa2Yyv', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('n2TgpFZWCMmFd2sphb6RKsCvsEyMCNa2Yyv', coin),
        false,
      );
      // normal address test
      expect(
        TWAnyAddress.isValid('n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin),
        true,
      );
      // contract address test
      expect(
        TWAnyAddress.isValid('n1zUNqeBPvsyrw5zxp9mKcDdLTjuaEL7s39', coin),
        true,
      );
    });

    test('String', () {
      final address = TWAnyAddress('n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY', coin);
      expect(address.description, 'n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY');
    });

    test('FromPrivateKey', () {
      final privaKey = TWPrivateKey.createWithHexString(
          'd2fd0ec9f6268fc8d1f563e3e976436936708bdf0dc60c66f35890f5967a8d2b');
      final publicKey = privaKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description, 'n1V5bB2tbaM3FUiL4eRwpBLgEredS5C2wLY');
    });
  });
}
