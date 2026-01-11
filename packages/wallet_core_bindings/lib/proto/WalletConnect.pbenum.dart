// This is a generated file - do not edit.
//
// Generated from WalletConnect.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The transaction protocol may differ from version to version.
class Protocol extends $pb.ProtobufEnum {
  static const Protocol V2 = Protocol._(0, _omitEnumNames ? '' : 'V2');

  static const $core.List<Protocol> values = <Protocol>[
    V2,
  ];

  static final $core.List<Protocol?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static Protocol? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Protocol._(super.value, super.name);
}

/// WalletConnect request method.
class Method extends $pb.ProtobufEnum {
  static const Method Unknown = Method._(0, _omitEnumNames ? '' : 'Unknown');

  /// cosmos_signAmino
  static const Method CosmosSignAmino =
      Method._(1, _omitEnumNames ? '' : 'CosmosSignAmino');

  /// solana_signTransaction
  static const Method SolanaSignTransaction =
      Method._(2, _omitEnumNames ? '' : 'SolanaSignTransaction');

  static const $core.List<Method> values = <Method>[
    Unknown,
    CosmosSignAmino,
    SolanaSignTransaction,
  ];

  static final $core.List<Method?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Method? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Method._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
