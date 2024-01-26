part of '../wallet_core_bindings.dart';

/// CoinTypeConfiguration functions
class TWCoinTypeConfiguration {
  /// Returns stock symbol of coin
  ///
  /// \param [type] A coin type
  /// \return A non-null TWString stock symbol of coin
  /// \note Caller must free returned object
  static String getSymbol(int type) =>
      TWString.fromPointer(iTWBindings.TWCoinTypeConfigurationGetSymbol(type))
          .value!;

  /// Returns max count decimal places for minimal coin unit
  ///
  /// \param [type] A coin type
  /// \return Returns max count decimal places for minimal coin unit
  static int getDecimals(int type) =>
      iTWBindings.TWCoinTypeConfigurationGetDecimals(type);

  /// Returns transaction url in blockchain explorer
  ///
  /// \param [type] A coin type
  /// \param [transactionID] A transaction identifier
  /// \return Returns a non-null TWString transaction url in blockchain explorer
  static String getTransactionURL(int type, String transactionID) =>
      TWString.fromPointer(iTWBindings.TWCoinTypeConfigurationGetTransactionURL(
        type,
        TWString(transactionID).pointer,
      )).value!;

  /// Returns account url in blockchain explorer
  ///
  /// \param [type] A coin type
  /// \param [accountID] an Account identifier
  /// \return Returns a non-null TWString account url in blockchain explorer
  static String getAccountURL(int type, String accountID) =>
      TWString.fromPointer(iTWBindings.TWCoinTypeConfigurationGetAccountURL(
        type,
        TWString(accountID).pointer,
      )).value!;

  /// Returns full name of coin in lower case
  ///
  /// \param [type] A coin type
  /// \return Returns a non-null TWString, full name of coin in lower case
  static String getID(int type) =>
      TWString.fromPointer(iTWBindings.TWCoinTypeConfigurationGetID(type))
          .value!;

  /// Returns full name of coin
  ///
  /// \param [type] A coin type
  /// \return Returns a non-null TWString, full name of coin
  static String getName(int type) =>
      TWString.fromPointer(iTWBindings.TWCoinTypeConfigurationGetName(type))
          .value!;
}
