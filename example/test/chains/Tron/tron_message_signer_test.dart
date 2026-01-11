import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TronMessageSigner', () {
    test('SignMessageAndVerify', () {
      final tronKey = TWPrivateKey.createWithHexString(
          '75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a');
      final pubKey =
          tronKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      const msg = 'Hello World';
      final signature = TWTronMessageSigner.signMessage(tronKey, msg);
      expect(signature,
          'bc0753c070cc55693097df11bc11e1a7c4bd5e1a40b9dc94c75568e59bcc9d6b50a7873ef25b469e494490a54de37327b4bc7fc825c81a377b555e34fb7261ba1c');
      expect(TWTronMessageSigner.verifyMessage(pubKey, msg, signature), true);

      const msg2 =
          "A much longer message to test the signing and verification process";
      final signature2 = TWTronMessageSigner.signMessage(tronKey, msg2);
      expect(
        signature2,
        '93aee5f753cf889e0749c74dd0c5996cce889883ae079e09ede462e16d65d06a4f43d1ed2745e9f3c1690695628269bd58f057a4a93953cc50e66b4a05bc0f451b',
      );
      expect(TWTronMessageSigner.verifyMessage(pubKey, msg2, signature2), true);
    });

    test('SignAndVerifyLegacy', () {
      const privKeyData =
          "75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a";
      final privateKey = TWPrivateKey.createWithHexString(privKeyData);
      const message = 'Hello World';

      final pubKey = privateKey.getPublicKey(TWCoinType.Tron);
      final signature = TWTronMessageSigner.signMessage(privateKey, message);
      expect(signature,
          'bc0753c070cc55693097df11bc11e1a7c4bd5e1a40b9dc94c75568e59bcc9d6b50a7873ef25b469e494490a54de37327b4bc7fc825c81a377b555e34fb7261ba1c');
      expect(
          TWTronMessageSigner.verifyMessage(pubKey, message, signature), true);

      const message2 =
          "A much longer message to test the signing and verification process";
      final signature2 = TWTronMessageSigner.signMessage(privateKey, message2);
      expect(signature2,
          '93aee5f753cf889e0749c74dd0c5996cce889883ae079e09ede462e16d65d06a4f43d1ed2745e9f3c1690695628269bd58f057a4a93953cc50e66b4a05bc0f451b');
      expect(TWTronMessageSigner.verifyMessage(pubKey, message2, signature2),
          true);
    });
  });
}
