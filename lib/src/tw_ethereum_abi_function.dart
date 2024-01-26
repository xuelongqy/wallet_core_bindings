part of '../wallet_core_bindings.dart';

/// TWEthereumAbiFunction finalizer.
final _twEthereumAbiFunctionFinalizer =
    Finalizer<Pointer<bindings.TWEthereumAbiFunction>>(
        (Pointer<bindings.TWEthereumAbiFunction> token) {
  iTWBindings.TWEthereumAbiFunctionDelete(token);
});

/// Represents Ethereum ABI function
class TWEthereumAbiFunction
    extends TWObjectFinalizable<bindings.TWEthereumAbiFunction> {
  TWEthereumAbiFunction.fromPointer(
    Pointer<bindings.TWEthereumAbiFunction> pointer, {
    bool attach = true,
  }) : super(
          pointer,
          attach: attach,
          finalizer: _twEthereumAbiFunctionFinalizer,
        );

  /// Creates a function object, with the given name and empty parameter list.  It must be deleted at the end.
  ///
  /// \param [name] function name
  TWEthereumAbiFunction(
    String name, {
    bool attach = true,
  }) : super(
          iTWBindings.TWEthereumAbiFunctionCreateWithString(
            TWString(name).pointer,
          ),
          attach: attach,
          finalizer: _twEthereumAbiFunctionFinalizer,
        );

  /// Deletes a function object created with a 'TWEthereumAbiFunctionCreateWithString' method.
  @override
  void delete() {
    super.delete();
    iTWBindings.TWEthereumAbiFunctionDelete(_pointer);
  }

  /// Return the function type signature, of the form "baz(int32,uint256)"
  String getType() => TWString.fromPointer(
        iTWBindings.TWEthereumAbiFunctionGetType(_pointer),
      ).toString();

  /// Methods for adding parameters of the given type (input or output).
  /// For output parameters (isOutput=true) a value has to be specified, although usually not need;

  /// Add a uint8 type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamUInt8(int val, bool isOutput) =>
      iTWBindings.TWEthereumAbiFunctionAddParamUInt8(
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
      iTWBindings.TWEthereumAbiFunctionAddParamUInt16(
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
      iTWBindings.TWEthereumAbiFunctionAddParamUInt32(
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
      iTWBindings.TWEthereumAbiFunctionAddParamUInt64(
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
      iTWBindings.TWEthereumAbiFunctionAddParamUInt256(
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
      iTWBindings.TWEthereumAbiFunctionAddParamUIntN(
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
      iTWBindings.TWEthereumAbiFunctionAddParamInt8(
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
      iTWBindings.TWEthereumAbiFunctionAddParamInt16(
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
      iTWBindings.TWEthereumAbiFunctionAddParamInt32(
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
      iTWBindings.TWEthereumAbiFunctionAddParamInt64(
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
      iTWBindings.TWEthereumAbiFunctionAddParamInt256(
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
      iTWBindings.TWEthereumAbiFunctionAddParamIntN(
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
      iTWBindings.TWEthereumAbiFunctionAddParamBool(
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
      iTWBindings.TWEthereumAbiFunctionAddParamString(
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
      iTWBindings.TWEthereumAbiFunctionAddParamAddress(
        _pointer,
        TWData(val).pointer,
        isOutput,
      );

  /// Add a bytes type parameter
  ///
  /// \param [val] for output parameters, value has to be specified
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the index of the parameter (0-based).
  int addParamBytes(Uint8List val, bool isOutput) =>
      iTWBindings.TWEthereumAbiFunctionAddParamBytes(
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
      iTWBindings.TWEthereumAbiFunctionAddParamBytesFix(
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
  int addParamArray(bool isOutput) =>
      iTWBindings.TWEthereumAbiFunctionAddParamArray(
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
      iTWBindings.TWEthereumAbiFunctionGetParamUInt8(_pointer, idx, isOutput);

  /// Get a uint64 type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  int getParamUInt64(int idx, bool isOutput) =>
      iTWBindings.TWEthereumAbiFunctionGetParamUInt64(_pointer, idx, isOutput);

  /// Get a uint256 type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter stored in a block of data.
  Uint8List getParamUInt256(int idx, bool isOutput) =>
      TWData.fromPointer(iTWBindings.TWEthereumAbiFunctionGetParamUInt256(
              _pointer, idx, isOutput))
          .bytes()!;

  /// Get a bool type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  bool getParamBool(int idx, bool isOutput) =>
      iTWBindings.TWEthereumAbiFunctionGetParamBool(_pointer, idx, isOutput);

  /// Get a string type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  String getParamString(int idx, bool isOutput) =>
      TWString.fromPointer(iTWBindings.TWEthereumAbiFunctionGetParamString(
              _pointer, idx, isOutput))
          .toString();

  /// Get an address type parameter at the given index
  ///
  /// \param [idx] index for the parameter (0-based).
  /// \param [isOutput] determines if the parameter is an input or output
  /// \return the value of the parameter.
  Uint8List getParamAddress(int idx, bool isOutput) =>
      TWData.fromPointer(iTWBindings.TWEthereumAbiFunctionGetParamAddress(
              _pointer, idx, isOutput))
          .bytes()!;

  /// Adding a uint8 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt8(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamUInt8(
          _pointer, arrayIdx, val);

  /// Adding a uint16 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt16(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamUInt16(
          _pointer, arrayIdx, val);

  /// Adding a uint32 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt32(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamUInt32(
          _pointer, arrayIdx, val);

  /// Adding a uint64 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt64(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamUInt64(
          _pointer, arrayIdx, val);

  /// Adding a uint256 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUInt256(int arrayIdx, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamUInt256(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a uint[N] type parameter of to the top-level input parameter array
  ///
  /// \param [bits] Number of bits of the integer parameter
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamUIntN(int arrayIdx, int bits, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamUIntN(
          _pointer, arrayIdx, bits, TWData(val).pointer);

  /// Adding a int8 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt8(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamInt8(
          _pointer, arrayIdx, val);

  /// Adding a int16 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt16(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamInt16(
          _pointer, arrayIdx, val);

  /// Adding a int32 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt32(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamInt32(
          _pointer, arrayIdx, val);

  /// Adding a int64 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt64(int arrayIdx, int val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamInt64(
          _pointer, arrayIdx, val);

  /// Adding a int256 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamInt256(int arrayIdx, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamInt256(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a int[N] type parameter of to the top-level input parameter array
  ///
  /// \param [bits] Number of bits of the integer parameter
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter stored in a block of data
  /// \return the index of the added parameter (0-based).
  int addInArrayParamIntN(int arrayIdx, int bits, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamIntN(
          _pointer, arrayIdx, bits, TWData(val).pointer);

  /// Adding a bool type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamBool(int arrayIdx, bool val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamBool(
          _pointer, arrayIdx, val);

  /// Adding a string type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamString(int arrayIdx, String val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamString(
          _pointer, arrayIdx, TWString(val).pointer);

  /// Adding an address type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamAddress(int arrayIdx, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamAddress(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a bytes type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamBytes(int arrayIdx, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamBytes(
          _pointer, arrayIdx, TWData(val).pointer);

  /// Adding a int64 type parameter of to the top-level input parameter array
  ///
  /// \param [arrayIdx] array index for the abi function (0-based).
  /// \param [size] fixed size of the bytes array parameter (val).
  /// \param [val] the value of the parameter
  /// \return the index of the added parameter (0-based).
  int addInArrayParamBytesFix(int arrayIdx, int size, Uint8List val) =>
      iTWBindings.TWEthereumAbiFunctionAddInArrayParamBytesFix(
          _pointer, arrayIdx, size, TWData(val).pointer);
}
