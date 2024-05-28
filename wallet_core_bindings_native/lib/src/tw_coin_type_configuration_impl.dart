part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWCoinTypeConfiguration].
class TWCoinTypeConfigurationImpl extends TWCoinTypeConfigurationInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWCoinTypeConfigurationImpl(this.bindings);

  @override
  int getAccountURL(int coin, int accountID) {
    return bindings.TWCoinTypeConfigurationGetAccountURL(
      coin,
      Pointer.fromAddress(accountID),
    ).address;
  }

  @override
  int getDecimals(int coin) {
    return bindings.TWCoinTypeConfigurationGetDecimals(
      coin,
    );
  }

  @override
  int getID(int coin) {
    return bindings.TWCoinTypeConfigurationGetID(
      coin,
    ).address;
  }

  @override
  int getName(int coin) {
    return bindings.TWCoinTypeConfigurationGetName(
      coin,
    ).address;
  }

  @override
  int getSymbol(int coin) {
    return bindings.TWCoinTypeConfigurationGetSymbol(
      coin,
    ).address;
  }

  @override
  int getTransactionURL(int coin, int transactionID) {
    return bindings.TWCoinTypeConfigurationGetTransactionURL(
      coin,
      Pointer.fromAddress(transactionID),
    ).address;
  }
}
