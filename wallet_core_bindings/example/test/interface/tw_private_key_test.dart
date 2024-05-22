import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

const key1Hex =
    "22667b69166481c9f334756f49c8dddfd72c6bcdd68a7386886e97a82f741130";

void main() {
  initTest();

  group(TWPrivateKey, () {
    test('Create', () {
      final privateKey = TWPrivateKey.createWithHexString(key1Hex);
      expect(privateKey.pointer != nullptr.address, true);

      final data = privateKey.data;
      expect(TWString.createWithHexBytes(data).value!, key1Hex);
    });

    test('Create new random', () {
      final privateKey = TWPrivateKey();
      expect(privateKey.pointer != nullptr.address, true);
    });

    test('Create invalid', () {
      final privateKey = TWPrivateKey.createWithHexString('deadbeef');
      expect(privateKey.pointer == nullptr.address, true);
    });

    test('Create copy', () {
      final privateKey1 = TWPrivateKey.createWithHexString(key1Hex);
      expect(privateKey1.pointer != nullptr.address, true);
      final privateKey2 = TWPrivateKey.createCopy(privateKey1);
      expect(privateKey2.pointer != nullptr.address, true);
    });

    test('All zeros', () {
      final data = TWData.createWithSize(32);
      final bytes = data.bytes()!;
      final privateKey = TWPrivateKey.createWithData(bytes);

      expect(privateKey.pointer == nullptr.address, true);
    });

    test('Invalid', () {
      final bytes = TWData.createWithHexString(
              'fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141')
          .bytes()!;
      final valid = TWPrivateKey.isValid(bytes, TWCurve.SECP256k1);

      final bytes2 = TWData.createWithHexString(
              '0000000000000000000000000000000000000000000000000000000000000000')
          .bytes()!;
      final valid2 = TWPrivateKey.isValid(bytes2, TWCurve.SECP256k1);

      expect(valid, false);
      expect(valid2, false);
    });

    test('IsValid', () {
      final bytes = TWData.createWithHexString(
              'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5')
          .bytes()!;

      expect(TWPrivateKey.isValid(bytes, TWCurve.SECP256k1), true);
      expect(TWPrivateKey.isValid(bytes, TWCurve.ED25519), true);
    });

    test('PublicKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');
      {
        final publickKey = privateKey.getPublicKeySecp256k1(false);
        expect(TWString.createWithHexBytes(publickKey.data).value!,
            '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c166b489a4b7c491e7688e6ebea3a71fc3a1a48d60f98d5ce84c93b65e423fde91');
      }
      {
        final publickKey = privateKey.getPublicKeyNist256p1();
        expect(TWString.createWithHexBytes(publickKey.data).value!,
            '026d786ab8fda678cf50f71d13641049a393b325063b8c0d4e5070de48a2caf9ab');
      }
      {
        final publickKey = privateKey.getPublicKeyCurve25519();
        expect(TWString.createWithHexBytes(publickKey.data).value!,
            '686cfce9108566dd43fc6aa75e31f9a9f319c9e9c04d6ad0a52505b86bc17c3a');
      }
      {
        final publickKey = privateKey.getPublicKey(TWCoinType.Ethereum);
        expect(TWString.createWithHexBytes(publickKey.data).value!,
            '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c166b489a4b7c491e7688e6ebea3a71fc3a1a48d60f98d5ce84c93b65e423fde91');

        final publicKeyByType =
            privateKey.getPublicKeyByType(TWCoinType.Ethereum.publicKeyType);

        expect(TWString.createWithHexBytes(publickKey.data).value!,
            TWString.createWithHexBytes(publicKeyByType.data).value!);
      }
      {
        final publickKey = privateKey.getPublicKey(TWCoinType.NEO);
        expect(TWString.createWithHexBytes(publickKey.data).value!,
            '026d786ab8fda678cf50f71d13641049a393b325063b8c0d4e5070de48a2caf9ab');
      }
      {
        final publickKey = privateKey.getPublicKey(TWCoinType.Waves);
        expect(TWString.createWithHexBytes(publickKey.data).value!,
            '686cfce9108566dd43fc6aa75e31f9a9f319c9e9c04d6ad0a52505b86bc17c3a');
      }
    });

    test('Sign', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');

      const message = 'hello';
      final data = TWString(message).bytes();
      final hash = TWHash.keccak256(data);

      final actual = privateKey.sign(hash, TWCurve.SECP256k1);

      expect(TWString.createWithHexBytes(actual).value!,
          '8720a46b5b3963790d94bcc61ad57ca02fd153584315bfa161ed3455e336ba624d68df010ed934b8792c5b6a57ba86c3da31d039f9612b44d1bf054132254de901');
    });

    test('SignAsDER', () {
      final privateKey = TWPrivateKey.createWithHexString(
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');

      const message = 'hello';
      final data = TWString(message).bytes();
      final hash = TWHash.keccak256(data);

      final actual = privateKey.signAsDER(hash);

      expect(TWString.createWithHexBytes(actual).value!,
          '30450221008720a46b5b3963790d94bcc61ad57ca02fd153584315bfa161ed3455e336ba6202204d68df010ed934b8792c5b6a57ba86c3da31d039f9612b44d1bf054132254de9');
    });
  });
}
