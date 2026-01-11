// This is a generated file - do not edit.
//
// Generated from Cardano.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class VoteDelegation_DRepType extends $pb.ProtobufEnum {
  static const VoteDelegation_DRepType DREP_ID =
      VoteDelegation_DRepType._(0, _omitEnumNames ? '' : 'DREP_ID');
  static const VoteDelegation_DRepType DREP_ALWAYS_ABSTAIN =
      VoteDelegation_DRepType._(2, _omitEnumNames ? '' : 'DREP_ALWAYS_ABSTAIN');
  static const VoteDelegation_DRepType DREP_NO_CONFIDENCE =
      VoteDelegation_DRepType._(3, _omitEnumNames ? '' : 'DREP_NO_CONFIDENCE');

  static const $core.List<VoteDelegation_DRepType> values =
      <VoteDelegation_DRepType>[
    DREP_ID,
    DREP_ALWAYS_ABSTAIN,
    DREP_NO_CONFIDENCE,
  ];

  static final $core.List<VoteDelegation_DRepType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static VoteDelegation_DRepType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VoteDelegation_DRepType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
