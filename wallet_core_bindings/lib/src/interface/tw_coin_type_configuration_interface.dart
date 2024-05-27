part of '../../wallet_core_bindings.dart';

/// [TWCoinTypeConfiguration] interface.
abstract class TWCoinTypeConfigurationInterface {
  int getSymbol(int coin);
  int getDecimals(int coin);
  int getTransactionURL(int coin, int transactionID);
  int getAccountURL(int coin, int accountID);
  int getID(int coin);
  int getName(int coin);
}