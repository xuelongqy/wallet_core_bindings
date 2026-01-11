// This is a generated file - do not edit.
//
// Generated from Filecoin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $0;
import 'Filecoin.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Filecoin.pbenum.dart';

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    $core.String? to,
    $fixnum.Int64? nonce,
    $core.List<$core.int>? value,
    $fixnum.Int64? gasLimit,
    $core.List<$core.int>? gasFeeCap,
    $core.List<$core.int>? gasPremium,
    $core.List<$core.int>? params,
    DerivationType? derivation,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (to != null) result.to = to;
    if (nonce != null) result.nonce = nonce;
    if (value != null) result.value = value;
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (gasFeeCap != null) result.gasFeeCap = gasFeeCap;
    if (gasPremium != null) result.gasPremium = gasPremium;
    if (params != null) result.params = params;
    if (derivation != null) result.derivation = derivation;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Filecoin.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'gasLimit')
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'gasFeeCap', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'gasPremium', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'params', $pb.PbFieldType.OY)
    ..aE<DerivationType>(9, _omitFieldNames ? '' : 'derivation',
        enumValues: DerivationType.values)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningInput copyWith(void Function(SigningInput) updates) =>
      super.copyWith((message) => updates(message as SigningInput))
          as SigningInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningInput create() => SigningInput._();
  @$core.override
  SigningInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningInput>(create);
  static SigningInput? _defaultInstance;

  /// The secret private key of the sender account, used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// Recipient's address.
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// Transaction nonce.
  @$pb.TagNumber(3)
  $fixnum.Int64 get nonce => $_getI64(2);
  @$pb.TagNumber(3)
  set nonce($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearNonce() => $_clearField(3);

  /// Transfer value (uint256, serialized big endian)
  @$pb.TagNumber(4)
  $core.List<$core.int> get value => $_getN(3);
  @$pb.TagNumber(4)
  set value($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => $_clearField(4);

  /// Gas limit.
  @$pb.TagNumber(5)
  $fixnum.Int64 get gasLimit => $_getI64(4);
  @$pb.TagNumber(5)
  set gasLimit($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearGasLimit() => $_clearField(5);

  /// Gas fee cap (uint256, serialized big endian)
  @$pb.TagNumber(6)
  $core.List<$core.int> get gasFeeCap => $_getN(5);
  @$pb.TagNumber(6)
  set gasFeeCap($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGasFeeCap() => $_has(5);
  @$pb.TagNumber(6)
  void clearGasFeeCap() => $_clearField(6);

  /// Gas premium (uint256, serialized big endian)
  @$pb.TagNumber(7)
  $core.List<$core.int> get gasPremium => $_getN(6);
  @$pb.TagNumber(7)
  set gasPremium($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGasPremium() => $_has(6);
  @$pb.TagNumber(7)
  void clearGasPremium() => $_clearField(7);

  /// Message params.
  @$pb.TagNumber(8)
  $core.List<$core.int> get params => $_getN(7);
  @$pb.TagNumber(8)
  set params($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasParams() => $_has(7);
  @$pb.TagNumber(8)
  void clearParams() => $_clearField(8);

  /// Sender address derivation type.
  @$pb.TagNumber(9)
  DerivationType get derivation => $_getN(8);
  @$pb.TagNumber(9)
  set derivation(DerivationType value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDerivation() => $_has(8);
  @$pb.TagNumber(9)
  void clearDerivation() => $_clearField(9);

  /// Public key secp256k1 extended
  @$pb.TagNumber(10)
  $core.List<$core.int> get publicKey => $_getN(9);
  @$pb.TagNumber(10)
  set publicKey($core.List<$core.int> value) => $_setBytes(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPublicKey() => $_has(9);
  @$pb.TagNumber(10)
  void clearPublicKey() => $_clearField(10);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? json,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (json != null) result.json = json;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  SigningOutput._();

  factory SigningOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Filecoin.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'json')
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningOutput copyWith(void Function(SigningOutput) updates) =>
      super.copyWith((message) => updates(message as SigningOutput))
          as SigningOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningOutput create() => SigningOutput._();
  @$core.override
  SigningOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningOutput>(create);
  static SigningOutput? _defaultInstance;

  /// Resulting transaction, in JSON.
  @$pb.TagNumber(1)
  $core.String get json => $_getSZ(0);
  @$pb.TagNumber(1)
  set json($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearJson() => $_clearField(1);

  /// Error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(2)
  $0.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.SigningError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  /// Error description
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
