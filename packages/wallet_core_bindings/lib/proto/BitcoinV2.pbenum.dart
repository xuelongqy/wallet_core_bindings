// This is a generated file - do not edit.
//
// Generated from BitcoinV2.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InputSelector extends $pb.ProtobufEnum {
  /// Automatically select enough inputs in an ascending order to cover the outputs of the transaction.
  static const InputSelector SelectAscending =
      InputSelector._(0, _omitEnumNames ? '' : 'SelectAscending');

  /// Automatically select enough inputs in the given order to cover the outputs of the transaction.
  static const InputSelector SelectInOrder =
      InputSelector._(1, _omitEnumNames ? '' : 'SelectInOrder');

  /// Automatically select enough inputs in an descending order to cover the outputs of the transaction.
  static const InputSelector SelectDescending =
      InputSelector._(2, _omitEnumNames ? '' : 'SelectDescending');

  /// Use all the inputs provided in the given order.
  static const InputSelector UseAll =
      InputSelector._(10, _omitEnumNames ? '' : 'UseAll');

  static const $core.List<InputSelector> values = <InputSelector>[
    SelectAscending,
    SelectInOrder,
    SelectDescending,
    UseAll,
  ];

  static final $core.Map<$core.int, InputSelector> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static InputSelector? valueOf($core.int value) => _byValue[value];

  const InputSelector._(super.value, super.name);
}

class TransactionVersion extends $pb.ProtobufEnum {
  /// V1 is used by default.
  static const TransactionVersion UseDefault =
      TransactionVersion._(0, _omitEnumNames ? '' : 'UseDefault');

  /// Original transaction version.
  static const TransactionVersion V1 =
      TransactionVersion._(1, _omitEnumNames ? '' : 'V1');

  /// https://github.com/bitcoin/bips/blob/master/bip-0068.mediawiki#specification
  static const TransactionVersion V2 =
      TransactionVersion._(2, _omitEnumNames ? '' : 'V2');

  static const $core.List<TransactionVersion> values = <TransactionVersion>[
    UseDefault,
    V1,
    V2,
  ];

  static final $core.List<TransactionVersion?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static TransactionVersion? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransactionVersion._(super.value, super.name);
}

class PreSigningOutput_SigningMethod extends $pb.ProtobufEnum {
  /// Used for P2SH and P2PKH - standard ecdsa secp256k1 signing
  static const PreSigningOutput_SigningMethod Legacy =
      PreSigningOutput_SigningMethod._(0, _omitEnumNames ? '' : 'Legacy');

  /// Used for P2WSH and P2WPKH - standard ecdsa secp256k1 signing
  static const PreSigningOutput_SigningMethod Segwit =
      PreSigningOutput_SigningMethod._(1, _omitEnumNames ? '' : 'Segwit');

  /// Used for P2TR key-path and P2TR script-pay - schnorr signing
  static const PreSigningOutput_SigningMethod Taproot =
      PreSigningOutput_SigningMethod._(2, _omitEnumNames ? '' : 'Taproot');

  static const $core.List<PreSigningOutput_SigningMethod> values =
      <PreSigningOutput_SigningMethod>[
    Legacy,
    Segwit,
    Taproot,
  ];

  static final $core.List<PreSigningOutput_SigningMethod?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PreSigningOutput_SigningMethod? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PreSigningOutput_SigningMethod._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
