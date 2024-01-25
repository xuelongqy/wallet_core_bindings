part of '../wallet_core_bindings.dart';

/// TWDataVector finalizer.
final _twDataVectorFinalizer = Finalizer<Pointer<bindings.TWDataVector>>(
    (Pointer<bindings.TWDataVector> token) {
  iTWBindings.TWDataVectorDelete(token);
});

/// A vector of TWData byte arrays
class TWDataVector extends TWObjectFinalizable<bindings.TWDataVector> {
  TWDataVector.fromPointer(
    Pointer<bindings.TWDataVector> pointer, {
    bool attach = true,
  }) : super(pointer, attach: attach, finalizer: _twDataVectorFinalizer);

  /// Creates a Vector of Data.
  TWDataVector({
    bool attach = true,
  }) : super(
          iTWBindings.TWDataVectorCreate(),
          attach: attach,
          finalizer: _twDataVectorFinalizer,
        );

  /// Creates a Vector of Data with the given element
  ///
  /// \param [data] A non-null valid block of data
  TWDataVector.createWithData(
    Uint8List data, {
    bool attach = true,
  }) : super(
          iTWBindings.TWDataVectorCreateWithData(TWData(data).pointer),
          attach: attach,
          finalizer: _twDataVectorFinalizer,
        );

  /// Delete/Deallocate a Vector of Data
  @override
  void delete() {
    super.delete();
    iTWBindings.TWDataVectorDelete(_pointer);
  }

  /// Add an element to a Vector of Data. Element is cloned
  ///
  /// \param [data] A non-null valid block of data
  void add(Uint8List data) =>
      iTWBindings.TWDataVectorAdd(_pointer, TWData(data).pointer);

  /// Retrieve the number of elements
  int get size => iTWBindings.TWDataVectorSize(_pointer);

  /// Retrieve the n-th element.
  ///
  /// \param [index] index element of the vector to be retrieved, need to be < TWDataVectorSize
  /// \return A non-null block of data
  Uint8List get(int index) =>
      TWData.fromPointer(iTWBindings.TWDataVectorGet(_pointer, index)).bytes()!;
}
