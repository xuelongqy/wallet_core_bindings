part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWTONAddressConverter].
class TWTONAddressConverterImpl extends TWTONAddressConverterInterface {
  final WasmInstance wasm;

  TWTONAddressConverterImpl(this.wasm);

  @override
  int fromBoc(int boc) {
    final func = wasm.getFunction('TWTONAddressConverterFromBoc')!;
    return func([boc]).first as int;
  }

  @override
  int toBoc(int address) {
    final func = wasm.getFunction('TWTONAddressConverterToBoc')!;
    return func([address]).first as int;
  }

  @override
  int toUserFriendly(int address, bool bounceable, bool testnet) {
    final func = wasm.getFunction('TWTONAddressConverterToUserFriendly')!;
    return func([address, bounceable ? 1 : 0, testnet ? 1 : 0]).first as int;
  }
}
