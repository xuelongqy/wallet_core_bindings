part of '../wallet_core_bindings.dart';

/// TWCryptoBoxSecretKey finalizer.
final _twCryptoBoxSecretKeyFinalizer = Finalizer<int>((int token) {
  _cryptoBoxSecretKeyImpl.delete(token);
});

/// Secret key used in `crypto_box` cryptography.
class TWCryptoBoxSecretKey extends TWObjectFinalizable {
  TWCryptoBoxSecretKey.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twCryptoBoxSecretKeyFinalizer);

  /// Create a random secret key.
  TWCryptoBoxSecretKey({
    super.attach = true,
  }) : super(
          _cryptoBoxSecretKeyImpl.create(),
          finalizer: _twCryptoBoxSecretKeyFinalizer,
        );

  /// Create a `crypto_box` secret key with the given block of data.
  ///
  /// \param [data] *non-null* byte array. Expected to have 32 bytes.
  TWCryptoBoxSecretKey.createWithData(
    Uint8List data, {
    super.attach = true,
  }) : super(
          _cryptoBoxSecretKeyImpl.createWithData(TWData(data).pointer),
          finalizer: _twCryptoBoxSecretKeyFinalizer,
        );

  /// Determines if the given secret key is valid or not.
  ///
  /// \param [data] byte array.
  /// \return true if the secret key is valid, false otherwise.
  static bool isValid(Uint8List data) {
    return _cryptoBoxSecretKeyImpl.isValid(TWData(data).pointer);
  }

  /// Delete the given secret `key`.
  @override
  void delete() {
    super.delete();
    _cryptoBoxSecretKeyImpl.delete(_pointer);
  }

  /// Returns the public key associated with the given `key`.
  ///
  /// \return the corresponding public key.
  TWCryptoBoxPublicKey getPublicKey() {
    return TWCryptoBoxPublicKey.fromPointer(
        _cryptoBoxSecretKeyImpl.getPublicKey(_pointer));
  }

  /// Returns the raw data of the given secret-key.
  Uint8List get data =>
      TWData.fromPointer(_cryptoBoxSecretKeyImpl.date(_pointer)).bytes()!;
}
