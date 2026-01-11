// This is a generated file - do not edit.
//
// Generated from EOS.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class KeyType extends $pb.ProtobufEnum {
  static const KeyType LEGACY = KeyType._(0, _omitEnumNames ? '' : 'LEGACY');
  static const KeyType MODERNK1 =
      KeyType._(1, _omitEnumNames ? '' : 'MODERNK1');
  static const KeyType MODERNR1 =
      KeyType._(2, _omitEnumNames ? '' : 'MODERNR1');

  static const $core.List<KeyType> values = <KeyType>[
    LEGACY,
    MODERNK1,
    MODERNR1,
  ];

  static final $core.List<KeyType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static KeyType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KeyType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
