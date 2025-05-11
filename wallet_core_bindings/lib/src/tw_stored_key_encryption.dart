part of '../wallet_core_bindings.dart';

/// Preset encryption kind
enum TWStoredKeyEncryption {
  Aes128Ctr(0),
  Aes128Cbc(1),
  Aes192Ctr(2),
  Aes256Ctr(3);

  final int value;

  const TWStoredKeyEncryption(this.value);

  /// Find a stored key encryption enum by its value.
  static TWStoredKeyEncryption find(int value) {
    return values.firstWhere((element) => element.value == value);
  }
}
