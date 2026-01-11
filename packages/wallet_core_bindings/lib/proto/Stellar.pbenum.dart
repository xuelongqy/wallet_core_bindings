// This is a generated file - do not edit.
//
// Generated from Stellar.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// A predicate (used in claim)
/// Rest of predicates not currently supported
/// See https://github.com/stellar/stellar-protocol/blob/master/core/cap-0023.md
class ClaimPredicate extends $pb.ProtobufEnum {
  static const ClaimPredicate Predicate_unconditional =
      ClaimPredicate._(0, _omitEnumNames ? '' : 'Predicate_unconditional');

  static const $core.List<ClaimPredicate> values = <ClaimPredicate>[
    Predicate_unconditional,
  ];

  static final $core.List<ClaimPredicate?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static ClaimPredicate? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ClaimPredicate._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
