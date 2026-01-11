// This is a generated file - do not edit.
//
// Generated from LiquidStaking.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum for supported coins for liquid staking
class Coin extends $pb.ProtobufEnum {
  /// Previously, MATIC.
  static const Coin POL = Coin._(0, _omitEnumNames ? '' : 'POL');
  static const Coin ATOM = Coin._(1, _omitEnumNames ? '' : 'ATOM');
  static const Coin BNB = Coin._(2, _omitEnumNames ? '' : 'BNB');
  static const Coin APT = Coin._(3, _omitEnumNames ? '' : 'APT');
  static const Coin ETH = Coin._(4, _omitEnumNames ? '' : 'ETH');

  static const $core.List<Coin> values = <Coin>[
    POL,
    ATOM,
    BNB,
    APT,
    ETH,
  ];

  static final $core.List<Coin?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Coin? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Coin._(super.value, super.name);
}

/// Enum for supported target blockchains for liquid staking
class Blockchain extends $pb.ProtobufEnum {
  static const Blockchain ETHEREUM =
      Blockchain._(0, _omitEnumNames ? '' : 'ETHEREUM');
  static const Blockchain POLYGON =
      Blockchain._(1, _omitEnumNames ? '' : 'POLYGON');
  static const Blockchain STRIDE =
      Blockchain._(2, _omitEnumNames ? '' : 'STRIDE');
  static const Blockchain BNB_BSC =
      Blockchain._(3, _omitEnumNames ? '' : 'BNB_BSC');
  static const Blockchain APTOS =
      Blockchain._(4, _omitEnumNames ? '' : 'APTOS');

  static const $core.List<Blockchain> values = <Blockchain>[
    ETHEREUM,
    POLYGON,
    STRIDE,
    BNB_BSC,
    APTOS,
  ];

  static final $core.List<Blockchain?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static Blockchain? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Blockchain._(super.value, super.name);
}

/// Enum for supported liquid staking protocols
class Protocol extends $pb.ProtobufEnum {
  static const Protocol Strader =
      Protocol._(0, _omitEnumNames ? '' : 'Strader');
  static const Protocol Stride = Protocol._(1, _omitEnumNames ? '' : 'Stride');
  static const Protocol Tortuga =
      Protocol._(2, _omitEnumNames ? '' : 'Tortuga');
  static const Protocol Lido = Protocol._(3, _omitEnumNames ? '' : 'Lido');

  static const $core.List<Protocol> values = <Protocol>[
    Strader,
    Stride,
    Tortuga,
    Lido,
  ];

  static final $core.List<Protocol?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static Protocol? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Protocol._(super.value, super.name);
}

/// Enum for status codes to indicate the result of an operation
class StatusCode extends $pb.ProtobufEnum {
  static const StatusCode OK = StatusCode._(0, _omitEnumNames ? '' : 'OK');
  static const StatusCode ERROR_ACTION_NOT_SET =
      StatusCode._(1, _omitEnumNames ? '' : 'ERROR_ACTION_NOT_SET');
  static const StatusCode ERROR_TARGETED_BLOCKCHAIN_NOT_SUPPORTED_BY_PROTOCOL =
      StatusCode._(
          2,
          _omitEnumNames
              ? ''
              : 'ERROR_TARGETED_BLOCKCHAIN_NOT_SUPPORTED_BY_PROTOCOL');
  static const StatusCode ERROR_SMART_CONTRACT_ADDRESS_NOT_SET = StatusCode._(
      3, _omitEnumNames ? '' : 'ERROR_SMART_CONTRACT_ADDRESS_NOT_SET');
  static const StatusCode ERROR_INPUT_PROTO_DESERIALIZATION = StatusCode._(
      4, _omitEnumNames ? '' : 'ERROR_INPUT_PROTO_DESERIALIZATION');
  static const StatusCode ERROR_OPERATION_NOT_SUPPORTED_BY_PROTOCOL =
      StatusCode._(
          5, _omitEnumNames ? '' : 'ERROR_OPERATION_NOT_SUPPORTED_BY_PROTOCOL');

  static const $core.List<StatusCode> values = <StatusCode>[
    OK,
    ERROR_ACTION_NOT_SET,
    ERROR_TARGETED_BLOCKCHAIN_NOT_SUPPORTED_BY_PROTOCOL,
    ERROR_SMART_CONTRACT_ADDRESS_NOT_SET,
    ERROR_INPUT_PROTO_DESERIALIZATION,
    ERROR_OPERATION_NOT_SUPPORTED_BY_PROTOCOL,
  ];

  static final $core.List<StatusCode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static StatusCode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StatusCode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
