part of '../wallet_core_bindings.dart';

class TWAnySigner {
  TWAnySigner._();

  /// Signs a transaction specified by the signing input and coin type.
  ///
  /// \param [input] The serialized data of a signing input (e.g. TW.Bitcoin.Proto.SigningInput).
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return The serialized data of a `SigningOutput` proto object. (e.g. TW.Bitcoin.Proto.SigningOutput).
  static Uint8List sign(Uint8List input, TWCoinType coin) =>
      TWData.fromPointer(_anySignerImpl.sign(
        TWData(input).pointer,
        coin.value,
      )).bytes()!;

  /// Signs a transaction specified by the JSON representation of signing input, coin type and a private key, returning the JSON representation of the signing output.
  ///
  /// \param [json] JSON representation of a signing input
  /// \param [key] The private key to sign with.
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return The JSON representation of a `SigningOutput` proto object.
  static String signJSON({
    required String json,
    required Uint8List key,
    required TWCoinType coin,
  }) =>
      TWString.fromPointer(_anySignerImpl.signJSON(
        TWString(json).pointer,
        TWData(key).pointer,
        coin.value,
      )).value!;

  /// Check if AnySigner supports signing JSON representation of signing input.
  ///
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return true if AnySigner supports signing JSON representation of signing input for a given coin.
  static bool supportsJSON(TWCoinType coin) =>
      _anySignerImpl.supportsJSON(coin.value);

  /// Plans a transaction (for UTXO chains only).
  ///
  /// \param [input] The serialized data of a signing input
  /// \param [coin] The given coin type to plan the transaction for.
  /// \return The serialized data of a `TransactionPlan` proto object.
  static Uint8List plan(Uint8List input, TWCoinType coin) =>
      TWData.fromPointer(_anySignerImpl.plan(
        TWData(input).pointer,
        coin.value,
      )).bytes()!;
}
