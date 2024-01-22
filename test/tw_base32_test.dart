import 'dart:ffi';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWBase32, () {
    test('InvalidDecode', () {
      final encodedInput = 'JBSWY3DPK5XXE3DE=======';
      final result = TWBase32.decode(encodedInput);
      expect(result, null);
    });
  });
}
