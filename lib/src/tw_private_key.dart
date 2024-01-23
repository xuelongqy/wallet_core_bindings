part of '../wallet_core_bindings.dart';

/// TWPrivateKey finalizer.
final _twPrivateKeyFinalizer = Finalizer<Pointer<bindings.TWPrivateKey>>(
    (Pointer<bindings.TWPrivateKey> token) {
  iTWBindings.TWPrivateKeyDelete(token);
});

/// Represents a private key.
class TWPrivateKey extends TWObjectFinalizable<bindings.TWPrivateKey> {
  static const size = 32;

  TWPrivateKey.fromPointer(
    Pointer<bindings.TWPrivateKey> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twPrivateKeyFinalizer);

  /// Create a random private key
  TWPrivateKey({
    bool attach = true,
  }) : super(
          iTWBindings.TWPrivateKeyCreate(),
          attach: attach,
          finalizer: _twPrivateKeyFinalizer,
        );

  /// Create a private key with the given block of data
  ///
  /// \param [data] a block of data
  TWPrivateKey.createWithData(
    Uint8List data, {
    bool attach = true,
  }) : super(
          iTWBindings.TWPrivateKeyCreateWithData(TWData(data).pointer),
          attach: attach,
          finalizer: _twPrivateKeyFinalizer,
        );

  /// Create a private key with the given hex of data
  ///
  /// \param [hex] a hex of data
  TWPrivateKey.createWithHexString(
    String hex, {
    bool attach = true,
  }) : super(
          iTWBindings.TWPrivateKeyCreateWithData(
            TWData.createWithHexString(hex).pointer,
          ),
          attach: attach,
          finalizer: _twPrivateKeyFinalizer,
        );

  /// Deep copy a given private key
  ///
  /// \param [key] Non-null private key to be copied
  TWPrivateKey.createCopy(
    TWPrivateKey key, {
    bool attach = true,
  }) : super(
          iTWBindings.TWPrivateKeyCreateCopy(key.pointer),
          attach: attach,
          finalizer: _twPrivateKeyFinalizer,
        );

  /// Delete the given private key
  @override
  void delete() {
    super.delete();
    iTWBindings.TWPrivateKeyDelete(_pointer);
  }

  /// Determines if the given private key is valid or not.
  ///
  /// \param [data] block of data (private key bytes)
  /// \param [curve] Eliptic curve of the private key
  /// \return true if the private key is valid, false otherwise
  static bool isValid(Uint8List data, int curve) =>
      iTWBindings.TWPrivateKeyIsValid(TWData(data).pointer, curve);

  /// Determines if the given private key is valid or not.
  ///
  /// \param [curve] Eliptic curve of the private key
  /// \return true if the private key is valid, false otherwise
  bool valid(int curve) =>
      iTWBindings.TWPrivateKeyIsValid(TWData(data).pointer, curve);

  /// Convert the given private key to raw-bytes block of data
  ///
  /// \return Non-null block of data (raw bytes) of the given private key
  Uint8List get data =>
      TWData.fromPointer(iTWBindings.TWPrivateKeyData(_pointer)).bytes()!;

  /// Returns the public key associated with the given coinType and privateKey
  ///
  /// \param [coinType] coinType of the given private key
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKey(int coinType) => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKey(_pointer, coinType));

  /// Returns the public key associated with the given pubkeyType and privateKey
  ///
  /// \param [pubkeyType] pubkeyType of the given private key
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeyByType(int pubkeyType) => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeyByType(_pointer, pubkeyType));

  /// Returns the Secp256k1 public key associated with the given private key
  ///
  /// \param [compressed] if the given private key is compressed or not
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeySecp256k1(bool compressed) => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeySecp256k1(_pointer, compressed));

  /// Returns the Nist256p1 public key associated with the given private key
  ///
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeyNist256p1() => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeyNist256p1(_pointer));

  /// Returns the Ed25519 public key associated with the given private key
  ///
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeyEd25519() => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeyEd25519(_pointer));

  /// Returns the Ed25519Blake2b public key associated with the given private key
  ///
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeyEd25519Blake2b() => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeyEd25519Blake2b(_pointer));

  /// Returns the Ed25519Cardano public key associated with the given private key
  ///
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeyEd25519Cardano() => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeyEd25519Cardano(_pointer));

  /// Returns the Curve25519 public key associated with the given private key
  ///
  /// \return Non-null pointer to the corresponding public key
  TWPublicKey getPublicKeyCurve25519() => TWPublicKey.fromPointer(
      iTWBindings.TWPrivateKeyGetPublicKeyCurve25519(_pointer));

  /// Signs a digest using ECDSA and given curve.
  ///
  /// \param [digest] Non-null digest block of data
  /// \param [curve] Eliptic curve
  /// \return Signature as a Non-null block of data
  Uint8List sign(Uint8List digest, int curve) => TWData.fromPointer(
          iTWBindings.TWPrivateKeySign(_pointer, TWData(digest).pointer, curve))
      .bytes()!;

  /// Signs a digest using ECDSA. The result is encoded with DER.
  ///
  /// \param [digest] Non-null digest block of data
  /// \return Signature as a Non-null block of data
  Uint8List signAsDER(Uint8List digest) => TWData.fromPointer(
          iTWBindings.TWPrivateKeySignAsDER(_pointer, TWData(digest).pointer))
      .bytes()!;

  /// Signs a digest using ECDSA and Zilliqa schnorr signature scheme.
  ///
  /// \param [message] Non-null message
  /// \return Signature as a Non-null block of data
  Uint8List signZilliqaSchnorr(Uint8List message) =>
      TWData.fromPointer(iTWBindings.TWPrivateKeySignZilliqaSchnorr(
              _pointer, TWData(message).pointer))
          .bytes()!;
}
