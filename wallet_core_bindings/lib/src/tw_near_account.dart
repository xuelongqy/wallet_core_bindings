part of '../wallet_core_bindings.dart';

/// TWNEARAccount finalizer.
final _twNEARAccountFinalizer = Finalizer<int>((int token) {
  _nearAccountImpl.delete(token);
});

/// Represents a NEAR Account name
class TWNEARAccount extends TWObjectFinalizable {
  TWNEARAccount.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twNEARAccountFinalizer,
        );

  /// Create a NEAR Account
  ///
  /// \param [string] Account name
  TWNEARAccount(
    String string, {
    bool attach = true,
  }) : super(
          _nearAccountImpl.createWithString(TWString(string).pointer),
          attach: attach,
          finalizer: _twNEARAccountFinalizer,
        );

  /// Delete the given Near Account
  @override
  void delete() {
    super.delete();
    _nearAccountImpl.delete(_pointer);
  }

  /// Returns the user friendly string representation.
  String get description => TWString.fromPointer(
        _nearAccountImpl.description(_pointer),
      ).value!;
}
