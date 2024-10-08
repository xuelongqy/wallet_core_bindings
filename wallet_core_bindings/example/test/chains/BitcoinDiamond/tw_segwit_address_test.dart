import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TWBitcoinDiamondSegwitAddress', () {
    const coin = TWCoinType.BitcoinDiamond;

    test('Valid', () {
      expect(
        TWAnyAddress.isValid(
            'bcd1q35t4g0ezx9cl5qzac4tl377n9492uztqjwf5wh', coin),
        true,
      );
      expect(
        TWAnyAddress.isValid(
            'bcd1q35t4g0ezx9cl5qzac4tl377n9492uztqjwf5ac', coin),
        false,
      );
    });

    /// Initializes a Bech32 address with a public key and a HRP prefix.
    test('PubkeyToAddress', () {
      final publicKey = TWPublicKey.createWithHexString(
          '032a9ccb9cc6fd461df091b0f711730daa4292f9226aec918ac19381ac2af5e9ee',
          TWPublicKeyType.SECP256k1);

      /// construct with public key
      final address = TWSegwitAddress.createWithPublicKey(
          TWHRP.forString('bcd'), publicKey);

      expect(TWSegwitAddress.isValidString(address.description), true);
      expect(
          address.description, 'bcd1q35t4g0ezx9cl5qzac4tl377n9492uztqjwf5wh');
    });

    /// Decodes a SegWit address.
    test('Decode', () {
      final result =
          TWSegwitAddress('bcd1q35t4g0ezx9cl5qzac4tl377n9492uztqjwf5wh');

      expect(result.witnessVersion, 0);
      expect(result.description, 'bcd1q35t4g0ezx9cl5qzac4tl377n9492uztqjwf5wh');
      expect(result.hrp, TWHRP.forString('bcd'));
    });
  });
}
