part of '../../wallet_core_bindings.dart';

/// [TWBizPasskeySession] interface.
abstract class TWBizPasskeySessionInterface {
  /// Encodes `BizPasskeySession.registerSession` function call to register a session passkey public key.
  ///
  /// \param sessionPasskeyPublicKey The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \param validUntilTimestamp The timestamp until which the session is valid. Big endian uint64.
  /// \return ABI-encoded function call.
  int encodeRegisterSessionCall(
      int sessionPasskeyPublicKey, int validUntilTimestamp);

  /// Encodes `BizPasskeySession.removeSession` function call to deregister a session passkey public key.
  ///
  /// \param sessionPasskeyPublicKey The nist256p1 (aka secp256p1) public key of the session passkey.
  /// \return ABI-encoded function call.
  int encodeRemoveSessionCall(int sessionPasskeyPublicKey);

  /// Encodes `BizPasskeySession` nonce.
  ///
  /// \param nonce The nonce of the Biz Passkey Session account.
  /// \return uint256 represented as [passkey_nonce_key_192, nonce_64].
  int encodePasskeySessionNonce(int nonce);

  /// Encodes `BizPasskeySession.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param input The serialized data of `BizPasskeySession.ExecuteWithPasskeySessionInput` protobuf message.
  /// \return ABI-encoded function call.
  int encodeExecuteWithPasskeySessionCall(int input);

  /// Signs and encodes `BizPasskeySession.executeWithPasskeySession` function call to execute a batch of transactions.
  ///
  /// \param input The serialized data of `BizPasskeySession.ExecuteWithSignatureInput` protobuf message.
  /// \return ABI-encoded function call.
  int signExecuteWithSignatureCall(int input);
}
