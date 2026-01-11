part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWFilecoinAddressConverter].
class TWFilecoinAddressConverterImpl
    extends TWFilecoinAddressConverterInterface {
  final WasmInstance wasm;

  TWFilecoinAddressConverterImpl(this.wasm);

  @override
  int convertFromEthereum(int filecoinAddress) {
    final func =
        wasm.getFunction('TWFilecoinAddressConverterConvertFromEthereum')!;
    return func([filecoinAddress]).first as int;
  }

  @override
  int convertToEthereum(int filecoinAddress) {
    final func =
        wasm.getFunction('TWFilecoinAddressConverterConvertToEthereum')!;
    return func([filecoinAddress]).first as int;
  }
}
