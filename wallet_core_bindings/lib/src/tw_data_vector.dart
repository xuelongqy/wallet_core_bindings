part of '../wallet_core_bindings.dart';

/// TWDataVector finalizer.
final _twDataVectorFinalizer = Finalizer<int>((int token) {
  _dataVectorImpl.delete(token);
});

/// A vector of TWData byte arrays
class TWDataVector extends TWObjectFinalizable {
  TWDataVector.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twDataVectorFinalizer,
        );

  /// Creates a Vector of Data.
  TWDataVector({
    bool attach = true,
  }) : super(
          _dataVectorImpl.create(),
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
          _dataVectorImpl.createWithData(TWData(data).pointer),
          attach: attach,
          finalizer: _twDataVectorFinalizer,
        );

  /// Creates a Vector of Data with the given list of elements
  ///
  /// \param [dataList] A non-null list of valid blocks of data
  TWDataVector.createWithDataList(
    List<Uint8List> dataList, {
    bool attach = true,
  }) : super(
          _dataVectorImpl.create(),
          attach: attach,
          finalizer: _twDataVectorFinalizer,
        ) {
    for (var data in dataList) {
      add(data);
    }
  }

  /// Delete/Deallocate a Vector of Data
  @override
  void delete() {
    super.delete();
    _dataVectorImpl.delete(_pointer);
  }

  /// Add an element to a Vector of Data. Element is cloned
  ///
  /// \param [data] A non-null valid block of data
  void add(Uint8List data) =>
      _dataVectorImpl.add(_pointer, TWData(data).pointer);

  /// Retrieve the number of elements
  int get size => _dataVectorImpl.size(_pointer);

  /// Retrieve the n-th element.
  ///
  /// \param [index] index element of the vector to be retrieved, need to be < TWDataVectorSize
  /// \return A non-null block of data
  Uint8List? get(int index) =>
      TWData.fromPointer(_dataVectorImpl.get(_pointer, index)).bytes();
}
