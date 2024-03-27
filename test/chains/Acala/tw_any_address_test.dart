import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

const acalaPrefix = 10;

void main() {
  group(TWAnyAddress, () {
    test('IsValid', () {
      expect(
        TWAnyAddress.isValidSS58(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.TWCoinTypePolkadot,
          acalaPrefix,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValid(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.TWCoinTypeAcala,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValid(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.TWCoinTypePolkadot,
        ),
        false,
      );
      expect(
        TWAnyAddress.isValid(
          '212ywJGVK2Nxnt5bjKXVHi4YY7FCFd4rVvhyt95CjpeHGZee',
          TWCoinType.TWCoinTypeBitcoin,
        ),
        false,
      );
      expect(
        TWAnyAddress.isValidSS58(
          '15KRsCq9LLNmCxNFhGk55s5bEyazKefunDxUH24GFZwsTxyu',
          TWCoinType.TWCoinTypePolkadot,
          acalaPrefix,
        ),
        false,
      );
    });

    test('createFromPubKey', () {
      final pubkey = TWPublicKey.createWithHexString(
        'e9590e4d99264a14a85e21e69537e4a64f66a875d38cb8f76b305f41fabe24a9',
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final addr = TWAnyAddress.createWithPublicKey(
        publicKey: pubkey,
        coin: TWCoinType.TWCoinTypeAcala,
      );
      final addrDescription = addr.description;
      expect(
          '269ZCS3WLGydTN8ynhyhZfzJrXkePUcdhwgLQs6TWFs5wVL5', addrDescription);
    });

    test('createFromString', () {
      const acalaAddress = '24CKv1LJ1T3U9ujCN63YzTPuQjcmURGA2xTjim98UKXxgNXT';
      final anyAddr = TWAnyAddress(acalaAddress, TWCoinType.TWCoinTypeAcala);
      final addrDescription = anyAddr.description;
      expect(
        TWAnyAddress.isValidSS58(
          addrDescription,
          TWCoinType.TWCoinTypeAcala,
          acalaPrefix,
        ),
        true,
      );
      expect(
        TWAnyAddress.isValid(
          addrDescription,
          TWCoinType.TWCoinTypeAcala,
        ),
        true,
      );
    });

    test('createFromPubKeyAcalaPrefix', () {
      final data = TWData.createWithHexString(
              '92fd9c237030356e26cfcc4568dc71055d5ec92dfe0ff903767e00611971bad3')
          .bytes()!;
      final pubkey = TWPublicKey(data, TWPublicKeyType.TWPublicKeyTypeED25519);
      final twAddress = TWAnyAddress.createSS58WithPublicKey(
        publicKey: pubkey,
        coin: TWCoinType.TWCoinTypePolkadot,
        ss58Prefix: acalaPrefix,
      );
      final address = twAddress.description;
      expect('24CKv1LJ1T3U9ujCN63YzTPuQjcmURGA2xTjim98UKXxgNXT', address);
    });

    test('createFromStringAcalaPrefix', () {
      const acalaAddress = '24CKv1LJ1T3U9ujCN63YzTPuQjcmURGA2xTjim98UKXxgNXT';
      final anyAddr = TWAnyAddress.createSS58(
        string: acalaAddress,
        coin: TWCoinType.TWCoinTypePolkadot,
        ss58Prefix: acalaPrefix,
      );
      final addrDescription = anyAddr.description;
      expect(
        TWAnyAddress.isValidSS58(
          addrDescription,
          TWCoinType.TWCoinTypePolkadot,
          acalaPrefix,
        ),
        true,
      );
    });
  });
}
