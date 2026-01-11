// This is a generated file - do not edit.
//
// Generated from EthereumAbi.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AbiError extends $pb.ProtobufEnum {
  /// This is the OK case, with value=0
  static const AbiError OK = AbiError._(0, _omitEnumNames ? '' : 'OK');

  /// Internal error.
  static const AbiError Error_internal =
      AbiError._(1, _omitEnumNames ? '' : 'Error_internal');

  /// Unexpected function signature or ABI mismatch.
  static const AbiError Error_abi_mismatch =
      AbiError._(2, _omitEnumNames ? '' : 'Error_abi_mismatch');

  /// Invalid ABI.
  static const AbiError Error_invalid_abi =
      AbiError._(3, _omitEnumNames ? '' : 'Error_invalid_abi');

  /// Invalid parameter type.
  static const AbiError Error_invalid_param_type =
      AbiError._(4, _omitEnumNames ? '' : 'Error_invalid_param_type');

  /// Invalid address value.
  static const AbiError Error_invalid_address_value =
      AbiError._(5, _omitEnumNames ? '' : 'Error_invalid_address_value');

  /// Invalid UInt value.
  static const AbiError Error_invalid_uint_value =
      AbiError._(6, _omitEnumNames ? '' : 'Error_invalid_uint_value');

  /// Missing parameter type.
  static const AbiError Error_missing_param_type =
      AbiError._(7, _omitEnumNames ? '' : 'Error_missing_param_type');

  /// Missing parameter value.
  static const AbiError Error_missing_param_value =
      AbiError._(8, _omitEnumNames ? '' : 'Error_missing_param_value');

  /// Invalid encoded data.
  static const AbiError Error_decoding_data =
      AbiError._(9, _omitEnumNames ? '' : 'Error_decoding_data');

  /// Invalid empty type.
  /// For example, bytes0, address[0].
  static const AbiError Error_empty_type =
      AbiError._(10, _omitEnumNames ? '' : 'Error_empty_type');

  static const $core.List<AbiError> values = <AbiError>[
    OK,
    Error_internal,
    Error_abi_mismatch,
    Error_invalid_abi,
    Error_invalid_param_type,
    Error_invalid_address_value,
    Error_invalid_uint_value,
    Error_missing_param_type,
    Error_missing_param_value,
    Error_decoding_data,
    Error_empty_type,
  ];

  static final $core.List<AbiError?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static AbiError? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AbiError._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
