part of '../wallet_core_bindings.dart';

/// Cardano helper functions
class TWCardano {
  TWCardano._();

  /// Calculates the minimum ADA amount needed for a UTXO.
  ///
  /// \deprecated consider using `TWCardanoOutputMinAdaAmount` instead.
  /// \see reference https://docs.cardano.org/native-tokens/minimum-ada-value-requirement
  /// \param [tokenBundle] serialized data of TW.Cardano.Proto.TokenBundle.
  /// \return the minimum ADA amount.
  static int minAdaAmount(Uint8List tokenBundle) =>
      _cardanoImpl.minAdaAmount(TWData(tokenBundle).pointer);

  /// Calculates the minimum ADA amount needed for an output.
  ///
  /// \see reference https://docs.cardano.org/native-tokens/minimum-ada-value-requirement
  /// \param [toAddress] valid destination address, as string.
  /// \param [tokenBundle] serialized data of TW.Cardano.Proto.TokenBundle.
  /// \param [coinsPerUtxoByte] cost per one byte of a serialized UTXO (Base-10 decimal string).
  /// \return the minimum ADA amount (Base-10 decimal string).
  static String outputMinAdaAmount({
    required String toAddress,
    required Uint8List tokenBundle,
    required String coinsPerUtxoByte,
  }) =>
      TWString.fromPointer(_cardanoImpl.outputMinAdaAmount(
        TWString(toAddress).pointer,
        TWData(tokenBundle).pointer,
        TWString(coinsPerUtxoByte).pointer,
      )).value!;

  /// Return the staking address associated to (contained in) this address. Must be a Base address.
  /// Empty string is returned on error. Result must be freed.
  /// \param [baseAddress] A valid base address, as string.
  /// \return the associated staking (reward) address, as string, or empty string on error.
  static String getStakingAddress(String baseAddress) => TWString.fromPointer(
          _cardanoImpl.getStakingAddress(TWString(baseAddress).pointer))
      .value!;

  /// Return the legacy(byron) address.
  /// \param [publicKey] A valid public key with TWPublicKeyTypeED25519Cardano type.
  /// \return the legacy(byron) address, as string, or empty string on error.
  static String getByronAddress(TWPublicKey publicKey) =>
      TWString.fromPointer(_cardanoImpl.getByronAddress(publicKey.pointer))
          .value!;
}
