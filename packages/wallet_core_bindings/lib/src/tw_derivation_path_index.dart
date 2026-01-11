part of '../wallet_core_bindings.dart';

/// TWDerivationPathIndex finalizer.
final _twDerivationPathIndexFinalizer = Finalizer<int>((int token) {
  _derivationPathIndexImpl.delete(token);
});

/// Represents a derivation path index in C++ with value and hardened flag.
class TWDerivationPathIndex extends TWObjectFinalizable {
  TWDerivationPathIndex.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
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
          _derivationPathIndexImpl.create(value, hardened),
          attach: attach,
          finalizer: _twDerivationPathIndexFinalizer,
        );

  /// Deletes an Index.
  @override
  void delete() {
    super.delete();
    _derivationPathIndexImpl.delete(_pointer);
  }

  /// Returns numeric value of an Index.
  int get value => _derivationPathIndexImpl.value(_pointer);

  /// Returns numeric value of an Index.
  bool get hardened => _derivationPathIndexImpl.hardened(_pointer);

  /// Returns the string description of a derivation path index.
  String get description =>
      TWString.fromPointer(_derivationPathIndexImpl.description(_pointer))
          .value!;
}
