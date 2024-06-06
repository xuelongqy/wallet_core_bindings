import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  const TestPubKey1 =
      "039d645d2ce630c2a9a6dbe0cbd0a8fcb7b70241cb8a48424f25593290af2494b9";
  const TestP2phkAddr1 = "12dNaXQtN5Asn2YFwT1cvciCrJa525fAe4";
  const TestP2phkData1 = "0011d91ce1cc681f95583da3f4a6841c174be950c7";
  const TestP2shAddr1 = "3PQ5BD39rDikf7YW6pJ9a9tbS3QhvwvzTG";
  const TestP2shData1 = "05ee1e69460b59027d9df0a79ca2c92aa382a25fb7";

  const coin = TWCoinType.Bitcoin;

  group('BitcoinAddress', () {
    test('P2PKH_CreateFromString', () {
      final address = TWBitcoinAddress(TestP2phkAddr1);
      expect(address.description, TestP2phkAddr1);
      expectHex(address.data, TestP2phkData1);
    });

    test('P2PKH_CreateFromPubkey', () {
      final publicKey = TWPublicKey.createWithHexString(
        TestPubKey1,
        TWPublicKeyType.SECP256k1,
      );
      final address =
          TWBitcoinAddress.createWithPublicKey(publicKey, coin.p2pkhPrefix);
      expect(address.description, TestP2phkAddr1);
      expectHex(address.data, TestP2phkData1);
    });

    test('P2PKH_CreateFromData', () {
      final address = TWBitcoinAddress.createWithData(
          TWData.createWithHexString(TestP2phkData1).bytes()!);
      expect(address.description, TestP2phkAddr1);
      expectHex(address.data, TestP2phkData1);
    });

    test('P2WPKH_Nested_P2SH', () {
      // P2SH address cannot be created directly from pubkey, script is built
      final publicKey = TWPublicKey.createWithHexString(
        TestPubKey1,
        TWPublicKeyType.SECP256k1,
      );

      final pubkeyHash = publicKey.hash(Uint8List(0));
      expectHex(pubkeyHash, '11d91ce1cc681f95583da3f4a6841c174be950c7');

      final script = TWBitcoinScript.buildPayToWitnessPubkeyHash(pubkeyHash);
      expectHex(script.data, '001411d91ce1cc681f95583da3f4a6841c174be950c7');

      final scriptHash = TWHash.sha256RIPEMD(script.data);
      expectHex(scriptHash, 'ee1e69460b59027d9df0a79ca2c92aa382a25fb7');

      final addressData = Uint8List.fromList([coin.p2shPrefix, ...scriptHash]);
      expectHex(addressData, TestP2shData1);

      final address = TWBitcoinAddress.createWithData(addressData);
      expect(address.description, TestP2shAddr1);
      expectHex(address.data, TestP2shData1);
    });

    test('P2SH_CreateFromData', () {
      final address = TWBitcoinAddress.createWithData(
          TWData.createWithHexString(TestP2shData1).bytes()!);
      expect(address.description, TestP2shAddr1);
      expectHex(address.data, TestP2shData1);
    });
  });
}
