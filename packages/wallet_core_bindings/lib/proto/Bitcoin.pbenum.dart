// This is a generated file - do not edit.
//
// Generated from Bitcoin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TransactionVariant extends $pb.ProtobufEnum {
  static const TransactionVariant P2PKH =
      TransactionVariant._(0, _omitEnumNames ? '' : 'P2PKH');
  static const TransactionVariant P2WPKH =
      TransactionVariant._(1, _omitEnumNames ? '' : 'P2WPKH');
  static const TransactionVariant P2TRKEYPATH =
      TransactionVariant._(2, _omitEnumNames ? '' : 'P2TRKEYPATH');
  static const TransactionVariant BRC20TRANSFER =
      TransactionVariant._(3, _omitEnumNames ? '' : 'BRC20TRANSFER');
  static const TransactionVariant NFTINSCRIPTION =
      TransactionVariant._(4, _omitEnumNames ? '' : 'NFTINSCRIPTION');

  static const $core.List<TransactionVariant> values = <TransactionVariant>[
    P2PKH,
    P2WPKH,
    P2TRKEYPATH,
    BRC20TRANSFER,
    NFTINSCRIPTION,
  ];

  static final $core.List<TransactionVariant?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static TransactionVariant? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransactionVariant._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
