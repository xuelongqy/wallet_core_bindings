// This is a generated file - do not edit.
//
// Generated from Ontology.proto.

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

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.String? contract,
    $core.String? method,
    $core.List<$core.int>? ownerPrivateKey,
    $core.String? toAddress,
    $fixnum.Int64? amount,
    $core.List<$core.int>? payerPrivateKey,
    $fixnum.Int64? gasPrice,
    $fixnum.Int64? gasLimit,
    $core.String? queryAddress,
    $core.int? nonce,
    $core.String? ownerAddress,
    $core.String? payerAddress,
  }) {
    final result = create();
    if (contract != null) result.contract = contract;
    if (method != null) result.method = method;
    if (ownerPrivateKey != null) result.ownerPrivateKey = ownerPrivateKey;
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    if (payerPrivateKey != null) result.payerPrivateKey = payerPrivateKey;
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (queryAddress != null) result.queryAddress = queryAddress;
    if (nonce != null) result.nonce = nonce;
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (payerAddress != null) result.payerAddress = payerAddress;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ontology.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'contract')
    ..aOS(2, _omitFieldNames ? '' : 'method')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'ownerPrivateKey', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'toAddress')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'payerPrivateKey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'gasLimit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : 'queryAddress')
    ..aI(10, _omitFieldNames ? '' : 'nonce', fieldType: $pb.PbFieldType.OU3)
    ..aOS(11, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(12, _omitFieldNames ? '' : 'payerAddress')
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

  /// Contract ID, e.g. "ONT"
  @$pb.TagNumber(1)
  $core.String get contract => $_getSZ(0);
  @$pb.TagNumber(1)
  set contract($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContract() => $_has(0);
  @$pb.TagNumber(1)
  void clearContract() => $_clearField(1);

  /// Method, e.g. "transfer"
  @$pb.TagNumber(2)
  $core.String get method => $_getSZ(1);
  @$pb.TagNumber(2)
  set method($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMethod() => $_has(1);
  @$pb.TagNumber(2)
  void clearMethod() => $_clearField(2);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(3)
  $core.List<$core.int> get ownerPrivateKey => $_getN(2);
  @$pb.TagNumber(3)
  set ownerPrivateKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOwnerPrivateKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerPrivateKey() => $_clearField(3);

  /// base58 encode address string (160-bit number)
  @$pb.TagNumber(4)
  $core.String get toAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set toAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearToAddress() => $_clearField(4);

  /// Transfer amount
  @$pb.TagNumber(5)
  $fixnum.Int64 get amount => $_getI64(4);
  @$pb.TagNumber(5)
  set amount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => $_clearField(5);

  /// Private key of the payer
  @$pb.TagNumber(6)
  $core.List<$core.int> get payerPrivateKey => $_getN(5);
  @$pb.TagNumber(6)
  set payerPrivateKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPayerPrivateKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayerPrivateKey() => $_clearField(6);

  /// Gas price
  @$pb.TagNumber(7)
  $fixnum.Int64 get gasPrice => $_getI64(6);
  @$pb.TagNumber(7)
  set gasPrice($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGasPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearGasPrice() => $_clearField(7);

  /// Limit for gas used
  @$pb.TagNumber(8)
  $fixnum.Int64 get gasLimit => $_getI64(7);
  @$pb.TagNumber(8)
  set gasLimit($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGasLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearGasLimit() => $_clearField(8);

  /// base58 encode address string (160-bit number)
  @$pb.TagNumber(9)
  $core.String get queryAddress => $_getSZ(8);
  @$pb.TagNumber(9)
  set queryAddress($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasQueryAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearQueryAddress() => $_clearField(9);

  /// Nonce (should be larger than in the last transaction of the account)
  @$pb.TagNumber(10)
  $core.int get nonce => $_getIZ(9);
  @$pb.TagNumber(10)
  set nonce($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasNonce() => $_has(9);
  @$pb.TagNumber(10)
  void clearNonce() => $_clearField(10);

  /// base58 encode address string (160-bit number)
  @$pb.TagNumber(11)
  $core.String get ownerAddress => $_getSZ(10);
  @$pb.TagNumber(11)
  set ownerAddress($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOwnerAddress() => $_has(10);
  @$pb.TagNumber(11)
  void clearOwnerAddress() => $_clearField(11);

  /// base58 encode address string (160-bit number)
  @$pb.TagNumber(12)
  $core.String get payerAddress => $_getSZ(11);
  @$pb.TagNumber(12)
  set payerAddress($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPayerAddress() => $_has(11);
  @$pb.TagNumber(12)
  void clearPayerAddress() => $_clearField(12);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ontology.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
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

  /// Signed and encoded transaction bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(2)
  $0.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.SigningError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  /// error code description
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
