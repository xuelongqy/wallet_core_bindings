//
//  Generated code. Do not modify.
//  source: Polymesh.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SecondaryKeyPermissions_RestrictionKind extends $pb.ProtobufEnum {
  static const SecondaryKeyPermissions_RestrictionKind Whole =
      SecondaryKeyPermissions_RestrictionKind._(
          0, _omitEnumNames ? '' : 'Whole');
  static const SecondaryKeyPermissions_RestrictionKind These =
      SecondaryKeyPermissions_RestrictionKind._(
          1, _omitEnumNames ? '' : 'These');
  static const SecondaryKeyPermissions_RestrictionKind Except =
      SecondaryKeyPermissions_RestrictionKind._(
          2, _omitEnumNames ? '' : 'Except');

  static const $core.List<SecondaryKeyPermissions_RestrictionKind> values =
      <SecondaryKeyPermissions_RestrictionKind>[
    Whole,
    These,
    Except,
  ];

  static final $core.Map<$core.int, SecondaryKeyPermissions_RestrictionKind>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static SecondaryKeyPermissions_RestrictionKind? valueOf($core.int value) =>
      _byValue[value];

  const SecondaryKeyPermissions_RestrictionKind._($core.int v, $core.String n)
      : super(v, n);
}

class Utility_BatchKind extends $pb.ProtobufEnum {
  static const Utility_BatchKind StopOnError =
      Utility_BatchKind._(0, _omitEnumNames ? '' : 'StopOnError');
  static const Utility_BatchKind Atomic =
      Utility_BatchKind._(1, _omitEnumNames ? '' : 'Atomic');
  static const Utility_BatchKind Optimistic =
      Utility_BatchKind._(2, _omitEnumNames ? '' : 'Optimistic');

  static const $core.List<Utility_BatchKind> values = <Utility_BatchKind>[
    StopOnError,
    Atomic,
    Optimistic,
  ];

  static final $core.Map<$core.int, Utility_BatchKind> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Utility_BatchKind? valueOf($core.int value) => _byValue[value];

  const Utility_BatchKind._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
