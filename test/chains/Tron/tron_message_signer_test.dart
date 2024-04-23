import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group('TronMessageSigner', () {
    test('SignMessageAndVerify', () {
      final tronKey = TWPrivateKey.createWithHexString(
          '75065f100e38d3f3b4c5c4235834ba8216de62272a4f03532c44b31a5734360a');
      final msg = 'Hello World';
      final signature = TWTronMessageSigner.signMessage(tronKey, msg);
      expect(signature,
          '9bb6d11ec8a6a3fb686a8f55b123e7ec4e9746a26157f6f9e854dd72f5683b450397a7b0a9653865658de8f9243f877539882891bad30c7286c3bf5622b900471b');
      final pubKey = tronKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(TWTronMessageSigner.verifyMessage(pubKey, msg, signature), true);
    });
  });
}
