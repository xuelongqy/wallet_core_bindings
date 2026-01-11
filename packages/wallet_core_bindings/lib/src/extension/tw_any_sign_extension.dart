part of '../../wallet_core_bindings.dart';

/// Any sign extension.
extension TWAnySignExtension on GeneratedMessage {
  /// Any sign.
  /// \param [coin] The given coin type to sign the transaction for.
  /// \return The serialized data of a `SigningOutput` proto object. (e.g. TW.Bitcoin.Proto.SigningOutput).
  Uint8List anySign(TWCoinType coin) {
    return TWAnySigner.sign(writeToBuffer(), coin);
  }

  /// Any sign to output.
  /// \param [coin] coin type.
  /// \param [output] Empty `SigningOutput` proto object. (e.g. TW.Bitcoin.Proto.SigningOutput).
  /// \return [output] after serialization data is filled.
  T anySignToOutput<T extends GeneratedMessage>(TWCoinType coin, T output) {
    output.mergeFromBuffer(anySign(coin));
    return output;
  }

  /// Any plan.
  /// \param [coin] coin type.
  /// \return The serialized data of a `TransactionPlan` proto object.
  Uint8List anyPlan(TWCoinType coin) {
    return TWAnySigner.plan(writeToBuffer(), coin);
  }

  /// Any plan to output.
  /// \param [coin] coin type.
  /// \param [output] Empty `TransactionPlan` proto object.
  /// \return [output] after serialization data is filled.
  T anyPlanToOutput<T extends GeneratedMessage>(TWCoinType coin, T output) {
    output.mergeFromBuffer(anyPlan(coin));
    return output;
  }
}
