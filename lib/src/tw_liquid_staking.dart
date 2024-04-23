part of '../wallet_core_bindings.dart';

/// THORChain swap functions
class TWLiquidStaking {
  TWLiquidStaking._();

  /// Builds a LiquidStaking transaction input.
  ///
  /// \param [input] The serialized data of LiquidStakingInput.
  /// \return The serialized data of LiquidStakingOutput.
  static Uint8List buildRequest(Uint8List input) => TWData.fromPointer(
        iTWBindings.TWLiquidStakingBuildRequest(
          TWData(input).pointer,
        ),
      ).bytes()!;
}
