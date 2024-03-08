import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

final PayToScriptHash = TWBitcoinScript.createWithBytes(
    TWData.createWithHexString(
            'a914' '4733f37cf4db86fbc2efed2500b4f4e49f312023' '87')
        .bytes()!);
final PayToWitnessScriptHash =
    TWBitcoinScript.createWithBytes(TWData.createWithHexString('0020'
            'ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db')
        .bytes()!);
final PayToWitnessPublicKeyHash = TWBitcoinScript.createWithBytes(
    TWData.createWithHexString(
            '0014' '79091972186c449eb1ded22b78e40d009bdf0089')
        .bytes()!);
final PayToPublicKeySecp256k1 =
    TWBitcoinScript.createWithBytes(TWData.createWithHexString('21'
            '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432'
            'ac')
        .bytes()!);
final PayToPublicKeySecp256k1Extended =
    TWBitcoinScript.createWithBytes(TWData.createWithHexString('41'
            '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1'
            '66b489a4b7c491e7688e6ebea3a71fc3a1a48d60f98d5ce84c93b65e423fde91ac')
        .bytes()!);
final PayToPublicKeyHash = TWBitcoinScript.createWithBytes(
    TWData.createWithHexString(
            '76a914' '79091972186c449eb1ded22b78e40d009bdf0089' '88ac')
        .bytes()!);

void main() {
  group(TWBitcoinScript, () {
    test('Create', () {
      final data = 'a9144733f37cf4db86fbc2efed2500b4f4e49f31202387';

      {
        final script = TWBitcoinScript();
        expect(script.pointer != nullptr, true);
      }

      {
        final script = TWBitcoinScript.createWithBytes(
            TWData.createWithHexString(data).bytes()!);
        expect(script.pointer != nullptr, true);
        expect(script.size, 23);
      }

      {
        final script = TWBitcoinScript.createWithBytes(
            TWData.createWithHexString(data).bytes()!);
        expect(script.pointer != nullptr, true);
        expect(script.size, 23);

        final scriptCopy = TWBitcoinScript.createCopy(script);
        expect(scriptCopy.pointer != nullptr, true);
        expect(scriptCopy.size, 23);
      }
    });

    test('Equals', () {
      final data = 'a9144733f37cf4db86fbc2efed2500b4f4e49f31202387';
      final script = TWBitcoinScript.createWithBytes(
          TWData.createWithHexString(data).bytes()!);
      final scriptCopy = TWBitcoinScript.createCopy(script);
      expect(script == scriptCopy, true);
    });

    test('IsPayToScriptHash', () {
      expect(PayToWitnessScriptHash.isPayToWitnessScriptHash, true);
    });

    test('IsPayToWitnessPublicKeyHash', () {
      expect(PayToWitnessPublicKeyHash.isPayToWitnessPublicKeyHash, true);
    });

    test('IsWitnessProgram', () {
      expect(PayToWitnessScriptHash.isWitnessProgram, true);
      expect(PayToWitnessPublicKeyHash.isWitnessProgram, true);
      expect(PayToScriptHash.isWitnessProgram, false);
    });

    test('MatchPayToPubkey', () {
      final res = PayToPublicKeySecp256k1.matchPayToPubkey();
      expect(res != null, true);
      expectHex(res!,
          '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432');

      expect(PayToScriptHash.matchPayToPubkey(), null);
    });

    test('MatchPayToPubkeyHash', () {
      final res = PayToPublicKeyHash.matchPayToPubkeyHash();
      expect(res != null, true);
      expectHex(res!, '79091972186c449eb1ded22b78e40d009bdf0089');

      expect(PayToScriptHash.matchPayToPubkeyHash(), null);
    });

    test('MatchPayToScriptHash', () {
      final res = PayToScriptHash.matchPayToScriptHash();
      expect(res != null, true);
      expectHex(res!, '4733f37cf4db86fbc2efed2500b4f4e49f312023');

      expect(PayToPublicKeySecp256k1.matchPayToScriptHash(), null);
    });

    test('MatchPayToWitnessPublicKeyHash', () {
      final res = PayToWitnessPublicKeyHash.matchPayToWitnessPublicKeyHash();
      expect(res != null, true);
      expectHex(res!, '79091972186c449eb1ded22b78e40d009bdf0089');

      expect(PayToPublicKeySecp256k1.matchPayToWitnessPublicKeyHash(), null);
    });

    test('MatchPayToWitnessScriptHash', () {
      final res = PayToWitnessScriptHash.matchPayToWitnessScriptHash();
      expect(res != null, true);
      expectHex(res!,
          'ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db');

      expect(PayToPublicKeySecp256k1.matchPayToWitnessScriptHash(), null);
    });

    test('Encode', () {
      final res = PayToScriptHash.encode();
      expect(res != null, true);
      expectHex(res!, '17a9144733f37cf4db86fbc2efed2500b4f4e49f31202387');
    });

    test('BuildPayToPublicKey', () {
      final pubkey =
          '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432';
      final script = TWBitcoinScript.buildPayToPublicKey(
          TWData.createWithHexString(pubkey).bytes()!);
      expect(script.pointer != nullptr, true);
      expectHex(
          script.data,
          '21'
          '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432'
          'ac');
    });

    test('BuildPayToWitnessPubkeyHash', () {
      final hash = '79091972186c449eb1ded22b78e40d009bdf0089';
      final script = TWBitcoinScript.buildPayToWitnessPubkeyHash(
          TWData.createWithHexString(hash).bytes()!);
      expect(script.pointer != nullptr, true);
      expectHex(script.data, '0014' '79091972186c449eb1ded22b78e40d009bdf0089');
    });

    test('BuildPayToWitnessScriptHash', () {
      final hash =
          'ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db';
      final script = TWBitcoinScript.buildPayToWitnessScriptHash(
          TWData.createWithHexString(hash).bytes()!);
      expect(script.pointer != nullptr, true);
      expectHex(
          script.data,
          '0020'
          'ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db');
    });

    test('ScriptHash', () {
      final pkData = 'cf5007e19af3641199f21f3fa54dff2fa2627471';
      final script = TWBitcoinScript.buildPayToPublicKeyHash(
          TWData.createWithHexString(pkData).bytes()!);

      final data = script.data;

      expectHex(data, '76a914cf5007e19af3641199f21f3fa54dff2fa262747188ac');

      final scriptHash = script.scriptHash;

      expectHex(scriptHash, 'c470d22e69a2a967f2cec0cd5a5aebb955cdd395');
    });

    test('RedeemScript', () {
      final pkData = 'cf5007e19af3641199f21f3fa54dff2fa2627471';
      final embeddedScript = TWBitcoinScript.buildPayToPublicKeyHash(
          TWData.createWithHexString(pkData).bytes()!);

      final scriptHash = embeddedScript.scriptHash;

      final scriptPub1 = TWBitcoinScript.buildPayToScriptHash(scriptHash);

      final data = scriptPub1.data;

      expectHex(data, 'a914c470d22e69a2a967f2cec0cd5a5aebb955cdd39587');
    });

    test('LockScriptForP2PKHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          '1Cu32FVupVCgHkMMRJdYJugxwo2Aprgk7H', TWCoinType.TWCoinTypeBitcoin);
      final scriptData = script.data;
      expectHex(
          scriptData, '76a9148280b37df378db99f66f85c95a783a76ac7a6d5988ac');

      final scriptPub2 = TWBitcoinScript.lockScriptForAddress(
          '16TZ8J6Q5iZKBWizWzFAYnrsaox5Z5aBRV', TWCoinType.TWCoinTypeBitcoin);
      final scriptPub2Data = scriptPub2.data;
      expectHex(
          scriptPub2Data, '76a9143bde42dbee7e4dbe6a21b2d50ce2f0167faa815988ac');
    });

    test('LockScriptForP2SHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          '37rHiL4DN2wkt8pgCAUfYJRxhir98ZGN1y', TWCoinType.TWCoinTypeBitcoin);
      final scriptData = script.data;
      expectHex(scriptData, 'a9144391adbec172cad6a9fc3eebca36aeec6640abda87');

      final scriptPub2 = TWBitcoinScript.lockScriptForAddress(
          '3HV63hgTNAgdiEp4FbJRPSVrjaV4ZoX4Bs', TWCoinType.TWCoinTypeBitcoin);
      final scriptPub2Data = scriptPub2.data;
      expectHex(
          scriptPub2Data, 'a914ad40768af6419a20bdb94d83c06b6c8c94721dc087');
    });

    test('LockScriptForP2WPKHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'bc1q6hppaw7uld68amnnu5vpp5dd5u7k92c2vtdtkq',
          TWCoinType.TWCoinTypeBitcoin);
      final scriptData = script.data;
      expectHex(scriptData, '0014d5c21ebbdcfb747eee73e51810d1ada73d62ab0a');

      final scriptPub2 = TWBitcoinScript.lockScriptForAddress(
          'bc1qqw0jllft9pcr7r5uw0x08njkft0thd0g5yus0x',
          TWCoinType.TWCoinTypeBitcoin);
      final scriptPub2Data = scriptPub2.data;
      expectHex(scriptPub2Data, '0014039f2ffd2b28703f0e9c73ccf3ce564adebbb5e8');
    });

    test('LockScriptForP2WPKHAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'bc1qcuqamesrt803xld4l2j2vxx8rxmrx7aq82mkw7xwxh643wzqjlnqutkcv2',
          TWCoinType.TWCoinTypeBitcoin);
      final scriptData = script.data;
      expectHex(scriptData,
          '0020c701dde60359df137db5faa4a618c719b6337ba03ab76778ce35f558b84097e6');
    });

    test('LockScriptForCashAddress', () {
      final script = TWBitcoinScript.lockScriptForAddress(
          'bitcoincash:pzclklsyx9f068hd00a0vene45akeyrg7vv0053uqf',
          TWCoinType.TWCoinTypeBitcoinCash);
      final scriptData = script.data;
      expectHex(scriptData, 'a914b1fb7e043152fd1eed7bfaf66679ad3b6c9068f387');

      final scriptPub2 = TWBitcoinScript.lockScriptForAddress(
          'bitcoincash:qpk05r5kcd8uuzwqunn8rlx5xvuvzjqju5rch3tc0u',
          TWCoinType.TWCoinTypeBitcoinCash);
      final scriptPub2Data = scriptPub2.data;
      expectHex(
          scriptPub2Data, '76a9146cfa0e96c34fce09c0e4e671fcd43338c14812e588ac');
    });

    test('HashTypeForCoin', () {
      expect(
        TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoin),
        TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
      );
      expect(
        TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeLitecoin),
        TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
      );
      expect(
        TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeZcash),
        TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
      );
      expect(
        TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoinCash),
        TWBitcoinSigHashType.TWBitcoinSigHashTypeAll |
            TWBitcoinSigHashType.TWBitcoinSigHashTypeFork,
      );
      expect(
        TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeECash),
        TWBitcoinSigHashType.TWBitcoinSigHashTypeAll |
            TWBitcoinSigHashType.TWBitcoinSigHashTypeFork,
      );
      expect(
        TWBitcoinScript.hashTypeForCoin(TWCoinType.TWCoinTypeBitcoinGold),
        TWBitcoinSigHashType.TWBitcoinSigHashTypeAll |
            TWBitcoinSigHashType.TWBitcoinSigHashTypeForkBTG,
      );
    });

    test('IsSingle', () {
      expect(
        TWBitcoinSigHashTypeIsSingle(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeSingle),
        true,
      );
      expect(
        TWBitcoinSigHashTypeIsSingle(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeAll),
        false,
      );
      expect(
        TWBitcoinSigHashTypeIsSingle(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeNone),
        false,
      );
      expect(
        TWBitcoinSigHashTypeIsSingle(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeFork),
        false,
      );
    });

    test('IsNone', () {
      expect(
        TWBitcoinSigHashTypeIsNone(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeNone),
        true,
      );
      expect(
        TWBitcoinSigHashTypeIsNone(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeSingle),
        false,
      );
      expect(
        TWBitcoinSigHashTypeIsNone(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeAll),
        false,
      );
      expect(
        TWBitcoinSigHashTypeIsNone(
            TWBitcoinSigHashType.TWBitcoinSigHashTypeFork),
        false,
      );
    });
  });
}
