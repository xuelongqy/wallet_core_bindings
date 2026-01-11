// This is a generated file - do not edit.
//
// Generated from VeChain.proto.

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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// A clause, between a sender and destination
class Clause extends $pb.GeneratedMessage {
  factory Clause({
    $core.String? to,
    $core.List<$core.int>? value,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (to != null) result.to = to;
    if (value != null) result.value = value;
    if (data != null) result.data = data;
    return result;
  }

  Clause._();

  factory Clause.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Clause.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Clause',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.VeChain.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Clause clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Clause copyWith(void Function(Clause) updates) =>
      super.copyWith((message) => updates(message as Clause)) as Clause;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Clause create() => Clause._();
  @$core.override
  Clause createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Clause getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Clause>(create);
  static Clause? _defaultInstance;

  /// / Recipient address.
  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => $_clearField(1);

  /// / Transaction amount (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  /// / Payload data.
  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.int? chainTag,
    $fixnum.Int64? blockRef,
    $core.int? expiration,
    $core.Iterable<Clause>? clauses,
    $core.int? gasPriceCoef,
    $fixnum.Int64? gas,
    $core.List<$core.int>? dependsOn,
    $fixnum.Int64? nonce,
    $core.List<$core.int>? privateKey,
  }) {
    final result = create();
    if (chainTag != null) result.chainTag = chainTag;
    if (blockRef != null) result.blockRef = blockRef;
    if (expiration != null) result.expiration = expiration;
    if (clauses != null) result.clauses.addAll(clauses);
    if (gasPriceCoef != null) result.gasPriceCoef = gasPriceCoef;
    if (gas != null) result.gas = gas;
    if (dependsOn != null) result.dependsOn = dependsOn;
    if (nonce != null) result.nonce = nonce;
    if (privateKey != null) result.privateKey = privateKey;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.VeChain.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'chainTag', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'blockRef', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'expiration', fieldType: $pb.PbFieldType.OU3)
    ..pPM<Clause>(4, _omitFieldNames ? '' : 'clauses',
        subBuilder: Clause.create)
    ..aI(5, _omitFieldNames ? '' : 'gasPriceCoef',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'gas', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'dependsOn', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
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

  /// / Last byte of the genesis block ID which is used to identify a blockchain to prevent the cross-chain replay attack.
  @$pb.TagNumber(1)
  $core.int get chainTag => $_getIZ(0);
  @$pb.TagNumber(1)
  set chainTag($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainTag() => $_clearField(1);

  /// / Reference to a specific block.
  @$pb.TagNumber(2)
  $fixnum.Int64 get blockRef => $_getI64(1);
  @$pb.TagNumber(2)
  set blockRef($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBlockRef() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockRef() => $_clearField(2);

  /// / How long, in terms of the number of blocks, the transaction will be allowed to be mined in VeChainThor.
  @$pb.TagNumber(3)
  $core.int get expiration => $_getIZ(2);
  @$pb.TagNumber(3)
  set expiration($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiration() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiration() => $_clearField(3);

  /// / An array of Clause objects.
  /// /
  /// / Each clause contains fields To, Value and Data to enable a single transaction to carry multiple tasks issued
  /// / by the transaction sender.
  @$pb.TagNumber(4)
  $pb.PbList<Clause> get clauses => $_getList(3);

  /// / Coefficient used to calculate the gas price for the transaction.
  @$pb.TagNumber(5)
  $core.int get gasPriceCoef => $_getIZ(4);
  @$pb.TagNumber(5)
  set gasPriceCoef($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGasPriceCoef() => $_has(4);
  @$pb.TagNumber(5)
  void clearGasPriceCoef() => $_clearField(5);

  /// / Maximum amount of gas allowed to pay for the transaction.
  @$pb.TagNumber(6)
  $fixnum.Int64 get gas => $_getI64(5);
  @$pb.TagNumber(6)
  set gas($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGas() => $_has(5);
  @$pb.TagNumber(6)
  void clearGas() => $_clearField(6);

  /// / ID of the transaction on which the current transaction depends.
  @$pb.TagNumber(7)
  $core.List<$core.int> get dependsOn => $_getN(6);
  @$pb.TagNumber(7)
  set dependsOn($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDependsOn() => $_has(6);
  @$pb.TagNumber(7)
  void clearDependsOn() => $_clearField(7);

  /// / Number set by user.
  @$pb.TagNumber(8)
  $fixnum.Int64 get nonce => $_getI64(7);
  @$pb.TagNumber(8)
  set nonce($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNonce() => $_has(7);
  @$pb.TagNumber(8)
  void clearNonce() => $_clearField(8);

  /// / The secret private key used for signing (32 bytes).
  @$pb.TagNumber(9)
  $core.List<$core.int> get privateKey => $_getN(8);
  @$pb.TagNumber(9)
  set privateKey($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPrivateKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrivateKey() => $_clearField(9);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (signature != null) result.signature = signature;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.VeChain.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(3, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
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

  /// Signed and encoded transaction bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// Signature.
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// error code description
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
