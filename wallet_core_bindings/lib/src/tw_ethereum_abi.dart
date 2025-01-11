part of '../wallet_core_bindings.dart';

/// Wrapper class for Ethereum ABI encoding & decoding.
class TWEthereumAbi {
  TWEthereumAbi._();

  /// Decode a contract call (function input) according to an ABI json.
  ///
  /// \param [coin] EVM-compatible coin type.
  /// \param [input] The serialized data of `TW.EthereumAbi.Proto.ContractCallDecodingInput`.
  /// \return The serialized data of a `TW.EthereumAbi.Proto.ContractCallDecodingOutput` proto object.
  static Uint8List decodeContractCall(TWCoinType coin, Uint8List input) =>
      TWData.fromPointer(_ethereumAbiImpl.decodeContractCall(
        coin.coin,
        TWData(input).pointer,
      )).bytes()!;

  /// Decode a function input or output data according to a given ABI.
  ///
  /// \param [coin] EVM-compatible coin type.
  /// \param [input] The serialized data of `TW.EthereumAbi.Proto.ParamsDecodingInput`.
  /// \return The serialized data of a `TW.EthereumAbi.Proto.ParamsDecodingOutput` proto object.
  static Uint8List decodeParams(TWCoinType coin, Uint8List input) =>
      TWData.fromPointer(
        _ethereumAbiImpl.decodeParams(
          coin.coin,
          TWData(input).pointer,
        ),
      ).bytes()!;

  /// /// Decodes an Eth ABI value according to a given type.
  ///
  /// \param [coin] EVM-compatible coin type.
  /// \param [input] The serialized data of `TW.EthereumAbi.Proto.ValueDecodingInput`.
  /// \return The serialized data of a `TW.EthereumAbi.Proto.ValueDecodingOutput` proto object.
  static Uint8List decodeValue(TWCoinType coin, Uint8List input) =>
      TWData.fromPointer(
        _ethereumAbiImpl.decodeValue(
          coin.coin,
          TWData(input).pointer,
        ),
      ).bytes()!;

  /// Encode function to Eth ABI binary.
  ///
  /// \param [coin] EVM-compatible coin type.
  /// \param [input] The serialized data of `TW.EthereumAbi.Proto.FunctionEncodingInput`.
  /// \return The serialized data of a `TW.EthereumAbi.Proto.FunctionEncodingOutput` proto object.
  static Uint8List encodeFunction(TWCoinType coin, Uint8List input) =>
      TWData.fromPointer(
        _ethereumAbiImpl.encodeFunction(
          coin.coin,
          TWData(input).pointer,
        ),
      ).bytes()!;

  /// Encode function to Eth ABI binary
  ///
  /// \param [fn] Non-null Eth abi function
  /// \return Non-null encoded block of data
  static Uint8List encode(TWEthereumAbiFunction fn) =>
      TWData.fromPointer(_ethereumAbiImpl.encode(fn.pointer)).bytes()!;

  /// Decode function output from Eth ABI binary, fill output parameters
  ///
  /// \param[in] [fn] Non-null Eth abi function
  /// \param[out] [encoded] Non-null block of data
  /// \return true if encoded have been filled correctly, false otherwise
  static bool decodeOutput(TWEthereumAbiFunction fn, Uint8List encoded) =>
      _ethereumAbiImpl.decodeOutput(fn.pointer, TWData(encoded).pointer);

  /// Decode function call data to human readable json format, according to input abi json
  ///
  /// \param [data] Non-null block of data
  /// \param [abi] Non-null string
  /// \return Non-null json string function call data
  static String? decodeCall(Uint8List data, String abi) => TWString.fromPointer(
        _ethereumAbiImpl.decodeCall(
            TWData(data).pointer, TWString(abi).pointer),
      ).value;

  /// Compute the hash of a struct, used for signing, according to EIP712 ("v4").
  /// Input is a Json object (as string), with following fields:
  /// - types: map of used struct types (see makeTypes())
  /// - primaryType: the type of the message (string)
  /// - domain: EIP712 domain specifier values
  /// - message: the message (object).
  /// Throws on error.
  /// Example input:
  ///  R"({
  ///     "types": {
  ///         "EIP712Domain": [
  ///             {"name": "name", "type": "string"},
  ///             {"name": "version", "type": "string"},
  ///             {"name": "chainId", "type": "uint256"},
  ///             {"name": "verifyingContract", "type": "address"}
  ///         ],
  ///         "Person": [
  ///             {"name": "name", "type": "string"},
  ///             {"name": "wallet", "type": "address"}
  ///         ]
  ///     },
  ///     "primaryType": "Person",
  ///     "domain": {
  ///         "name": "Ether Person",
  ///         "version": "1",
  ///         "chainId": 1,
  ///         "verifyingContract": "0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC"
  ///     },
  ///     "message": {
  ///         "name": "Cow",
  ///         "wallet": "CD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826"
  ///     }
  ///  })");
  /// On error, empty Data is returned.
  /// Returned data must be deleted (hint: use WRAPD() macro).
  ///
  /// \param [messageJson] Non-null json abi input
  /// \return Non-null block of data, encoded abi input
  static Uint8List encodeTyped(String messageJson) => TWData.fromPointer(
        _ethereumAbiImpl.encodeTyped(TWString(messageJson).pointer),
      ).bytes()!;

  /// Get function signature from Ethereum ABI json
  ///
  /// \param [abi] The function ABI json string, for example: {"inputs":[{"internalType":"bool","name":"arg1","type":"bool"}],"name":"fun1","outputs":[],"stateMutability":"nonpayable","type":"function"}
  /// \return the function type signature, of the form "baz(int32,uint256)", null if the abi is invalid.
  static String? getFunctionSignature(String abi) => TWString.fromPointer(
        _ethereumAbiImpl.getFunctionSignature(TWString(abi).pointer),
      ).value;
}
