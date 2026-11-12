// This is a generated file - do not edit.
//
// Generated from Zcash.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Zcash transparent transaction format.
class TransactionVersion extends $pb.ProtobufEnum {
  /// Version 5 is used by default.
  /// Komodo doesn't support version 5, so version 4 is used by default there.
  static const TransactionVersion UseDefault =
      TransactionVersion._(0, _omitEnumNames ? '' : 'UseDefault');

  /// Sapling transaction format (0x80000004), version group ID 0x892F2085.
  /// Version 4 transactions are not valid after NU7 activation, see https://zips.z.cash/zip-2003
  static const TransactionVersion V4 =
      TransactionVersion._(4, _omitEnumNames ? '' : 'V4');

  /// NU5 transaction format (0x80000005), version group ID 0x26A7270A.
  /// See https://zips.z.cash/zip-0225 and https://zips.z.cash/zip-0244
  static const TransactionVersion V5 =
      TransactionVersion._(5, _omitEnumNames ? '' : 'V5');

  static const $core.List<TransactionVersion> values = <TransactionVersion>[
    UseDefault,
    V4,
    V5,
  ];

  static final $core.Map<$core.int, TransactionVersion> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TransactionVersion? valueOf($core.int value) => _byValue[value];

  const TransactionVersion._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
