part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWCoinTypeConfiguration].
class TWCoinTypeConfigurationImpl extends TWCoinTypeConfigurationInterface {
  final WasmInstance wasm;

  TWCoinTypeConfigurationImpl(this.wasm);

  @override
  int getAccountURL(int coin, int accountID) {
    final func = wasm.getFunction('TWCoinTypeConfigurationGetAccountURL')!;
    return func([coin, accountID]).first as int;
  }

  @override
  int getDecimals(int coin) {
    final func = wasm.getFunction('TWCoinTypeConfigurationGetDecimals')!;
    return func([coin]).first as int;
  }

  @override
  int getID(int coin) {
    final func = wasm.getFunction('TWCoinTypeConfigurationGetID')!;
    return func([coin]).first as int;
  }

  @override
  int getName(int coin) {
    final func = wasm.getFunction('TWCoinTypeConfigurationGetName')!;
    return func([coin]).first as int;
  }

  @override
  int getSymbol(int coin) {
    final func = wasm.getFunction('TWCoinTypeConfigurationGetSymbol')!;
    return func([coin]).first as int;
  }

  @override
  int getTransactionURL(int coin, int transactionID) {
    final func = wasm.getFunction('TWCoinTypeConfigurationGetTransactionURL')!;
    return func([coin, transactionID]).first as int;
  }
}
