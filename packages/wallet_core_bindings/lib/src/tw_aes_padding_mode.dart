part of '../wallet_core_bindings.dart';

/// Padding mode used in AES encryption.
enum TWAESPaddingMode {
  Zero(0),
  PKCS7(1);

  final int value;

  const TWAESPaddingMode(this.value);

  /// Find a padding mode enum by its value.
  static TWAESPaddingMode find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}
