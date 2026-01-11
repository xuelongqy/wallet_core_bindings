// This is a generated file - do not edit.
//
// Generated from Polkadot.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Destination options for reward
class RewardDestination extends $pb.ProtobufEnum {
  static const RewardDestination STAKED =
      RewardDestination._(0, _omitEnumNames ? '' : 'STAKED');
  static const RewardDestination STASH =
      RewardDestination._(1, _omitEnumNames ? '' : 'STASH');
  static const RewardDestination CONTROLLER =
      RewardDestination._(2, _omitEnumNames ? '' : 'CONTROLLER');

  static const $core.List<RewardDestination> values = <RewardDestination>[
    STAKED,
    STASH,
    CONTROLLER,
  ];

  static final $core.List<RewardDestination?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RewardDestination? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RewardDestination._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
