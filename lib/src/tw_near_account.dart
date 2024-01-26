part of '../wallet_core_bindings.dart';

/// TWNEARAccount finalizer.
final _twNEARAccountFinalizer = Finalizer<Pointer<bindings.TWNEARAccount>>(
    (Pointer<bindings.TWNEARAccount> token) {
  iTWBindings.TWNEARAccountDelete(token);
});

/// Represents a NEAR Account name
class TWNEARAccount extends TWObjectFinalizable<bindings.TWNEARAccount> {
  TWNEARAccount.fromPointer(
    Pointer<bindings.TWNEARAccount> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twNEARAccountFinalizer,
        );

  /// Create a NEAR Account
  ///
  /// \param [string] Account name
  TWNEARAccount(
    String string, {
    bool attach = true,
  }) : super(
          iTWBindings.TWNEARAccountCreateWithString(TWString(string).pointer),
          attach: attach,
          finalizer: _twNEARAccountFinalizer,
        );

  /// Delete the given Near Account
  @override
  void delete() {
    super.delete();
    iTWBindings.TWNEARAccountDelete(_pointer);
  }

  /// Returns the user friendly string representation.
  String get description => TWString.fromPointer(
        iTWBindings.TWNEARAccountDescription(_pointer),
      ).value!;
}
