part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWCoinType].
class TWCoinTypeImpl extends TWCoinTypeInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWCoinTypeImpl(this.bindings);

  @override
  int blockchain(int coin) {
    return bindings.TWCoinTypeBlockchain(coin);
  }

  @override
  int chainId(int coin) {
    return bindings.TWCoinTypeChainId(coin).address;
  }

  @override
  int curve(int coin) {
    return bindings.TWCoinTypeCurve(coin);
  }

  @override
  int derivationPath(int coin) {
    return bindings.TWCoinTypeDerivationPath(coin).address;
  }

  @override
  int derivationPathWithDerivation(int coin, int derivation) {
    return bindings.TWCoinTypeDerivationPathWithDerivation(coin, derivation)
        .address;
  }

  @override
  int deriveAddress(int coin, int privateKey) {
    return bindings.TWCoinTypeDeriveAddress(
            coin, Pointer.fromAddress(privateKey))
        .address;
  }

  @override
  int deriveAddressFromPublicKey(int coin, int publicKey) {
    return bindings.TWCoinTypeDeriveAddressFromPublicKey(
            coin, Pointer.fromAddress(publicKey))
        .address;
  }

  @override
  int deriveAddressFromPublicKeyAndDerivation(
      int coin, int publicKey, int derivationPath) {
    return bindings.TWCoinTypeDeriveAddressFromPublicKeyAndDerivation(
      coin,
      Pointer.fromAddress(publicKey),
      derivationPath,
    ).address;
  }

  @override
  int hrp(int coin) {
    return bindings.TWCoinTypeHRP(coin);
  }

  @override
  int p2pkhPrefix(int coin) {
    return bindings.TWCoinTypeP2pkhPrefix(coin);
  }

  @override
  int p2shPrefix(int coin) {
    return bindings.TWCoinTypeP2shPrefix(coin);
  }

  @override
  int publicKeyType(int coin) {
    return bindings.TWCoinTypePublicKeyType(coin);
  }

  @override
  int purpose(int coin) {
    return bindings.TWCoinTypePurpose(coin);
  }

  @override
  int slip44Id(int coin) {
    return bindings.TWCoinTypeSlip44Id(coin);
  }

  @override
  int ss58Prefix(int coin) {
    return bindings.TWCoinTypeSS58Prefix(coin);
  }

  @override
  int staticPrefix(int coin) {
    return bindings.TWCoinTypeStaticPrefix(coin);
  }

  @override
  bool validate(int coin, int address) {
    return bindings.TWCoinTypeValidate(coin, Pointer.fromAddress(address));
  }

  @override
  int xprvVersion(int coin) {
    return bindings.TWCoinTypeXprvVersion(coin);
  }

  @override
  int xpubVersion(int coin) {
    return bindings.TWCoinTypeXpubVersion(coin);
  }
}
