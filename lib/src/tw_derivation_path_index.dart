part of '../wallet_core_bindings.dart';

/// TWDerivationPathIndex finalizer.
final _twDerivationPathIndexFinalizer =
    Finalizer<Pointer<bindings.TWDerivationPathIndex>>(
        (Pointer<bindings.TWDerivationPathIndex> token) {
  iTWBindings.TWDerivationPathIndexDelete(token);
});

/// Represents a derivation path index in C++ with value and hardened flag.
class TWDerivationPathIndex
    extends TWObjectFinalizable<bindings.TWDerivationPathIndex> {
  TWDerivationPathIndex.fromPointer(
    Pointer<bindings.TWDerivationPathIndex> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twDerivationPathIndexFinalizer,
        );

  /// Creates a new Index with a value and hardened flag.
  /// Must be deleted with TWDerivationPathIndexDelete after use.
  ///
  /// \param [value] Index value
  /// \param [hardened] Indicates if the Index is hardened.
  TWDerivationPathIndex(
    int value,
    bool hardened, {
    bool attach = true,
  }) : super(
          iTWBindings.TWDerivationPathIndexCreate(value, hardened),
          attach: attach,
          finalizer: _twDerivationPathIndexFinalizer,
        );

  /// Deletes an Index.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWDerivationPathIndexDelete(_pointer);
  }

  /// Returns numeric value of an Index.
  int get value => iTWBindings.TWDerivationPathIndexValue(_pointer);

  /// Returns numeric value of an Index.
  bool get hardened => iTWBindings.TWDerivationPathIndexHardened(_pointer);

  /// Returns the string description of a derivation path index.
  String get description => TWString.fromPointer(
          iTWBindings.TWDerivationPathIndexDescription(_pointer))
      .toString();
}
