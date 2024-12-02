import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();

  group(TWBech32, () {
    test('Encode', () {
      const hrp = 'abcdef';
      final data = parse_hex('00443214c74254b635cf84653a56d7c675be77df');
      final result = TWBech32.encode(hrp, data);

      expect(result, 'abcdef1qpzry9x8gf2tvdw0s3jn54khce6mua7lmqqqxw');
    });

    test('Decode', () {
      const input = 'abcdef1qpzry9x8gf2tvdw0s3jn54khce6mua7lmqqqxw';
      final result = TWBech32.decode(input)!;

      expectHex(result, '00443214c74254b635cf84653a56d7c675be77df');
    });

    test('Decode_WrongChecksumVariant', () {
      // This is a Bech32m variant, not Bech32 variant. So it should fail using Bech32 decoder.
      const input = 'abcdef1l7aum6echk45nj3s0wdvt2fg8x9yrzpqzd3ryx';
      final result = TWBech32.decode(input);

      expect(result, null);
    });

    test('EncodeM', () {
      const hrp = 'abcdef';
      final data = parse_hex('ffbbcdeb38bdab49ca307b9ac5a928398a418820');
      final result = TWBech32.encodeM(hrp, data);

      expect(result, 'abcdef1l7aum6echk45nj3s0wdvt2fg8x9yrzpqzd3ryx');
    });

    test('DecodeM', () {
      const input = 'abcdef1l7aum6echk45nj3s0wdvt2fg8x9yrzpqzd3ryx';
      final result = TWBech32.decodeM(input)!;

      expectHex(result, 'ffbbcdeb38bdab49ca307b9ac5a928398a418820');
    });

    test('DecodeM_WrongChecksumVariant', () {
      // This is a Bech32 variant, not Bech32m variant. So it should fail using Bech32M decoder.
      const input = 'abcdef1qpzry9x8gf2tvdw0s3jn54khce6mua7lmqqqxw';
      final result = TWBech32.decodeM(input);

      expect(result, null);
    });
  });
}
