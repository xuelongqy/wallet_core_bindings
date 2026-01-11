// This is a generated file - do not edit.
//
// Generated from TheOpenNetwork.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WalletVersion extends $pb.ProtobufEnum {
  static const WalletVersion WALLET_V3_R1 =
      WalletVersion._(0, _omitEnumNames ? '' : 'WALLET_V3_R1');
  static const WalletVersion WALLET_V3_R2 =
      WalletVersion._(1, _omitEnumNames ? '' : 'WALLET_V3_R2');
  static const WalletVersion WALLET_V4_R2 =
      WalletVersion._(2, _omitEnumNames ? '' : 'WALLET_V4_R2');
  static const WalletVersion WALLET_V5_R1 =
      WalletVersion._(3, _omitEnumNames ? '' : 'WALLET_V5_R1');

  static const $core.List<WalletVersion> values = <WalletVersion>[
    WALLET_V3_R1,
    WALLET_V3_R2,
    WALLET_V4_R2,
    WALLET_V5_R1,
  ];

  static final $core.List<WalletVersion?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static WalletVersion? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WalletVersion._(super.value, super.name);
}

class SendMode extends $pb.ProtobufEnum {
  static const SendMode DEFAULT =
      SendMode._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const SendMode PAY_FEES_SEPARATELY =
      SendMode._(1, _omitEnumNames ? '' : 'PAY_FEES_SEPARATELY');
  static const SendMode IGNORE_ACTION_PHASE_ERRORS =
      SendMode._(2, _omitEnumNames ? '' : 'IGNORE_ACTION_PHASE_ERRORS');
  static const SendMode DESTROY_ON_ZERO_BALANCE =
      SendMode._(32, _omitEnumNames ? '' : 'DESTROY_ON_ZERO_BALANCE');
  static const SendMode ATTACH_ALL_INBOUND_MESSAGE_VALUE =
      SendMode._(64, _omitEnumNames ? '' : 'ATTACH_ALL_INBOUND_MESSAGE_VALUE');
  static const SendMode ATTACH_ALL_CONTRACT_BALANCE =
      SendMode._(128, _omitEnumNames ? '' : 'ATTACH_ALL_CONTRACT_BALANCE');

  static const $core.List<SendMode> values = <SendMode>[
    DEFAULT,
    PAY_FEES_SEPARATELY,
    IGNORE_ACTION_PHASE_ERRORS,
    DESTROY_ON_ZERO_BALANCE,
    ATTACH_ALL_INBOUND_MESSAGE_VALUE,
    ATTACH_ALL_CONTRACT_BALANCE,
  ];

  static final $core.Map<$core.int, SendMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SendMode? valueOf($core.int value) => _byValue[value];

  const SendMode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
