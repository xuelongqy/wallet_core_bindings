import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  const coin = TWCoinType.TWCoinTypeOasis;

  group('MultiversXAddress', () {
    test('Valid', () {
      expect(
        TWAnyAddress.isValid(
            'oasis1qp0cnmkjl22gky6p6qeghjytt4v7dkxsrsmueweh', coin),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWAnyAddress.isValid(
            'oasis1qp0cnmkjl22gky6p6qeghjytt4v7dkxsrsmuewehj', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            'oasi1qp0cnmkjl22gky6p6qeghjytt4v7dkxsrsmueweh', coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '4f8b5676990b00e23d9904a92deb8d8f428ff289c8939926358f1d20537c21a0');
      final address = TWAnyAddress.createWithPublicKey(
          privateKey.getPublicKeyEd25519(), coin);
      expect('oasis1qzawzy5kaa2xgphenf3r0f5enpr3mx5dps559yxm',
          address.description);
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        'aba52c0dcb80c2fe96ed4c3741af40c573a0500c0d73acda22795c37cb0f1739',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect('oasis1qphdkldpttpsj2j3l9sde9h26cwpfwqwwuhvruyu',
          address.description);
    });

    test('FromString', () {
      final address =
          TWAnyAddress('oasis1hts399h023jqd7v6vgm6dxvcguwe4rgvqqgvq38n', coin);
      expect(address.description,
          'oasis1hts399h023jqd7v6vgm6dxvcguwe4rgvqqgvq38n');
    });
  });
}
