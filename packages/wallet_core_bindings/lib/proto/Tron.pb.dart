// This is a generated file - do not edit.
//
// Generated from Tron.proto.

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

/// A transfer transaction
class TransferContract extends $pb.GeneratedMessage {
  factory TransferContract({
    $core.String? ownerAddress,
    $core.String? toAddress,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  TransferContract._();

  factory TransferContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(2, _omitFieldNames ? '' : 'toAddress')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferContract copyWith(void Function(TransferContract) updates) =>
      super.copyWith((message) => updates(message as TransferContract))
          as TransferContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferContract create() => TransferContract._();
  @$core.override
  TransferContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferContract>(create);
  static TransferContract? _defaultInstance;

  /// Sender address.
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Recipient address.
  @$pb.TagNumber(2)
  $core.String get toAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => $_clearField(2);

  /// Amount to send.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Asset transfer
class TransferAssetContract extends $pb.GeneratedMessage {
  factory TransferAssetContract({
    $core.String? assetName,
    $core.String? ownerAddress,
    $core.String? toAddress,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (assetName != null) result.assetName = assetName;
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  TransferAssetContract._();

  factory TransferAssetContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferAssetContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferAssetContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'assetName')
    ..aOS(2, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(3, _omitFieldNames ? '' : 'toAddress')
    ..aInt64(4, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferAssetContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferAssetContract copyWith(
          void Function(TransferAssetContract) updates) =>
      super.copyWith((message) => updates(message as TransferAssetContract))
          as TransferAssetContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferAssetContract create() => TransferAssetContract._();
  @$core.override
  TransferAssetContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferAssetContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferAssetContract>(create);
  static TransferAssetContract? _defaultInstance;

  /// Asset name.
  @$pb.TagNumber(1)
  $core.String get assetName => $_getSZ(0);
  @$pb.TagNumber(1)
  set assetName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAssetName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetName() => $_clearField(1);

  /// Sender address.
  @$pb.TagNumber(2)
  $core.String get ownerAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => $_clearField(2);

  /// Recipient address.
  @$pb.TagNumber(3)
  $core.String get toAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set toAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAddress() => $_clearField(3);

  /// Amount to send.
  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);
}

/// TRC20 token transfer
class TransferTRC20Contract extends $pb.GeneratedMessage {
  factory TransferTRC20Contract({
    $core.String? contractAddress,
    $core.String? ownerAddress,
    $core.String? toAddress,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (contractAddress != null) result.contractAddress = contractAddress;
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  TransferTRC20Contract._();

  factory TransferTRC20Contract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferTRC20Contract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferTRC20Contract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'contractAddress')
    ..aOS(2, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(3, _omitFieldNames ? '' : 'toAddress')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferTRC20Contract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferTRC20Contract copyWith(
          void Function(TransferTRC20Contract) updates) =>
      super.copyWith((message) => updates(message as TransferTRC20Contract))
          as TransferTRC20Contract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferTRC20Contract create() => TransferTRC20Contract._();
  @$core.override
  TransferTRC20Contract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferTRC20Contract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferTRC20Contract>(create);
  static TransferTRC20Contract? _defaultInstance;

  /// Contract name.
  @$pb.TagNumber(1)
  $core.String get contractAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set contractAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContractAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearContractAddress() => $_clearField(1);

  /// Sender address.
  @$pb.TagNumber(2)
  $core.String get ownerAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => $_clearField(2);

  /// Recipient address.
  @$pb.TagNumber(3)
  $core.String get toAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set toAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAddress() => $_clearField(3);

  /// Amount to send, (uint256, serialized big endian)
  @$pb.TagNumber(4)
  $core.List<$core.int> get amount => $_getN(3);
  @$pb.TagNumber(4)
  set amount($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);
}

/// Freeze balance
class FreezeBalanceContract extends $pb.GeneratedMessage {
  factory FreezeBalanceContract({
    $core.String? ownerAddress,
    $fixnum.Int64? frozenBalance,
    $fixnum.Int64? frozenDuration,
    $core.String? resource,
    $core.String? receiverAddress,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (frozenBalance != null) result.frozenBalance = frozenBalance;
    if (frozenDuration != null) result.frozenDuration = frozenDuration;
    if (resource != null) result.resource = resource;
    if (receiverAddress != null) result.receiverAddress = receiverAddress;
    return result;
  }

  FreezeBalanceContract._();

  factory FreezeBalanceContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FreezeBalanceContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FreezeBalanceContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aInt64(2, _omitFieldNames ? '' : 'frozenBalance')
    ..aInt64(3, _omitFieldNames ? '' : 'frozenDuration')
    ..aOS(10, _omitFieldNames ? '' : 'resource')
    ..aOS(15, _omitFieldNames ? '' : 'receiverAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeBalanceContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeBalanceContract copyWith(
          void Function(FreezeBalanceContract) updates) =>
      super.copyWith((message) => updates(message as FreezeBalanceContract))
          as FreezeBalanceContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeBalanceContract create() => FreezeBalanceContract._();
  @$core.override
  FreezeBalanceContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FreezeBalanceContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FreezeBalanceContract>(create);
  static FreezeBalanceContract? _defaultInstance;

  /// Sender address.
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Frozen balance. Minimum 1
  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenBalance($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalance() => $_clearField(2);

  /// Frozen duration
  @$pb.TagNumber(3)
  $fixnum.Int64 get frozenDuration => $_getI64(2);
  @$pb.TagNumber(3)
  set frozenDuration($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFrozenDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrozenDuration() => $_clearField(3);

  /// Resource type: BANDWIDTH | ENERGY
  @$pb.TagNumber(10)
  $core.String get resource => $_getSZ(3);
  @$pb.TagNumber(10)
  set resource($core.String value) => $_setString(3, value);
  @$pb.TagNumber(10)
  $core.bool hasResource() => $_has(3);
  @$pb.TagNumber(10)
  void clearResource() => $_clearField(10);

  /// Receiver address
  @$pb.TagNumber(15)
  $core.String get receiverAddress => $_getSZ(4);
  @$pb.TagNumber(15)
  set receiverAddress($core.String value) => $_setString(4, value);
  @$pb.TagNumber(15)
  $core.bool hasReceiverAddress() => $_has(4);
  @$pb.TagNumber(15)
  void clearReceiverAddress() => $_clearField(15);
}

/// stake TRX to obtain TRON Power (voting rights) and bandwidth or energy.
class FreezeBalanceV2Contract extends $pb.GeneratedMessage {
  factory FreezeBalanceV2Contract({
    $core.String? ownerAddress,
    $fixnum.Int64? frozenBalance,
    $core.String? resource,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (frozenBalance != null) result.frozenBalance = frozenBalance;
    if (resource != null) result.resource = resource;
    return result;
  }

  FreezeBalanceV2Contract._();

  factory FreezeBalanceV2Contract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FreezeBalanceV2Contract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FreezeBalanceV2Contract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aInt64(2, _omitFieldNames ? '' : 'frozenBalance')
    ..aOS(3, _omitFieldNames ? '' : 'resource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeBalanceV2Contract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FreezeBalanceV2Contract copyWith(
          void Function(FreezeBalanceV2Contract) updates) =>
      super.copyWith((message) => updates(message as FreezeBalanceV2Contract))
          as FreezeBalanceV2Contract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FreezeBalanceV2Contract create() => FreezeBalanceV2Contract._();
  @$core.override
  FreezeBalanceV2Contract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FreezeBalanceV2Contract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FreezeBalanceV2Contract>(create);
  static FreezeBalanceV2Contract? _defaultInstance;

  /// Address of transaction initiator, data type is string
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Amount of TRX to be staked, unit is sun, data type is uint256
  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenBalance($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalance() => $_clearField(2);

  /// Resource type, "BANDWIDTH" or "ENERGY", data type is string
  @$pb.TagNumber(3)
  $core.String get resource => $_getSZ(2);
  @$pb.TagNumber(3)
  set resource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);
}

/// Unstake TRX to release bandwidth and energy and at the same time TRON Power will be reduced and all corresponding votes will be canceled.
class UnfreezeBalanceV2Contract extends $pb.GeneratedMessage {
  factory UnfreezeBalanceV2Contract({
    $core.String? ownerAddress,
    $fixnum.Int64? unfreezeBalance,
    $core.String? resource,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (unfreezeBalance != null) result.unfreezeBalance = unfreezeBalance;
    if (resource != null) result.resource = resource;
    return result;
  }

  UnfreezeBalanceV2Contract._();

  factory UnfreezeBalanceV2Contract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnfreezeBalanceV2Contract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnfreezeBalanceV2Contract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aInt64(2, _omitFieldNames ? '' : 'unfreezeBalance')
    ..aOS(3, _omitFieldNames ? '' : 'resource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnfreezeBalanceV2Contract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnfreezeBalanceV2Contract copyWith(
          void Function(UnfreezeBalanceV2Contract) updates) =>
      super.copyWith((message) => updates(message as UnfreezeBalanceV2Contract))
          as UnfreezeBalanceV2Contract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceV2Contract create() => UnfreezeBalanceV2Contract._();
  @$core.override
  UnfreezeBalanceV2Contract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceV2Contract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnfreezeBalanceV2Contract>(create);
  static UnfreezeBalanceV2Contract? _defaultInstance;

  /// Address of transaction initiator, data type is string
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Amount of TRX to be unstaked, unit is sun, data type is uint256
  @$pb.TagNumber(2)
  $fixnum.Int64 get unfreezeBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set unfreezeBalance($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnfreezeBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnfreezeBalance() => $_clearField(2);

  /// Resource type, "BANDWIDTH" or "ENERGY", data type is string
  @$pb.TagNumber(3)
  $core.String get resource => $_getSZ(2);
  @$pb.TagNumber(3)
  set resource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);
}

/// withdraw unfrozen balance
class WithdrawExpireUnfreezeContract extends $pb.GeneratedMessage {
  factory WithdrawExpireUnfreezeContract({
    $core.String? ownerAddress,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    return result;
  }

  WithdrawExpireUnfreezeContract._();

  factory WithdrawExpireUnfreezeContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WithdrawExpireUnfreezeContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WithdrawExpireUnfreezeContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawExpireUnfreezeContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawExpireUnfreezeContract copyWith(
          void Function(WithdrawExpireUnfreezeContract) updates) =>
      super.copyWith(
              (message) => updates(message as WithdrawExpireUnfreezeContract))
          as WithdrawExpireUnfreezeContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawExpireUnfreezeContract create() =>
      WithdrawExpireUnfreezeContract._();
  @$core.override
  WithdrawExpireUnfreezeContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WithdrawExpireUnfreezeContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WithdrawExpireUnfreezeContract>(create);
  static WithdrawExpireUnfreezeContract? _defaultInstance;

  /// Address of transaction initiator, data type is string
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);
}

/// delegate resource
class DelegateResourceContract extends $pb.GeneratedMessage {
  factory DelegateResourceContract({
    $core.String? ownerAddress,
    $core.String? resource,
    $fixnum.Int64? balance,
    $core.String? receiverAddress,
    $core.bool? lock,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (resource != null) result.resource = resource;
    if (balance != null) result.balance = balance;
    if (receiverAddress != null) result.receiverAddress = receiverAddress;
    if (lock != null) result.lock = lock;
    return result;
  }

  DelegateResourceContract._();

  factory DelegateResourceContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DelegateResourceContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DelegateResourceContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(2, _omitFieldNames ? '' : 'resource')
    ..aInt64(3, _omitFieldNames ? '' : 'balance')
    ..aOS(4, _omitFieldNames ? '' : 'receiverAddress')
    ..aOB(5, _omitFieldNames ? '' : 'lock')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DelegateResourceContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DelegateResourceContract copyWith(
          void Function(DelegateResourceContract) updates) =>
      super.copyWith((message) => updates(message as DelegateResourceContract))
          as DelegateResourceContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelegateResourceContract create() => DelegateResourceContract._();
  @$core.override
  DelegateResourceContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DelegateResourceContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DelegateResourceContract>(create);
  static DelegateResourceContract? _defaultInstance;

  /// Address of transaction initiator, data type is string
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Resource type, "BANDWIDTH" or "ENERGY", data type is string
  @$pb.TagNumber(2)
  $core.String get resource => $_getSZ(1);
  @$pb.TagNumber(2)
  set resource($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => $_clearField(2);

  /// Amount of TRX staked for resource to be delegated, unit is sun, data type is uint256
  @$pb.TagNumber(3)
  $fixnum.Int64 get balance => $_getI64(2);
  @$pb.TagNumber(3)
  set balance($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => $_clearField(3);

  /// Receiver address of resource to be delegated to
  @$pb.TagNumber(4)
  $core.String get receiverAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set receiverAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiverAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverAddress() => $_clearField(4);

  /// Whether it is locked, if it is set to true, the delegated resources cannot be undelegated within 3 days.
  /// When the lock time is not over, if the owner delegates the same resources using the lock to the same address,
  /// the lock time will be reset to 3 days
  @$pb.TagNumber(5)
  $core.bool get lock => $_getBF(4);
  @$pb.TagNumber(5)
  set lock($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLock() => $_has(4);
  @$pb.TagNumber(5)
  void clearLock() => $_clearField(5);
}

/// undelegate resource
class UnDelegateResourceContract extends $pb.GeneratedMessage {
  factory UnDelegateResourceContract({
    $core.String? ownerAddress,
    $core.String? resource,
    $fixnum.Int64? balance,
    $core.String? receiverAddress,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (resource != null) result.resource = resource;
    if (balance != null) result.balance = balance;
    if (receiverAddress != null) result.receiverAddress = receiverAddress;
    return result;
  }

  UnDelegateResourceContract._();

  factory UnDelegateResourceContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnDelegateResourceContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnDelegateResourceContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(2, _omitFieldNames ? '' : 'resource')
    ..aInt64(3, _omitFieldNames ? '' : 'balance')
    ..aOS(4, _omitFieldNames ? '' : 'receiverAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnDelegateResourceContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnDelegateResourceContract copyWith(
          void Function(UnDelegateResourceContract) updates) =>
      super.copyWith(
              (message) => updates(message as UnDelegateResourceContract))
          as UnDelegateResourceContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnDelegateResourceContract create() => UnDelegateResourceContract._();
  @$core.override
  UnDelegateResourceContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnDelegateResourceContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnDelegateResourceContract>(create);
  static UnDelegateResourceContract? _defaultInstance;

  /// Address of transaction initiator, data type is string
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Resource type, "BANDWIDTH" or "ENERGY", data type is string
  @$pb.TagNumber(2)
  $core.String get resource => $_getSZ(1);
  @$pb.TagNumber(2)
  set resource($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearResource() => $_clearField(2);

  /// Amount of TRX staked for resource to be undelegated, unit is sun, data type is uint256
  @$pb.TagNumber(3)
  $fixnum.Int64 get balance => $_getI64(2);
  @$pb.TagNumber(3)
  set balance($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => $_clearField(3);

  /// Receiver address of resource to be delegated to, data type is string
  @$pb.TagNumber(4)
  $core.String get receiverAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set receiverAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiverAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverAddress() => $_clearField(4);
}

/// Unfreeze balance
class UnfreezeBalanceContract extends $pb.GeneratedMessage {
  factory UnfreezeBalanceContract({
    $core.String? ownerAddress,
    $core.String? resource,
    $core.String? receiverAddress,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (resource != null) result.resource = resource;
    if (receiverAddress != null) result.receiverAddress = receiverAddress;
    return result;
  }

  UnfreezeBalanceContract._();

  factory UnfreezeBalanceContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnfreezeBalanceContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnfreezeBalanceContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(10, _omitFieldNames ? '' : 'resource')
    ..aOS(15, _omitFieldNames ? '' : 'receiverAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnfreezeBalanceContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnfreezeBalanceContract copyWith(
          void Function(UnfreezeBalanceContract) updates) =>
      super.copyWith((message) => updates(message as UnfreezeBalanceContract))
          as UnfreezeBalanceContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceContract create() => UnfreezeBalanceContract._();
  @$core.override
  UnfreezeBalanceContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnfreezeBalanceContract>(create);
  static UnfreezeBalanceContract? _defaultInstance;

  /// Sender address
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Resource type: BANDWIDTH | ENERGY
  @$pb.TagNumber(10)
  $core.String get resource => $_getSZ(1);
  @$pb.TagNumber(10)
  set resource($core.String value) => $_setString(1, value);
  @$pb.TagNumber(10)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(10)
  void clearResource() => $_clearField(10);

  /// Receiver address
  @$pb.TagNumber(15)
  $core.String get receiverAddress => $_getSZ(2);
  @$pb.TagNumber(15)
  set receiverAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(15)
  $core.bool hasReceiverAddress() => $_has(2);
  @$pb.TagNumber(15)
  void clearReceiverAddress() => $_clearField(15);
}

/// Unfreeze asset
class UnfreezeAssetContract extends $pb.GeneratedMessage {
  factory UnfreezeAssetContract({
    $core.String? ownerAddress,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    return result;
  }

  UnfreezeAssetContract._();

  factory UnfreezeAssetContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnfreezeAssetContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnfreezeAssetContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnfreezeAssetContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnfreezeAssetContract copyWith(
          void Function(UnfreezeAssetContract) updates) =>
      super.copyWith((message) => updates(message as UnfreezeAssetContract))
          as UnfreezeAssetContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfreezeAssetContract create() => UnfreezeAssetContract._();
  @$core.override
  UnfreezeAssetContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnfreezeAssetContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnfreezeAssetContract>(create);
  static UnfreezeAssetContract? _defaultInstance;

  /// Sender address
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);
}

/// Vote asset
class VoteAssetContract extends $pb.GeneratedMessage {
  factory VoteAssetContract({
    $core.String? ownerAddress,
    $core.Iterable<$core.String>? voteAddress,
    $core.bool? support,
    $core.int? count,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (voteAddress != null) result.voteAddress.addAll(voteAddress);
    if (support != null) result.support = support;
    if (count != null) result.count = count;
    return result;
  }

  VoteAssetContract._();

  factory VoteAssetContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoteAssetContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoteAssetContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..pPS(2, _omitFieldNames ? '' : 'voteAddress')
    ..aOB(3, _omitFieldNames ? '' : 'support')
    ..aI(5, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteAssetContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteAssetContract copyWith(void Function(VoteAssetContract) updates) =>
      super.copyWith((message) => updates(message as VoteAssetContract))
          as VoteAssetContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoteAssetContract create() => VoteAssetContract._();
  @$core.override
  VoteAssetContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VoteAssetContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteAssetContract>(create);
  static VoteAssetContract? _defaultInstance;

  /// Sender address
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Vote addresses
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get voteAddress => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get support => $_getBF(2);
  @$pb.TagNumber(3)
  set support($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupport() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupport() => $_clearField(3);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(5)
  set count($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(5)
  void clearCount() => $_clearField(5);
}

/// A vote
class VoteWitnessContract_Vote extends $pb.GeneratedMessage {
  factory VoteWitnessContract_Vote({
    $core.String? voteAddress,
    $fixnum.Int64? voteCount,
  }) {
    final result = create();
    if (voteAddress != null) result.voteAddress = voteAddress;
    if (voteCount != null) result.voteCount = voteCount;
    return result;
  }

  VoteWitnessContract_Vote._();

  factory VoteWitnessContract_Vote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoteWitnessContract_Vote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoteWitnessContract.Vote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'voteAddress')
    ..aInt64(2, _omitFieldNames ? '' : 'voteCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteWitnessContract_Vote clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteWitnessContract_Vote copyWith(
          void Function(VoteWitnessContract_Vote) updates) =>
      super.copyWith((message) => updates(message as VoteWitnessContract_Vote))
          as VoteWitnessContract_Vote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract_Vote create() => VoteWitnessContract_Vote._();
  @$core.override
  VoteWitnessContract_Vote createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract_Vote getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteWitnessContract_Vote>(create);
  static VoteWitnessContract_Vote? _defaultInstance;

  /// address
  @$pb.TagNumber(1)
  $core.String get voteAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set voteAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVoteAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoteAddress() => $_clearField(1);

  /// vote count
  @$pb.TagNumber(2)
  $fixnum.Int64 get voteCount => $_getI64(1);
  @$pb.TagNumber(2)
  set voteCount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVoteCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoteCount() => $_clearField(2);
}

/// Vote witness
class VoteWitnessContract extends $pb.GeneratedMessage {
  factory VoteWitnessContract({
    $core.String? ownerAddress,
    $core.Iterable<VoteWitnessContract_Vote>? votes,
    $core.bool? support,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (votes != null) result.votes.addAll(votes);
    if (support != null) result.support = support;
    return result;
  }

  VoteWitnessContract._();

  factory VoteWitnessContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoteWitnessContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoteWitnessContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..pPM<VoteWitnessContract_Vote>(2, _omitFieldNames ? '' : 'votes',
        subBuilder: VoteWitnessContract_Vote.create)
    ..aOB(3, _omitFieldNames ? '' : 'support')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteWitnessContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoteWitnessContract copyWith(void Function(VoteWitnessContract) updates) =>
      super.copyWith((message) => updates(message as VoteWitnessContract))
          as VoteWitnessContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract create() => VoteWitnessContract._();
  @$core.override
  VoteWitnessContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteWitnessContract>(create);
  static VoteWitnessContract? _defaultInstance;

  /// Owner
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// The votes
  @$pb.TagNumber(2)
  $pb.PbList<VoteWitnessContract_Vote> get votes => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get support => $_getBF(2);
  @$pb.TagNumber(3)
  set support($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupport() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupport() => $_clearField(3);
}

/// Withdraw balance
class WithdrawBalanceContract extends $pb.GeneratedMessage {
  factory WithdrawBalanceContract({
    $core.String? ownerAddress,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    return result;
  }

  WithdrawBalanceContract._();

  factory WithdrawBalanceContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WithdrawBalanceContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WithdrawBalanceContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawBalanceContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawBalanceContract copyWith(
          void Function(WithdrawBalanceContract) updates) =>
      super.copyWith((message) => updates(message as WithdrawBalanceContract))
          as WithdrawBalanceContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawBalanceContract create() => WithdrawBalanceContract._();
  @$core.override
  WithdrawBalanceContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WithdrawBalanceContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WithdrawBalanceContract>(create);
  static WithdrawBalanceContract? _defaultInstance;

  /// Sender address
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);
}

/// Smart contract call
class TriggerSmartContract extends $pb.GeneratedMessage {
  factory TriggerSmartContract({
    $core.String? ownerAddress,
    $core.String? contractAddress,
    $fixnum.Int64? callValue,
    $core.List<$core.int>? data,
    $fixnum.Int64? callTokenValue,
    $fixnum.Int64? tokenId,
  }) {
    final result = create();
    if (ownerAddress != null) result.ownerAddress = ownerAddress;
    if (contractAddress != null) result.contractAddress = contractAddress;
    if (callValue != null) result.callValue = callValue;
    if (data != null) result.data = data;
    if (callTokenValue != null) result.callTokenValue = callTokenValue;
    if (tokenId != null) result.tokenId = tokenId;
    return result;
  }

  TriggerSmartContract._();

  factory TriggerSmartContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TriggerSmartContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TriggerSmartContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ownerAddress')
    ..aOS(2, _omitFieldNames ? '' : 'contractAddress')
    ..aInt64(3, _omitFieldNames ? '' : 'callValue')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aInt64(5, _omitFieldNames ? '' : 'callTokenValue')
    ..aInt64(6, _omitFieldNames ? '' : 'tokenId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSmartContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSmartContract copyWith(void Function(TriggerSmartContract) updates) =>
      super.copyWith((message) => updates(message as TriggerSmartContract))
          as TriggerSmartContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerSmartContract create() => TriggerSmartContract._();
  @$core.override
  TriggerSmartContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TriggerSmartContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TriggerSmartContract>(create);
  static TriggerSmartContract? _defaultInstance;

  /// Owner
  @$pb.TagNumber(1)
  $core.String get ownerAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => $_clearField(1);

  /// Contract address
  @$pb.TagNumber(2)
  $core.String get contractAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set contractAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => $_clearField(2);

  /// amount
  @$pb.TagNumber(3)
  $fixnum.Int64 get callValue => $_getI64(2);
  @$pb.TagNumber(3)
  set callValue($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCallValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallValue() => $_clearField(3);

  /// call data
  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => $_clearField(4);

  /// token value
  @$pb.TagNumber(5)
  $fixnum.Int64 get callTokenValue => $_getI64(4);
  @$pb.TagNumber(5)
  set callTokenValue($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCallTokenValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearCallTokenValue() => $_clearField(5);

  /// ID of the token
  @$pb.TagNumber(6)
  $fixnum.Int64 get tokenId => $_getI64(5);
  @$pb.TagNumber(6)
  set tokenId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTokenId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokenId() => $_clearField(6);
}

/// Info from block header
class BlockHeader extends $pb.GeneratedMessage {
  factory BlockHeader({
    $fixnum.Int64? timestamp,
    $core.List<$core.int>? txTrieRoot,
    $core.List<$core.int>? parentHash,
    $fixnum.Int64? number,
    $core.List<$core.int>? witnessAddress,
    $core.int? version,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (txTrieRoot != null) result.txTrieRoot = txTrieRoot;
    if (parentHash != null) result.parentHash = parentHash;
    if (number != null) result.number = number;
    if (witnessAddress != null) result.witnessAddress = witnessAddress;
    if (version != null) result.version = version;
    return result;
  }

  BlockHeader._();

  factory BlockHeader.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockHeader.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockHeader',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'txTrieRoot', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'parentHash', $pb.PbFieldType.OY)
    ..aInt64(7, _omitFieldNames ? '' : 'number')
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'witnessAddress', $pb.PbFieldType.OY)
    ..aI(10, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockHeader clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockHeader copyWith(void Function(BlockHeader) updates) =>
      super.copyWith((message) => updates(message as BlockHeader))
          as BlockHeader;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockHeader create() => BlockHeader._();
  @$core.override
  BlockHeader createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockHeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockHeader>(create);
  static BlockHeader? _defaultInstance;

  /// creation timestamp
  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  /// root
  @$pb.TagNumber(2)
  $core.List<$core.int> get txTrieRoot => $_getN(1);
  @$pb.TagNumber(2)
  set txTrieRoot($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTxTrieRoot() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxTrieRoot() => $_clearField(2);

  /// hash of the parent
  @$pb.TagNumber(3)
  $core.List<$core.int> get parentHash => $_getN(2);
  @$pb.TagNumber(3)
  set parentHash($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentHash() => $_clearField(3);

  @$pb.TagNumber(7)
  $fixnum.Int64 get number => $_getI64(3);
  @$pb.TagNumber(7)
  set number($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(7)
  $core.bool hasNumber() => $_has(3);
  @$pb.TagNumber(7)
  void clearNumber() => $_clearField(7);

  @$pb.TagNumber(9)
  $core.List<$core.int> get witnessAddress => $_getN(4);
  @$pb.TagNumber(9)
  set witnessAddress($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(9)
  $core.bool hasWitnessAddress() => $_has(4);
  @$pb.TagNumber(9)
  void clearWitnessAddress() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get version => $_getIZ(5);
  @$pb.TagNumber(10)
  set version($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(10)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(10)
  void clearVersion() => $_clearField(10);
}

enum Transaction_ContractOneof {
  transfer,
  transferAsset,
  freezeBalance,
  unfreezeBalance,
  unfreezeAsset,
  withdrawBalance,
  voteAsset,
  voteWitness,
  triggerSmartContract,
  transferTrc20Contract,
  freezeBalanceV2,
  unfreezeBalanceV2,
  withdrawExpireUnfreeze,
  delegateResource,
  undelegateResource,
  notSet
}

/// Transaction
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $fixnum.Int64? timestamp,
    $fixnum.Int64? expiration,
    BlockHeader? blockHeader,
    $fixnum.Int64? feeLimit,
    $core.String? memo,
    TransferContract? transfer,
    TransferAssetContract? transferAsset,
    FreezeBalanceContract? freezeBalance,
    UnfreezeBalanceContract? unfreezeBalance,
    UnfreezeAssetContract? unfreezeAsset,
    WithdrawBalanceContract? withdrawBalance,
    VoteAssetContract? voteAsset,
    VoteWitnessContract? voteWitness,
    TriggerSmartContract? triggerSmartContract,
    TransferTRC20Contract? transferTrc20Contract,
    FreezeBalanceV2Contract? freezeBalanceV2,
    UnfreezeBalanceV2Contract? unfreezeBalanceV2,
    WithdrawExpireUnfreezeContract? withdrawExpireUnfreeze,
    DelegateResourceContract? delegateResource,
    UnDelegateResourceContract? undelegateResource,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (expiration != null) result.expiration = expiration;
    if (blockHeader != null) result.blockHeader = blockHeader;
    if (feeLimit != null) result.feeLimit = feeLimit;
    if (memo != null) result.memo = memo;
    if (transfer != null) result.transfer = transfer;
    if (transferAsset != null) result.transferAsset = transferAsset;
    if (freezeBalance != null) result.freezeBalance = freezeBalance;
    if (unfreezeBalance != null) result.unfreezeBalance = unfreezeBalance;
    if (unfreezeAsset != null) result.unfreezeAsset = unfreezeAsset;
    if (withdrawBalance != null) result.withdrawBalance = withdrawBalance;
    if (voteAsset != null) result.voteAsset = voteAsset;
    if (voteWitness != null) result.voteWitness = voteWitness;
    if (triggerSmartContract != null)
      result.triggerSmartContract = triggerSmartContract;
    if (transferTrc20Contract != null)
      result.transferTrc20Contract = transferTrc20Contract;
    if (freezeBalanceV2 != null) result.freezeBalanceV2 = freezeBalanceV2;
    if (unfreezeBalanceV2 != null) result.unfreezeBalanceV2 = unfreezeBalanceV2;
    if (withdrawExpireUnfreeze != null)
      result.withdrawExpireUnfreeze = withdrawExpireUnfreeze;
    if (delegateResource != null) result.delegateResource = delegateResource;
    if (undelegateResource != null)
      result.undelegateResource = undelegateResource;
    return result;
  }

  Transaction._();

  factory Transaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Transaction_ContractOneof>
      _Transaction_ContractOneofByTag = {
    10: Transaction_ContractOneof.transfer,
    11: Transaction_ContractOneof.transferAsset,
    12: Transaction_ContractOneof.freezeBalance,
    13: Transaction_ContractOneof.unfreezeBalance,
    14: Transaction_ContractOneof.unfreezeAsset,
    15: Transaction_ContractOneof.withdrawBalance,
    16: Transaction_ContractOneof.voteAsset,
    17: Transaction_ContractOneof.voteWitness,
    18: Transaction_ContractOneof.triggerSmartContract,
    19: Transaction_ContractOneof.transferTrc20Contract,
    20: Transaction_ContractOneof.freezeBalanceV2,
    21: Transaction_ContractOneof.unfreezeBalanceV2,
    23: Transaction_ContractOneof.withdrawExpireUnfreeze,
    24: Transaction_ContractOneof.delegateResource,
    25: Transaction_ContractOneof.undelegateResource,
    0: Transaction_ContractOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 23, 24, 25])
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..aInt64(2, _omitFieldNames ? '' : 'expiration')
    ..aOM<BlockHeader>(3, _omitFieldNames ? '' : 'blockHeader',
        subBuilder: BlockHeader.create)
    ..aInt64(4, _omitFieldNames ? '' : 'feeLimit')
    ..aOS(5, _omitFieldNames ? '' : 'memo')
    ..aOM<TransferContract>(10, _omitFieldNames ? '' : 'transfer',
        subBuilder: TransferContract.create)
    ..aOM<TransferAssetContract>(11, _omitFieldNames ? '' : 'transferAsset',
        subBuilder: TransferAssetContract.create)
    ..aOM<FreezeBalanceContract>(12, _omitFieldNames ? '' : 'freezeBalance',
        subBuilder: FreezeBalanceContract.create)
    ..aOM<UnfreezeBalanceContract>(13, _omitFieldNames ? '' : 'unfreezeBalance',
        subBuilder: UnfreezeBalanceContract.create)
    ..aOM<UnfreezeAssetContract>(14, _omitFieldNames ? '' : 'unfreezeAsset',
        subBuilder: UnfreezeAssetContract.create)
    ..aOM<WithdrawBalanceContract>(15, _omitFieldNames ? '' : 'withdrawBalance',
        subBuilder: WithdrawBalanceContract.create)
    ..aOM<VoteAssetContract>(16, _omitFieldNames ? '' : 'voteAsset',
        subBuilder: VoteAssetContract.create)
    ..aOM<VoteWitnessContract>(17, _omitFieldNames ? '' : 'voteWitness',
        subBuilder: VoteWitnessContract.create)
    ..aOM<TriggerSmartContract>(
        18, _omitFieldNames ? '' : 'triggerSmartContract',
        subBuilder: TriggerSmartContract.create)
    ..aOM<TransferTRC20Contract>(
        19, _omitFieldNames ? '' : 'transferTrc20Contract',
        subBuilder: TransferTRC20Contract.create)
    ..aOM<FreezeBalanceV2Contract>(20, _omitFieldNames ? '' : 'freezeBalanceV2',
        subBuilder: FreezeBalanceV2Contract.create)
    ..aOM<UnfreezeBalanceV2Contract>(
        21, _omitFieldNames ? '' : 'unfreezeBalanceV2',
        subBuilder: UnfreezeBalanceV2Contract.create)
    ..aOM<WithdrawExpireUnfreezeContract>(
        23, _omitFieldNames ? '' : 'withdrawExpireUnfreeze',
        subBuilder: WithdrawExpireUnfreezeContract.create)
    ..aOM<DelegateResourceContract>(
        24, _omitFieldNames ? '' : 'delegateResource',
        subBuilder: DelegateResourceContract.create)
    ..aOM<UnDelegateResourceContract>(
        25, _omitFieldNames ? '' : 'undelegateResource',
        subBuilder: UnDelegateResourceContract.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction copyWith(void Function(Transaction) updates) =>
      super.copyWith((message) => updates(message as Transaction))
          as Transaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  @$core.override
  Transaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  Transaction_ContractOneof whichContractOneof() =>
      _Transaction_ContractOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  void clearContractOneof() => $_clearField($_whichOneof(0));

  /// Transaction timestamp in milliseconds.
  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  /// Transaction expiration time in milliseconds.
  @$pb.TagNumber(2)
  $fixnum.Int64 get expiration => $_getI64(1);
  @$pb.TagNumber(2)
  set expiration($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiration() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiration() => $_clearField(2);

  /// Transaction block header.
  @$pb.TagNumber(3)
  BlockHeader get blockHeader => $_getN(2);
  @$pb.TagNumber(3)
  set blockHeader(BlockHeader value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBlockHeader() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockHeader() => $_clearField(3);
  @$pb.TagNumber(3)
  BlockHeader ensureBlockHeader() => $_ensure(2);

  /// Transaction fee limit.
  @$pb.TagNumber(4)
  $fixnum.Int64 get feeLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set feeLimit($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFeeLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearFeeLimit() => $_clearField(4);

  /// Transaction memo.
  @$pb.TagNumber(5)
  $core.String get memo => $_getSZ(4);
  @$pb.TagNumber(5)
  set memo($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMemo() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemo() => $_clearField(5);

  @$pb.TagNumber(10)
  TransferContract get transfer => $_getN(5);
  @$pb.TagNumber(10)
  set transfer(TransferContract value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTransfer() => $_has(5);
  @$pb.TagNumber(10)
  void clearTransfer() => $_clearField(10);
  @$pb.TagNumber(10)
  TransferContract ensureTransfer() => $_ensure(5);

  @$pb.TagNumber(11)
  TransferAssetContract get transferAsset => $_getN(6);
  @$pb.TagNumber(11)
  set transferAsset(TransferAssetContract value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasTransferAsset() => $_has(6);
  @$pb.TagNumber(11)
  void clearTransferAsset() => $_clearField(11);
  @$pb.TagNumber(11)
  TransferAssetContract ensureTransferAsset() => $_ensure(6);

  @$pb.TagNumber(12)
  FreezeBalanceContract get freezeBalance => $_getN(7);
  @$pb.TagNumber(12)
  set freezeBalance(FreezeBalanceContract value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasFreezeBalance() => $_has(7);
  @$pb.TagNumber(12)
  void clearFreezeBalance() => $_clearField(12);
  @$pb.TagNumber(12)
  FreezeBalanceContract ensureFreezeBalance() => $_ensure(7);

  @$pb.TagNumber(13)
  UnfreezeBalanceContract get unfreezeBalance => $_getN(8);
  @$pb.TagNumber(13)
  set unfreezeBalance(UnfreezeBalanceContract value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasUnfreezeBalance() => $_has(8);
  @$pb.TagNumber(13)
  void clearUnfreezeBalance() => $_clearField(13);
  @$pb.TagNumber(13)
  UnfreezeBalanceContract ensureUnfreezeBalance() => $_ensure(8);

  @$pb.TagNumber(14)
  UnfreezeAssetContract get unfreezeAsset => $_getN(9);
  @$pb.TagNumber(14)
  set unfreezeAsset(UnfreezeAssetContract value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasUnfreezeAsset() => $_has(9);
  @$pb.TagNumber(14)
  void clearUnfreezeAsset() => $_clearField(14);
  @$pb.TagNumber(14)
  UnfreezeAssetContract ensureUnfreezeAsset() => $_ensure(9);

  @$pb.TagNumber(15)
  WithdrawBalanceContract get withdrawBalance => $_getN(10);
  @$pb.TagNumber(15)
  set withdrawBalance(WithdrawBalanceContract value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasWithdrawBalance() => $_has(10);
  @$pb.TagNumber(15)
  void clearWithdrawBalance() => $_clearField(15);
  @$pb.TagNumber(15)
  WithdrawBalanceContract ensureWithdrawBalance() => $_ensure(10);

  @$pb.TagNumber(16)
  VoteAssetContract get voteAsset => $_getN(11);
  @$pb.TagNumber(16)
  set voteAsset(VoteAssetContract value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasVoteAsset() => $_has(11);
  @$pb.TagNumber(16)
  void clearVoteAsset() => $_clearField(16);
  @$pb.TagNumber(16)
  VoteAssetContract ensureVoteAsset() => $_ensure(11);

  @$pb.TagNumber(17)
  VoteWitnessContract get voteWitness => $_getN(12);
  @$pb.TagNumber(17)
  set voteWitness(VoteWitnessContract value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasVoteWitness() => $_has(12);
  @$pb.TagNumber(17)
  void clearVoteWitness() => $_clearField(17);
  @$pb.TagNumber(17)
  VoteWitnessContract ensureVoteWitness() => $_ensure(12);

  @$pb.TagNumber(18)
  TriggerSmartContract get triggerSmartContract => $_getN(13);
  @$pb.TagNumber(18)
  set triggerSmartContract(TriggerSmartContract value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasTriggerSmartContract() => $_has(13);
  @$pb.TagNumber(18)
  void clearTriggerSmartContract() => $_clearField(18);
  @$pb.TagNumber(18)
  TriggerSmartContract ensureTriggerSmartContract() => $_ensure(13);

  @$pb.TagNumber(19)
  TransferTRC20Contract get transferTrc20Contract => $_getN(14);
  @$pb.TagNumber(19)
  set transferTrc20Contract(TransferTRC20Contract value) =>
      $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasTransferTrc20Contract() => $_has(14);
  @$pb.TagNumber(19)
  void clearTransferTrc20Contract() => $_clearField(19);
  @$pb.TagNumber(19)
  TransferTRC20Contract ensureTransferTrc20Contract() => $_ensure(14);

  @$pb.TagNumber(20)
  FreezeBalanceV2Contract get freezeBalanceV2 => $_getN(15);
  @$pb.TagNumber(20)
  set freezeBalanceV2(FreezeBalanceV2Contract value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasFreezeBalanceV2() => $_has(15);
  @$pb.TagNumber(20)
  void clearFreezeBalanceV2() => $_clearField(20);
  @$pb.TagNumber(20)
  FreezeBalanceV2Contract ensureFreezeBalanceV2() => $_ensure(15);

  @$pb.TagNumber(21)
  UnfreezeBalanceV2Contract get unfreezeBalanceV2 => $_getN(16);
  @$pb.TagNumber(21)
  set unfreezeBalanceV2(UnfreezeBalanceV2Contract value) =>
      $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasUnfreezeBalanceV2() => $_has(16);
  @$pb.TagNumber(21)
  void clearUnfreezeBalanceV2() => $_clearField(21);
  @$pb.TagNumber(21)
  UnfreezeBalanceV2Contract ensureUnfreezeBalanceV2() => $_ensure(16);

  @$pb.TagNumber(23)
  WithdrawExpireUnfreezeContract get withdrawExpireUnfreeze => $_getN(17);
  @$pb.TagNumber(23)
  set withdrawExpireUnfreeze(WithdrawExpireUnfreezeContract value) =>
      $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasWithdrawExpireUnfreeze() => $_has(17);
  @$pb.TagNumber(23)
  void clearWithdrawExpireUnfreeze() => $_clearField(23);
  @$pb.TagNumber(23)
  WithdrawExpireUnfreezeContract ensureWithdrawExpireUnfreeze() => $_ensure(17);

  @$pb.TagNumber(24)
  DelegateResourceContract get delegateResource => $_getN(18);
  @$pb.TagNumber(24)
  set delegateResource(DelegateResourceContract value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasDelegateResource() => $_has(18);
  @$pb.TagNumber(24)
  void clearDelegateResource() => $_clearField(24);
  @$pb.TagNumber(24)
  DelegateResourceContract ensureDelegateResource() => $_ensure(18);

  @$pb.TagNumber(25)
  UnDelegateResourceContract get undelegateResource => $_getN(19);
  @$pb.TagNumber(25)
  set undelegateResource(UnDelegateResourceContract value) =>
      $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasUndelegateResource() => $_has(19);
  @$pb.TagNumber(25)
  void clearUndelegateResource() => $_clearField(25);
  @$pb.TagNumber(25)
  UnDelegateResourceContract ensureUndelegateResource() => $_ensure(19);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    Transaction? transaction,
    $core.List<$core.int>? privateKey,
    $core.String? txId,
    $core.String? rawJson,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    if (privateKey != null) result.privateKey = privateKey;
    if (txId != null) result.txId = txId;
    if (rawJson != null) result.rawJson = rawJson;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'txId', protoName: 'txId')
    ..aOS(4, _omitFieldNames ? '' : 'rawJson')
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

  /// Transaction.
  @$pb.TagNumber(1)
  Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(Transaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTransaction() => $_ensure(0);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => $_clearField(2);

  /// For direct sign in Tron, we just have to sign the txId returned by the DApp json payload.
  /// TODO: This field can be removed in the future, as we can use raw_json.txID instead.
  @$pb.TagNumber(3)
  $core.String get txId => $_getSZ(2);
  @$pb.TagNumber(3)
  set txId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTxId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxId() => $_clearField(3);

  /// Raw JSON data from the DApp, which contains fields 'txID', 'raw_data' and 'raw_data_hex' normally.
  @$pb.TagNumber(4)
  $core.String get rawJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set rawJson($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRawJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearRawJson() => $_clearField(4);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? id,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? refBlockBytes,
    $core.List<$core.int>? refBlockHash,
    $core.String? json,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (signature != null) result.signature = signature;
    if (refBlockBytes != null) result.refBlockBytes = refBlockBytes;
    if (refBlockHash != null) result.refBlockHash = refBlockHash;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Tron.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'refBlockBytes', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'refBlockHash', $pb.PbFieldType.OY)
    ..aOS(5, _omitFieldNames ? '' : 'json')
    ..aE<$0.SigningError>(6, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(7, _omitFieldNames ? '' : 'errorMessage')
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

  /// Transaction identifier.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// Signature.
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get refBlockBytes => $_getN(2);
  @$pb.TagNumber(3)
  set refBlockBytes($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefBlockBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefBlockBytes() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get refBlockHash => $_getN(3);
  @$pb.TagNumber(4)
  set refBlockHash($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRefBlockHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefBlockHash() => $_clearField(4);

  /// Result in JSON
  @$pb.TagNumber(5)
  $core.String get json => $_getSZ(4);
  @$pb.TagNumber(5)
  set json($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasJson() => $_has(4);
  @$pb.TagNumber(5)
  void clearJson() => $_clearField(5);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(6)
  $0.SigningError get error => $_getN(5);
  @$pb.TagNumber(6)
  set error($0.SigningError value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);

  /// error code description
  @$pb.TagNumber(7)
  $core.String get errorMessage => $_getSZ(6);
  @$pb.TagNumber(7)
  set errorMessage($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasErrorMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearErrorMessage() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
