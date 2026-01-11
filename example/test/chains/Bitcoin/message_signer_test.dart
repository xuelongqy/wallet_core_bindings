import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() async {
  await initWalletCoreImpl();

  final gPrivateKey = TWPrivateKey.createWithHexString(
      'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5');

  group('BitcoinMessageSigner', () {
    test('VerifyMessage', () {
      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: '1B8Qea79tsxmn4dTiKKRVvsJpHwL2fMQnr',
          message: 'test signature',
          signature:
              'H+3L5IbSVcejp4S2VwLXCxLEMQAWDvKbE8lQyq0ocdvyM1aoEudkzN/S/qLI3vnNOFY6V13BXWSFrPr3OjGa5Dk=',
        ),
        true,
      );
      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: '1HZwkjkeaoZfTSaJxDw6aKkxp45agDiEzN',
          message: 'This is an example of a signed message.',
          signature:
              'G39Qf0XrZHICWbz3r5gOkcgTRw3vM4leGjiR3refr/K1OezcKmmXaLn4zc8ji2rjbBUIMrIhH/jc5Z2qEEz7qVk=',
        ),
        true,
      );
      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: '1H8X4u6CVZRTLLNbUQTKAnc5vCkqWMpwfF',
          message: 'compressed key',
          signature:
              'IKUI9v2xbHogJe8HKXI2M5KEhMKaW6fjNxtyEy27Mf+3/e1ht4jZoc85e4F8stPsxt4Xcg8Yr42S28O6L/Qx9fE=',
        ),
        true,
      );
      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X',
          message: 'test signature',
          signature:
              'ILH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=',
        ),
        true,
      );
      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X',
          message: 'another text',
          signature:
              'H7vrF2C+TlFiHyegAw3QLv6SK0myuEEXUOgfx0+Qio1YVDuSa6p/OHpoQVlUt3F8QJdbdZN9M1h/fYEAnEz16V0=',
        ),
        true,
      );
      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: '1E4T9JZ3mq6cdgiRJEWzHqDXb9t322fE6d',
          message: 'test signature',
          signature:
              'HLH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=',
        ),
        true,
      );
    });

    test('SignAndVerify', () {
      final pubkey = gPrivateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      expectHex(pubkey.data,
          '0399c6f51ad6f98c9c583f8e92bb7758ab2ca9a04110c0a1126ec43e5453d196c1');
      final address = TWBitcoinAddress.createWithPublicKey(
          pubkey, TWCoinType.Bitcoin.p2pkhPrefix);
      expect(address.description, '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X');

      {
        const msg = 'test signature';
        final signature = TWBitcoinMessageSigner.signMessage(
          privateKey: gPrivateKey,
          address: address.description,
          message: msg,
        );

        expect(signature,
            'ILH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=');
      }

      {
        const msg = 'another text';
        final signature = TWBitcoinMessageSigner.signMessage(
          privateKey: gPrivateKey,
          address: address.description,
          message: msg,
        );

        expect(signature,
            'H7vrF2C+TlFiHyegAw3QLv6SK0myuEEXUOgfx0+Qio1YVDuSa6p/OHpoQVlUt3F8QJdbdZN9M1h/fYEAnEz16V0=');
      }

      // uncompressed
      final pubKeyUncomp =
          gPrivateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);
      final keyHash = pubKeyUncomp.hash(
        Uint8List.fromList([TWCoinType.Bitcoin.p2pkhPrefix]),
        hasher: TWHash.sha256RIPEMD,
      );
      final addressUncomp = TWBitcoinAddress.createWithData(keyHash);
      expect(addressUncomp.description, '1E4T9JZ3mq6cdgiRJEWzHqDXb9t322fE6d');

      // {
      //   const msg = 'test signature';
      //   final signature = TWBitcoinMessageSigner.signMessage(
      //     privateKey: gPrivateKey,
      //     address: addressUncomp.description,
      //     message: msg,
      //     compressed: false,
      //   );

      //   expect(signature,
      //       'HLH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=');
      // }
    });

    test('SignAndVerify', () {
      const privKeyData =
          'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5';
      final privateKey = TWPrivateKey.createWithHexString(privKeyData);
      const address = '19cAJn4Ms8jodBBGtroBNNpCZiHAWGAq7X';
      const message = 'test signature';

      final signature = TWBitcoinMessageSigner.signMessage(
        privateKey: privateKey,
        address: address,
        message: message,
      );
      expect(signature,
          'ILH5K7JQLaRGaKGXXH5mYM6FIIy9IWyY4JUPI+PHYY4WaupxUbg+zy0bhBCrDuehy9x4WidwjkRR1GSLnWvOXBo=');

      expect(
        TWBitcoinMessageSigner.verifyMessage(
          address: address,
          message: message,
          signature: signature,
        ),
        true,
      );
    });
  });
}
