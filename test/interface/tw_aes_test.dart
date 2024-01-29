import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

final key = TWData.createWithHexString(
    "603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4");
final key2 = TWData.createWithHexString(
    "bbc82a01ebdb14698faee4a9e5038de72c995a9f6bcdb21903d62408b0c5ca96");

void main() {
  group(TWAES, () {
    test('CBCEncryptZeroPadding', () {
      final iv = TWData.createWithHexString('000102030405060708090A0B0C0D0E0F');
      final data =
          TWData.createWithHexString('6bc1bee22e409f96e93d7e117393172a');

      final encryptResult = TWAES.encryptCBC(
          key: key.bytes()!,
          data: data.bytes()!,
          iv: iv.bytes()!,
          mode: TWAESPaddingMode.TWAESPaddingModeZero);

      expect(TWString.createWithHexBytes(encryptResult!).value!,
          'f58c4c04d6e5f1ba779eabfb5f7bfbd6');
    });

    test('CBCDecryptZeroPadding', () {
      final iv = TWData.createWithHexString('000102030405060708090A0B0C0D0E0F');
      final cipher =
          TWData.createWithHexString('f58c4c04d6e5f1ba779eabfb5f7bfbd6');

      final decryptResult = TWAES.decryptCBC(
          key: key.bytes()!,
          data: cipher.bytes()!,
          iv: iv.bytes()!,
          mode: TWAESPaddingMode.TWAESPaddingModeZero);

      expect(TWString.createWithHexBytes(decryptResult!).value!,
          '6bc1bee22e409f96e93d7e117393172a');
    });

    test('CBCEncryptPKCS7Padding', () {
      final iv = TWData.createWithHexString('37f8687086d31852979e228f4a97925b');
      final data = TWData.createWithHexString(
          '7b226a736f6e727063223a22322e30222c226964223a313535343334333833343735323434362c226572726f72223a7b22636f6465223a2d33323030302c226d657373616765223a2253657373696f6e2052656a6563746564227d7d');

      final encryptResult = TWAES.encryptCBC(
          key: key2.bytes()!,
          data: data.bytes()!,
          iv: iv.bytes()!,
          mode: TWAESPaddingMode.TWAESPaddingModePKCS7);

      expect(TWString.createWithHexBytes(encryptResult!).value!,
          '23c75d1b3228742ddb12eeef5a5016e37a8980a77fabc6dd01e6a355d88851c611d37e0d17a2f9c30f659da6d42ba77aca9b84bd6a95e3924f47d9093fbf16e0fb55b165ec193489645b4f7d2573959305c8fa70f88fe5affc43e3084a5878d1');
    });

    test('CBCDecryptPKCS7Padding', () {
      final iv = TWData.createWithHexString('debb62725b21c7577e4e498e10f096c7');
      final cipher = TWData.createWithHexString(
          'e7df9810ce66defcc03023ee945f5958c1d4697bf97945daeab5059c2bc6262642cbca82982ac690e77e16671770c200f348f743a7c6e5df5c74eb892ef9b45a9b5ddf0f08fa60c49e5b694688d1b0b521b43975e65b4e8d557a83f4d1aab0af');

      final decryptResult = TWAES.decryptCBC(
          key: key2.bytes()!,
          data: cipher.bytes()!,
          iv: iv.bytes()!,
          mode: TWAESPaddingMode.TWAESPaddingModePKCS7);

      expect(TWString.createWithHexBytes(decryptResult!).value!,
          '7b226a736f6e727063223a22322e30222c226964223a313535343334333833343735323434362c226572726f72223a7b22636f6465223a2d33323030302c226d657373616765223a2253657373696f6e2052656a6563746564227d7d');
    });

    test('CTREncrypt', () {
      final iv = TWData.createWithHexString('f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff');
      final data =
          TWData.createWithHexString('6bc1bee22e409f96e93d7e117393172a');

      final encryptResult = TWAES.encryptCTR(
        key: key.bytes()!,
        data: data.bytes()!,
        iv: iv.bytes()!,
      );

      expect(TWString.createWithHexBytes(encryptResult!).value!,
          '601ec313775789a5b7a7f504bbf3d228');
    });

    test('CBCDecryptPKCS7Padding', () {
      final iv = TWData.createWithHexString('f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff');
      final cipher =
          TWData.createWithHexString('601ec313775789a5b7a7f504bbf3d228');

      final decryptResult = TWAES.decryptCTR(
        key: key.bytes()!,
        data: cipher.bytes()!,
        iv: iv.bytes()!,
      );

      expect(TWString.createWithHexBytes(decryptResult!).value!,
          '6bc1bee22e409f96e93d7e117393172a');
    });
  });
}
