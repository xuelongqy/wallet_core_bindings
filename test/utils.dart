import 'dart:io';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

String? _projectRoot;

String get projectRoot {
  if (_projectRoot == null) {
    _projectRoot = Directory.current.path;
  }
  return _projectRoot!;
}

void expectHex(Uint8List actual, String expected) {
  expect(TWString.createWithHexBytes(actual).value, expected);
}

void expectHexBytes(Uint8List actual, Uint8List expected) {
  expect(TWString.createWithHexBytes(actual).value,
      TWString.createWithHexBytes(expected).value);
}

Uint8List hexToBytes(String hexString, {int? length}) {
  String newHexString = hexString;
  if (length != null) {
    newHexString = hexString.padLeft(length * 2, '0');
  }
  if (newHexString.length % 2 != 0) {
    newHexString = '0$newHexString';
  }
  return TWData.createWithHexString(newHexString).bytes()!;
}

Uint8List bigIntToBytes(BigInt value, {int? length}) {
  final hex = value.toRadixString(16);
  return hexToBytes(hex, length: length);
}

Uint8List intToBytes(int value, {int? length}) {
  final hex = value.toRadixString(16);
  return hexToBytes(hex, length: length);
}

Uint8List bigIntStringToBytes(String value, {int? length}) {
  final hex = BigInt.parse(value).toRadixString(16);
  return hexToBytes(hex, length: length);
}

void main() {}
