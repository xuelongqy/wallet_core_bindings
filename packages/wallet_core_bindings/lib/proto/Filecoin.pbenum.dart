// This is a generated file - do not edit.
//
// Generated from Filecoin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Defines the type of `from` address derivation.
class DerivationType extends $pb.ProtobufEnum {
  /// Defines a Secp256k1 (`f1`) derivation for the sender address.
  /// Default derivation type.
  static const DerivationType SECP256K1 =
      DerivationType._(0, _omitEnumNames ? '' : 'SECP256K1');

  /// Defines a Delegated (`f4`) derivation for the sender address.
  static const DerivationType DELEGATED =
      DerivationType._(1, _omitEnumNames ? '' : 'DELEGATED');

  static const $core.List<DerivationType> values = <DerivationType>[
    SECP256K1,
    DELEGATED,
  ];

  static final $core.List<DerivationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static DerivationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DerivationType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
