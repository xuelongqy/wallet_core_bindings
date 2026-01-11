part of '../wallet_core_bindings.dart';

/// TWCryptoBoxPublicKey finalizer.
final _twCryptoBoxPublicKeyFinalizer = Finalizer<int>((int token) {
  _cryptoBoxPublicKeyImpl.delete(token);
});

/// Public key used in `crypto_box` cryptography.
class TWCryptoBoxPublicKey extends TWObjectFinalizable {
  TWCryptoBoxPublicKey.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(finalizer: _twCryptoBoxPublicKeyFinalizer);

  /// Create a `crypto_box` public key with the given block of data.
  ///
  /// \param [data] *non-null* byte array. Expected to have 32 bytes.
  TWCryptoBoxPublicKey.createWithData(
    Uint8List data, {
    super.attach = true,
  }) : super(
          _cryptoBoxPublicKeyImpl.createWithData(TWData(data).pointer),
          finalizer: _twCryptoBoxPublicKeyFinalizer,
        );

  /// Determines if the given public key is valid or not.
  ///
  /// \param [data] byte array.
  /// \return true if the public key is valid, false otherwise.
  static bool isValid(Uint8List data) {
    return _cryptoBoxPublicKeyImpl.isValid(TWData(data).pointer);
  }

  /// Delete the given public key.
  @override
  void delete() {
    super.delete();
    _cryptoBoxPublicKeyImpl.delete(_pointer);
  }

  /// Returns the raw data of the given public-key.
  Uint8List get data =>
      TWData.fromPointer(_cryptoBoxPublicKeyImpl.date(_pointer)).bytes()!;
}
