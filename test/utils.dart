import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void expectHex(Uint8List actual, String expected) {
  expect(TWString.createWithHexBytes(actual).value, expected);
}
