import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('KusamaAddress', () {
    const coin = TWCoinType.Kusama;

    test('Validation', () {
      // Substrate ed25519
      expect(
        TWAnyAddress.isValid(
            '5FqqU2rytGPhcwQosKRtW1E3ha6BJKAjHgtcodh71dSyXhoZ', coin),
        false,
      );
      // Polkadot ed25519
      expect(
        TWAnyAddress.isValid(
            '15AeCjMpcSt3Fwa47jJBd7JzQ395Kr2cuyF5Zp4UBf1g9ony', coin),
        false,
      );
      // Polkadot sr25519
      expect(
        TWAnyAddress.isValid(
            '15AeCjMpcSt3Fwa47jJBd7JzQ395Kr2cuyF5Zp4UBf1g9ony', coin),
        false,
      );
      // Bitcoin
      expect(
        TWAnyAddress.isValid('1ES14c7qLb5CYhLMUekctxLgc1FV2Ti9DA', coin),
        false,
      );

      // Kusama ed25519
      expect(
        TWAnyAddress.isValid(
            'FHKAe66mnbk8ke8zVWE9hFVFrJN1mprFPVmD5rrevotkcDZ', coin),
        true,
      );
      // Kusama secp256k1
      expect(
        TWAnyAddress.isValid(
            'FxQFyTorsjVsjjMyjdgq8w5vGx8LiA1qhWbRYcFijxKKchx', coin),
        true,
      );
      // Kusama sr25519
      expect(
        TWAnyAddress.isValid(
            'EJ5UJ12GShfh7EWrcNZFLiYU79oogdtXFUuDDZzk7Wb2vCe', coin),
        true,
      );
    });

    test('FromPrivateKey', () {
      // from subkey: tiny escape drive pupil flavor endless love walk gadget match filter luxury
      final privateKey = TWPrivateKey.createWithHexString(
          '0xa21981f3bb990c40837df44df639541ff57c5e600f9eb4ac00ed8d1f718364e5');
      final address = TWAnyAddress.createWithPublicKey(
          privateKey.getPublicKeyEd25519(), coin);
      expect(address.description,
          'CeVXtoU4py9e7F6upfM2ZarVave299TjcdaTSxhDDZrYgnM');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0x032eb287017c5cde2940b5dd062d413f9d09f8aa44723fc80bf46b96c81ac23d',
        TWPublicKeyType.ED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description,
          'CeVXtoU4py9e7F6upfM2ZarVave299TjcdaTSxhDDZrYgnM');
    });

    test('FromString', () {
      final address =
          TWAnyAddress('CeVXtoU4py9e7F6upfM2ZarVave299TjcdaTSxhDDZrYgnM', coin);
      expect(address.description,
          'CeVXtoU4py9e7F6upfM2ZarVave299TjcdaTSxhDDZrYgnM');
    });
  });
}
