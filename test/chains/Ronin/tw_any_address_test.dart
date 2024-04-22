import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

const roninPrefixChecksummed = "ronin:EC49280228b0D05Aa8e8b756503254e1eE7835ab";

const gTests = [
  roninPrefixChecksummed,
  "ronin:ec49280228b0d05aa8e8b756503254e1ee7835ab",
  "0xEC49280228b0D05Aa8e8b756503254e1eE7835ab",
  "ronin:0xEC49280228b0D05Aa8e8b756503254e1eE7835ab",
];

void main() {
  group('RoninAnyAddress', () {
    const coin = TWCoinType.TWCoinTypeRonin;

    test('Validate', () {
      for (final t in gTests) {
        expect(TWAnyAddress.isValid(t, coin), true);
      }
    });

    test('Normalize', () {
      for (final t in gTests) {
        final addr = TWAnyAddress(t, coin);
        final string2 = addr.description;
        expect(string2, roninPrefixChecksummed);

        final keyHash = addr.data;
        expectHex(keyHash, 'ec49280228b0d05aa8e8b756503254e1ee7835ab');
      }
    });

    test('Invalid', () {
      const tests = {
        "EC49280228b0D05Aa8e8b756503254e1eE7835ab", // no prefix
        "ec49280228b0d05aa8e8b756503254e1ee7835ab", // no prefix
        "roni:EC49280228b0D05Aa8e8b756503254e1eE7835ab", // wrong prefix
        "ronin=EC49280228b0D05Aa8e8b756503254e1eE7835ab", // wrong prefix
        "0xronin:EC49280228b0D05Aa8e8b756503254e1eE7835ab", // wrong prefix
        "EC49280228b0D05Aa8e8b756503254e1eE7835", // too short
        "ronin:EC49280228b0D05Aa8e8b756503254e1eE7835", // too short
        "ronin:ec49280228b0d05aa8e8b756503254e1ee7835", // too short
      };

      for (final t in tests) {
        expect(TWAnyAddress.isValid(t, coin), false);
      }
    });
  });
}
