import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() async {
  initTest();

  group(TWString, () {
    test('HexZero', () {
      final bytes = Uint8List.fromList([0]);
      final zero = TWString.createWithHexBytes(bytes);
      expect(zero.value!, '00');
    });

    test('HexNumber', () {
      final bytes = Uint8List.fromList([0xde, 0xad, 0xbe, 0xef]);
      final string = TWString.createWithHexBytes(bytes);
      expect(string.value!, 'deadbeef');
    });

    test('GetChar', () {
      final bytes = Uint8List.fromList([0xde, 0xad, 0xbe, 0xef]);
      final string = TWString.createWithHexBytes(bytes);
      expect(string.value!, 'deadbeef');

      expect(string[0], 'd');
      expect(string[1], 'e');
      expect(string[2], 'a');
      expect(string[3], 'd');
      expect(string[4], 'b');
      expect(string[5], 'e');
      expect(string[6], 'e');
      expect(string[7], 'f');
    });
  });
}
