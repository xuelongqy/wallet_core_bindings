part of '../wallet_core_bindings.dart';

/// Represents a message signer to sign custom messages for any blockchain.
class TWMessageSigner {
  TWMessageSigner._();

  /// Computes preimage hashes of a message, needed for external signing.
  ///
  /// \param [coin] The given coin type to sign the message for.
  /// \param [input] The serialized data of a `MessageSigningInput` proto object, (e.g. `TW.Solana.Proto.MessageSigningInput`).
  /// \return The serialized data of a `PreSigningOutput` proto object, (e.g. `TxCompiler::Proto::PreSigningOutput`).
  static Uint8List preImageHashes(TWCoinType coin, Uint8List input) =>
      TWData.fromPointer(
        _messageSignerImpl.preImageHashes(
          coin.value,
          TWData(input).pointer,
        ),
      ).bytes()!;

  /// Signs an arbitrary message to prove ownership of an address for off-chain services.
  ///
  /// \param [coin] The given coin type to sign the message for.
  /// \param [input] The serialized data of a `MessageSigningInput` proto object, (e.g. `TW.Solana.Proto.MessageSigningInput`).
  /// \return The serialized data of a `MessageSigningOutput` proto object, (e.g. `TW.Solana.Proto.MessageSigningOutput`).
  static Uint8List sign(TWCoinType coin, Uint8List input) => TWData.fromPointer(
        _messageSignerImpl.sign(
          coin.value,
          TWData(input).pointer,
        ),
      ).bytes()!;

  /// Verifies a signature for a message.
  ///
  /// \param [coin] The given coin type to sign the message for.
  /// \param [input] The serialized data of a verifying input (e.g. TW.Ethereum.Proto.MessageVerifyingInput).
  /// \return whether the signature is valid.
  static bool verify(TWCoinType coin, Uint8List input) =>
      _messageSignerImpl.verify(
        coin.value,
        TWData(input).pointer,
      );
}
