//
//  Generated code. Do not modify.
//  source: Cardano.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

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

  static final $core.Map<$core.int, VoteDelegation_DRepType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static VoteDelegation_DRepType? valueOf($core.int value) => _byValue[value];

  const VoteDelegation_DRepType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
