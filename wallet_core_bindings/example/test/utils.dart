import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings_native/wallet_core_bindings_native.dart';
import 'package:wallet_core_bindings_wasm/wallet_core_bindings_wasm.dart';
import 'package:wasm_run_flutter/wasm_run_flutter.dart';

bool _isInitWalletCore = false;

bool isTestWasm = false;

void initTest() {
  setUpAll(() async {
    await initWalletCoreImpl();
  });
}

Future initWalletCoreImpl() async {
  if (_isInitWalletCore) {
    return;
  }
  await initWalletCoreWasmImpl();
  _isInitWalletCore = true;
}

Future initWalletCoreNativeImpl() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WalletCoreBindingsNativeImpl().initialize();
}

Future initWalletCoreWasmImpl() async {
  await WasmRunLibrary.setUp(override: false);
  WidgetsFlutterBinding.ensureInitialized();
  await WalletCoreBindingsWasmImpl().initialize();
  isTestWasm = true;
}

const UINT32_MAX = 0xffffffff;

String? _projectRoot;

String get projectRoot {
  _projectRoot ??= Directory.current.path;
  return _projectRoot!;
}

String get TESTS_ROOT {
  return '$projectRoot/test';
}

void expectHex(List<int> actual, String expected) {
  expect(TWString.createWithHexBytes(Uint8List.fromList(actual)).value,
      expected.replaceFirst('0x', ''));
}

void expectHexBytes(List<int> actual, List<int> expected) {
  expect(TWString.createWithHexBytes(Uint8List.fromList(actual)).value,
      TWString.createWithHexBytes(Uint8List.fromList(expected)).value);
}

void expectJson(String actual, String expected) {
  expect(
    const DeepCollectionEquality()
        .equals(json.decode(actual), json.decode(expected)),
    true,
  );
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

int bytesToInt(List<int> bytes) {
  return int.parse(hex(bytes), radix: 16);
}

Uint8List parse_hex(String hex) {
  return TWData.createWithHexString(hex).bytes()!;
}

String hex(List<int> bytes) {
  return TWString.createWithHexBytes(Uint8List.fromList(bytes)).value!;
}

String hexString(String value) {
  return TWString.createWithHexBytes(Uint8List.fromList(utf8.encode(value)))
      .value!;
}

void expectWasmWithException(
  Function actual,
  dynamic matcher, {
  String? reason,
  dynamic skip, // true or a String
}) {
  if (isTestWasm) {
    expect(actual, throwsException, reason: reason, skip: skip);
  } else {
    expect(actual(), matcher, reason: reason, skip: skip);
  }
}
