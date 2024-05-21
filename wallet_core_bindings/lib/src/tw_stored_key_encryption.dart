part of '../wallet_core_bindings.dart';

/// Preset encryption kind
enum TWStoredKeyEncryption {
  Aes128Ctr(0),
  Aes128Cbc(1),
  Aes192Ctr(2),
  Aes256Ctr(3);

  final int encryption;

  const TWStoredKeyEncryption(this.encryption);

  /// Find a stored key encryption enum by its value.
  static TWStoredKeyEncryption find(int encryption) {
    return values.firstWhere((element) => element.encryption == encryption);
  }
}
