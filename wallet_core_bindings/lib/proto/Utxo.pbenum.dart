//
//  Generated code. Do not modify.
//  source: Utxo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Error extends $pb.ProtobufEnum {
  static const Error OK = Error._(0, _omitEnumNames ? '' : 'OK');
  static const Error Error_invalid_leaf_hash =
      Error._(1, _omitEnumNames ? '' : 'Error_invalid_leaf_hash');
  static const Error Error_invalid_sighash_type =
      Error._(2, _omitEnumNames ? '' : 'Error_invalid_sighash_type');
  static const Error Error_invalid_lock_time =
      Error._(3, _omitEnumNames ? '' : 'Error_invalid_lock_time');
  static const Error Error_invalid_txid =
      Error._(4, _omitEnumNames ? '' : 'Error_invalid_txid');
  static const Error Error_sighash_failed =
      Error._(5, _omitEnumNames ? '' : 'Error_sighash_failed');
  static const Error Error_missing_sighash_method =
      Error._(6, _omitEnumNames ? '' : 'Error_missing_sighash_method');
  static const Error Error_failed_encoding =
      Error._(7, _omitEnumNames ? '' : 'Error_failed_encoding');
  static const Error Error_insufficient_inputs =
      Error._(8, _omitEnumNames ? '' : 'Error_insufficient_inputs');
  static const Error Error_no_outputs_specified =
      Error._(9, _omitEnumNames ? '' : 'Error_no_outputs_specified');
  static const Error Error_missing_change_script_pubkey =
      Error._(10, _omitEnumNames ? '' : 'Error_missing_change_script_pubkey');

  static const $core.List<Error> values = <Error>[
    OK,
    Error_invalid_leaf_hash,
    Error_invalid_sighash_type,
    Error_invalid_lock_time,
    Error_invalid_txid,
    Error_sighash_failed,
    Error_missing_sighash_method,
    Error_failed_encoding,
    Error_insufficient_inputs,
    Error_no_outputs_specified,
    Error_missing_change_script_pubkey,
  ];

  static final $core.Map<$core.int, Error> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Error? valueOf($core.int value) => _byValue[value];

  const Error._($core.int v, $core.String n) : super(v, n);
}

class InputSelector extends $pb.ProtobufEnum {
  static const InputSelector SelectAscending =
      InputSelector._(0, _omitEnumNames ? '' : 'SelectAscending');
  static const InputSelector SelectInOrder =
      InputSelector._(1, _omitEnumNames ? '' : 'SelectInOrder');
  static const InputSelector SelectDescending =
      InputSelector._(2, _omitEnumNames ? '' : 'SelectDescending');
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

  const InputSelector._($core.int v, $core.String n) : super(v, n);
}

class SigningMethod extends $pb.ProtobufEnum {
  static const SigningMethod Legacy =
      SigningMethod._(0, _omitEnumNames ? '' : 'Legacy');
  static const SigningMethod Segwit =
      SigningMethod._(1, _omitEnumNames ? '' : 'Segwit');
  static const SigningMethod TaprootAll =
      SigningMethod._(2, _omitEnumNames ? '' : 'TaprootAll');
  static const SigningMethod TaprootOnePrevout =
      SigningMethod._(3, _omitEnumNames ? '' : 'TaprootOnePrevout');

  static const $core.List<SigningMethod> values = <SigningMethod>[
    Legacy,
    Segwit,
    TaprootAll,
    TaprootOnePrevout,
  ];

  static final $core.Map<$core.int, SigningMethod> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SigningMethod? valueOf($core.int value) => _byValue[value];

  const SigningMethod._($core.int v, $core.String n) : super(v, n);
}

class SighashType extends $pb.ProtobufEnum {
  static const SighashType UseDefault =
      SighashType._(0, _omitEnumNames ? '' : 'UseDefault');
  static const SighashType All = SighashType._(1, _omitEnumNames ? '' : 'All');
  static const SighashType None =
      SighashType._(2, _omitEnumNames ? '' : 'None');
  static const SighashType Single =
      SighashType._(3, _omitEnumNames ? '' : 'Single');
  static const SighashType AllPlusAnyoneCanPay =
      SighashType._(129, _omitEnumNames ? '' : 'AllPlusAnyoneCanPay');
  static const SighashType NonePlusAnyoneCanPay =
      SighashType._(130, _omitEnumNames ? '' : 'NonePlusAnyoneCanPay');
  static const SighashType SinglePlusAnyoneCanPay =
      SighashType._(131, _omitEnumNames ? '' : 'SinglePlusAnyoneCanPay');

  static const $core.List<SighashType> values = <SighashType>[
    UseDefault,
    All,
    None,
    Single,
    AllPlusAnyoneCanPay,
    NonePlusAnyoneCanPay,
    SinglePlusAnyoneCanPay,
  ];

  static final $core.Map<$core.int, SighashType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SighashType? valueOf($core.int value) => _byValue[value];

  const SighashType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
