import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TezosAddress', () {
    const coin = TWCoinType.TWCoinTypeTezos;

    test('isInvalid', () {
      final invalidAddresses = {
        "NmH7tmeJUmHcncBDvpr7aJNEBk7rp5zYsB1qt", // Invalid prefix, valid checksum
        "tz1eZwq8b5cvE2bPKokatLkVMzkxz24z3AAAA", // Valid prefix, invalid checksum
        "1tzeZwq8b5cvE2bPKokatLkVMzkxz24zAAAAA" // Invalid prefix, invalid checksum
      };

      for (final address in invalidAddresses) {
        expect(TWAnyAddress.isValid(address, coin), false);
      }
    });

    test('isValid', () {
      final validAddresses = {
        "tz1Yju7jmmsaUiG9qQLoYv35v5pHgnWoLWbt",
        "tz2PdGc7U5tiyqPgTSgqCDct94qd6ovQwP6u",
        "tz3VEZ4k6a4Wx42iyev6i2aVAptTRLEAivNN",
        "KT1XnTn74bUtxHfDtBmm2bGZAQfhPbvKWR8o",
      };

      for (final address in validAddresses) {
        expect(TWAnyAddress.isValid(address, coin), true);
      }
    });

    test('string', () {
      final addressString = "tz1d1qQL3mYVuiH4JPFvuikEpFwaDm85oabM";
      final address = TWAnyAddress(addressString, coin);
      expect(address.description, addressString);
    });

    test('PublicKeyInit', () {
      final bytes = parse_hex(
          "01fe157cc8011727936c592f856c9071d39cf4acdadfa6d76435e4619c9dc56f63");
      final publicKey = TWPublicKey.createWithData(
          bytes, TWPublicKeyType.TWPublicKeyTypeED25519);
      final address = TWAnyAddress.createWithPublicKey(publicKey, coin);

      final expected = "tz1cG2jx3W4bZFeVGBjsTxUAG8tdpTXtE8PT";
      expect(address.description, expected);
    });
  });
}
