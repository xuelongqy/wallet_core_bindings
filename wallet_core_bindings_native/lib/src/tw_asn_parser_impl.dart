part of '../wallet_core_bindings_native.dart';

/// Native interface for [TWAsnParser].
class TWASNParserImpl extends TWAsnParserInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWASNParserImpl(this.bindings);

  @override
  int ecdsaSignatureFromDer(int encoded) {
    return bindings.TWAsnParserEcdsaSignatureFromDer(
      Pointer.fromAddress(encoded),
    ).address;
  }
}
