// This is a generated file - do not edit.
//
// Generated from Barz.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// FacetCutAction represents the action to be performed for a FacetCut
class FacetCutAction extends $pb.ProtobufEnum {
  static const FacetCutAction ADD =
      FacetCutAction._(0, _omitEnumNames ? '' : 'ADD');
  static const FacetCutAction REPLACE =
      FacetCutAction._(1, _omitEnumNames ? '' : 'REPLACE');
  static const FacetCutAction REMOVE =
      FacetCutAction._(2, _omitEnumNames ? '' : 'REMOVE');

  static const $core.List<FacetCutAction> values = <FacetCutAction>[
    ADD,
    REPLACE,
    REMOVE,
  ];

  static final $core.List<FacetCutAction?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static FacetCutAction? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FacetCutAction._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
