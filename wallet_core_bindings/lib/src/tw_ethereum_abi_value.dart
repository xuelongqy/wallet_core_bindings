part of '../wallet_core_bindings.dart';

/// Represents Ethereum ABI value
class TWEthereumAbiValue {
  TWEthereumAbiValue._();

  /// Encode a bool according to Ethereum ABI, into 32 bytes.  Values are padded by 0 on the left, unless specified otherwise
  ///
  /// \param [value] a boolean value
  /// \return Encoded value stored in a block of data
  static Uint8List encodeBool(bool value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeBool(
          value,
        ),
      ).bytes()!;

  /// Encode a int32 according to Ethereum ABI, into 32 bytes. Values are padded by 0 on the left, unless specified otherwise
  ///
  /// \param [value] a int32 value
  /// \return Encoded value stored in a block of data
  static Uint8List encodeInt32(int value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeInt32(
          value,
        ),
      ).bytes()!;

  /// Encode a uint32 according to Ethereum ABI, into 32 bytes.  Values are padded by 0 on the left, unless specified otherwise
  ///
  /// \param [value] a uint32 value
  /// \return Encoded value stored in a block of data
  static Uint8List encodeUInt32(int value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeUInt32(
          value,
        ),
      ).bytes()!;

  /// Encode a int256 according to Ethereum ABI, into 32 bytes.  Values are padded by 0 on the left, unless specified otherwise
  ///
  /// \param [value] a int256 value stored in a block of data
  /// \return Encoded value stored in a block of data
  static Uint8List encodeInt256(Uint8List value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeInt256(
          TWData(value).pointer,
        ),
      ).bytes()!;

  /// Encode an int256 according to Ethereum ABI, into 32 bytes.  Values are padded by 0 on the left, unless specified otherwise
  ///
  /// \param [value] a int256 value stored in a block of data
  /// \return Encoded value stored in a block of data
  static Uint8List encodeUInt256(Uint8List value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeUInt256(
          TWData(value).pointer,
        ),
      ).bytes()!;

  /// Encode an address according to Ethereum ABI, 20 bytes of the address.
  ///
  /// \param [value] an address value stored in a block of data
  /// \return Encoded value stored in a block of data
  static Uint8List encodeAddress(Uint8List value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeAddress(
          TWData(value).pointer,
        ),
      ).bytes()!;

  /// Encode a string according to Ethereum ABI by encoding its hash.
  ///
  /// \param [value] a string value
  /// \return Encoded value stored in a block of data
  static Uint8List encodeString(String value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeString(
          TWString(value).pointer,
        ),
      ).bytes()!;

  /// Encode a number of bytes, up to 32 bytes, padded on the right.  Longer arrays are truncated.
  ///
  /// \param [value] bunch of bytes
  /// \return Encoded value stored in a block of data
  static Uint8List encodeBytes(Uint8List value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeBytes(
          TWData(value).pointer,
        ),
      ).bytes()!;

  /// Encode a dynamic number of bytes by encoding its hash
  ///
  /// \param [value] bunch of bytes
  /// \return Encoded value stored in a block of data
  static Uint8List encodeBytesDyn(Uint8List value) => TWData.fromPointer(
        _ethereumAbiValueImpl.encodeBytesDyn(
          TWData(value).pointer,
        ),
      ).bytes()!;

  /// Decodes input data (bytes longer than 32 will be truncated) as uint256
  ///
  /// \param [input] Data to be decoded
  /// \return Non-null decoded string value
  static String decodeUInt256(Uint8List input) => TWString.fromPointer(
          _ethereumAbiValueImpl.decodeUInt256(TWData(input).pointer))
      .value!;

  /// Decode an arbitrary type, return value as string
  ///
  /// \param [input] Data to be decoded
  /// \param [type] the underlying type that need to be decoded
  /// \return Non-null decoded string value
  static String decodeValue(Uint8List input, String type) =>
      TWString.fromPointer(_ethereumAbiValueImpl.decodeValue(
        TWData(input).pointer,
        TWString(type).pointer,
      )).value!;

  /// Decode an array of given simple types.  Return a '\n'-separated string of elements
  ///
  /// \param [input] Data to be decoded
  /// \param [type] the underlying type that need to be decoded
  /// \return Non-null decoded string value
  static String decodeArray(Uint8List input, String type) =>
      TWString.fromPointer(_ethereumAbiValueImpl.decodeArray(
        TWData(input).pointer,
        TWString(type).pointer,
      )).value!;
}
