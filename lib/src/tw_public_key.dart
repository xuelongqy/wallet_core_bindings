part of '../wallet_core_bindings.dart';

/// TWPublicKey finalizer.
final _twPublicKeyFinalizer = Finalizer<Pointer<bindings.TWPublicKey>>(
    (Pointer<bindings.TWPublicKey> token) {
  iTWBindings.TWPublicKeyDelete(token);
});

/// Represents a public key.
class TWPublicKey extends TWObjectFinalizable<bindings.TWPublicKey> {
  TWPublicKey.fromPointer(
    Pointer<bindings.TWPublicKey> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twPublicKeyFinalizer);

  /// Create a public key from a block of data
  ///
  /// \param [data] Non-null block of data representing the public key
  /// \param [type] type of the public key
  /// \note Should be deleted with [TWPublicKey.delete]
  TWPublicKey.createWithData({
    required TWData data,
    required int type,
    bool attach = true,
  }) : super(
          iTWBindings.TWPublicKeyCreateWithData(data.pointer, type),
          attach: attach,
          finalizer: _twPublicKeyFinalizer,
        );

  /// Try to get a public key from a given signature and a message
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  TWPublicKey.recover({
    required TWData signature,
    required TWData message,
    bool attach = true,
  }) : super(
          iTWBindings.TWPublicKeyRecover(signature.pointer, message.pointer),
          attach: attach,
          finalizer: _twPublicKeyFinalizer,
        );

  /// Delete the given public key
  @override
  void delete() {
    super.delete();
    iTWBindings.TWPublicKeyDelete(_pointer);
  }

  /// Gives the raw data of a given public-key
  TWData data() => TWData.fromPointer(iTWBindings.TWPublicKeyData(_pointer));

  /// Determines if the given public key is valid or not
  ///
  /// \param [type] type of the public key
  /// \return true if the block of data is a valid public key, false otherwise
  bool isValid(int type) =>
      iTWBindings.TWPublicKeyIsValid(data().pointer, type);

  /// Determines if the given public key is compressed or not
  bool isCompressed() => iTWBindings.TWPublicKeyIsCompressed(_pointer);

  /// Give the compressed public key of the given non-compressed public key
  TWPublicKey compressed() =>
      TWPublicKey.fromPointer(iTWBindings.TWPublicKeyCompressed(_pointer));

  /// Give the non-compressed public key of a corresponding compressed public key
  TWPublicKey uncompressed() =>
      TWPublicKey.fromPointer(iTWBindings.TWPublicKeyUncompressed(_pointer));

  /// Verify the validity of a signature and a message using the given public key
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  /// \return true if the signature and the message belongs to the given public key, false otherwise
  bool verify({
    required TWData signature,
    required TWData message,
  }) =>
      iTWBindings.TWPublicKeyVerify(
          pointer, signature.pointer, message.pointer);

  /// Verify the validity as DER of a signature and a message using the given public key
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  /// \return true if the signature and the message belongs to the given public key, false otherwise
  bool verifyAsDER({
    required TWData signature,
    required TWData message,
  }) =>
      iTWBindings.TWPublicKeyVerifyAsDER(
          pointer, signature.pointer, message.pointer);

  /// Verify a Zilliqa schnorr signature with a signature and message.
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  /// \return true if the signature and the message belongs to the given public key, false otherwise
  bool verifyZilliqaSchnorr({
    required TWData signature,
    required TWData message,
  }) =>
      iTWBindings.TWPublicKeyVerifyZilliqaSchnorr(
          pointer, signature.pointer, message.pointer);

  /// Give the public key type (eliptic) of a given public key
  ///
  /// \return The public key type of the given public key (eliptic)
  int type() => iTWBindings.TWPublicKeyKeyType(_pointer);

  /// Get the public key description from a given public key
  ///
  /// \return Non-null pointer to a string representing the description of the public key
  String description() {
    TWString twRes =
        TWString.fromPointer(iTWBindings.TWPublicKeyDescription(_pointer));
    String res = twRes.toString();
    twRes.delete();
    return res;
  }
}
