import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWPublicKey, () {
    test('Create', () {
      final publickKeyHex =
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1';
      final publickKey = TWPublicKey.createWithData(
        data: TWData.createWithHexString(publickKeyHex).bytes()!,
        type: TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      expect(publickKey.pointer != nullptr, true);
      final publicKeyData = publickKey.data;
      expect(TWString.createWithHexBytes(publicKeyData).value!, publickKeyHex);
    });

    test('Create from private Secp256k1', () {
      final key = TWData.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      final privateKey = TWPrivateKey.createWithData(key.bytes()!);
      final publickKey = privateKey.getPublicKeySecp256k1(true);

      expect(publickKey.data.length, TWPublicKey.compressedSize);
      final publickKeyData = publickKey.data;
      expect(TWString.createWithHexBytes(publickKeyData).value!,
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1');
      expect(publickKey.description,
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1');
      expect(publickKey.valid(TWPublicKeyType.TWPublicKeyTypeSECP256k1), true);
      expect(publickKey.isCompressed, true);
    });

    test('Create invalid', () {
      final publicKey = TWPublicKey.createWithData(
        data: TWData.createWithHexString('deadbeef').bytes()!,
        type: TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      expect(publicKey.pointer, nullptr);
    });

    test('Compressed extended', () {
      final key = TWData.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      final privateKey = TWPrivateKey.createWithData(key.bytes()!);
      final publickKey = privateKey.getPublicKeySecp256k1(true);
      expect(publickKey.type, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      expect(publickKey.data.length, TWPublicKey.compressedSize);
      expect(publickKey.isCompressed, true);
      expect(publickKey.valid(TWPublicKeyType.TWPublicKeyTypeSECP256k1), true);

      final extended = publickKey.uncompressed();
      expect(extended.type, TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      expect(extended.data.length, TWPublicKey.uncompressedSize);
      expect(extended.isCompressed, false);
      expect(extended.valid(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended),
          true);

      final compressed = privateKey.getPublicKeySecp256k1(true);
      expect(compressed.type, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      expect(compressed.data.length, TWPublicKey.compressedSize);
      expect(compressed.isCompressed, true);
      expect(compressed.valid(TWPublicKeyType.TWPublicKeyTypeSECP256k1), true);
    });

    test('Verify', () {
      final key = TWData.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      final privateKey = TWPrivateKey.createWithData(key.bytes()!);

      const message = 'Hello';
      final messageData = TWData(TWString(message).bytes()).bytes()!;
      final digest = TWHash.keccak256(messageData);

      final signature = privateKey.signAsDER(digest);

      final publicKey = privateKey.getPublicKeySecp256k1(false);

      expect(
          publicKey.verifyAsDER(signature: signature, message: digest), true);
      expect(publicKey.verify(signature: signature, message: digest), false);
    });

    test('Verify Ed25519', () {
      final key = TWData.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      final privateKey = TWPrivateKey.createWithData(key.bytes()!);

      const message = 'Hello';
      final messageData = TWData(TWString(message).bytes()).bytes()!;
      final digest = TWHash.sha256(messageData);

      final signature = privateKey.sign(digest, TWCurve.TWCurveED25519);
      final publicKey = privateKey.getPublicKeyEd25519();

      final signature2 =
          privateKey.sign(digest, TWCurve.TWCurveED25519Blake2bNano);
      final publicKey2 = privateKey.getPublicKeyEd25519Blake2b();

      expect(publicKey.verify(signature: signature, message: digest), true);
      expect(publicKey2.verify(signature: signature2, message: digest), true);
    });

    test('Recover', () {
      final message = TWData.createWithHexString(
          'de4e9524586d6fce45667f9ff12f661e79870c4105fa0fb58af976619bb11432');
      final signature = TWData.createWithHexString(
          '00000000000000000000000000000000000000000000000000000000000000020123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef80');
      final publickKey = TWPublicKey.recover(
          signature: signature.bytes()!, message: message.bytes()!);
      expect(publickKey.pointer != nullptr, true);
      expect(publickKey.type, TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      final publicKeyData = publickKey.data;
      expect(TWString.createWithHexBytes(publicKeyData).value!,
          '0456d8089137b1fd0d890f8c7d4a04d0fd4520a30b19518ee87bd168ea12ed8090329274c4c6c0d9df04515776f2741eeffc30235d596065d718c3973e19711ad0');
    });

    test('Recover invalid', () {
      final deadbeef = TWData.createWithHexString('deadbeef');
      final publicKey = TWPublicKey.recover(
          signature: deadbeef.bytes()!, message: deadbeef.bytes()!);
      expect(publicKey.pointer == nullptr, true);
    });
  });
}