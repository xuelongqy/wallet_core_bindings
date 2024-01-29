import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWString, () {
    test('All', () {
      TWString string = TWString('deadbeef');
      Uint8List bytes = Uint8List.fromList([0xde, 0xad, 0xbe, 0xef]);
      TWString string2 = TWString.createWithHexData(TWData(bytes));

      expect(string.value!, 'deadbeef');
      expect(string.size, 8);
      expect(string[1], 'e');
      expect(string == string2, true);
    });
  });
}
