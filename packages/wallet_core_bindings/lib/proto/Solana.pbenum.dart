// This is a generated file - do not edit.
//
// Generated from Solana.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TokenProgramId extends $pb.ProtobufEnum {
  static const TokenProgramId TokenProgram =
      TokenProgramId._(0, _omitEnumNames ? '' : 'TokenProgram');
  static const TokenProgramId Token2022Program =
      TokenProgramId._(1, _omitEnumNames ? '' : 'Token2022Program');

  static const $core.List<TokenProgramId> values = <TokenProgramId>[
    TokenProgram,
    Token2022Program,
  ];

  static final $core.List<TokenProgramId?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static TokenProgramId? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TokenProgramId._(super.value, super.name);
}

class Encoding extends $pb.ProtobufEnum {
  static const Encoding Base58 = Encoding._(0, _omitEnumNames ? '' : 'Base58');
  static const Encoding Base64 = Encoding._(1, _omitEnumNames ? '' : 'Base64');

  static const $core.List<Encoding> values = <Encoding>[
    Base58,
    Base64,
  ];

  static final $core.List<Encoding?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Encoding? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Encoding._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
