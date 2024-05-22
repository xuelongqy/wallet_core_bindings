part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWBitcoinSigHashType].
class TWBitcoinSigHashTypeImpl extends TWBitcoinSigHashTypeInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBitcoinSigHashTypeImpl(this.bindings);

  @override
  bool isNone(int type) {
    return bindings.TWBitcoinSigHashTypeIsNone(type);
  }

  @override
  bool isSingle(int type) {
    return bindings.TWBitcoinSigHashTypeIsSingle(type);
  }
}