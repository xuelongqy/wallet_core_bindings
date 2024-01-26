part of '../wallet_core_bindings.dart';

/// TWFIOAccount finalizer.
final _twFIOAccountFinalizer = Finalizer<Pointer<bindings.TWFIOAccount>>(
    (Pointer<bindings.TWFIOAccount> token) {
  iTWBindings.TWFIOAccountDelete(token);
});

class TWFIOAccount extends TWObjectFinalizable<bindings.TWFIOAccount> {
  TWFIOAccount.fromPointer(
    Pointer<bindings.TWFIOAccount> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twFIOAccountFinalizer,
        );

  /// Create a FIO Account
  ///
  /// \param [string] Account name
  /// \note Must be deleted with \TWFIOAccountDelete
  /// \return Pointer to a nullable FIO Account
  TWFIOAccount(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWFIOAccountCreateWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twFIOAccountFinalizer,
        );

  /// Delete a FIO Account
  @override
  void delete() {
    super.delete();
    iTWBindings.TWFIOAccountDelete(_pointer);
  }

  /// Returns the short account string representation.
  ///
  /// \return Account non-null string representation
  String get description => TWString.fromPointer(
        iTWBindings.TWFIOAccountDescription(_pointer),
      ).toString();
}
