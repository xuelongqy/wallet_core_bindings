import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('PactusWallet', () {
    test('DerivationPath', () {
      final derivationPath = TWCoinType.Pactus.derivationPath;
      expect(derivationPath, "m/44'/21888'/3'/0'");
    });

    test('HDWallet_MainnetDerivation', () {
      const mnemonic =
          "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon cactus";
      const passphrase = "";
      final wallet = TWHDWallet.createWithMnemonic(
        mnemonic,
        passphrase: passphrase,
      );

      const derivationPath1 = "m/44'/21888'/3'/0'";
      final privateKey1 = wallet.getKey(TWCoinType.Pactus, derivationPath1);
      final publicKey1 = privateKey1.getPublicKeyEd25519();
      final address1 = TWAnyAddress.createWithPublicKey(
        publicKey1,
        TWCoinType.Pactus,
      );
      final addressStr1 = address1.description;

      const derivationPath2 = "m/44'/21888'/3'/1'";
      final privateKey2 = wallet.getKey(TWCoinType.Pactus, derivationPath2);
      final publicKey2 = privateKey2.getPublicKeyEd25519();
      final address2 = TWAnyAddress.createWithPublicKey(
        publicKey2,
        TWCoinType.Pactus,
      );
      final addressStr2 = address2.description;

      expect(addressStr1, 'pc1rcx9x55nfme5juwdgxd2ksjdcmhvmvkrygmxpa3');
      expect(addressStr2, 'pc1r7aynw9urvh66ktr3fte2gskjjnxzruflkgde94');
    });

    test('HDWallet_TestnetDerivation', () {
      const mnemonic =
          "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon cactus";
      const passphrase = "";
      final wallet = TWHDWallet.createWithMnemonic(
        mnemonic,
        passphrase: passphrase,
      );

      const derivationPath1 = "m/44'/21777'/3'/0'";
      final privateKey1 = wallet.getKey(TWCoinType.Pactus, derivationPath1);
      final publicKey1 = privateKey1.getPublicKeyEd25519();
      final address1 = TWAnyAddress.createWithPublicKeyDerivation(
        publicKey: publicKey1,
        coin: TWCoinType.Pactus,
        derivation: TWDerivation.PactusTestnet,
      );
      final addressStr1 = address1.description;

      const derivationPath2 = "m/44'/21777'/3'/1'";
      final privateKey2 = wallet.getKey(TWCoinType.Pactus, derivationPath2);
      final publicKey2 = privateKey2.getPublicKeyEd25519();
      final address2 = TWAnyAddress.createWithPublicKeyDerivation(
        publicKey: publicKey2,
        coin: TWCoinType.Pactus,
        derivation: TWDerivation.PactusTestnet,
      );
      final addressStr2 = address2.description;

      expect(addressStr1, 'tpc1r35xwz99uw2qrhz9wmdanaqcsge2nzsfegvv555');
      expect(addressStr2, 'tpc1r34xj32k004j8v35fx6uqw4yaka54g6jdr58tvk');
    });
  });
}
