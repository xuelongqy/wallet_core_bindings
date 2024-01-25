part of '../wallet_core_bindings.dart';

/// Calculates the fee of any Bitcoin transaction.
class TWBitcoinFee {
  /// Calculates the fee of any Bitcoin transaction.
  ///
  /// \param [data] the signed transaction in its final form.
  /// \param [satVb] the satoshis per vbyte amount. The passed on string is interpreted as a unit64_t.
  /// \returns the fee denominated in satoshis or nullptr if the transaction failed to be decoded.
  static String calculateFee(Uint8List data, String satVb) =>
      TWString.fromPointer(iTWBindings.TWBitcoinFeeCalculateFee(
        TWData(data).pointer,
        TWString(satVb).pointer,
      )).toString();
}
