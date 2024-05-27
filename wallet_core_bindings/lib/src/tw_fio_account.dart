part of '../wallet_core_bindings.dart';

/// TWFIOAccount finalizer.
final _twFIOAccountFinalizer = Finalizer<int>((int token) {
  _fioAccountImpl.delete(token);
});

/// Represents a FIO Account name
class TWFIOAccount extends TWObjectFinalizable {
  TWFIOAccount.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twFIOAccountFinalizer,
        );

  /// Create a FIO Account
  ///
  /// \param [string] Account name
  TWFIOAccount(
    String string, {
    bool attach = true,
  }) : super(
          _fioAccountImpl.createWithString(
            TWString(string).pointer,
          ),
          attach: attach,
          finalizer: _twFIOAccountFinalizer,
        );

  /// Delete a FIO Account
  @override
  void delete() {
    super.delete();
    _fioAccountImpl.delete(_pointer);
  }

  /// Returns the short account string representation.
  ///
  /// \return Account non-null string representation
  String get description => TWString.fromPointer(
        _fioAccountImpl.description(_pointer),
      ).value!;
}
