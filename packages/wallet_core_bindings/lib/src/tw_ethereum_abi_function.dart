part of '../wallet_core_bindings.dart';

/// TWEthereumAbiFunction finalizer.
final _twEthereumAbiFunctionFinalizer = Finalizer<int>((int token) {
  _ethereumAbiFunctionImpl.delete(token);
});

/// Represents Ethereum ABI function
class TWEthereumAbiFunction extends TWObjectFinalizable {
  TWEthereumAbiFunction.fromPointer(
    super.pointer, {
    super.attach = true,
  }) : super(
          finalizer: _twEthereumAbiFunctionFinalizer,
        );

  /// Creates a function object, with the given name and empty parameter list.  It must be deleted at the end.
  ///
  /// \param [name] function name
  TWEthereumAbiFunction(
    String name, {
    bool attach = true,
  }) : super(
          _ethereumAbiFunctionImpl.createWithString(
            TWString(name).pointer,
          ),
          attach: attach,
          finalizer: _twEthereumAbiFunctionFinalizer,
        );

  /// Deletes a function object created with a 'TWEthereumAbiFunctionCreateWithString' method.
  @override
  void delete() {
    super.delete();
    _ethereumAbiFunctionImpl.delete(_pointer);
  }

  /// Return the function type signature, of the form "baz(int32,uint256)"
  String getType() => TWString.fromPointer(
        _ethereumAbiFunctionImpl.getType(_pointer),
      ).value!;

  /// Methods for adding parameters of the given type (input or output).
  /// For output parameters (isOutput=true) a value has to be specified, although usually not need;

  /// Add a uint8 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUInt8(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamUInt8(
        _pointer,
        val,
        isOutput,
      );

  /// Add a uint16 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUInt16(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamUInt16(
        _pointer,
        val,
        isOutput,
      );

  /// Add a uint32 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUInt32(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamUInt32(
        _pointer,
        val,
        isOutput,
      );

  /// Add a uint64 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUInt64(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamUInt64(
        _pointer,
        val,
        isOutput,
      );

  /// Add a uint256 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUInt256(Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamUInt256(
        _pointer,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a uint(bits) type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUIntN(int bits, Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamUIntN(
        _pointer,
        bits,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a int8 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamInt8(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamInt8(
        _pointer,
        val,
        isOutput,
      );

  /// Add a int16 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamInt16(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamInt16(
        _pointer,
        val,
        isOutput,
      );

  /// Add a int32 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamInt32(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamInt32(
        _pointer,
        val,
        isOutput,
      );

  /// Add a int64 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamInt64(int val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamInt64(
        _pointer,
        val,
        isOutput,
      );

  /// Add a int256 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified (stored in a block of data)
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamInt256(Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamInt256(
        _pointer,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a int(bits) type parameter
  ///
  /// \param [bits] Number of bits of the integer parameter
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamIntN(int bits, Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamIntN(
        _pointer,
        bits,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a bool type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamBool(bool val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamBool(
        _pointer,
        val,
        isOutput,
      );

  /// Add a string type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamString(String val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamString(
        _pointer,
        TWString(val).pointer,
        isOutput,
      );

  /// Add an address type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamAddress(Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamAddress(
        _pointer,
        TWData(val).pointer,
        isOutput,
      );

  /// Add an address type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamAddressHex(String val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamAddress(
        _pointer,
        TWData.createWithHexString(val).pointer,
        isOutput,
      );

  /// Add a bytes type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamBytes(Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamBytes(
        _pointer,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a bytes[N] type parameter
  ///
  /// \param [size] fixed size of the bytes array parameter (val).
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamBytesFix(int size, Uint8List val, bool isOutput) =>
      _ethereumAbiFunctionImpl.addParamBytesFix(
        _pointer,
        size,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a type[] type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamArray(bool isOutput) => _ethereumAbiFunctionImpl.addParamArray(
        _pointer,
        isOutput,
      );

  /// Methods for accessing the value of an output or input parameter, of different types.

  /// Get a uint8 type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  int getParamUInt8(int idx, bool isOutput) =>
      _ethereumAbiFunctionImpl.getParamUInt8(_pointer, idx, isOutput);

  /// Get a uint64 type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  int getParamUInt64(int idx, bool isOutput) =>
      _ethereumAbiFunctionImpl.getParamUInt64(_pointer, idx, isOutput);

  /// Get a uint256 type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter stored in a block of data.
  Uint8List getParamUInt256(int idx, bool isOutput) => TWData.fromPointer(
          _ethereumAbiFunctionImpl.getParamUInt256(_pointer, idx, isOutput))
      .bytes()!;

  /// Get a bool type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  bool getParamBool(int idx, bool isOutput) =>
      _ethereumAbiFunctionImpl.getParamBool(_pointer, idx, isOutput);

  /// Get a string type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  String getParamString(int idx, bool isOutput) => TWString.fromPointer(
          _ethereumAbiFunctionImpl.getParamString(_pointer, idx, isOutput))
      .value!;

  /// Get an address type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  Uint8List getParamAddress(int idx, bool isOutput) => TWData.fromPointer(
          _ethereumAbiFunctionImpl.getParamAddress(_pointer, idx, isOutput))
      .bytes()!;

  /// Adding a uint8 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt8(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamUInt8(_pointer, arrayIdx, val);

  /// Adding a uint16 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt16(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamUInt16(_pointer, arrayIdx, val);

  /// Adding a uint32 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt32(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamUInt32(_pointer, arrayIdx, val);

  /// Adding a uint64 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt64(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamUInt64(_pointer, arrayIdx, val);

  /// Adding a uint256 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt256(int arrayIdx, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamUInt256(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a uint[N] type parameter of to the top-level input parameter array
  ///
  /// \param [bits] Number of bits of the integer parameter
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUIntN(int arrayIdx, int bits, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamUIntN(
          _pointer, arrayIdx, bits, TWData(val).pointer);

  /// Adding a int8 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt8(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamInt8(_pointer, arrayIdx, val);

  /// Adding a int16 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt16(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamInt16(_pointer, arrayIdx, val);

  /// Adding a int32 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt32(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamInt32(_pointer, arrayIdx, val);

  /// Adding a int64 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt64(int arrayIdx, int val) =>
      _ethereumAbiFunctionImpl.addInArrayParamInt64(_pointer, arrayIdx, val);

  /// Adding a int256 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt256(int arrayIdx, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamInt256(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a int[N] type parameter of to the top-level input parameter array
  ///
  /// \param [bits] Number of bits of the integer parameter
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamIntN(int arrayIdx, int bits, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamIntN(
          _pointer, arrayIdx, bits, TWData(val).pointer);

  /// Adding a bool type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamBool(int arrayIdx, bool val) =>
      _ethereumAbiFunctionImpl.addInArrayParamBool(_pointer, arrayIdx, val);

  /// Adding a string type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamString(int arrayIdx, String val) =>
      _ethereumAbiFunctionImpl.addInArrayParamString(
          _pointer, arrayIdx, TWString(val).pointer);

  /// Adding an address type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamAddress(int arrayIdx, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamAddress(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a bytes type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamBytes(int arrayIdx, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamBytes(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a int64 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [size] fixed size of the bytes array parameter (val).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamBytesFix(int arrayIdx, int size, Uint8List val) =>
      _ethereumAbiFunctionImpl.addInArrayParamBytesFix(
          _pointer, arrayIdx, size, TWData(val).pointer);

  /// Encode function to Eth ABI binary
  ///
  /// \return Non-null encoded block of data
  Uint8List encode() => TWEthereumAbi.encode(this);
}
