part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWBitcoinFee].
class TWBitcoinFeeImpl extends TWBitcoinFeeInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBitcoinFeeImpl(this.bindings);

  @override
  int calculateFee(int data, int satVb) {
    return bindings.TWBitcoinFeeCalculateFee(
      Pointer.fromAddress(data),
      Pointer.fromAddress(satVb),
    ).address;
  }
}
