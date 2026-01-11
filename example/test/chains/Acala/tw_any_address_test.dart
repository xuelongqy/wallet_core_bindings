import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

const acalaPrefix = 10;

void main() {
  initTest();
  group(TWAnyAddress, () {
    test('IsValid', () {
      expect(
        TWAnyAddress.isValidSS58(
          string: '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          coin: TWCoinType.Polkadot,
          ss58Prefix: acalaPrefix,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValid(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.Acala,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValid(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.Polkadot,
        ),
        false,
      );
      expect(
        TWAnyAddress.isValid(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.Bitcoin,
        ),
        false,
      );
      expect(
        TWAnyAddress.isValidSS58(
          string: '15KRsCq9LLNmCxNFhGk55s5bEyazKefunDxUH24GFZwsTxyu',
          coin: TWCoinType.Polkadot,
          ss58Prefix: acalaPrefix,
        ),
        false,
      );
    });

    test('createFromPubKey', () {
      final pubkey = TWPublicKey.createWithHexString(
        'e9590e4d99264a14a85e21e69537e4a64f66a875d38cb8f76b305f41fabe24a9',
        TWPublicKeyType.ED25519,
      );
      final addr = TWAnyAddress.createWithPublicKey(
        pubkey,
        TWCoinType.Acala,
      );
      final addrDescription = addr.description;
      expect(
          '269ZCS3WLGydTN8ynhyhZfzJrXkePUcdhwgLQs6TWFs5wVL5', addrDescription);
    });

    test('createFromString', () {
      const acalaAddress = '24CKv1LJ1T3U9ujCN63YzTPuQjcmURGA2xTjim98UKXxgNXT';
      final anyAddr = TWAnyAddress(acalaAddress, TWCoinType.Acala);
      final addrDescription = anyAddr.description;
      expect(
        TWAnyAddress.isValidSS58(
          string: addrDescription,
          coin: TWCoinType.Acala,
          ss58Prefix: acalaPrefix,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValid(
          addrDescription,
          TWCoinType.Acala,
        ),
        true,
      );
    });

    test('createFromPubKeyAcalaPrefix', () {
      final data = TWData.createWithHexString(
              '92fd9c237030356e26cfcc4568dc71055d5ec92dfe0ff903767e00611971bad3')
          .bytes()!;
      final pubkey = TWPublicKey(data, TWPublicKeyType.ED25519);
      final twAddress = TWAnyAddress.createSS58WithPublicKey(
        publicKey: pubkey,
        coin: TWCoinType.Polkadot,
        ss58Prefix: acalaPrefix,
      );
      final address = twAddress.description;
      expect('24CKv1LJ1T3U9ujCN63YzTPuQjcmURGA2xTjim98UKXxgNXT', address);
    });

    test('createFromStringAcalaPrefix', () {
      const acalaAddress = '24CKv1LJ1T3U9ujCN63YzTPuQjcmURGA2xTjim98UKXxgNXT';
      final anyAddr = TWAnyAddress.createSS58(
        string: acalaAddress,
        coin: TWCoinType.Polkadot,
        ss58Prefix: acalaPrefix,
      );
      final addrDescription = anyAddr.description;
      expect(
        TWAnyAddress.isValidSS58(
          string: addrDescription,
          coin: TWCoinType.Polkadot,
          ss58Prefix: acalaPrefix,
        ),
        true,
      );
    });
  });
}
