import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('DecredAddress', () {
    const coin = TWCoinType.TWCoinTypeDecred;

    test('FromPublicKey', () {
      {
        final publicKey = TWPublicKey.createWithHexString(
          '0279be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798',
          TWPublicKeyType.TWPublicKeyTypeSECP256k1,
        );
        final address =
            TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin);
        expect(address.description, 'DsmcYVbP1Nmag2H4AS17UTvmWXmGeA7nLDx');
      }
      {
        final privateKey = TWPrivateKey.createWithHexString(
            'a1269039e4ffdf43687852d7247a295f0b5bc55e6dda031cffaa3295ca0a9d7a');
        final publicKey =
            privateKey.getPublicKey(TWPublicKeyType.TWPublicKeyTypeED25519);
        final address =
            TWAnyAddress.createWithPublicKey(publicKey: publicKey, coin: coin);
        expect(address.pointer != nullptr, true);
      }
    });

    test('Valid', () {
      expect(TWAnyAddress.isValid('DsmcYVbP1Nmag2H4AS17UTvmWXmGeA7nLDx', coin),
          true);
      expect(TWAnyAddress.isValid('Dcur2mcGjmENx4DhNqDctW5wJCVyT3Qeqkx', coin),
          true);
    });

    test('Invalid', () {
      expect(TWAnyAddress.isValid('rnBFvgZphmN39GWzUJeUitaP22Fr9be75H', coin),
          false);
      expect(TWAnyAddress.isValid('t3gQDEavk5VzAAHK8TrQu2BWDLxEiF1unBm', coin),
          false);
    });

    test('FromString', () {
      final string = 'DsmcYVbP1Nmag2H4AS17UTvmWXmGeA7nLDx';
      final address = TWAnyAddress(string, coin);
      expect(address.description, string);
    });

    test('Derive', () {
      final mnemonic =
          "ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal";
      final wallet = TWHDWallet.createWithMnemonic(mnemonic);
      final path = TWCoinTypeDerivationPath(coin);
      final address = TWCoinTypeDeriveAddress(coin, wallet.getKey(coin, path));
      expect(address, 'DsVMHD5D86dpRnt2GPZvv4bYUJZg6B9Pzqa');
    });
  });
}