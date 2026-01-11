part of '../wallet_core_bindings.dart';

/// Non-core transaction utility methods, like building a transaction using an external signature.
class TWTransactionDecoder {
  TWTransactionDecoder._();

  /// Decodes a transaction from a binary representation.
  ///
  /// \param [coinType] coin type.
  /// \param [encodedTx] encoded transaction data.
  /// \return serialized protobuf message specific for the given coin.
  static Uint8List decode(TWCoinType coinType, Uint8List encodedTx) {
    return TWData.fromPointer(_transactionDecoderImpl.decode(
      coinType.value,
      TWData(encodedTx).pointer,
    )).bytes()!;
  }
}
