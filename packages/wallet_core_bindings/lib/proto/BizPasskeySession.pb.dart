// This is a generated file - do not edit.
//
// Generated from BizPasskeySession.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class EncodingHashParams extends $pb.GeneratedMessage {
  factory EncodingHashParams({
    $core.List<$core.int>? chainId,
    $core.String? codeAddress,
    $core.String? codeName,
    $core.String? codeVersion,
    $core.String? typeHash,
    $core.String? domainSeparatorHash,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (codeAddress != null) result.codeAddress = codeAddress;
    if (codeName != null) result.codeName = codeName;
    if (codeVersion != null) result.codeVersion = codeVersion;
    if (typeHash != null) result.typeHash = typeHash;
    if (domainSeparatorHash != null)
      result.domainSeparatorHash = domainSeparatorHash;
    return result;
  }

  EncodingHashParams._();

  factory EncodingHashParams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EncodingHashParams.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EncodingHashParams',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BizPasskeySession.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'chainId', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'codeAddress')
    ..aOS(3, _omitFieldNames ? '' : 'codeName')
    ..aOS(4, _omitFieldNames ? '' : 'codeVersion')
    ..aOS(5, _omitFieldNames ? '' : 'typeHash')
    ..aOS(6, _omitFieldNames ? '' : 'domainSeparatorHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncodingHashParams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EncodingHashParams copyWith(void Function(EncodingHashParams) updates) =>
      super.copyWith((message) => updates(message as EncodingHashParams))
          as EncodingHashParams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EncodingHashParams create() => EncodingHashParams._();
  @$core.override
  EncodingHashParams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EncodingHashParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EncodingHashParams>(create);
  static EncodingHashParams? _defaultInstance;

  /// Chain identifier (uint256, serialized big endian).
  @$pb.TagNumber(1)
  $core.List<$core.int> get chainId => $_getN(0);
  @$pb.TagNumber(1)
  set chainId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// The address of the smart contract wallet.
  @$pb.TagNumber(2)
  $core.String get codeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set codeAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCodeAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCodeAddress() => $_clearField(2);

  /// The name of the smart contract wallet.
  @$pb.TagNumber(3)
  $core.String get codeName => $_getSZ(2);
  @$pb.TagNumber(3)
  set codeName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCodeName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCodeName() => $_clearField(3);

  /// The version of the smart contract wallet.
  @$pb.TagNumber(4)
  $core.String get codeVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set codeVersion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCodeVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearCodeVersion() => $_clearField(4);

  /// The type hash of the smart contract wallet.
  @$pb.TagNumber(5)
  $core.String get typeHash => $_getSZ(4);
  @$pb.TagNumber(5)
  set typeHash($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTypeHash() => $_has(4);
  @$pb.TagNumber(5)
  void clearTypeHash() => $_clearField(5);

  /// The domain separator hash of the smart contract wallet.
  @$pb.TagNumber(6)
  $core.String get domainSeparatorHash => $_getSZ(5);
  @$pb.TagNumber(6)
  set domainSeparatorHash($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDomainSeparatorHash() => $_has(5);
  @$pb.TagNumber(6)
  void clearDomainSeparatorHash() => $_clearField(6);
}

class Execution extends $pb.GeneratedMessage {
  factory Execution({
    $core.String? address,
    $core.List<$core.int>? amount,
    $core.List<$core.int>? payload,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (amount != null) result.amount = amount;
    if (payload != null) result.payload = payload;
    return result;
  }

  Execution._();

  factory Execution.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Execution.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Execution',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BizPasskeySession.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Execution clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Execution copyWith(void Function(Execution) updates) =>
      super.copyWith((message) => updates(message as Execution)) as Execution;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Execution create() => Execution._();
  @$core.override
  Execution createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Execution getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Execution>(create);
  static Execution? _defaultInstance;

  /// Recipient addresses.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// Amounts to send in wei (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Contract call payloads data
  @$pb.TagNumber(3)
  $core.List<$core.int> get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => $_clearField(3);
}

class ExecuteWithPasskeySessionInput extends $pb.GeneratedMessage {
  factory ExecuteWithPasskeySessionInput({
    $core.Iterable<Execution>? executions,
    $fixnum.Int64? validAfter,
    $fixnum.Int64? validUntil,
    $core.List<$core.int>? passkeySignature,
  }) {
    final result = create();
    if (executions != null) result.executions.addAll(executions);
    if (validAfter != null) result.validAfter = validAfter;
    if (validUntil != null) result.validUntil = validUntil;
    if (passkeySignature != null) result.passkeySignature = passkeySignature;
    return result;
  }

  ExecuteWithPasskeySessionInput._();

  factory ExecuteWithPasskeySessionInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecuteWithPasskeySessionInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecuteWithPasskeySessionInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BizPasskeySession.Proto'),
      createEmptyInstance: create)
    ..pPM<Execution>(1, _omitFieldNames ? '' : 'executions',
        subBuilder: Execution.create)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'validAfter', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'validUntil', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'passkeySignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteWithPasskeySessionInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteWithPasskeySessionInput copyWith(
          void Function(ExecuteWithPasskeySessionInput) updates) =>
      super.copyWith(
              (message) => updates(message as ExecuteWithPasskeySessionInput))
          as ExecuteWithPasskeySessionInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteWithPasskeySessionInput create() =>
      ExecuteWithPasskeySessionInput._();
  @$core.override
  ExecuteWithPasskeySessionInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecuteWithPasskeySessionInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecuteWithPasskeySessionInput>(create);
  static ExecuteWithPasskeySessionInput? _defaultInstance;

  /// Batched executions to be executed on the smart contract wallet.
  @$pb.TagNumber(1)
  $pb.PbList<Execution> get executions => $_getList(0);

  /// Transaction valid after this timestamp.
  @$pb.TagNumber(2)
  $fixnum.Int64 get validAfter => $_getI64(1);
  @$pb.TagNumber(2)
  set validAfter($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidAfter() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidAfter() => $_clearField(2);

  /// Transaction valid until this timestamp.
  @$pb.TagNumber(3)
  $fixnum.Int64 get validUntil => $_getI64(2);
  @$pb.TagNumber(3)
  set validUntil($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValidUntil() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidUntil() => $_clearField(3);

  /// Passkey session signature.
  @$pb.TagNumber(4)
  $core.List<$core.int> get passkeySignature => $_getN(3);
  @$pb.TagNumber(4)
  set passkeySignature($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPasskeySignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearPasskeySignature() => $_clearField(4);
}

class ExecuteWithSignatureInput extends $pb.GeneratedMessage {
  factory ExecuteWithSignatureInput({
    $core.Iterable<Execution>? executions,
    $core.List<$core.int>? privateKey,
    $core.List<$core.int>? nonce,
    $fixnum.Int64? validAfter,
    $fixnum.Int64? validUntil,
    EncodingHashParams? encodingHashParams,
  }) {
    final result = create();
    if (executions != null) result.executions.addAll(executions);
    if (privateKey != null) result.privateKey = privateKey;
    if (nonce != null) result.nonce = nonce;
    if (validAfter != null) result.validAfter = validAfter;
    if (validUntil != null) result.validUntil = validUntil;
    if (encodingHashParams != null)
      result.encodingHashParams = encodingHashParams;
    return result;
  }

  ExecuteWithSignatureInput._();

  factory ExecuteWithSignatureInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecuteWithSignatureInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecuteWithSignatureInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BizPasskeySession.Proto'),
      createEmptyInstance: create)
    ..pPM<Execution>(1, _omitFieldNames ? '' : 'executions',
        subBuilder: Execution.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'validAfter', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'validUntil', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<EncodingHashParams>(6, _omitFieldNames ? '' : 'encodingHashParams',
        subBuilder: EncodingHashParams.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteWithSignatureInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteWithSignatureInput copyWith(
          void Function(ExecuteWithSignatureInput) updates) =>
      super.copyWith((message) => updates(message as ExecuteWithSignatureInput))
          as ExecuteWithSignatureInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteWithSignatureInput create() => ExecuteWithSignatureInput._();
  @$core.override
  ExecuteWithSignatureInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecuteWithSignatureInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecuteWithSignatureInput>(create);
  static ExecuteWithSignatureInput? _defaultInstance;

  /// Batched executions to be executed on the smart contract wallet.
  @$pb.TagNumber(1)
  $pb.PbList<Execution> get executions => $_getList(0);

  /// Private key to sign the `BizPasskeySession.executeWithSignature` function call.
  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => $_clearField(2);

  /// BizGuard nonce (uint256, serialized big endian).
  /// Used to sign the `BizPasskeySession.executeWithSignature` function call.
  @$pb.TagNumber(3)
  $core.List<$core.int> get nonce => $_getN(2);
  @$pb.TagNumber(3)
  set nonce($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearNonce() => $_clearField(3);

  /// Transaction valid after this timestamp in seconds.
  @$pb.TagNumber(4)
  $fixnum.Int64 get validAfter => $_getI64(3);
  @$pb.TagNumber(4)
  set validAfter($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValidAfter() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidAfter() => $_clearField(4);

  /// Transaction valid until this timestamp in seconds.
  @$pb.TagNumber(5)
  $fixnum.Int64 get validUntil => $_getI64(4);
  @$pb.TagNumber(5)
  set validUntil($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasValidUntil() => $_has(4);
  @$pb.TagNumber(5)
  void clearValidUntil() => $_clearField(5);

  /// Parameters used to generate an encoded Biz-specific hash to be signed.
  @$pb.TagNumber(6)
  EncodingHashParams get encodingHashParams => $_getN(5);
  @$pb.TagNumber(6)
  set encodingHashParams(EncodingHashParams value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEncodingHashParams() => $_has(5);
  @$pb.TagNumber(6)
  void clearEncodingHashParams() => $_clearField(6);
  @$pb.TagNumber(6)
  EncodingHashParams ensureEncodingHashParams() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
