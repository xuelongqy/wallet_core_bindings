part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWCoinType].
class TWCoinTypeImpl extends TWCoinTypeInterface {
  final WasmInstance wasm;

  TWCoinTypeImpl(this.wasm);

  @override
  int blockchain(int coin) {
    final func = wasm.getFunction('TWCoinTypeBlockchain')!;
    return func([coin]).first as int;
  }

  @override
  int chainId(int coin) {
    final func = wasm.getFunction('TWCoinTypeChainId')!;
    return func([coin]).first as int;
  }

  @override
  int curve(int coin) {
    final func = wasm.getFunction('TWCoinTypeCurve')!;
    return func([coin]).first as int;
  }

  @override
  int derivationPath(int coin) {
    final func = wasm.getFunction('TWCoinTypeDerivationPath')!;
    return func([coin]).first as int;
  }

  @override
  int derivationPathWithDerivation(int coin, int derivation) {
    final func = wasm.getFunction('TWCoinTypeDerivationPathWithDerivation')!;
    return func([coin, derivation]).first as int;
  }

  @override
  int deriveAddress(int coin, int privateKey) {
    final func = wasm.getFunction('TWCoinTypeDeriveAddress')!;
    return func([coin, privateKey]).first as int;
  }

  @override
  int deriveAddressFromPublicKey(int coin, int publicKey) {
    final func = wasm.getFunction('TWCoinTypeDeriveAddressFromPublicKey')!;
    return func([coin, publicKey]).first as int;
  }

  @override
  int deriveAddressFromPublicKeyAndDerivation(
      int coin, int publicKey, int derivationPath) {
    final func =
        wasm.getFunction('TWCoinTypeDeriveAddressFromPublicKeyAndDerivation')!;
    return func([coin, publicKey, derivationPath]).first as int;
  }

  @override
  int hrp(int coin) {
    final func = wasm.getFunction('TWCoinTypeHRP')!;
    return func([coin]).first as int;
  }

  @override
  int p2pkhPrefix(int coin) {
    final func = wasm.getFunction('TWCoinTypeP2pkhPrefix')!;
    return func([coin]).first as int;
  }

  @override
  int p2shPrefix(int coin) {
    final func = wasm.getFunction('TWCoinTypeP2shPrefix')!;
    return func([coin]).first as int;
  }

  @override
  int publicKeyType(int coin) {
    final func = wasm.getFunction('TWCoinTypePublicKeyType')!;
    return func([coin]).first as int;
  }

  @override
  int purpose(int coin) {
    final func = wasm.getFunction('TWCoinTypePurpose')!;
    return func([coin]).first as int;
  }

  @override
  int slip44Id(int coin) {
    final func = wasm.getFunction('TWCoinTypeSlip44Id')!;
    return func([coin]).first as int;
  }

  @override
  int ss58Prefix(int coin) {
    final func = wasm.getFunction('TWCoinTypeSS58Prefix')!;
    return func([coin]).first as int;
  }

  @override
  int staticPrefix(int coin) {
    final func = wasm.getFunction('TWCoinTypeStaticPrefix')!;
    return func([coin]).first as int;
  }

  @override
  bool validate(int coin, int address) {
    final func = wasm.getFunction('TWCoinTypeValidate')!;
    return func([coin, address]).first as int == 1;
  }

  @override
  int xprvVersion(int coin) {
    final func = wasm.getFunction('TWCoinTypeXprvVersion')!;
    return func([coin]).first as int;
  }

  @override
  int xpubVersion(int coin) {
    final func = wasm.getFunction('TWCoinTypeXpubVersion')!;
    return func([coin]).first as int;
  }
}
