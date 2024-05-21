part of '../wallet_core_bindings.dart';

/// Padding mode used in AES encryption.
enum TWAESPaddingMode {
  Zero(0),
  PKCS7(1);

  final int mode;

  const TWAESPaddingMode(this.mode);

  /// Find a padding mode enum by its value.
  static TWAESPaddingMode find(int mode) {
    return values.firstWhere((element) => element.mode == mode);
  }
}
