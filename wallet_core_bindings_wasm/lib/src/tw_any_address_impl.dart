part of '../wallet_core_bindings_wasm.dart';

/// Wasm interface for [TWAnyAddress].
class TWAnyAddressImpl extends TWAnyAddressInterface {
  final WasmInstance wasm;

  TWAnyAddressImpl(this.wasm);

  @override
  int coin(int pointer) {
    final func = wasm.getFunction('TWAnyAddressCoin')!;
    return func([pointer]).first as int;
  }

  @override
  int createBech32(int string, int coin, int hrp) {
    final func = wasm.getFunction('TWAnyAddressCreateBech32')!;
    return func([string, coin, hrp]).first as int;
  }

  @override
  int createBech32WithPublicKey(int publicKey, int coin, int hrp) {
    final func = wasm.getFunction('TWAnyAddressCreateBech32WithPublicKey')!;
    return func([publicKey, coin, hrp]).first as int;
  }

  @override
  int createSS58(int string, int coin, int ss58Prefix) {
    final func = wasm.getFunction('TWAnyAddressCreateSS58')!;
    return func([string, coin, ss58Prefix]).first as int;
  }

  @override
  int createSS58WithPublicKey(int publicKey, int coin, int ss58Prefix) {
    final func = wasm.getFunction('TWAnyAddressCreateSS58WithPublicKey')!;
    return func([publicKey, coin, ss58Prefix]).first as int;
  }

  @override
  int createWithPublicKey(int publicKey, int coin) {
    final func = wasm.getFunction('TWAnyAddressCreateWithPublicKey')!;
    return func([publicKey, coin]).first as int;
  }

  @override
  int createWithPublicKeyDerivation(int publicKey, int coin, int derivation) {
    final func = wasm.getFunction('TWAnyAddressCreateWithPublicKeyDerivation')!;
    return func([publicKey, coin, derivation]).first as int;
  }

  @override
  int createWithPublicKeyFilecoinAddressType(
      int publicKey, int filecoinAddressType) {
    final func =
        wasm.getFunction('TWAnyAddressCreateWithPublicKeyFilecoinAddressType')!;
    return func([publicKey, filecoinAddressType]).first as int;
  }

  @override
  int createWithPublicKeyFiroAddressType(int publicKey, int firoAddressType) {
    final func =
        wasm.getFunction('TWAnyAddressCreateWithPublicKeyFiroAddressType')!;
    return func([publicKey, firoAddressType]).first as int;
  }

  @override
  int createWithString(int string, int coin) {
    final func = wasm.getFunction('TWAnyAddressCreateWithString')!;
    return func([string, coin]).first as int;
  }

  @override
  int data(int pointer) {
    final func = wasm.getFunction('TWAnyAddressData')!;
    return func([pointer]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWAnyAddressDelete')!;
    func([pointer]);
  }

  @override
  int description(int pointer) {
    final func = wasm.getFunction('TWAnyAddressDescription')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWAnyAddressEqual')!;
    return func([lhs, rhs]).first as int == 1;
  }

  @override
  bool isValid(int string, int coin) {
    final func = wasm.getFunction('TWAnyAddressIsValid')!;
    return func([string, coin]).first as int == 1;
  }

  @override
  bool isValidBech32(int string, int coin, int hrp) {
    final func = wasm.getFunction('TWAnyAddressIsValidBech32')!;
    return func([string, coin, hrp]).first as int == 1;
  }

  @override
  bool isValidSS58(int string, int coin, int ss58Prefix) {
    final func = wasm.getFunction('TWAnyAddressIsValidSS58')!;
    return func([string, coin, ss58Prefix]).first as int == 1;
  }
}
