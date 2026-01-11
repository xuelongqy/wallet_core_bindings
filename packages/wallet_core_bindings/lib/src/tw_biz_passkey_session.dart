part of '../wallet_core_bindings.dart';

/// BizPasskeySession functions
class TWBizPasskeySession {
  TWBizPasskeySession._();

  /// Encodes `BizPasskeySession.registerSession` function call to register a session passkey public key.
  ///
  /// \param [sessionPasskeyPublicKey] The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \param [validUntilTimestamp] The timestamp until which the session is valid. Big endian uint64.
  /// \return ABI-encoded function call.
  static Uint8List? encodeRegisterSessionCall({
    required TWPublicKey sessionPasskeyPublicKey,
    required Uint8List validUntilTimestamp,
  }) =>
      TWData.fromPointer(
        _bizPasskeySessionImpl.encodeRegisterSessionCall(
          sessionPasskeyPublicKey.pointer,
          TWData(validUntilTimestamp).pointer,
        ),
      ).bytes();

  /// Encodes `BizPasskeySession.removeSession` function call to deregister a session passkey public key.
  ///
  /// \param [sessionPasskeyPublicKey] The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \return ABI-encoded function call.
  static Uint8List? encodeRemoveSessionCall({
    required TWPublicKey sessionPasskeyPublicKey,
  }) =>
      TWData.fromPointer(
        _bizPasskeySessionImpl.encodeRemoveSessionCall(
          sessionPasskeyPublicKey.pointer,
        ),
      ).bytes();

  /// Encodes `BizPasskeySession` nonce.
  ///
  /// \param [nonce] The nonce of the Biz Passkey Session account.
  /// \return uint256 represented as [passkey_nonce_key_192, nonce_64].
  static Uint8List? encodePasskeySessionNonce({
    required Uint8List nonce,
  }) =>
      TWData.fromPointer(
        _bizPasskeySessionImpl.encodePasskeySessionNonce(
          TWData(nonce).pointer,
        ),
      ).bytes();

  /// Encodes `BizPasskeySession.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param [input] The serialized data of `BizPasskeySession.ExecuteWithPasskeySessionInput` protobuf message.
  /// \return ABI-encoded function call.
  static Uint8List? encodeExecuteWithPasskeySessionCall({
    required Uint8List input,
  }) =>
      TWData.fromPointer(
        _bizPasskeySessionImpl.encodeExecuteWithPasskeySessionCall(
          TWData(input).pointer,
        ),
      ).bytes();

  /// Signs and encodes `BizPasskeySession.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param [input] The serialized data of `BizPasskeySession.ExecuteWithSignatureInput` protobuf message.
  /// \return ABI-encoded function call.
  static Uint8List? signExecuteWithSignatureCall({
    required Uint8List input,
  }) =>
      TWData.fromPointer(
        _bizPasskeySessionImpl.signExecuteWithSignatureCall(
          TWData(input).pointer,
        ),
      ).bytes();
}
