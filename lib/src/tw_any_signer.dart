part of '../wallet_core_bindings.dart';

class TWAnySigner {
  /// Signs a transaction specified by the signing input and coin type.
  ///
  /// \param [input] The serialized data of a signing input (e.g. TW.Bitcoin.Proto.SigningInput).
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return The serialized data of a `SigningOutput` proto object. (e.g. TW.Bitcoin.Proto.SigningOutput).
  static TWData sign({
    required TWData input,
    required int coin,
  }) =>
      TWData.fromPointer(iTWBindings.TWAnySignerSign(input.pointer, coin));

  /// Signs a transaction specified by the JSON representation of signing input, coin type and a private key, returning the JSON representation of the signing output.
  ///
  /// \param [json] JSON representation of a signing input
  /// \param [key] The private key to sign with.
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return The JSON representation of a `SigningOutput` proto object.
  static String signJSON({
    required String json,
    required TWData key,
    required int coin,
  }) {
    TWString twJson = TWString(json);
    String res = TWString.fromPointer(
            iTWBindings.TWAnySignerSignJSON(twJson.pointer, key.pointer, coin))
        .toString();
    twJson.delete();
    return res;
  }

  /// Check if AnySigner supports signing JSON representation of signing input.
  ///
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return true if AnySigner supports signing JSON representation of signing input for a given coin.
  static bool supportsJSON(int coin) =>
      iTWBindings.TWAnySignerSupportsJSON(coin);

  /// Plans a transaction (for UTXO chains only).
  ///
  /// \param [input] The serialized data of a signing input
  /// \param [coin] The given coin type to plan the transaction for.
  /// \return The serialized data of a `TransactionPlan` proto object.
  static TWData plan({
    required TWData input,
    required int coin,
  }) =>
      TWData.fromPointer(iTWBindings.TWAnySignerPlan(input.pointer, coin));
}
