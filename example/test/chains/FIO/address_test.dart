import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('FIOAddress', () {
    const coin = TWCoinType.FIO;

    test('ValidateString', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
          TWAnyAddress.isValid(
              '65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjTF', coin),
          false);
      expect(
          TWAnyAddress.isValid(
              'EOS65QzSGJ579GPNKtZoZkChTzsxR4B48RCfiS82m2ymJR6VZCjT', coin),
          false);

      expect(
          TWAnyAddress.isValid(
              'FIO5kJKNHwctcfUM5XZyiWSqSTM5HTzznJP9F3ZdbhaQAHEVq575o', coin),
          true);
    });

    test('FromString', () {
      final address = TWAnyAddress(
          'FIO5kJKNHwctcfUM5XZyiWSqSTM5HTzznJP9F3ZdbhaQAHEVq575o', coin);
      expect(address.description,
          'FIO5kJKNHwctcfUM5XZyiWSqSTM5HTzznJP9F3ZdbhaQAHEVq575o');
    });

    test('FromPublicKey', () {
      final key = TWPrivateKey.createWithHexString(
          'ea8eb60b7e5868e218f248e032769020b4fea5dcfd02f2992861eaf4fb534854');
      final publicKey = key.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      expectHex(publicKey.data,
          '0271195c66ec2799e436757a70cd8431d4b17733a097b18a5f7f1b6b085978ff0f');
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description,
          'FIO5kJKNHwctcfUM5XZyiWSqSTM5HTzznJP9F3ZdbhaQAHEVq575o');
    });

    test('GetPublicKey', () {
      const publicKeyHex =
          "0271195c66ec2799e436757a70cd8431d4b17733a097b18a5f7f1b6b085978ff0f";
      final publicKey = TWPublicKey.createWithHexString(
          publicKeyHex, TWPublicKeyType.SECP256k1);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);
      expect(address.description,
          'FIO5kJKNHwctcfUM5XZyiWSqSTM5HTzznJP9F3ZdbhaQAHEVq575o');
    });
  });
}
