// This is a generated file - do not edit.
//
// Generated from Tezos.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Operation types
class Operation_OperationKind extends $pb.ProtobufEnum {
  /// Note: Proto3 semantics require a zero value.
  static const Operation_OperationKind ENDORSEMENT =
      Operation_OperationKind._(0, _omitEnumNames ? '' : 'ENDORSEMENT');
  static const Operation_OperationKind REVEAL =
      Operation_OperationKind._(107, _omitEnumNames ? '' : 'REVEAL');
  static const Operation_OperationKind TRANSACTION =
      Operation_OperationKind._(108, _omitEnumNames ? '' : 'TRANSACTION');
  static const Operation_OperationKind DELEGATION =
      Operation_OperationKind._(110, _omitEnumNames ? '' : 'DELEGATION');

  static const $core.List<Operation_OperationKind> values =
      <Operation_OperationKind>[
    ENDORSEMENT,
    REVEAL,
    TRANSACTION,
    DELEGATION,
  ];

  static final $core.Map<$core.int, Operation_OperationKind> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Operation_OperationKind? valueOf($core.int value) => _byValue[value];

  const Operation_OperationKind._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
