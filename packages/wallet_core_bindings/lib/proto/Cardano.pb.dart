// This is a generated file - do not edit.
//
// Generated from Cardano.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Cardano.pbenum.dart';
import 'Common.pbenum.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Cardano.pbenum.dart';

/// A transaction output that can be used as input
class OutPoint extends $pb.GeneratedMessage {
  factory OutPoint({
    $core.List<$core.int>? txHash,
    $fixnum.Int64? outputIndex,
  }) {
    final result = create();
    if (txHash != null) result.txHash = txHash;
    if (outputIndex != null) result.outputIndex = outputIndex;
    return result;
  }

  OutPoint._();

  factory OutPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutPoint',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'txHash', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'outputIndex', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutPoint copyWith(void Function(OutPoint) updates) =>
      super.copyWith((message) => updates(message as OutPoint)) as OutPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutPoint create() => OutPoint._();
  @$core.override
  OutPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutPoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutPoint>(create);
  static OutPoint? _defaultInstance;

  /// The transaction ID
  @$pb.TagNumber(1)
  $core.List<$core.int> get txHash => $_getN(0);
  @$pb.TagNumber(1)
  set txHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  /// The index of this output within the transaction
  @$pb.TagNumber(2)
  $fixnum.Int64 get outputIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set outputIndex($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOutputIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutputIndex() => $_clearField(2);
}

/// Represents a token and an amount. Token is identified by PolicyID and name.
class TokenAmount extends $pb.GeneratedMessage {
  factory TokenAmount({
    $core.String? policyId,
    $core.String? assetName,
    $core.List<$core.int>? amount,
    $core.String? assetNameHex,
  }) {
    final result = create();
    if (policyId != null) result.policyId = policyId;
    if (assetName != null) result.assetName = assetName;
    if (amount != null) result.amount = amount;
    if (assetNameHex != null) result.assetNameHex = assetNameHex;
    return result;
  }

  TokenAmount._();

  factory TokenAmount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenAmount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenAmount',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'policyId')
    ..aOS(2, _omitFieldNames ? '' : 'assetName')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'assetNameHex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenAmount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenAmount copyWith(void Function(TokenAmount) updates) =>
      super.copyWith((message) => updates(message as TokenAmount))
          as TokenAmount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenAmount create() => TokenAmount._();
  @$core.override
  TokenAmount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenAmount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenAmount>(create);
  static TokenAmount? _defaultInstance;

  /// Policy ID of the token, as hex string (28x2 digits)
  @$pb.TagNumber(1)
  $core.String get policyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set policyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPolicyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicyId() => $_clearField(1);

  /// The name of the asset (within the policy)
  @$pb.TagNumber(2)
  $core.String get assetName => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAssetName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetName() => $_clearField(2);

  /// The amount (uint256, serialized big endian)
  @$pb.TagNumber(3)
  $core.List<$core.int> get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// The name of the asset (hex encoded). Ignored if `asset_name` is set
  @$pb.TagNumber(4)
  $core.String get assetNameHex => $_getSZ(3);
  @$pb.TagNumber(4)
  set assetNameHex($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAssetNameHex() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssetNameHex() => $_clearField(4);
}

/// One input for a transaction
class TxInput extends $pb.GeneratedMessage {
  factory TxInput({
    OutPoint? outPoint,
    $core.String? address,
    $fixnum.Int64? amount,
    $core.Iterable<TokenAmount>? tokenAmount,
  }) {
    final result = create();
    if (outPoint != null) result.outPoint = outPoint;
    if (address != null) result.address = address;
    if (amount != null) result.amount = amount;
    if (tokenAmount != null) result.tokenAmount.addAll(tokenAmount);
    return result;
  }

  TxInput._();

  factory TxInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TxInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOM<OutPoint>(1, _omitFieldNames ? '' : 'outPoint',
        subBuilder: OutPoint.create)
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<TokenAmount>(4, _omitFieldNames ? '' : 'tokenAmount',
        subBuilder: TokenAmount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxInput copyWith(void Function(TxInput) updates) =>
      super.copyWith((message) => updates(message as TxInput)) as TxInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxInput create() => TxInput._();
  @$core.override
  TxInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TxInput getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxInput>(create);
  static TxInput? _defaultInstance;

  /// The UTXO
  @$pb.TagNumber(1)
  OutPoint get outPoint => $_getN(0);
  @$pb.TagNumber(1)
  set outPoint(OutPoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutPoint() => $_clearField(1);
  @$pb.TagNumber(1)
  OutPoint ensureOutPoint() => $_ensure(0);

  /// The owner address (string)
  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  /// ADA amount in the UTXO
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// optional token amounts in the UTXO
  @$pb.TagNumber(4)
  $pb.PbList<TokenAmount> get tokenAmount => $_getList(3);
}

/// One output for a transaction
class TxOutput extends $pb.GeneratedMessage {
  factory TxOutput({
    $core.String? address,
    $fixnum.Int64? amount,
    $core.Iterable<TokenAmount>? tokenAmount,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (amount != null) result.amount = amount;
    if (tokenAmount != null) result.tokenAmount.addAll(tokenAmount);
    return result;
  }

  TxOutput._();

  factory TxOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TxOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<TokenAmount>(3, _omitFieldNames ? '' : 'tokenAmount',
        subBuilder: TokenAmount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TxOutput copyWith(void Function(TxOutput) updates) =>
      super.copyWith((message) => updates(message as TxOutput)) as TxOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxOutput create() => TxOutput._();
  @$core.override
  TxOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TxOutput getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxOutput>(create);
  static TxOutput? _defaultInstance;

  /// Destination address (string)
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// ADA amount
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// optional token amounts
  @$pb.TagNumber(3)
  $pb.PbList<TokenAmount> get tokenAmount => $_getList(2);
}

/// Collection of tokens with amount
class TokenBundle extends $pb.GeneratedMessage {
  factory TokenBundle({
    $core.Iterable<TokenAmount>? token,
  }) {
    final result = create();
    if (token != null) result.token.addAll(token);
    return result;
  }

  TokenBundle._();

  factory TokenBundle.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenBundle.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenBundle',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..pPM<TokenAmount>(1, _omitFieldNames ? '' : 'token',
        subBuilder: TokenAmount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenBundle clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenBundle copyWith(void Function(TokenBundle) updates) =>
      super.copyWith((message) => updates(message as TokenBundle))
          as TokenBundle;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenBundle create() => TokenBundle._();
  @$core.override
  TokenBundle createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenBundle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenBundle>(create);
  static TokenBundle? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TokenAmount> get token => $_getList(0);
}

/// Message for simple Transfer tx
class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.String? toAddress,
    $core.String? changeAddress,
    $fixnum.Int64? amount,
    TokenBundle? tokenAmount,
    $core.bool? useMaxAmount,
    $fixnum.Int64? forceFee,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (changeAddress != null) result.changeAddress = changeAddress;
    if (amount != null) result.amount = amount;
    if (tokenAmount != null) result.tokenAmount = tokenAmount;
    if (useMaxAmount != null) result.useMaxAmount = useMaxAmount;
    if (forceFee != null) result.forceFee = forceFee;
    return result;
  }

  Transfer._();

  factory Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..aOS(2, _omitFieldNames ? '' : 'changeAddress')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<TokenBundle>(4, _omitFieldNames ? '' : 'tokenAmount',
        subBuilder: TokenBundle.create)
    ..aOB(5, _omitFieldNames ? '' : 'useMaxAmount')
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'forceFee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transfer copyWith(void Function(Transfer) updates) =>
      super.copyWith((message) => updates(message as Transfer)) as Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  @$core.override
  Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  /// Destination address as string
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Change address
  @$pb.TagNumber(2)
  $core.String get changeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChangeAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeAddress() => $_clearField(2);

  /// Requested ADA amount to be transferred. Output can be different only in use_max_amount case.
  /// Note that Cardano has a minimum amount per UTXO, see TWCardanoMinAdaAmount.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// Optional token(s) to be transferred
  /// Currently only one token type to be transferred per transaction is supported
  @$pb.TagNumber(4)
  TokenBundle get tokenAmount => $_getN(3);
  @$pb.TagNumber(4)
  set tokenAmount(TokenBundle value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTokenAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenAmount() => $_clearField(4);
  @$pb.TagNumber(4)
  TokenBundle ensureTokenAmount() => $_ensure(3);

  /// Request max amount option. If set, tx will send all possible amounts from all inputs, including all tokens; there will be no change; requested amount and token_amount is disregarded in this case.
  @$pb.TagNumber(5)
  $core.bool get useMaxAmount => $_getBF(4);
  @$pb.TagNumber(5)
  set useMaxAmount($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUseMaxAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearUseMaxAmount() => $_clearField(5);

  /// Optional fee overriding. If left to 0, optimal fee will be calculated. If set, exactly this value will be used as fee.
  /// Use it with care, it may result in underfunded or wasteful fee.
  @$pb.TagNumber(6)
  $fixnum.Int64 get forceFee => $_getI64(5);
  @$pb.TagNumber(6)
  set forceFee($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasForceFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearForceFee() => $_clearField(6);
}

/// Register a staking key for the account, prerequisite for Staking.
/// Note: staking messages are typically used with a 1-output-to-self transaction.
class RegisterStakingKey extends $pb.GeneratedMessage {
  factory RegisterStakingKey({
    $core.String? stakingAddress,
    $fixnum.Int64? depositAmount,
  }) {
    final result = create();
    if (stakingAddress != null) result.stakingAddress = stakingAddress;
    if (depositAmount != null) result.depositAmount = depositAmount;
    return result;
  }

  RegisterStakingKey._();

  factory RegisterStakingKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterStakingKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterStakingKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stakingAddress')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'depositAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterStakingKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterStakingKey copyWith(void Function(RegisterStakingKey) updates) =>
      super.copyWith((message) => updates(message as RegisterStakingKey))
          as RegisterStakingKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterStakingKey create() => RegisterStakingKey._();
  @$core.override
  RegisterStakingKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterStakingKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterStakingKey>(create);
  static RegisterStakingKey? _defaultInstance;

  /// Staking address (as string)
  @$pb.TagNumber(1)
  $core.String get stakingAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set stakingAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStakingAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingAddress() => $_clearField(1);

  /// Amount deposited in this TX. Should be 2 ADA (2000000). If not set correctly, TX will be rejected. See also Delegate.deposit_amount.
  @$pb.TagNumber(2)
  $fixnum.Int64 get depositAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set depositAmount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDepositAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepositAmount() => $_clearField(2);
}

/// Deregister staking key. can be done when staking is stopped completely. The Staking deposit is returned at this time.
class DeregisterStakingKey extends $pb.GeneratedMessage {
  factory DeregisterStakingKey({
    $core.String? stakingAddress,
    $fixnum.Int64? undepositAmount,
  }) {
    final result = create();
    if (stakingAddress != null) result.stakingAddress = stakingAddress;
    if (undepositAmount != null) result.undepositAmount = undepositAmount;
    return result;
  }

  DeregisterStakingKey._();

  factory DeregisterStakingKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeregisterStakingKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeregisterStakingKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stakingAddress')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'undepositAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeregisterStakingKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeregisterStakingKey copyWith(void Function(DeregisterStakingKey) updates) =>
      super.copyWith((message) => updates(message as DeregisterStakingKey))
          as DeregisterStakingKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeregisterStakingKey create() => DeregisterStakingKey._();
  @$core.override
  DeregisterStakingKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeregisterStakingKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeregisterStakingKey>(create);
  static DeregisterStakingKey? _defaultInstance;

  /// Staking address (as string)
  @$pb.TagNumber(1)
  $core.String get stakingAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set stakingAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStakingAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingAddress() => $_clearField(1);

  /// Amount undeposited in this TX. Should be 2 ADA (2000000). If not set correctly, TX will be rejected. See also RegisterStakingKey.deposit_amount.
  @$pb.TagNumber(2)
  $fixnum.Int64 get undepositAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set undepositAmount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUndepositAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearUndepositAmount() => $_clearField(2);
}

/// Vote delegation to a specific DRep or always abstain or no confidence
class VoteDelegation extends $pb.GeneratedMessage {
  factory VoteDelegation({
    $core.String? stakingAddress,
    VoteDelegation_DRepType? drepType,
    $core.String? drepId,
  }) {
    final result = create();
    if (stakingAddress != null) result.stakingAddress = stakingAddress;
    if (drepType != null) result.drepType = drepType;
    if (drepId != null) result.drepId = drepId;
    return result;
  }

  VoteDelegation._();

  factory VoteDelegation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoteDelegation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoteDelegation',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stakingAddress')
    ..aE<VoteDelegation_DRepType>(2, _omitFieldNames ? '' : 'drepType',
        enumValues: VoteDelegation_DRepType.values)
    ..aOS(3, _omitFieldNames ? '' : 'drepId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteDelegation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteDelegation copyWith(void Function(VoteDelegation) updates) =>
      super.copyWith((message) => updates(message as VoteDelegation))
          as VoteDelegation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoteDelegation create() => VoteDelegation._();
  @$core.override
  VoteDelegation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VoteDelegation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteDelegation>(create);
  static VoteDelegation? _defaultInstance;

  /// Staking address (as string)
  @$pb.TagNumber(1)
  $core.String get stakingAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set stakingAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStakingAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingAddress() => $_clearField(1);

  /// DRep type
  @$pb.TagNumber(2)
  VoteDelegation_DRepType get drepType => $_getN(1);
  @$pb.TagNumber(2)
  set drepType(VoteDelegation_DRepType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDrepType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrepType() => $_clearField(2);

  /// DRep ID (only used when drep_type is DREP_ID)
  @$pb.TagNumber(3)
  $core.String get drepId => $_getSZ(2);
  @$pb.TagNumber(3)
  set drepId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDrepId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDrepId() => $_clearField(3);
}

/// Delegate funds in this account to a specified staking pool.
class Delegate extends $pb.GeneratedMessage {
  factory Delegate({
    $core.String? stakingAddress,
    $core.List<$core.int>? poolId,
    $fixnum.Int64? depositAmount,
  }) {
    final result = create();
    if (stakingAddress != null) result.stakingAddress = stakingAddress;
    if (poolId != null) result.poolId = poolId;
    if (depositAmount != null) result.depositAmount = depositAmount;
    return result;
  }

  Delegate._();

  factory Delegate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Delegate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Delegate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stakingAddress')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'poolId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'depositAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Delegate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Delegate copyWith(void Function(Delegate) updates) =>
      super.copyWith((message) => updates(message as Delegate)) as Delegate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Delegate create() => Delegate._();
  @$core.override
  Delegate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Delegate getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Delegate>(create);
  static Delegate? _defaultInstance;

  /// Staking address (as string)
  @$pb.TagNumber(1)
  $core.String get stakingAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set stakingAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStakingAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingAddress() => $_clearField(1);

  /// PoolID of staking pool
  @$pb.TagNumber(2)
  $core.List<$core.int> get poolId => $_getN(1);
  @$pb.TagNumber(2)
  set poolId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPoolId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoolId() => $_clearField(2);

  /// Amount deposited in this TX. Should be 0. If not set correctly, TX will be rejected. See also RegisterStakingKey.deposit_amount.
  @$pb.TagNumber(3)
  $fixnum.Int64 get depositAmount => $_getI64(2);
  @$pb.TagNumber(3)
  set depositAmount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDepositAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepositAmount() => $_clearField(3);
}

/// Withdraw earned staking reward.
class Withdraw extends $pb.GeneratedMessage {
  factory Withdraw({
    $core.String? stakingAddress,
    $fixnum.Int64? withdrawAmount,
  }) {
    final result = create();
    if (stakingAddress != null) result.stakingAddress = stakingAddress;
    if (withdrawAmount != null) result.withdrawAmount = withdrawAmount;
    return result;
  }

  Withdraw._();

  factory Withdraw.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Withdraw.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Withdraw',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'stakingAddress')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'withdrawAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Withdraw clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Withdraw copyWith(void Function(Withdraw) updates) =>
      super.copyWith((message) => updates(message as Withdraw)) as Withdraw;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Withdraw create() => Withdraw._();
  @$core.override
  Withdraw createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Withdraw getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Withdraw>(create);
  static Withdraw? _defaultInstance;

  /// Staking address (as string)
  @$pb.TagNumber(1)
  $core.String get stakingAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set stakingAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStakingAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingAddress() => $_clearField(1);

  /// Withdrawal amount. Should match the real value of the earned reward.
  @$pb.TagNumber(2)
  $fixnum.Int64 get withdrawAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set withdrawAmount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWithdrawAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearWithdrawAmount() => $_clearField(2);
}

/// Describes a preliminary transaction plan.
class TransactionPlan extends $pb.GeneratedMessage {
  factory TransactionPlan({
    $fixnum.Int64? availableAmount,
    $fixnum.Int64? amount,
    $fixnum.Int64? fee,
    $fixnum.Int64? change,
    $core.Iterable<TokenAmount>? availableTokens,
    $core.Iterable<TokenAmount>? outputTokens,
    $core.Iterable<TokenAmount>? changeTokens,
    $core.Iterable<TxInput>? utxos,
    $0.SigningError? error,
    $fixnum.Int64? deposit,
    $fixnum.Int64? undeposit,
    $core.Iterable<TxOutput>? extraOutputs,
  }) {
    final result = create();
    if (availableAmount != null) result.availableAmount = availableAmount;
    if (amount != null) result.amount = amount;
    if (fee != null) result.fee = fee;
    if (change != null) result.change = change;
    if (availableTokens != null) result.availableTokens.addAll(availableTokens);
    if (outputTokens != null) result.outputTokens.addAll(outputTokens);
    if (changeTokens != null) result.changeTokens.addAll(changeTokens);
    if (utxos != null) result.utxos.addAll(utxos);
    if (error != null) result.error = error;
    if (deposit != null) result.deposit = deposit;
    if (undeposit != null) result.undeposit = undeposit;
    if (extraOutputs != null) result.extraOutputs.addAll(extraOutputs);
    return result;
  }

  TransactionPlan._();

  factory TransactionPlan.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionPlan.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionPlan',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'availableAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'change', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<TokenAmount>(5, _omitFieldNames ? '' : 'availableTokens',
        subBuilder: TokenAmount.create)
    ..pPM<TokenAmount>(6, _omitFieldNames ? '' : 'outputTokens',
        subBuilder: TokenAmount.create)
    ..pPM<TokenAmount>(7, _omitFieldNames ? '' : 'changeTokens',
        subBuilder: TokenAmount.create)
    ..pPM<TxInput>(8, _omitFieldNames ? '' : 'utxos',
        subBuilder: TxInput.create)
    ..aE<$0.SigningError>(9, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'deposit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'undeposit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<TxOutput>(12, _omitFieldNames ? '' : 'extraOutputs',
        subBuilder: TxOutput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionPlan clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionPlan copyWith(void Function(TransactionPlan) updates) =>
      super.copyWith((message) => updates(message as TransactionPlan))
          as TransactionPlan;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionPlan create() => TransactionPlan._();
  @$core.override
  TransactionPlan createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionPlan>(create);
  static TransactionPlan? _defaultInstance;

  /// total coins in the utxos
  @$pb.TagNumber(1)
  $fixnum.Int64 get availableAmount => $_getI64(0);
  @$pb.TagNumber(1)
  set availableAmount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAvailableAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvailableAmount() => $_clearField(1);

  /// coins in the output UTXO
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// coin amount deducted as fee
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);

  /// coins in the change UTXO
  @$pb.TagNumber(4)
  $fixnum.Int64 get change => $_getI64(3);
  @$pb.TagNumber(4)
  set change($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChange() => $_has(3);
  @$pb.TagNumber(4)
  void clearChange() => $_clearField(4);

  /// total tokens in the utxos (optional)
  @$pb.TagNumber(5)
  $pb.PbList<TokenAmount> get availableTokens => $_getList(4);

  /// tokens in the output (optional)
  @$pb.TagNumber(6)
  $pb.PbList<TokenAmount> get outputTokens => $_getList(5);

  /// tokens in the change (optional)
  @$pb.TagNumber(7)
  $pb.PbList<TokenAmount> get changeTokens => $_getList(6);

  /// The selected UTXOs, subset ot the input UTXOs
  @$pb.TagNumber(8)
  $pb.PbList<TxInput> get utxos => $_getList(7);

  /// Optional error
  @$pb.TagNumber(9)
  $0.SigningError get error => $_getN(8);
  @$pb.TagNumber(9)
  set error($0.SigningError value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasError() => $_has(8);
  @$pb.TagNumber(9)
  void clearError() => $_clearField(9);

  /// coins deposited (going to deposit) in this TX
  @$pb.TagNumber(10)
  $fixnum.Int64 get deposit => $_getI64(9);
  @$pb.TagNumber(10)
  set deposit($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDeposit() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeposit() => $_clearField(10);

  /// coins undeposited (coming from deposit) in this TX
  @$pb.TagNumber(11)
  $fixnum.Int64 get undeposit => $_getI64(10);
  @$pb.TagNumber(11)
  set undeposit($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUndeposit() => $_has(10);
  @$pb.TagNumber(11)
  void clearUndeposit() => $_clearField(11);

  /// Optional additional destination addresses, additional to first to_address output
  @$pb.TagNumber(12)
  $pb.PbList<TxOutput> get extraOutputs => $_getList(11);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.Iterable<TxInput>? utxos,
    $core.Iterable<$core.List<$core.int>>? privateKey,
    Transfer? transferMessage,
    $fixnum.Int64? ttl,
    TransactionPlan? plan,
    RegisterStakingKey? registerStakingKey,
    Delegate? delegate,
    Withdraw? withdraw,
    DeregisterStakingKey? deregisterStakingKey,
    $core.Iterable<TxOutput>? extraOutputs,
    VoteDelegation? voteDelegation,
  }) {
    final result = create();
    if (utxos != null) result.utxos.addAll(utxos);
    if (privateKey != null) result.privateKey.addAll(privateKey);
    if (transferMessage != null) result.transferMessage = transferMessage;
    if (ttl != null) result.ttl = ttl;
    if (plan != null) result.plan = plan;
    if (registerStakingKey != null)
      result.registerStakingKey = registerStakingKey;
    if (delegate != null) result.delegate = delegate;
    if (withdraw != null) result.withdraw = withdraw;
    if (deregisterStakingKey != null)
      result.deregisterStakingKey = deregisterStakingKey;
    if (extraOutputs != null) result.extraOutputs.addAll(extraOutputs);
    if (voteDelegation != null) result.voteDelegation = voteDelegation;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..pPM<TxInput>(1, _omitFieldNames ? '' : 'utxos',
        subBuilder: TxInput.create)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.PY)
    ..aOM<Transfer>(3, _omitFieldNames ? '' : 'transferMessage',
        subBuilder: Transfer.create)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'ttl', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<TransactionPlan>(5, _omitFieldNames ? '' : 'plan',
        subBuilder: TransactionPlan.create)
    ..aOM<RegisterStakingKey>(6, _omitFieldNames ? '' : 'registerStakingKey',
        subBuilder: RegisterStakingKey.create)
    ..aOM<Delegate>(7, _omitFieldNames ? '' : 'delegate',
        subBuilder: Delegate.create)
    ..aOM<Withdraw>(8, _omitFieldNames ? '' : 'withdraw',
        subBuilder: Withdraw.create)
    ..aOM<DeregisterStakingKey>(
        9, _omitFieldNames ? '' : 'deregisterStakingKey',
        subBuilder: DeregisterStakingKey.create)
    ..pPM<TxOutput>(10, _omitFieldNames ? '' : 'extraOutputs',
        subBuilder: TxOutput.create)
    ..aOM<VoteDelegation>(11, _omitFieldNames ? '' : 'voteDelegation',
        subBuilder: VoteDelegation.create)
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

  /// Available input UTXOs
  @$pb.TagNumber(1)
  $pb.PbList<TxInput> get utxos => $_getList(0);

  /// Available private keys (double extended keys); every input UTXO address should be covered
  /// In case of Plan only, keys should be present, in correct number
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get privateKey => $_getList(1);

  /// Later this can be made oneof if more message types are supported
  @$pb.TagNumber(3)
  Transfer get transferMessage => $_getN(2);
  @$pb.TagNumber(3)
  set transferMessage(Transfer value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  Transfer ensureTransferMessage() => $_ensure(2);

  /// Time-to-live time of the TX
  @$pb.TagNumber(4)
  $fixnum.Int64 get ttl => $_getI64(3);
  @$pb.TagNumber(4)
  set ttl($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTtl() => $_has(3);
  @$pb.TagNumber(4)
  void clearTtl() => $_clearField(4);

  /// Optional plan, if missing it will be computed
  @$pb.TagNumber(5)
  TransactionPlan get plan => $_getN(4);
  @$pb.TagNumber(5)
  set plan(TransactionPlan value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPlan() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlan() => $_clearField(5);
  @$pb.TagNumber(5)
  TransactionPlan ensurePlan() => $_ensure(4);

  /// Optional, used in case of Staking Key registration (prerequisite for Staking)
  @$pb.TagNumber(6)
  RegisterStakingKey get registerStakingKey => $_getN(5);
  @$pb.TagNumber(6)
  set registerStakingKey(RegisterStakingKey value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasRegisterStakingKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearRegisterStakingKey() => $_clearField(6);
  @$pb.TagNumber(6)
  RegisterStakingKey ensureRegisterStakingKey() => $_ensure(5);

  /// Optional, used in case of (re)delegation
  @$pb.TagNumber(7)
  Delegate get delegate => $_getN(6);
  @$pb.TagNumber(7)
  set delegate(Delegate value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDelegate() => $_has(6);
  @$pb.TagNumber(7)
  void clearDelegate() => $_clearField(7);
  @$pb.TagNumber(7)
  Delegate ensureDelegate() => $_ensure(6);

  /// Optional, used in case of withdraw
  @$pb.TagNumber(8)
  Withdraw get withdraw => $_getN(7);
  @$pb.TagNumber(8)
  set withdraw(Withdraw value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasWithdraw() => $_has(7);
  @$pb.TagNumber(8)
  void clearWithdraw() => $_clearField(8);
  @$pb.TagNumber(8)
  Withdraw ensureWithdraw() => $_ensure(7);

  /// Optional
  @$pb.TagNumber(9)
  DeregisterStakingKey get deregisterStakingKey => $_getN(8);
  @$pb.TagNumber(9)
  set deregisterStakingKey(DeregisterStakingKey value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDeregisterStakingKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeregisterStakingKey() => $_clearField(9);
  @$pb.TagNumber(9)
  DeregisterStakingKey ensureDeregisterStakingKey() => $_ensure(8);

  /// extra output UTXOs
  @$pb.TagNumber(10)
  $pb.PbList<TxOutput> get extraOutputs => $_getList(9);

  /// Optional, used for vote delegation
  @$pb.TagNumber(11)
  VoteDelegation get voteDelegation => $_getN(10);
  @$pb.TagNumber(11)
  set voteDelegation(VoteDelegation value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasVoteDelegation() => $_has(10);
  @$pb.TagNumber(11)
  void clearVoteDelegation() => $_clearField(11);
  @$pb.TagNumber(11)
  VoteDelegation ensureVoteDelegation() => $_ensure(10);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? txId,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (txId != null) result.txId = txId;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Cardano.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'txId', $pb.PbFieldType.OY)
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

  /// Encoded transaction bytes
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// TxID, derived from transaction data, also needed for submission
  @$pb.TagNumber(2)
  $core.List<$core.int> get txId => $_getN(1);
  @$pb.TagNumber(2)
  set txId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxId() => $_clearField(2);

  /// Optional error
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
