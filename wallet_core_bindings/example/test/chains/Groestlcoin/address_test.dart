import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('GroestlcoinAddress', () {
    const coin = TWCoinType.Groestlcoin;

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
          '03b85cc59b67c35851eb5060cfc3a759a482254553c5857075c9e247d74d412c91',
          TWPublicKeyType.SECP256k1);
      final address = TWGroestlcoinAddress.createWithPublicKey(publicKey, 36);
      expect(address.description, 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM');
    });

    test('Valid', () {
      expect(
        TWGroestlcoinAddress.isValidString(
            'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM'),
        true,
      );
    });

    test('Invalid', () {
      expect(
        TWGroestlcoinAddress.isValidString('Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLo'),
        false,
      );
      expect(
        TWGroestlcoinAddress.isValidString(
            '1JAd7XCBzGudGpJQSDSfpmJhiygtLQWaGL'),
        false,
      );
    });

    test('FromString', () {
      const string = "Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM";
      final address = TWGroestlcoinAddress(string);

      expect(address.description, string);
    });

    test('Derive', () {
      const mnemonic = "all all all all all all all all all all all all";
      final wallet = TWHDWallet.createWithMnemonic(mnemonic);
      final path = coin.derivationPath;
      var address = coin.deriveAddress(wallet.getKey(coin, path));
      expect(address, 'grs1qw4teyraux2s77nhjdwh9ar8rl9dt7zww8r6lne');

      address = coin.deriveAddressFromPublicKeyAndDerivation(
        wallet.getKey(coin, path).getPublicKey(coin),
        TWDerivation.Legacy,
      );
      expect(address, 'FfsAQrzfdECwEsApubn2rvxgamU8CcqsLT');
    });

    test('AddressData', () {
      final publicKey = TWPublicKey.createWithHexString(
        '03b85cc59b67c35851eb5060cfc3a759a482254553c5857075c9e247d74d412c91',
        TWPublicKeyType.SECP256k1,
      );
      var address = coin.deriveAddressFromPublicKeyAndDerivation(
        publicKey,
        TWDerivation.Legacy,
      );
      expect(address, 'Fj62rBJi8LvbmWu2jzkaUX1NFXLEqDLoZM');

      var addressData = TWAnyAddress(address, coin).data;
      expectHex(addressData, '98af0aaca388a7e1024f505c033626d908e3b54a');

      address = coin.deriveAddressFromPublicKeyAndDerivation(
        publicKey,
        TWDerivation.Segwit,
      );
      expect(address, 'grs1qnzhs4t9r3zn7zqj02pwqxd3xmyyw8d22q55nf8');

      addressData = TWAnyAddress(address, coin).data;
      expectHex(addressData, '98af0aaca388a7e1024f505c033626d908e3b54a');
    });
  });
}
