part of '../wallet_core_bindings.dart';

/// THORChain swap functions
class TWTHORChainSwap {
  /// Builds a THORChainSwap transaction input.
  ///
  /// \param input The serialized data of SwapInput.
  /// \return The serialized data of SwapOutput.
  Uint8List buildSwap(Uint8List input) => TWData.fromPointer(
          iTWBindings.TWTHORChainSwapBuildSwap(TWData(input).pointer))
      .bytes()!;
}
