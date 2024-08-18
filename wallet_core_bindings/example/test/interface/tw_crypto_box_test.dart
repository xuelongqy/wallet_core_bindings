import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();
  group(TWCryptoBox, () {
    test('EncryptDecryptEasy', () {
      final mySecret = TWCryptoBoxSecretKey();
      final myPubkey = mySecret.getPublicKey();

      final otherSecret = TWCryptoBoxSecretKey();
      final otherPubkey = otherSecret.getPublicKey();

      final message = "Well done is better than well said. -Benjamin Franklin";
      final messageData = TWData.createWithString(message).bytes()!;

      final encrypted = TWCryptoBox.encryptEasy(
        mySecret: mySecret,
        otherPubkey: otherPubkey,
        message: messageData,
      )!;

      // Step 2. Make sure the Box can be decrypted by the other side.
      final decrypted = TWCryptoBox.decryptEasy(
        mySecret: otherSecret,
        otherPubkey: myPubkey,
        encrypted: encrypted,
      )!;
      final decryptedMessage = TWString.createWithRawBytes(decrypted).value;
      expect(decryptedMessage, message);
    });

    test('PublicKeyWithData', () {
      final pubkeyBytesHex =
          "afccabc5b28a8a1fd1cd880516f9c854ae2498d0d1b978b53a59f38e4ae55747";
      final pubkeyData = TWData.createWithHexString(pubkeyBytesHex).bytes()!;

      expect(TWCryptoBoxPublicKey.isValid(pubkeyData), true);
      final publicKey = TWCryptoBoxPublicKey.createWithData(pubkeyData);
      final actualBytes = publicKey.data;
      expect(actualBytes, pubkeyData);
    });

    test('SecretKeyWithData', () {
      final secretBytesHex =
          "dd87000d4805d6fbd89ae1352f5e4445648b79d5e901c92aebcb610e9be468e4";
      final secretData = TWData.createWithHexString(secretBytesHex).bytes()!;

      expect(TWCryptoBoxSecretKey.isValid(secretData), true);
      final secretKey = TWCryptoBoxSecretKey.createWithData(secretData);
      final actualBytes = secretKey.data;
      expect(actualBytes, secretData);
    });

    test('DecryptEasyError', () {
      final otherPubkeyBytes = parse_hex(
          'afccabc5b28a8a1fd1cd880516f9c854ae2498d0d1b978b53a59f38e4ae55747');

      final mySecret = TWCryptoBoxSecretKey();
      final otherPubkey = TWCryptoBoxPublicKey.createWithData(otherPubkeyBytes);

      // The given encrypted box cannot be decrypted by using `mySecret` and `otherPubkey`.
      final invalidEncrypted = parse_hex(
          '7a7b9c8fee6e3c597512848c7d513e7131193cdfd410ff6611522fdeea99d7160873182019d7a18502f22c5e3644d26a2b669365');

      final decrypted = TWCryptoBox.decryptEasy(
        mySecret: mySecret,
        otherPubkey: otherPubkey,
        encrypted: invalidEncrypted,
      );
      expect(decrypted, null);
    });
  });
}
