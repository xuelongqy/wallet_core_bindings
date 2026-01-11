part of '../wallet_core_bindings.dart';

/// Object used to encapsulate native pointer.
abstract class TWObject {
  final int _pointer;

  int get pointer => _pointer;

  TWObject(this._pointer);
}

/// Object used to encapsulate native pointer
/// and release pointer during garbage collection.
abstract class TWObjectFinalizable extends TWObject implements Finalizable {
  /// Finalizer for pointer.
  /// When garbage collection occurs, release the memory of the pointer.
  final Finalizer<int> _finalizer;

  /// Whether the pointer is attached to the object.
  final bool attach;

  TWObjectFinalizable(
    int pointer, {
    required Finalizer<int> finalizer,
    required this.attach,
  })  : _finalizer = finalizer,
        super(pointer) {
    if (attach) {
      _finalizer.attach(this, pointer, detach: this);
    }
  }

  /// Detach and free memory early。
  /// Must call super.
  void delete() {
    if (attach) {
      _finalizer.detach(this);
    }
  }
}
