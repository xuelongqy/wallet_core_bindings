part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWSolanaAddress].
class TWSolanaAddressImpl extends TWSolanaAddressInterface {
  final WasmInstance wasm;

  TWSolanaAddressImpl(this.wasm);

  @override
  int createWithString(int string) {
    final func = wasm.getFunction('TWSolanaAddressCreateWithString')!;
    return func([string]).first as int;
  }

  @override
  int defaultTokenAddress(int pointer, int tokenMintAddress) {
    final func = wasm.getFunction('TWSolanaAddressDefaultTokenAddress')!;
    return func([pointer, tokenMintAddress]).first as int;
  }

  @override
  int token2022Address(int pointer, int tokenMintAddress) {
    final func = wasm.getFunction('TWSolanaAddressToken2022Address')!;
    return func([pointer, tokenMintAddress]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWSolanaAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWSolanaAddressDescription')!;
    return func([pointer]).first as int;
  }
}
