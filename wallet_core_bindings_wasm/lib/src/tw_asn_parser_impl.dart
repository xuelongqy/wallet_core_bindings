part of '../wallet_core_bindings_wasm.dart';

/// Native interface for [TWAsnParser].
class TWASNParserImpl extends TWAsnParserInterface {
  final WasmInstance wasm;

  TWASNParserImpl(this.wasm);

  @override
  int ecdsaSignatureFromDer(int encoded) {
    final func = wasm.getFunction('TWAsnParserEcdsaSignatureFromDer')!;
    return func([encoded]).first as int;
  }
}
