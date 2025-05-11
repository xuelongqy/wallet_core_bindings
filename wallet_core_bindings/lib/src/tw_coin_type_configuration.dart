part of '../wallet_core_bindings.dart';

/// CoinTypeConfiguration functions
class TWCoinTypeConfiguration {
  TWCoinTypeConfiguration._();

  /// Returns stock symbol of coin
  ///
  /// \param [type] A coin type
  /// \return A non-null TWString stock symbol of coin
  /// \note Caller must free returned object
  static String getSymbol(TWCoinType type) =>
      TWString.fromPointer(_coinTypeConfigurationImpl.getSymbol(type.value))
          .value!;

  /// Returns max count decimal places for minimal coin unit
  ///
  /// \param [type] A coin type
  /// \return Returns max count decimal places for minimal coin unit
  static int getDecimals(TWCoinType type) =>
      _coinTypeConfigurationImpl.getDecimals(type.value);

  /// Returns transaction url in blockchain explorer
  ///
  /// \param [type] A coin type
  /// \param [transactionID] A transaction identifier
  /// \return Returns a non-null TWString transaction url in blockchain explorer
  static String getTransactionURL(TWCoinType type, String transactionID) =>
      TWString.fromPointer(_coinTypeConfigurationImpl.getTransactionURL(
        type.value,
        TWString(transactionID).pointer,
      )).value!;

  /// Returns account url in blockchain explorer
  ///
  /// \param [type] A coin type
  /// \param [accountID] an Account identifier
  /// \return Returns a non-null TWString account url in blockchain explorer
  static String getAccountURL(TWCoinType type, String accountID) =>
      TWString.fromPointer(_coinTypeConfigurationImpl.getAccountURL(
        type.value,
        TWString(accountID).pointer,
      )).value!;

  /// Returns full name of coin in lower case
  ///
  /// \param [type] A coin type
  /// \return Returns a non-null TWString, full name of coin in lower case
  static String getID(TWCoinType type) =>
      TWString.fromPointer(_coinTypeConfigurationImpl.getID(type.value)).value!;

  /// Returns full name of coin
  ///
  /// \param [type] A coin type
  /// \return Returns a non-null TWString, full name of coin
  static String getName(TWCoinType type) =>
      TWString.fromPointer(_coinTypeConfigurationImpl.getName(type.value))
          .value!;
}
