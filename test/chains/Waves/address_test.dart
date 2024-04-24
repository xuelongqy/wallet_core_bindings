import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('WavesAddress', () {
    const coin = TWCoinType.TWCoinTypeWaves;

    test('FromPrivateKey', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '9864a747e1b97f131fabb6b447296c9b6f0201e79fb3c5356e6c77e89b6a806a');
      final publicKeyEd25519 = privateKey.getPublicKeyEd25519();
      expect(hex(publicKeyEd25519.data),
          'ff84c4bfc095df25b01e48807715856d95af93d88c5b57f30cb0ce567ca4ced6');
      final publicKeyCurve25519 = privateKey.getPublicKeyCurve25519();
      expect(hex(publicKeyCurve25519.data),
          '559a50cb45a9a8e8d4f83295c354725990164d10bb505275d1a3086c08fb935d');
      final address =
          TWAnyAddress.createWithPublicKey(publicKeyCurve25519, coin);

      expect(address.description, '3P2uzAzX9XTu1t32GkWw68YFFLwtapWvDds');
    });

    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithHexString(
        '559a50cb45a9a8e8d4f83295c354725990164d10bb505275d1a3086c08fb935d',
        TWPublicKeyType.TWPublicKeyTypeCURVE25519,
      );
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      expect(address.description, '3P2uzAzX9XTu1t32GkWw68YFFLwtapWvDds');
    });

    test('Invalid', () {
      expect(TWAnyAddress.isValid('abc', coin), false);
      expect(
        TWAnyAddress.isValid(
            '0x5aAeb6053F3E94C9b9A09f33669435E7Ef1BeAed', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('3PLANf4MgtNN5v5k4NNnyx2m4zKJiw1tF9v', coin),
        false,
      );
      expect(
        TWAnyAddress.isValid('3PLANf4MgtNN5v6k4NNnyx2m4zKJiw1tF8v', coin),
        false,
      );
    });

    test('Valid', () {
      expect(
        TWAnyAddress.isValid('3PLANf4MgtNN5v6k4NNnyx2m4zKJiw1tF9v', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('3PDjjLFDR5aWkKgufika7KSLnGmAe8ueDpC', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('3PLjucTjqEfmgBF7fs2CER3fHQapCtknPeW', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid('3PB9ffP1YKQer3e7t283gPCLyjEfK8xrGp7', coin),
        true,
      );
    });

    test('InitWithString', () {
      final address = TWAnyAddress(
        '3PQupTC1yRiHneotFt79LF2pkN6GrGMwEy3',
        coin,
      );
      expect(address.description, '3PQupTC1yRiHneotFt79LF2pkN6GrGMwEy3');
    });

    test('Derive', () {
      final mnemonic =
          "water process satisfy repeat flag avoid town badge sketch surge split between cabin sugar "
          "ill special axis adjust pull useful craft peace flee physical";
      final wallet = TWHDWallet.createWithMnemonic(mnemonic);
      final address1 = TWCoinTypeDeriveAddress(
          coin, wallet.getKey(coin, "m/44'/5741564'/0'/0'/0'"));
      final address2 = TWCoinTypeDeriveAddress(
          coin, wallet.getKey(coin, "m/44'/5741564'/0'/0'/1'"));

      expect(address1, '3PQupTC1yRiHneotFt79LF2pkN6GrGMwEy3');
      expect(address2, '3PEXw52bkS9XuLhttWoKyykZjXqEY8zeLxf');
    });
  });
}
