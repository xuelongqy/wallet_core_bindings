// This is a generated file - do not edit.
//
// Generated from IOST.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The enumeration defines the signature algorithm.
class Algorithm extends $pb.ProtobufEnum {
  /// unknown
  static const Algorithm UNKNOWN =
      Algorithm._(0, _omitEnumNames ? '' : 'UNKNOWN');

  /// secp256k1
  static const Algorithm SECP256K1 =
      Algorithm._(1, _omitEnumNames ? '' : 'SECP256K1');

  /// ed25519
  static const Algorithm ED25519 =
      Algorithm._(2, _omitEnumNames ? '' : 'ED25519');

  static const $core.List<Algorithm> values = <Algorithm>[
    UNKNOWN,
    SECP256K1,
    ED25519,
  ];

  static final $core.List<Algorithm?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Algorithm? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Algorithm._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
