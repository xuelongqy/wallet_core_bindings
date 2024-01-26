part of '../wallet_core_bindings.dart';

class TWEthereumRlp {
  /// Encode an item or a list of items as Eth RLP binary format.
  ///
  /// \param [coin] EVM-compatible coin type.
  /// \param [input] Non-null serialized `EthereumRlp::Proto::EncodingInput`.
  /// \return serialized `EthereumRlp::Proto::EncodingOutput`.
  static Uint8List encode(int coin, Uint8List input) =>
      TWData.fromPointer(iTWBindings.TWEthereumRlpEncode(
        coin,
        TWData(input).pointer,
      )).bytes()!;
}
