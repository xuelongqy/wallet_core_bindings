import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWBase64, () {
    test('Decode', () {
      final encodedInput = 'Kyc/YWI=';
      final result = TWBase64.decode(encodedInput)!;

      expect(result.length, 5);

      expect(TWString.createWithRawBytes(result).value!, '+\'?ab');
    });

    test('Encode', () {
      final data = TWString('+\'?ab').bytes();
      final encodedStr = TWBase64.encode(data);

      expect(encodedStr, 'Kyc/YWI=');
    });

    test('DecodeUrl', () {
      final encodedInput = 'Kyc_YWI=';
      final result = TWBase64.decodeUrl(encodedInput)!;

      expect(result.length, 5);

      expect(TWString.createWithRawBytes(result).value!, '+\'?ab');
    });

    test('Encode', () {
      final data = TWString('+\'?ab').bytes();
      final encodedStr = TWBase64.encodeUrl(data);

      expect(encodedStr, 'Kyc_YWI=');
    });
  });
}
