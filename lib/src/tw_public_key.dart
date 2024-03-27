part of '../wallet_core_bindings.dart';

/// TWPublicKey finalizer.
final _twPublicKeyFinalizer = Finalizer<Pointer<bindings.TWPublicKey>>(
    (Pointer<bindings.TWPublicKey> token) {
  iTWBindings.TWPublicKeyDelete(token);
});

/// Represents a public key.
class TWPublicKey extends TWObjectFinalizable<bindings.TWPublicKey> {
  static const compressedSize = 33;
  static const uncompressedSize = 65;

  TWPublicKey.fromPointer(
    Pointer<bindings.TWPublicKey> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twPublicKeyFinalizer);

  /// Create a public key from a block of data
  ///
  /// \param [data] Non-null block of data representing the public key
  /// \param [type] type of the public key
  TWPublicKey.createWithData(
    Uint8List data,
    int type, {
    bool attach = true,
  }) : super(
          iTWBindings.TWPublicKeyCreateWithData(TWData(data).pointer, type),
          attach: attach,
          finalizer: _twPublicKeyFinalizer,
        );

  /// Create a public key from a block of data
  ///
  /// \param [data] Non-null block of data representing the public key
  /// \param [type] type of the public key
  TWPublicKey(
    Uint8List data,
    int type, {
    bool attach = true,
  }) : super(
          iTWBindings.TWPublicKeyCreateWithData(TWData(data).pointer, type),
          attach: attach,
          finalizer: _twPublicKeyFinalizer,
        );

  /// Create a public key from a hex of data
  ///
  /// \param [hex] Non-null hex of data representing the public key
  /// \param [type] type of the public key
  TWPublicKey.createWithHexString(
    String hex,
    int type, {
    bool attach = true,
  }) : super(
          iTWBindings.TWPublicKeyCreateWithData(
            TWData.createWithHexString(hex).pointer,
            type,
          ),
          attach: attach,
          finalizer: _twPublicKeyFinalizer,
        );

  /// Try to get a public key from a given signature and a message
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  TWPublicKey.recover({
    required Uint8List signature,
    required Uint8List message,
    bool attach = true,
  }) : super(
          iTWBindings.TWPublicKeyRecover(
            TWData(signature).pointer,
            TWData(message).pointer,
          ),
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
  Uint8List get data =>
      TWData.fromPointer(iTWBindings.TWPublicKeyData(_pointer)).bytes()!;

  /// Determines if the given public key is valid or not
  ///
  /// \param [data] block of data (private key bytes)
  /// \param [type] type of the public key
  /// \return true if the block of data is a valid public key, false otherwise
  static bool isValid(Uint8List data, int type) =>
      iTWBindings.TWPublicKeyIsValid(TWData(data).pointer, type);

  /// Determines if the given public key is valid or not
  ///
  /// \param [type] type of the public key
  /// \return true if the block of data is a valid public key, false otherwise
  bool valid(int type) =>
      iTWBindings.TWPublicKeyIsValid(TWData(data).pointer, type);

  /// Determines if the given public key is compressed or not
  bool get isCompressed => iTWBindings.TWPublicKeyIsCompressed(_pointer);

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
    required Uint8List signature,
    required Uint8List message,
  }) =>
      iTWBindings.TWPublicKeyVerify(
        pointer,
        TWData(signature).pointer,
        TWData(message).pointer,
      );

  /// Verify the validity as DER of a signature and a message using the given public key
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  /// \return true if the signature and the message belongs to the given public key, false otherwise
  bool verifyAsDER({
    required Uint8List signature,
    required Uint8List message,
  }) =>
      iTWBindings.TWPublicKeyVerifyAsDER(
        pointer,
        TWData(signature).pointer,
        TWData(message).pointer,
      );

  /// Verify a Zilliqa schnorr signature with a signature and message.
  ///
  /// \param [signature] Non-null pointer to a block of data corresponding to the signature
  /// \param [message] Non-null pointer to a block of data corresponding to the message
  /// \return true if the signature and the message belongs to the given public key, false otherwise
  bool verifyZilliqaSchnorr({
    required Uint8List signature,
    required Uint8List message,
  }) =>
      iTWBindings.TWPublicKeyVerifyZilliqaSchnorr(
        pointer,
        TWData(signature).pointer,
        TWData(message).pointer,
      );

  /// Give the public key type (eliptic) of a given public key
  ///
  /// \return The public key type of the given public key (eliptic)
  int get type => iTWBindings.TWPublicKeyKeyType(_pointer);

  /// Get the public key description from a given public key
  ///
  /// \return Non-null pointer to a string representing the description of the public key
  String get description =>
      TWString.fromPointer(iTWBindings.TWPublicKeyDescription(_pointer)).value!;

  /// Get the public key HASH.
  ///
  /// \param [prefix] Non-null block of data representing the prefix
  /// \param [hasher] Non-null hasher function
  /// \param [skipTypeByte] Non-null bool
  /// \return Non-null block of data representing the hash of the public key
  Uint8List hash(
    Uint8List prefix, {
    TWHasher hasher = TWHash.sha256RIPEMD,
    bool skipTypeByte = false,
  }) {
    final hashData = data.toList();
    if (skipTypeByte) {
      data.removeAt(0);
    }
    final hash = hasher(Uint8List.fromList(hashData));

    return Uint8List.fromList([...prefix, ...hash]);
  }
}
