import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() async {
  await initWalletCoreImpl();

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

  group('BitcoinScript', () {
    test('PayToPublicKey', () {
      final script = TWBitcoinScript.buildPayToPublicKey(TWData.createWithHexString(
              '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432')
          .bytes()!);
      expectHexBytes(script.data, PayToPublicKeySecp256k1.data);

      expectHex(
        PayToPublicKeySecp256k1.matchPayToPubkey()!,
        '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432',
      );
      expectHex(
        PayToPublicKeySecp256k1Extended.matchPayToPubkey()!,
        '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1',
      );

      expect(PayToScriptHash.matchPayToPubkey(), null);
      expect(PayToWitnessScriptHash.matchPayToPubkey(), null);
      expect(PayToWitnessPublicKeyHash.matchPayToPubkey(), null);
      expect(PayToPublicKeyHash.matchPayToPubkey(), null);
    });

    test('PayToPublicKeyHash', () {
      final script = TWBitcoinScript.buildPayToPublicKeyHash(
          TWData.createWithHexString('79091972186c449eb1ded22b78e40d009bdf0089')
              .bytes()!);
      expectHexBytes(script.data, PayToPublicKeyHash.data);

      expectHex(
        PayToPublicKeyHash.matchPayToPubkeyHash()!,
        '79091972186c449eb1ded22b78e40d009bdf0089',
      );
      expectHex(
        PayToPublicKeySecp256k1.matchPayToPubkey()!,
        '03c9f4836b9a4f77fc0d81f7bcb01b7f1b35916864b9476c241ce9fc198bd25432',
      );
      expectHex(
        PayToPublicKeySecp256k1Extended.matchPayToPubkey()!,
        '0499c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1',
      );

      expect(PayToScriptHash.matchPayToPubkeyHash(), null);
      expect(PayToWitnessScriptHash.matchPayToPubkeyHash(), null);
      expect(PayToWitnessPublicKeyHash.matchPayToPubkeyHash(), null);
    });

    test('PayToScriptHash', () {
      final script = TWBitcoinScript.buildPayToScriptHash(
          TWData.createWithHexString('4733f37cf4db86fbc2efed2500b4f4e49f312023')
              .bytes()!);
      expectHexBytes(script.data, PayToScriptHash.data);

      expect(PayToScriptHash.isPayToScriptHash, true);
      expect(PayToScriptHash.data.length, 23);

      expect(PayToWitnessScriptHash.isPayToScriptHash, false);
      expect(PayToWitnessPublicKeyHash.isPayToScriptHash, false);
      expect(PayToPublicKeySecp256k1.isPayToScriptHash, false);
      expect(PayToPublicKeySecp256k1Extended.isPayToScriptHash, false);
      expect(PayToPublicKeyHash.isPayToScriptHash, false);

      expectHex(
        PayToScriptHash.matchPayToScriptHash()!,
        '4733f37cf4db86fbc2efed2500b4f4e49f312023',
      );

      expect(PayToWitnessScriptHash.matchPayToScriptHash(), null);
      expect(PayToWitnessPublicKeyHash.matchPayToScriptHash(), null);
      expect(PayToPublicKeySecp256k1.matchPayToScriptHash(), null);
      expect(PayToPublicKeySecp256k1Extended.matchPayToScriptHash(), null);
      expect(PayToPublicKeyHash.matchPayToScriptHash(), null);
    });

    test('PayToWitnessScriptHash', () {
      final script = TWBitcoinScript.buildPayToWitnessScriptHash(
          TWData.createWithHexString(
                  'ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db')
              .bytes()!);
      expectHexBytes(script.data, PayToWitnessScriptHash.data);

      expect(PayToWitnessScriptHash.isPayToWitnessScriptHash, true);
      expect(PayToWitnessScriptHash.data.length, 34);

      expect(PayToScriptHash.isPayToWitnessScriptHash, false);
      expect(PayToWitnessPublicKeyHash.isPayToWitnessScriptHash, false);
      expect(PayToPublicKeySecp256k1.isPayToWitnessScriptHash, false);
      expect(PayToPublicKeySecp256k1Extended.isPayToWitnessScriptHash, false);
      expect(PayToPublicKeyHash.isPayToWitnessScriptHash, false);

      expectHex(
        PayToWitnessScriptHash.matchPayToWitnessScriptHash()!,
        'ff25429251b5a84f452230a3c75fd886b7fc5a7865ce4a7bb7a9d7c5be6da3db',
      );

      expect(PayToScriptHash.matchPayToWitnessScriptHash(), null);
      expect(PayToWitnessPublicKeyHash.matchPayToWitnessScriptHash(), null);
      expect(PayToPublicKeySecp256k1.matchPayToWitnessScriptHash(), null);
      expect(
          PayToPublicKeySecp256k1Extended.matchPayToWitnessScriptHash(), null);
      expect(PayToPublicKeyHash.matchPayToWitnessScriptHash(), null);
    });

    test('PayToWitnessPublicKeyHash', () {
      final script = TWBitcoinScript.buildPayToWitnessPubkeyHash(
          TWData.createWithHexString('79091972186c449eb1ded22b78e40d009bdf0089')
              .bytes()!);
      expectHexBytes(script.data, PayToWitnessPublicKeyHash.data);

      expect(PayToWitnessPublicKeyHash.isPayToWitnessPublicKeyHash, true);
      expect(PayToWitnessPublicKeyHash.data.length, 22);

      expect(PayToScriptHash.isPayToWitnessPublicKeyHash, false);
      expect(PayToWitnessScriptHash.isPayToWitnessPublicKeyHash, false);
      expect(PayToPublicKeySecp256k1.isPayToWitnessPublicKeyHash, false);
      expect(
          PayToPublicKeySecp256k1Extended.isPayToWitnessPublicKeyHash, false);
      expect(PayToPublicKeyHash.isPayToWitnessPublicKeyHash, false);

      expectHex(
        PayToWitnessPublicKeyHash.matchPayToWitnessPublicKeyHash()!,
        '79091972186c449eb1ded22b78e40d009bdf0089',
      );

      expect(PayToScriptHash.matchPayToWitnessPublicKeyHash(), null);
      expect(PayToWitnessScriptHash.matchPayToWitnessPublicKeyHash(), null);
      expect(PayToPublicKeySecp256k1.matchPayToWitnessPublicKeyHash(), null);
      expect(PayToPublicKeySecp256k1Extended.matchPayToWitnessPublicKeyHash(),
          null);
      expect(PayToPublicKeyHash.matchPayToWitnessPublicKeyHash(), null);
    });
  });
}
