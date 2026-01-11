// This is a generated file - do not edit.
//
// Generated from THORChainSwap.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Supported blockchains
class Chain extends $pb.ProtobufEnum {
  static const Chain THOR = Chain._(0, _omitEnumNames ? '' : 'THOR');
  static const Chain BTC = Chain._(1, _omitEnumNames ? '' : 'BTC');
  static const Chain ETH = Chain._(2, _omitEnumNames ? '' : 'ETH');
  static const Chain BNB = Chain._(3, _omitEnumNames ? '' : 'BNB');
  static const Chain DOGE = Chain._(4, _omitEnumNames ? '' : 'DOGE');
  static const Chain BCH = Chain._(5, _omitEnumNames ? '' : 'BCH');
  static const Chain LTC = Chain._(6, _omitEnumNames ? '' : 'LTC');
  static const Chain ATOM = Chain._(7, _omitEnumNames ? '' : 'ATOM');
  static const Chain AVAX = Chain._(8, _omitEnumNames ? '' : 'AVAX');
  static const Chain BSC = Chain._(9, _omitEnumNames ? '' : 'BSC');

  static const $core.List<Chain> values = <Chain>[
    THOR,
    BTC,
    ETH,
    BNB,
    DOGE,
    BCH,
    LTC,
    ATOM,
    AVAX,
    BSC,
  ];

  static final $core.List<Chain?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static Chain? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Chain._(super.value, super.name);
}

/// Predefined error codes
class ErrorCode extends $pb.ProtobufEnum {
  /// OK
  static const ErrorCode OK = ErrorCode._(0, _omitEnumNames ? '' : 'OK');
  static const ErrorCode Error_general =
      ErrorCode._(1, _omitEnumNames ? '' : 'Error_general');
  static const ErrorCode Error_Input_proto_deserialization =
      ErrorCode._(2, _omitEnumNames ? '' : 'Error_Input_proto_deserialization');
  static const ErrorCode Error_Unsupported_from_chain =
      ErrorCode._(13, _omitEnumNames ? '' : 'Error_Unsupported_from_chain');
  static const ErrorCode Error_Unsupported_to_chain =
      ErrorCode._(14, _omitEnumNames ? '' : 'Error_Unsupported_to_chain');
  static const ErrorCode Error_Invalid_from_address =
      ErrorCode._(15, _omitEnumNames ? '' : 'Error_Invalid_from_address');
  static const ErrorCode Error_Invalid_to_address =
      ErrorCode._(16, _omitEnumNames ? '' : 'Error_Invalid_to_address');
  static const ErrorCode Error_Invalid_vault_address =
      ErrorCode._(21, _omitEnumNames ? '' : 'Error_Invalid_vault_address');
  static const ErrorCode Error_Invalid_router_address =
      ErrorCode._(22, _omitEnumNames ? '' : 'Error_Invalid_router_address');

  static const $core.List<ErrorCode> values = <ErrorCode>[
    OK,
    Error_general,
    Error_Input_proto_deserialization,
    Error_Unsupported_from_chain,
    Error_Unsupported_to_chain,
    Error_Invalid_from_address,
    Error_Invalid_to_address,
    Error_Invalid_vault_address,
    Error_Invalid_router_address,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
