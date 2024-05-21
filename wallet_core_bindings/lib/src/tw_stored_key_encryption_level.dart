part of '../wallet_core_bindings.dart';

/// Preset encryption parameter with different security strength, for key store
enum TWStoredKeyEncryptionLevel {
  /// Default, which is one of the below values, determined by the implementation.
  Default(0),

  /// Minimal sufficient level of encryption strength (scrypt 4096)
  Minimal(1),

  /// Weak encryption strength (scrypt 16k)
  Weak(2),

  /// Standard level of encryption strength (scrypt 262k)
  Standard(3);

  final int level;

  const TWStoredKeyEncryptionLevel(this.level);

  /// Find a stored key encryption level enum by its value.
  static TWStoredKeyEncryptionLevel find(int level) {
    return values.firstWhere((element) => element.level == level);
  }
}
