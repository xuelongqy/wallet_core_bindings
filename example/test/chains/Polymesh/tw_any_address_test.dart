import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWPolymesh', () {
    const coin = TWCoinType.Polymesh;
    const polymeshPrefix = 12;

    test('Address', () {
      const string = "2E5u4xA1TqswQ3jMJH96zekxwr2itvKu79fDC1mmnVZRh6Uv";
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash,
          '4870d56d074c50e891506d78faa4fb69ca039cc5f131eb491e166b975880e867');
    });

    test('Validation', () {
      // Substrate ed25519
      expect(
        TWAnyAddress.isValid(
            '5FqqU2rytGPhcwQosKRtW1E3ha6BJKAjHgtcodh71dSyXhoZ', coin),
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
        false,
      );
      // Kusama secp256k1
      expect(
        TWAnyAddress.isValid(
            'FxQFyTorsjVsjjMyjdgq8w5vGx8LiA1qhWbRYcFijxKKchx', coin),
        false,
      );
      // Kusama sr25519
      expect(
        TWAnyAddress.isValid(
            'EJ5UJ12GShfh7EWrcNZFLiYU79oogdtXFUuDDZzk7Wb2vCe', coin),
        false,
      );

      // Polkadot ed25519
      expect(
        TWAnyAddress.isValid(
            '15KRsCq9LLNmCxNFhGk55s5bEyazKefunDxUH24GFZwsTxyu', coin),
        false,
      );
      // Polkadot sr25519
      expect(
        TWAnyAddress.isValid(
            '15AeCjMpcSt3Fwa47jJBd7JzQ395Kr2cuyF5Zp4UBf1g9ony', coin),
        false,
      );

      // Polymesh
      expect(
        TWAnyAddress.isValid(
            '2DxwekgWwK7sqVeuXGmaXLZUvwnewLTs2rvU2CFKLgvvYwCG', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'JCViCkwMdGWKpf7Wogb8EFtDmaYTEZGEg6ah4svUPGnnpc7A', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid(
            '2DxwekgWwK7sqVeuXGmaXLZUvwnewLTs2rvU2CFKLgvvYwCG', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'JCViCkwMdGWKpf7Wogb8EFtDmaYTEZGEg6ah4svUPGnnpc7A', coin),
        false,
      );
    });

    test('FromPrivateKey', () {
      // subkey phrase `chief menu kingdom stereo hope hazard into island bag trick egg route`
      final privateKey = TWPrivateKey.createWithHexString(
          '0x612d82bc053d1b4729057688ecb1ebf62745d817ddd9b595bc822f5f2ba0e41a');
      final publicKey = privateKey.getPublicKey(coin);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;
      expect(addressStr, '2GmLy7KywpsV5fDpZfJMcgGgzoJWyrEA3Wc3fDmsoq5iqtBT');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '0xbeff0e5d6f6e6e6d573d3044f3e2bfb353400375dc281da3337468d4aa527908',
        TWPublicKeyType.ED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      final addressStr = address.description;
      expect(addressStr, '2GmLy7KywpsV5fDpZfJMcgGgzoJWyrEA3Wc3fDmsoq5iqtBT');
    });

    test('FromPublicKeyWithPrefix', () {
      final publicKey = TWPublicKey.createWithHexString(
        '849e2f6b165d4b28b39ef3d98f86c0520d82bc349536324365c10af08f323f83',
        TWPublicKeyType.ED25519,
      );
      const addressPolymesh =
          '2FSoQykVV3uWe5ChZuazMDHBoaZmCPPuoYx5KHL5VqXooDQW';
      {
        final address = TWAnyAddress.createSS58WithPublicKey(
          publicKey: publicKey,
          coin: coin,
          ss58Prefix: polymeshPrefix,
        );
        final addressStr = address.description;
        expect(addressStr, addressPolymesh);
      }
    });

    test('FromString', () {
      const string = '2E5u4xA1TqswQ3jMJH96zekxwr2itvKu79fDC1mmnVZRh6Uv';
      final addr = TWAnyAddress(string, coin);
      final string2 = addr.description;
      expect(string, string2);
      final keyHash = addr.data;
      expectHex(keyHash,
          '4870d56d074c50e891506d78faa4fb69ca039cc5f131eb491e166b975880e867');
    });

    test('FromStringWithPrefix', () {
      // polymesh
      const addressPolymesh =
          '2FSoQykVV3uWe5ChZuazMDHBoaZmCPPuoYx5KHL5VqXooDQW';
      {
        final address = TWAnyAddress.createSS58(
          string: addressPolymesh,
          coin: TWCoinType.Polymesh,
          ss58Prefix: polymeshPrefix,
        );
        final addressStr = address.description;
        expect(addressStr, addressPolymesh);
      }
    });
  });
}
