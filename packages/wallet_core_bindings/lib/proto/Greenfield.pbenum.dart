// This is a generated file - do not edit.
//
// Generated from Greenfield.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Transaction broadcast mode
class BroadcastMode extends $pb.ProtobufEnum {
  static const BroadcastMode SYNC =
      BroadcastMode._(0, _omitEnumNames ? '' : 'SYNC');
  static const BroadcastMode ASYNC =
      BroadcastMode._(1, _omitEnumNames ? '' : 'ASYNC');

  static const $core.List<BroadcastMode> values = <BroadcastMode>[
    SYNC,
    ASYNC,
  ];

  static final $core.List<BroadcastMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static BroadcastMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BroadcastMode._(super.value, super.name);
}

/// Options for transaction encoding.
/// Consider adding Json mode.
class EncodingMode extends $pb.ProtobufEnum {
  static const EncodingMode Protobuf =
      EncodingMode._(0, _omitEnumNames ? '' : 'Protobuf');

  static const $core.List<EncodingMode> values = <EncodingMode>[
    Protobuf,
  ];

  static final $core.List<EncodingMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static EncodingMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EncodingMode._(super.value, super.name);
}

/// Options for transaction signing.
/// Consider adding Direct mode when it is supported.
class SigningMode extends $pb.ProtobufEnum {
  static const SigningMode Eip712 =
      SigningMode._(0, _omitEnumNames ? '' : 'Eip712');

  static const $core.List<SigningMode> values = <SigningMode>[
    Eip712,
  ];

  static final $core.List<SigningMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static SigningMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SigningMode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
