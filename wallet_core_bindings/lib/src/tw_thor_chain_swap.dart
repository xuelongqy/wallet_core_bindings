part of '../wallet_core_bindings.dart';

/// THORChain swap functions
class TWTHORChainSwap {
  TWTHORChainSwap._();

  /// Builds a THORChainSwap transaction input.
  ///
  /// \param input The serialized data of SwapInput.
  /// \return The serialized data of SwapOutput.
  static Uint8List buildSwap(Uint8List input) =>
      TWData.fromPointer(_thorChainSwapImpl.buildSwap(TWData(input).pointer))
          .bytes()!;
}
