import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('PolkadotAddress', () {
    const coin = TWCoinType.TWCoinTypePolkadot;

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
        true,
      );
      // Polkadot sr25519
      expect(
        TWAnyAddress.isValid(
            '15AeCjMpcSt3Fwa47jJBd7JzQ395Kr2cuyF5Zp4UBf1g9ony', coin),
        true,
      );

      expect(
        TWAnyAddress.isValidSS58(
          string: 'cEYtw6AVMB27hFUs4gVukajLM7GqxwxUfJkbPY3rNToHMcCgb',
          coin: coin,
          ss58Prefix: 64,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValidSS58(
          string: 'JCViCkwMdGWKpf7Wogb8EFtDmaYTEZGEg6ah4svUPGnnpc7A',
          coin: coin,
          ss58Prefix: 64,
        ),
        false,
      );

      // Polymesh
      expect(
        TWAnyAddress.isValidSS58(
          string: '2DxwekgWwK7sqVeuXGmaXLZUvwnewLTs2rvU2CFKLgvvYwCG',
          coin: coin,
          ss58Prefix: 12,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValidSS58(
          string: 'JCViCkwMdGWKpf7Wogb8EFtDmaYTEZGEg6ah4svUPGnnpc7A',
          coin: coin,
          ss58Prefix: 12,
        ),
        false,
      );
    });

    test('FromPrivateKey', () {
      // subkey phrase `chief menu kingdom stereo hope hazard into island bag trick egg route`
      final publicKey = TWPublicKey.createWithHexString(
        '0xbeff0e5d6f6e6e6d573d3044f3e2bfb353400375dc281da3337468d4aa527908',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description,
          '15KRsCq9LLNmCxNFhGk55s5bEyazKefunDxUH24GFZwsTxyu');
    });

    test('FromPublicKeyWithPrefix', () {
      var publicKey = TWPublicKey.createWithHexString(
        '0x92fd9c237030356e26cfcc4568dc71055d5ec92dfe0ff903767e00611971bad3',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final addressPolkadot = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(addressPolkadot.description,
          '14KjL5vGAYJCbKgZJmFKDSjewtBpvaxx9YvRZvi7qmb5s8CC');

      final addressAstar = TWAnyAddress.createSS58WithPublicKey(
        publicKey: publicKey,
        coin: coin,
        ss58Prefix: 5,
      );
      expect(addressAstar.description,
          'ZG2d3dH5zfqNchsqReS6x4nBJuJCW7Z6Fh5eLvdA3ZXGkPd');

      final addressParallel = TWAnyAddress.createSS58WithPublicKey(
        publicKey: publicKey,
        coin: coin,
        ss58Prefix: 172,
      );
      expect(addressParallel.description,
          'p8EGHjWt7e1MYoD7V6WXvbPZWK9GSJiiK85kv2R7Ur7FisPUL');

      // polymesh
      publicKey = TWPublicKey.createWithHexString(
        '849e2f6b165d4b28b39ef3d98f86c0520d82bc349536324365c10af08f323f83',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final addressPolymesh = TWAnyAddress.createSS58WithPublicKey(
        publicKey: publicKey,
        coin: coin,
        ss58Prefix: 12,
      );
      expect(addressPolymesh.description,
          '2FSoQykVV3uWe5ChZuazMDHBoaZmCPPuoYx5KHL5VqXooDQW');
    });

    test('FromString', () {
      final address = TWAnyAddress(
          '15KRsCq9LLNmCxNFhGk55s5bEyazKefunDxUH24GFZwsTxyu', coin);
      expect(address.description,
          '15KRsCq9LLNmCxNFhGk55s5bEyazKefunDxUH24GFZwsTxyu');
    });

    test('FromStringWithPrefix', () {
      final addressKusama = TWAnyAddress.createSS58(
        string: 'Fu3r514w83euSVV7q1MyFGWErUR2xDzXS2goHzimUn4S12D',
        coin: coin,
        ss58Prefix: 2,
      );
      expect(addressKusama.description,
          'Fu3r514w83euSVV7q1MyFGWErUR2xDzXS2goHzimUn4S12D');

      final addressParallel = TWAnyAddress.createSS58(
        string: 'p8EGHjWt7e1MYoD7V6WXvbPZWK9GSJiiK85kv2R7Ur7FisPUL',
        coin: coin,
        ss58Prefix: 172,
      );
      expect(addressParallel.description,
          'p8EGHjWt7e1MYoD7V6WXvbPZWK9GSJiiK85kv2R7Ur7FisPUL');

      // polymesh
      final addressPolymesh = TWAnyAddress.createSS58(
        string: '2FSoQykVV3uWe5ChZuazMDHBoaZmCPPuoYx5KHL5VqXooDQW',
        coin: coin,
        ss58Prefix: 12,
      );
      expect(addressPolymesh.description,
          '2FSoQykVV3uWe5ChZuazMDHBoaZmCPPuoYx5KHL5VqXooDQW');
    });
  });
}
