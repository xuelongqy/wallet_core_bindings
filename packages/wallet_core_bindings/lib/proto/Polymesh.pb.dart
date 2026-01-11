// This is a generated file - do not edit.
//
// Generated from Polymesh.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $1;
import 'Polkadot.pb.dart' as $0;
import 'Polymesh.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Polymesh.pbenum.dart';

/// transfer
class Balance_Transfer extends $pb.GeneratedMessage {
  factory Balance_Transfer({
    $core.String? toAddress,
    $core.List<$core.int>? value,
    $core.String? memo,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (value != null) result.value = value;
    if (memo != null) result.memo = memo;
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Balance_Transfer._();

  factory Balance_Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Balance_Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Balance.Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'memo')
    ..aOM<$0.CallIndices>(4, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Balance_Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Balance_Transfer copyWith(void Function(Balance_Transfer) updates) =>
      super.copyWith((message) => updates(message as Balance_Transfer))
          as Balance_Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Balance_Transfer create() => Balance_Transfer._();
  @$core.override
  Balance_Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Balance_Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Balance_Transfer>(create);
  static Balance_Transfer? _defaultInstance;

  /// destination address
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// amount (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  /// max 32 chars
  @$pb.TagNumber(3)
  $core.String get memo => $_getSZ(2);
  @$pb.TagNumber(3)
  set memo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemo() => $_clearField(3);

  /// call indices
  @$pb.TagNumber(4)
  $0.CallIndices get callIndices => $_getN(3);
  @$pb.TagNumber(4)
  set callIndices($0.CallIndices value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCallIndices() => $_has(3);
  @$pb.TagNumber(4)
  void clearCallIndices() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.CallIndices ensureCallIndices() => $_ensure(3);
}

enum Balance_MessageOneof { transfer, notSet }

/// Balance transfer transaction
class Balance extends $pb.GeneratedMessage {
  factory Balance({
    Balance_Transfer? transfer,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  Balance._();

  factory Balance.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Balance.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Balance_MessageOneof>
      _Balance_MessageOneofByTag = {
    1: Balance_MessageOneof.transfer,
    0: Balance_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Balance',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Balance_Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Balance_Transfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Balance clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Balance copyWith(void Function(Balance) updates) =>
      super.copyWith((message) => updates(message as Balance)) as Balance;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Balance create() => Balance._();
  @$core.override
  Balance createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Balance getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Balance>(create);
  static Balance? _defaultInstance;

  @$pb.TagNumber(1)
  Balance_MessageOneof whichMessageOneof() =>
      _Balance_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Balance_Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Balance_Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Balance_Transfer ensureTransfer() => $_ensure(0);
}

/// Bond to a controller
class Staking_Bond extends $pb.GeneratedMessage {
  factory Staking_Bond({
    $core.String? controller,
    $core.List<$core.int>? value,
    $0.RewardDestination? rewardDestination,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (controller != null) result.controller = controller;
    if (value != null) result.value = value;
    if (rewardDestination != null) result.rewardDestination = rewardDestination;
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_Bond._();

  factory Staking_Bond.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_Bond.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.Bond',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'controller')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aE<$0.RewardDestination>(3, _omitFieldNames ? '' : 'rewardDestination',
        enumValues: $0.RewardDestination.values)
    ..aOM<$0.CallIndices>(4, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Bond clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Bond copyWith(void Function(Staking_Bond) updates) =>
      super.copyWith((message) => updates(message as Staking_Bond))
          as Staking_Bond;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_Bond create() => Staking_Bond._();
  @$core.override
  Staking_Bond createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_Bond getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_Bond>(create);
  static Staking_Bond? _defaultInstance;

  /// controller ID (optional)
  @$pb.TagNumber(1)
  $core.String get controller => $_getSZ(0);
  @$pb.TagNumber(1)
  set controller($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasController() => $_has(0);
  @$pb.TagNumber(1)
  void clearController() => $_clearField(1);

  /// amount (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  /// destination for rewards
  @$pb.TagNumber(3)
  $0.RewardDestination get rewardDestination => $_getN(2);
  @$pb.TagNumber(3)
  set rewardDestination($0.RewardDestination value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRewardDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearRewardDestination() => $_clearField(3);

  /// call indices
  @$pb.TagNumber(4)
  $0.CallIndices get callIndices => $_getN(3);
  @$pb.TagNumber(4)
  set callIndices($0.CallIndices value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCallIndices() => $_has(3);
  @$pb.TagNumber(4)
  void clearCallIndices() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.CallIndices ensureCallIndices() => $_ensure(3);
}

/// Bond extra amount
class Staking_BondExtra extends $pb.GeneratedMessage {
  factory Staking_BondExtra({
    $core.List<$core.int>? value,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_BondExtra._();

  factory Staking_BondExtra.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_BondExtra.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.BondExtra',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aOM<$0.CallIndices>(2, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_BondExtra clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_BondExtra copyWith(void Function(Staking_BondExtra) updates) =>
      super.copyWith((message) => updates(message as Staking_BondExtra))
          as Staking_BondExtra;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_BondExtra create() => Staking_BondExtra._();
  @$core.override
  Staking_BondExtra createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_BondExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_BondExtra>(create);
  static Staking_BondExtra? _defaultInstance;

  /// amount (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// call indices
  @$pb.TagNumber(2)
  $0.CallIndices get callIndices => $_getN(1);
  @$pb.TagNumber(2)
  set callIndices($0.CallIndices value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCallIndices() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallIndices() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CallIndices ensureCallIndices() => $_ensure(1);
}

/// Unbond
class Staking_Unbond extends $pb.GeneratedMessage {
  factory Staking_Unbond({
    $core.List<$core.int>? value,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_Unbond._();

  factory Staking_Unbond.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_Unbond.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.Unbond',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aOM<$0.CallIndices>(2, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Unbond clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Unbond copyWith(void Function(Staking_Unbond) updates) =>
      super.copyWith((message) => updates(message as Staking_Unbond))
          as Staking_Unbond;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_Unbond create() => Staking_Unbond._();
  @$core.override
  Staking_Unbond createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_Unbond getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_Unbond>(create);
  static Staking_Unbond? _defaultInstance;

  /// amount (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// call indices
  @$pb.TagNumber(2)
  $0.CallIndices get callIndices => $_getN(1);
  @$pb.TagNumber(2)
  set callIndices($0.CallIndices value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCallIndices() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallIndices() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CallIndices ensureCallIndices() => $_ensure(1);
}

/// Rebond
class Staking_Rebond extends $pb.GeneratedMessage {
  factory Staking_Rebond({
    $core.List<$core.int>? value,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_Rebond._();

  factory Staking_Rebond.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_Rebond.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.Rebond',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..aOM<$0.CallIndices>(2, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Rebond clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Rebond copyWith(void Function(Staking_Rebond) updates) =>
      super.copyWith((message) => updates(message as Staking_Rebond))
          as Staking_Rebond;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_Rebond create() => Staking_Rebond._();
  @$core.override
  Staking_Rebond createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_Rebond getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_Rebond>(create);
  static Staking_Rebond? _defaultInstance;

  /// amount (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// call indices
  @$pb.TagNumber(2)
  $0.CallIndices get callIndices => $_getN(1);
  @$pb.TagNumber(2)
  set callIndices($0.CallIndices value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCallIndices() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallIndices() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CallIndices ensureCallIndices() => $_ensure(1);
}

/// Withdraw unbonded amounts
class Staking_WithdrawUnbonded extends $pb.GeneratedMessage {
  factory Staking_WithdrawUnbonded({
    $core.int? slashingSpans,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (slashingSpans != null) result.slashingSpans = slashingSpans;
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_WithdrawUnbonded._();

  factory Staking_WithdrawUnbonded.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_WithdrawUnbonded.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.WithdrawUnbonded',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'slashingSpans')
    ..aOM<$0.CallIndices>(2, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_WithdrawUnbonded clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_WithdrawUnbonded copyWith(
          void Function(Staking_WithdrawUnbonded) updates) =>
      super.copyWith((message) => updates(message as Staking_WithdrawUnbonded))
          as Staking_WithdrawUnbonded;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_WithdrawUnbonded create() => Staking_WithdrawUnbonded._();
  @$core.override
  Staking_WithdrawUnbonded createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_WithdrawUnbonded getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_WithdrawUnbonded>(create);
  static Staking_WithdrawUnbonded? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get slashingSpans => $_getIZ(0);
  @$pb.TagNumber(1)
  set slashingSpans($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSlashingSpans() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlashingSpans() => $_clearField(1);

  /// call indices
  @$pb.TagNumber(2)
  $0.CallIndices get callIndices => $_getN(1);
  @$pb.TagNumber(2)
  set callIndices($0.CallIndices value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCallIndices() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallIndices() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CallIndices ensureCallIndices() => $_ensure(1);
}

/// Nominate
class Staking_Nominate extends $pb.GeneratedMessage {
  factory Staking_Nominate({
    $core.Iterable<$core.String>? nominators,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (nominators != null) result.nominators.addAll(nominators);
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_Nominate._();

  factory Staking_Nominate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_Nominate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.Nominate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'nominators')
    ..aOM<$0.CallIndices>(2, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Nominate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Nominate copyWith(void Function(Staking_Nominate) updates) =>
      super.copyWith((message) => updates(message as Staking_Nominate))
          as Staking_Nominate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_Nominate create() => Staking_Nominate._();
  @$core.override
  Staking_Nominate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_Nominate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_Nominate>(create);
  static Staking_Nominate? _defaultInstance;

  /// list of nominators
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get nominators => $_getList(0);

  /// call indices
  @$pb.TagNumber(2)
  $0.CallIndices get callIndices => $_getN(1);
  @$pb.TagNumber(2)
  set callIndices($0.CallIndices value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCallIndices() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallIndices() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CallIndices ensureCallIndices() => $_ensure(1);
}

/// Chill
class Staking_Chill extends $pb.GeneratedMessage {
  factory Staking_Chill({
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Staking_Chill._();

  factory Staking_Chill.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking_Chill.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking.Chill',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOM<$0.CallIndices>(1, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Chill clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking_Chill copyWith(void Function(Staking_Chill) updates) =>
      super.copyWith((message) => updates(message as Staking_Chill))
          as Staking_Chill;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking_Chill create() => Staking_Chill._();
  @$core.override
  Staking_Chill createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking_Chill getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Staking_Chill>(create);
  static Staking_Chill? _defaultInstance;

  /// call indices
  @$pb.TagNumber(1)
  $0.CallIndices get callIndices => $_getN(0);
  @$pb.TagNumber(1)
  set callIndices($0.CallIndices value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCallIndices() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallIndices() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CallIndices ensureCallIndices() => $_ensure(0);
}

enum Staking_MessageOneof {
  bond,
  bondExtra,
  unbond,
  withdrawUnbonded,
  nominate,
  chill,
  rebond,
  notSet
}

/// Staking transaction
class Staking extends $pb.GeneratedMessage {
  factory Staking({
    Staking_Bond? bond,
    Staking_BondExtra? bondExtra,
    Staking_Unbond? unbond,
    Staking_WithdrawUnbonded? withdrawUnbonded,
    Staking_Nominate? nominate,
    Staking_Chill? chill,
    Staking_Rebond? rebond,
  }) {
    final result = create();
    if (bond != null) result.bond = bond;
    if (bondExtra != null) result.bondExtra = bondExtra;
    if (unbond != null) result.unbond = unbond;
    if (withdrawUnbonded != null) result.withdrawUnbonded = withdrawUnbonded;
    if (nominate != null) result.nominate = nominate;
    if (chill != null) result.chill = chill;
    if (rebond != null) result.rebond = rebond;
    return result;
  }

  Staking._();

  factory Staking.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Staking.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Staking_MessageOneof>
      _Staking_MessageOneofByTag = {
    1: Staking_MessageOneof.bond,
    2: Staking_MessageOneof.bondExtra,
    3: Staking_MessageOneof.unbond,
    4: Staking_MessageOneof.withdrawUnbonded,
    5: Staking_MessageOneof.nominate,
    6: Staking_MessageOneof.chill,
    7: Staking_MessageOneof.rebond,
    0: Staking_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Staking',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
    ..aOM<Staking_Bond>(1, _omitFieldNames ? '' : 'bond',
        subBuilder: Staking_Bond.create)
    ..aOM<Staking_BondExtra>(2, _omitFieldNames ? '' : 'bondExtra',
        subBuilder: Staking_BondExtra.create)
    ..aOM<Staking_Unbond>(3, _omitFieldNames ? '' : 'unbond',
        subBuilder: Staking_Unbond.create)
    ..aOM<Staking_WithdrawUnbonded>(
        4, _omitFieldNames ? '' : 'withdrawUnbonded',
        subBuilder: Staking_WithdrawUnbonded.create)
    ..aOM<Staking_Nominate>(5, _omitFieldNames ? '' : 'nominate',
        subBuilder: Staking_Nominate.create)
    ..aOM<Staking_Chill>(6, _omitFieldNames ? '' : 'chill',
        subBuilder: Staking_Chill.create)
    ..aOM<Staking_Rebond>(7, _omitFieldNames ? '' : 'rebond',
        subBuilder: Staking_Rebond.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Staking copyWith(void Function(Staking) updates) =>
      super.copyWith((message) => updates(message as Staking)) as Staking;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Staking create() => Staking._();
  @$core.override
  Staking createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Staking getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Staking>(create);
  static Staking? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  Staking_MessageOneof whichMessageOneof() =>
      _Staking_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Staking_Bond get bond => $_getN(0);
  @$pb.TagNumber(1)
  set bond(Staking_Bond value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBond() => $_has(0);
  @$pb.TagNumber(1)
  void clearBond() => $_clearField(1);
  @$pb.TagNumber(1)
  Staking_Bond ensureBond() => $_ensure(0);

  @$pb.TagNumber(2)
  Staking_BondExtra get bondExtra => $_getN(1);
  @$pb.TagNumber(2)
  set bondExtra(Staking_BondExtra value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBondExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearBondExtra() => $_clearField(2);
  @$pb.TagNumber(2)
  Staking_BondExtra ensureBondExtra() => $_ensure(1);

  @$pb.TagNumber(3)
  Staking_Unbond get unbond => $_getN(2);
  @$pb.TagNumber(3)
  set unbond(Staking_Unbond value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUnbond() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnbond() => $_clearField(3);
  @$pb.TagNumber(3)
  Staking_Unbond ensureUnbond() => $_ensure(2);

  @$pb.TagNumber(4)
  Staking_WithdrawUnbonded get withdrawUnbonded => $_getN(3);
  @$pb.TagNumber(4)
  set withdrawUnbonded(Staking_WithdrawUnbonded value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasWithdrawUnbonded() => $_has(3);
  @$pb.TagNumber(4)
  void clearWithdrawUnbonded() => $_clearField(4);
  @$pb.TagNumber(4)
  Staking_WithdrawUnbonded ensureWithdrawUnbonded() => $_ensure(3);

  @$pb.TagNumber(5)
  Staking_Nominate get nominate => $_getN(4);
  @$pb.TagNumber(5)
  set nominate(Staking_Nominate value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNominate() => $_has(4);
  @$pb.TagNumber(5)
  void clearNominate() => $_clearField(5);
  @$pb.TagNumber(5)
  Staking_Nominate ensureNominate() => $_ensure(4);

  @$pb.TagNumber(6)
  Staking_Chill get chill => $_getN(5);
  @$pb.TagNumber(6)
  set chill(Staking_Chill value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasChill() => $_has(5);
  @$pb.TagNumber(6)
  void clearChill() => $_clearField(6);
  @$pb.TagNumber(6)
  Staking_Chill ensureChill() => $_ensure(5);

  @$pb.TagNumber(7)
  Staking_Rebond get rebond => $_getN(6);
  @$pb.TagNumber(7)
  set rebond(Staking_Rebond value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasRebond() => $_has(6);
  @$pb.TagNumber(7)
  void clearRebond() => $_clearField(7);
  @$pb.TagNumber(7)
  Staking_Rebond ensureRebond() => $_ensure(6);
}

class IdentityId extends $pb.GeneratedMessage {
  factory IdentityId({
    $core.List<$core.int>? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  IdentityId._();

  factory IdentityId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IdentityId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IdentityId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IdentityId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IdentityId copyWith(void Function(IdentityId) updates) =>
      super.copyWith((message) => updates(message as IdentityId)) as IdentityId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IdentityId create() => IdentityId._();
  @$core.override
  IdentityId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IdentityId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IdentityId>(create);
  static IdentityId? _defaultInstance;

  /// 32 byte identity id.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class AssetId extends $pb.GeneratedMessage {
  factory AssetId({
    $core.List<$core.int>? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  AssetId._();

  factory AssetId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetId copyWith(void Function(AssetId) updates) =>
      super.copyWith((message) => updates(message as AssetId)) as AssetId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetId create() => AssetId._();
  @$core.override
  AssetId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetId>(create);
  static AssetId? _defaultInstance;

  /// 16 byte asset id.
  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class PortfolioId extends $pb.GeneratedMessage {
  factory PortfolioId({
    IdentityId? identity,
    $core.bool? default_2,
    $fixnum.Int64? user,
  }) {
    final result = create();
    if (identity != null) result.identity = identity;
    if (default_2 != null) result.default_2 = default_2;
    if (user != null) result.user = user;
    return result;
  }

  PortfolioId._();

  factory PortfolioId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PortfolioId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PortfolioId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOM<IdentityId>(1, _omitFieldNames ? '' : 'identity',
        subBuilder: IdentityId.create)
    ..aOB(2, _omitFieldNames ? '' : 'default')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'user', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioId copyWith(void Function(PortfolioId) updates) =>
      super.copyWith((message) => updates(message as PortfolioId))
          as PortfolioId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioId create() => PortfolioId._();
  @$core.override
  PortfolioId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PortfolioId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PortfolioId>(create);
  static PortfolioId? _defaultInstance;

  /// IdentityId of the portfolio owner.
  @$pb.TagNumber(1)
  IdentityId get identity => $_getN(0);
  @$pb.TagNumber(1)
  set identity(IdentityId value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentity() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentity() => $_clearField(1);
  @$pb.TagNumber(1)
  IdentityId ensureIdentity() => $_ensure(0);

  /// If `default` is true ignore the `user` field.
  @$pb.TagNumber(2)
  $core.bool get default_2 => $_getBF(1);
  @$pb.TagNumber(2)
  set default_2($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDefault_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefault_2() => $_clearField(2);

  /// The users portfolio number.  (ignored if `default = true`)
  @$pb.TagNumber(3)
  $fixnum.Int64 get user => $_getI64(2);
  @$pb.TagNumber(3)
  set user($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => $_clearField(3);
}

class SecondaryKeyPermissions_AssetPermissions extends $pb.GeneratedMessage {
  factory SecondaryKeyPermissions_AssetPermissions({
    SecondaryKeyPermissions_RestrictionKind? kind,
    $core.Iterable<AssetId>? assets,
  }) {
    final result = create();
    if (kind != null) result.kind = kind;
    if (assets != null) result.assets.addAll(assets);
    return result;
  }

  SecondaryKeyPermissions_AssetPermissions._();

  factory SecondaryKeyPermissions_AssetPermissions.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecondaryKeyPermissions_AssetPermissions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecondaryKeyPermissions.AssetPermissions',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aE<SecondaryKeyPermissions_RestrictionKind>(
        1, _omitFieldNames ? '' : 'kind',
        enumValues: SecondaryKeyPermissions_RestrictionKind.values)
    ..pPM<AssetId>(2, _omitFieldNames ? '' : 'assets',
        subBuilder: AssetId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_AssetPermissions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_AssetPermissions copyWith(
          void Function(SecondaryKeyPermissions_AssetPermissions) updates) =>
      super.copyWith((message) =>
              updates(message as SecondaryKeyPermissions_AssetPermissions))
          as SecondaryKeyPermissions_AssetPermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_AssetPermissions create() =>
      SecondaryKeyPermissions_AssetPermissions._();
  @$core.override
  SecondaryKeyPermissions_AssetPermissions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_AssetPermissions getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SecondaryKeyPermissions_AssetPermissions>(create);
  static SecondaryKeyPermissions_AssetPermissions? _defaultInstance;

  @$pb.TagNumber(1)
  SecondaryKeyPermissions_RestrictionKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(SecondaryKeyPermissions_RestrictionKind value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<AssetId> get assets => $_getList(1);
}

class SecondaryKeyPermissions_PortfolioPermissions
    extends $pb.GeneratedMessage {
  factory SecondaryKeyPermissions_PortfolioPermissions({
    SecondaryKeyPermissions_RestrictionKind? kind,
    $core.Iterable<PortfolioId>? portfolios,
  }) {
    final result = create();
    if (kind != null) result.kind = kind;
    if (portfolios != null) result.portfolios.addAll(portfolios);
    return result;
  }

  SecondaryKeyPermissions_PortfolioPermissions._();

  factory SecondaryKeyPermissions_PortfolioPermissions.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecondaryKeyPermissions_PortfolioPermissions.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecondaryKeyPermissions.PortfolioPermissions',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aE<SecondaryKeyPermissions_RestrictionKind>(
        1, _omitFieldNames ? '' : 'kind',
        enumValues: SecondaryKeyPermissions_RestrictionKind.values)
    ..pPM<PortfolioId>(2, _omitFieldNames ? '' : 'portfolios',
        subBuilder: PortfolioId.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_PortfolioPermissions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_PortfolioPermissions copyWith(
          void Function(SecondaryKeyPermissions_PortfolioPermissions)
              updates) =>
      super.copyWith((message) =>
              updates(message as SecondaryKeyPermissions_PortfolioPermissions))
          as SecondaryKeyPermissions_PortfolioPermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_PortfolioPermissions create() =>
      SecondaryKeyPermissions_PortfolioPermissions._();
  @$core.override
  SecondaryKeyPermissions_PortfolioPermissions createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_PortfolioPermissions getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SecondaryKeyPermissions_PortfolioPermissions>(create);
  static SecondaryKeyPermissions_PortfolioPermissions? _defaultInstance;

  @$pb.TagNumber(1)
  SecondaryKeyPermissions_RestrictionKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(SecondaryKeyPermissions_RestrictionKind value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PortfolioId> get portfolios => $_getList(1);
}

class SecondaryKeyPermissions_PalletPermissions extends $pb.GeneratedMessage {
  factory SecondaryKeyPermissions_PalletPermissions({
    $core.String? palletName,
    SecondaryKeyPermissions_RestrictionKind? kind,
    $core.Iterable<$core.String>? extrinsicNames,
  }) {
    final result = create();
    if (palletName != null) result.palletName = palletName;
    if (kind != null) result.kind = kind;
    if (extrinsicNames != null) result.extrinsicNames.addAll(extrinsicNames);
    return result;
  }

  SecondaryKeyPermissions_PalletPermissions._();

  factory SecondaryKeyPermissions_PalletPermissions.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecondaryKeyPermissions_PalletPermissions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecondaryKeyPermissions.PalletPermissions',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'palletName')
    ..aE<SecondaryKeyPermissions_RestrictionKind>(
        2, _omitFieldNames ? '' : 'kind',
        enumValues: SecondaryKeyPermissions_RestrictionKind.values)
    ..pPS(3, _omitFieldNames ? '' : 'extrinsicNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_PalletPermissions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_PalletPermissions copyWith(
          void Function(SecondaryKeyPermissions_PalletPermissions) updates) =>
      super.copyWith((message) =>
              updates(message as SecondaryKeyPermissions_PalletPermissions))
          as SecondaryKeyPermissions_PalletPermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_PalletPermissions create() =>
      SecondaryKeyPermissions_PalletPermissions._();
  @$core.override
  SecondaryKeyPermissions_PalletPermissions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_PalletPermissions getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SecondaryKeyPermissions_PalletPermissions>(create);
  static SecondaryKeyPermissions_PalletPermissions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get palletName => $_getSZ(0);
  @$pb.TagNumber(1)
  set palletName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPalletName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPalletName() => $_clearField(1);

  @$pb.TagNumber(2)
  SecondaryKeyPermissions_RestrictionKind get kind => $_getN(1);
  @$pb.TagNumber(2)
  set kind(SecondaryKeyPermissions_RestrictionKind value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKind() => $_has(1);
  @$pb.TagNumber(2)
  void clearKind() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get extrinsicNames => $_getList(2);
}

class SecondaryKeyPermissions_ExtrinsicPermissions
    extends $pb.GeneratedMessage {
  factory SecondaryKeyPermissions_ExtrinsicPermissions({
    SecondaryKeyPermissions_RestrictionKind? kind,
    $core.Iterable<SecondaryKeyPermissions_PalletPermissions>? pallets,
  }) {
    final result = create();
    if (kind != null) result.kind = kind;
    if (pallets != null) result.pallets.addAll(pallets);
    return result;
  }

  SecondaryKeyPermissions_ExtrinsicPermissions._();

  factory SecondaryKeyPermissions_ExtrinsicPermissions.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecondaryKeyPermissions_ExtrinsicPermissions.fromJson(
          $core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecondaryKeyPermissions.ExtrinsicPermissions',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aE<SecondaryKeyPermissions_RestrictionKind>(
        1, _omitFieldNames ? '' : 'kind',
        enumValues: SecondaryKeyPermissions_RestrictionKind.values)
    ..pPM<SecondaryKeyPermissions_PalletPermissions>(
        2, _omitFieldNames ? '' : 'pallets',
        subBuilder: SecondaryKeyPermissions_PalletPermissions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_ExtrinsicPermissions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions_ExtrinsicPermissions copyWith(
          void Function(SecondaryKeyPermissions_ExtrinsicPermissions)
              updates) =>
      super.copyWith((message) =>
              updates(message as SecondaryKeyPermissions_ExtrinsicPermissions))
          as SecondaryKeyPermissions_ExtrinsicPermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_ExtrinsicPermissions create() =>
      SecondaryKeyPermissions_ExtrinsicPermissions._();
  @$core.override
  SecondaryKeyPermissions_ExtrinsicPermissions createEmptyInstance() =>
      create();
  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions_ExtrinsicPermissions getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SecondaryKeyPermissions_ExtrinsicPermissions>(create);
  static SecondaryKeyPermissions_ExtrinsicPermissions? _defaultInstance;

  @$pb.TagNumber(1)
  SecondaryKeyPermissions_RestrictionKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(SecondaryKeyPermissions_RestrictionKind value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<SecondaryKeyPermissions_PalletPermissions> get pallets =>
      $_getList(1);
}

class SecondaryKeyPermissions extends $pb.GeneratedMessage {
  factory SecondaryKeyPermissions({
    SecondaryKeyPermissions_AssetPermissions? asset,
    SecondaryKeyPermissions_ExtrinsicPermissions? extrinsic,
    SecondaryKeyPermissions_PortfolioPermissions? portfolio,
  }) {
    final result = create();
    if (asset != null) result.asset = asset;
    if (extrinsic != null) result.extrinsic = extrinsic;
    if (portfolio != null) result.portfolio = portfolio;
    return result;
  }

  SecondaryKeyPermissions._();

  factory SecondaryKeyPermissions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SecondaryKeyPermissions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SecondaryKeyPermissions',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOM<SecondaryKeyPermissions_AssetPermissions>(
        1, _omitFieldNames ? '' : 'asset',
        subBuilder: SecondaryKeyPermissions_AssetPermissions.create)
    ..aOM<SecondaryKeyPermissions_ExtrinsicPermissions>(
        2, _omitFieldNames ? '' : 'extrinsic',
        subBuilder: SecondaryKeyPermissions_ExtrinsicPermissions.create)
    ..aOM<SecondaryKeyPermissions_PortfolioPermissions>(
        3, _omitFieldNames ? '' : 'portfolio',
        subBuilder: SecondaryKeyPermissions_PortfolioPermissions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SecondaryKeyPermissions copyWith(
          void Function(SecondaryKeyPermissions) updates) =>
      super.copyWith((message) => updates(message as SecondaryKeyPermissions))
          as SecondaryKeyPermissions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions create() => SecondaryKeyPermissions._();
  @$core.override
  SecondaryKeyPermissions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SecondaryKeyPermissions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SecondaryKeyPermissions>(create);
  static SecondaryKeyPermissions? _defaultInstance;

  /// The assets permissions of the secondary key.
  @$pb.TagNumber(1)
  SecondaryKeyPermissions_AssetPermissions get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(SecondaryKeyPermissions_AssetPermissions value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  SecondaryKeyPermissions_AssetPermissions ensureAsset() => $_ensure(0);

  /// The pallet/extrinsic permissions of the secondary key.
  @$pb.TagNumber(2)
  SecondaryKeyPermissions_ExtrinsicPermissions get extrinsic => $_getN(1);
  @$pb.TagNumber(2)
  set extrinsic(SecondaryKeyPermissions_ExtrinsicPermissions value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasExtrinsic() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtrinsic() => $_clearField(2);
  @$pb.TagNumber(2)
  SecondaryKeyPermissions_ExtrinsicPermissions ensureExtrinsic() => $_ensure(1);

  /// The portfolio permissions of the secondary key.
  @$pb.TagNumber(3)
  SecondaryKeyPermissions_PortfolioPermissions get portfolio => $_getN(2);
  @$pb.TagNumber(3)
  set portfolio(SecondaryKeyPermissions_PortfolioPermissions value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPortfolio() => $_has(2);
  @$pb.TagNumber(3)
  void clearPortfolio() => $_clearField(3);
  @$pb.TagNumber(3)
  SecondaryKeyPermissions_PortfolioPermissions ensurePortfolio() => $_ensure(2);
}

/// Identity::join_identity_as_key call
class Identity_JoinIdentityAsKey extends $pb.GeneratedMessage {
  factory Identity_JoinIdentityAsKey({
    $0.CallIndices? callIndices,
    $fixnum.Int64? authId,
  }) {
    final result = create();
    if (callIndices != null) result.callIndices = callIndices;
    if (authId != null) result.authId = authId;
    return result;
  }

  Identity_JoinIdentityAsKey._();

  factory Identity_JoinIdentityAsKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Identity_JoinIdentityAsKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Identity.JoinIdentityAsKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOM<$0.CallIndices>(1, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'authId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_JoinIdentityAsKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_JoinIdentityAsKey copyWith(
          void Function(Identity_JoinIdentityAsKey) updates) =>
      super.copyWith(
              (message) => updates(message as Identity_JoinIdentityAsKey))
          as Identity_JoinIdentityAsKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identity_JoinIdentityAsKey create() => Identity_JoinIdentityAsKey._();
  @$core.override
  Identity_JoinIdentityAsKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Identity_JoinIdentityAsKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Identity_JoinIdentityAsKey>(create);
  static Identity_JoinIdentityAsKey? _defaultInstance;

  /// call indices
  @$pb.TagNumber(1)
  $0.CallIndices get callIndices => $_getN(0);
  @$pb.TagNumber(1)
  set callIndices($0.CallIndices value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCallIndices() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallIndices() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CallIndices ensureCallIndices() => $_ensure(0);

  /// auth id
  @$pb.TagNumber(2)
  $fixnum.Int64 get authId => $_getI64(1);
  @$pb.TagNumber(2)
  set authId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthId() => $_clearField(2);
}

/// Identity::leave_identity_as_key call
class Identity_LeaveIdentityAsKey extends $pb.GeneratedMessage {
  factory Identity_LeaveIdentityAsKey({
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Identity_LeaveIdentityAsKey._();

  factory Identity_LeaveIdentityAsKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Identity_LeaveIdentityAsKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Identity.LeaveIdentityAsKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOM<$0.CallIndices>(1, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_LeaveIdentityAsKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_LeaveIdentityAsKey copyWith(
          void Function(Identity_LeaveIdentityAsKey) updates) =>
      super.copyWith(
              (message) => updates(message as Identity_LeaveIdentityAsKey))
          as Identity_LeaveIdentityAsKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identity_LeaveIdentityAsKey create() =>
      Identity_LeaveIdentityAsKey._();
  @$core.override
  Identity_LeaveIdentityAsKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Identity_LeaveIdentityAsKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Identity_LeaveIdentityAsKey>(create);
  static Identity_LeaveIdentityAsKey? _defaultInstance;

  /// call indices
  @$pb.TagNumber(1)
  $0.CallIndices get callIndices => $_getN(0);
  @$pb.TagNumber(1)
  set callIndices($0.CallIndices value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCallIndices() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallIndices() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CallIndices ensureCallIndices() => $_ensure(0);
}

enum Identity_AddAuthorization_Authorization_AuthOneof { joinIdentity, notSet }

class Identity_AddAuthorization_Authorization extends $pb.GeneratedMessage {
  factory Identity_AddAuthorization_Authorization({
    SecondaryKeyPermissions? joinIdentity,
  }) {
    final result = create();
    if (joinIdentity != null) result.joinIdentity = joinIdentity;
    return result;
  }

  Identity_AddAuthorization_Authorization._();

  factory Identity_AddAuthorization_Authorization.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Identity_AddAuthorization_Authorization.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core
      .Map<$core.int, Identity_AddAuthorization_Authorization_AuthOneof>
      _Identity_AddAuthorization_Authorization_AuthOneofByTag = {
    6: Identity_AddAuthorization_Authorization_AuthOneof.joinIdentity,
    0: Identity_AddAuthorization_Authorization_AuthOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Identity.AddAuthorization.Authorization',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..oo(0, [6])
    ..aOM<SecondaryKeyPermissions>(6, _omitFieldNames ? '' : 'joinIdentity',
        subBuilder: SecondaryKeyPermissions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_AddAuthorization_Authorization clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_AddAuthorization_Authorization copyWith(
          void Function(Identity_AddAuthorization_Authorization) updates) =>
      super.copyWith((message) =>
              updates(message as Identity_AddAuthorization_Authorization))
          as Identity_AddAuthorization_Authorization;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identity_AddAuthorization_Authorization create() =>
      Identity_AddAuthorization_Authorization._();
  @$core.override
  Identity_AddAuthorization_Authorization createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Identity_AddAuthorization_Authorization getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          Identity_AddAuthorization_Authorization>(create);
  static Identity_AddAuthorization_Authorization? _defaultInstance;

  @$pb.TagNumber(6)
  Identity_AddAuthorization_Authorization_AuthOneof whichAuthOneof() =>
      _Identity_AddAuthorization_Authorization_AuthOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(6)
  void clearAuthOneof() => $_clearField($_whichOneof(0));

  /// AttestPrimaryKeyRotation(IdentityId) = 1
  /// RotatePrimaryKey = 2
  /// TransferTicker(Ticker) = 3
  /// AddMultiSigSigner(AccountId) = 4
  /// TransferAssetOwnership(AssetId) = 5
  @$pb.TagNumber(6)
  SecondaryKeyPermissions get joinIdentity => $_getN(0);
  @$pb.TagNumber(6)
  set joinIdentity(SecondaryKeyPermissions value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasJoinIdentity() => $_has(0);
  @$pb.TagNumber(6)
  void clearJoinIdentity() => $_clearField(6);
  @$pb.TagNumber(6)
  SecondaryKeyPermissions ensureJoinIdentity() => $_ensure(0);
}

/// Identity::add_authorization call
class Identity_AddAuthorization extends $pb.GeneratedMessage {
  factory Identity_AddAuthorization({
    $0.CallIndices? callIndices,
    $core.String? target,
    Identity_AddAuthorization_Authorization? authorization,
    $fixnum.Int64? expiry,
  }) {
    final result = create();
    if (callIndices != null) result.callIndices = callIndices;
    if (target != null) result.target = target;
    if (authorization != null) result.authorization = authorization;
    if (expiry != null) result.expiry = expiry;
    return result;
  }

  Identity_AddAuthorization._();

  factory Identity_AddAuthorization.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Identity_AddAuthorization.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Identity.AddAuthorization',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aOM<$0.CallIndices>(1, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..aOS(2, _omitFieldNames ? '' : 'target')
    ..aOM<Identity_AddAuthorization_Authorization>(
        3, _omitFieldNames ? '' : 'authorization',
        subBuilder: Identity_AddAuthorization_Authorization.create)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'expiry', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_AddAuthorization clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity_AddAuthorization copyWith(
          void Function(Identity_AddAuthorization) updates) =>
      super.copyWith((message) => updates(message as Identity_AddAuthorization))
          as Identity_AddAuthorization;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identity_AddAuthorization create() => Identity_AddAuthorization._();
  @$core.override
  Identity_AddAuthorization createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Identity_AddAuthorization getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Identity_AddAuthorization>(create);
  static Identity_AddAuthorization? _defaultInstance;

  /// call indices
  @$pb.TagNumber(1)
  $0.CallIndices get callIndices => $_getN(0);
  @$pb.TagNumber(1)
  set callIndices($0.CallIndices value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCallIndices() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallIndices() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CallIndices ensureCallIndices() => $_ensure(0);

  /// address that will be added to the Identity
  @$pb.TagNumber(2)
  $core.String get target => $_getSZ(1);
  @$pb.TagNumber(2)
  set target($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTarget() => $_has(1);
  @$pb.TagNumber(2)
  void clearTarget() => $_clearField(2);

  /// Authorization.
  @$pb.TagNumber(3)
  Identity_AddAuthorization_Authorization get authorization => $_getN(2);
  @$pb.TagNumber(3)
  set authorization(Identity_AddAuthorization_Authorization value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAuthorization() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthorization() => $_clearField(3);
  @$pb.TagNumber(3)
  Identity_AddAuthorization_Authorization ensureAuthorization() => $_ensure(2);

  /// expire time, unix seconds
  @$pb.TagNumber(4)
  $fixnum.Int64 get expiry => $_getI64(3);
  @$pb.TagNumber(4)
  set expiry($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiry() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiry() => $_clearField(4);
}

enum Identity_MessageOneof {
  joinIdentityAsKey,
  addAuthorization,
  leaveIdentityAsKey,
  notSet
}

/// Identity module
class Identity extends $pb.GeneratedMessage {
  factory Identity({
    Identity_JoinIdentityAsKey? joinIdentityAsKey,
    Identity_AddAuthorization? addAuthorization,
    Identity_LeaveIdentityAsKey? leaveIdentityAsKey,
  }) {
    final result = create();
    if (joinIdentityAsKey != null) result.joinIdentityAsKey = joinIdentityAsKey;
    if (addAuthorization != null) result.addAuthorization = addAuthorization;
    if (leaveIdentityAsKey != null)
      result.leaveIdentityAsKey = leaveIdentityAsKey;
    return result;
  }

  Identity._();

  factory Identity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Identity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Identity_MessageOneof>
      _Identity_MessageOneofByTag = {
    1: Identity_MessageOneof.joinIdentityAsKey,
    2: Identity_MessageOneof.addAuthorization,
    3: Identity_MessageOneof.leaveIdentityAsKey,
    0: Identity_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Identity',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<Identity_JoinIdentityAsKey>(
        1, _omitFieldNames ? '' : 'joinIdentityAsKey',
        subBuilder: Identity_JoinIdentityAsKey.create)
    ..aOM<Identity_AddAuthorization>(
        2, _omitFieldNames ? '' : 'addAuthorization',
        subBuilder: Identity_AddAuthorization.create)
    ..aOM<Identity_LeaveIdentityAsKey>(
        3, _omitFieldNames ? '' : 'leaveIdentityAsKey',
        subBuilder: Identity_LeaveIdentityAsKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Identity copyWith(void Function(Identity) updates) =>
      super.copyWith((message) => updates(message as Identity)) as Identity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Identity create() => Identity._();
  @$core.override
  Identity createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Identity getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Identity>(create);
  static Identity? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  Identity_MessageOneof whichMessageOneof() =>
      _Identity_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Identity_JoinIdentityAsKey get joinIdentityAsKey => $_getN(0);
  @$pb.TagNumber(1)
  set joinIdentityAsKey(Identity_JoinIdentityAsKey value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasJoinIdentityAsKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearJoinIdentityAsKey() => $_clearField(1);
  @$pb.TagNumber(1)
  Identity_JoinIdentityAsKey ensureJoinIdentityAsKey() => $_ensure(0);

  @$pb.TagNumber(2)
  Identity_AddAuthorization get addAuthorization => $_getN(1);
  @$pb.TagNumber(2)
  set addAuthorization(Identity_AddAuthorization value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAddAuthorization() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddAuthorization() => $_clearField(2);
  @$pb.TagNumber(2)
  Identity_AddAuthorization ensureAddAuthorization() => $_ensure(1);

  @$pb.TagNumber(3)
  Identity_LeaveIdentityAsKey get leaveIdentityAsKey => $_getN(2);
  @$pb.TagNumber(3)
  set leaveIdentityAsKey(Identity_LeaveIdentityAsKey value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaveIdentityAsKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaveIdentityAsKey() => $_clearField(3);
  @$pb.TagNumber(3)
  Identity_LeaveIdentityAsKey ensureLeaveIdentityAsKey() => $_ensure(2);
}

class Utility_Batch extends $pb.GeneratedMessage {
  factory Utility_Batch({
    Utility_BatchKind? kind,
    $core.Iterable<RuntimeCall>? calls,
    $0.CallIndices? callIndices,
  }) {
    final result = create();
    if (kind != null) result.kind = kind;
    if (calls != null) result.calls.addAll(calls);
    if (callIndices != null) result.callIndices = callIndices;
    return result;
  }

  Utility_Batch._();

  factory Utility_Batch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Utility_Batch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Utility.Batch',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..aE<Utility_BatchKind>(1, _omitFieldNames ? '' : 'kind',
        enumValues: Utility_BatchKind.values)
    ..pPM<RuntimeCall>(2, _omitFieldNames ? '' : 'calls',
        subBuilder: RuntimeCall.create)
    ..aOM<$0.CallIndices>(3, _omitFieldNames ? '' : 'callIndices',
        subBuilder: $0.CallIndices.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Utility_Batch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Utility_Batch copyWith(void Function(Utility_Batch) updates) =>
      super.copyWith((message) => updates(message as Utility_Batch))
          as Utility_Batch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Utility_Batch create() => Utility_Batch._();
  @$core.override
  Utility_Batch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Utility_Batch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Utility_Batch>(create);
  static Utility_Batch? _defaultInstance;

  /// The type of batch.
  @$pb.TagNumber(1)
  Utility_BatchKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(Utility_BatchKind value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => $_clearField(1);

  /// batched calls.
  @$pb.TagNumber(2)
  $pb.PbList<RuntimeCall> get calls => $_getList(1);

  /// call indices
  @$pb.TagNumber(3)
  $0.CallIndices get callIndices => $_getN(2);
  @$pb.TagNumber(3)
  set callIndices($0.CallIndices value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCallIndices() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallIndices() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.CallIndices ensureCallIndices() => $_ensure(2);
}

enum Utility_MessageOneof { batch, notSet }

/// Utility pallet transaction
class Utility extends $pb.GeneratedMessage {
  factory Utility({
    Utility_Batch? batch,
  }) {
    final result = create();
    if (batch != null) result.batch = batch;
    return result;
  }

  Utility._();

  factory Utility.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Utility.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Utility_MessageOneof>
      _Utility_MessageOneofByTag = {
    1: Utility_MessageOneof.batch,
    0: Utility_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Utility',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Utility_Batch>(1, _omitFieldNames ? '' : 'batch',
        subBuilder: Utility_Batch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Utility clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Utility copyWith(void Function(Utility) updates) =>
      super.copyWith((message) => updates(message as Utility)) as Utility;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Utility create() => Utility._();
  @$core.override
  Utility createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Utility getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Utility>(create);
  static Utility? _defaultInstance;

  @$pb.TagNumber(1)
  Utility_MessageOneof whichMessageOneof() =>
      _Utility_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Utility_Batch get batch => $_getN(0);
  @$pb.TagNumber(1)
  set batch(Utility_Batch value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBatch() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatch() => $_clearField(1);
  @$pb.TagNumber(1)
  Utility_Batch ensureBatch() => $_ensure(0);
}

enum RuntimeCall_PalletOneof {
  balanceCall,
  stakingCall,
  identityCall,
  utilityCall,
  notSet
}

/// Polymesh runtime call.
class RuntimeCall extends $pb.GeneratedMessage {
  factory RuntimeCall({
    Balance? balanceCall,
    Staking? stakingCall,
    Identity? identityCall,
    Utility? utilityCall,
  }) {
    final result = create();
    if (balanceCall != null) result.balanceCall = balanceCall;
    if (stakingCall != null) result.stakingCall = stakingCall;
    if (identityCall != null) result.identityCall = identityCall;
    if (utilityCall != null) result.utilityCall = utilityCall;
    return result;
  }

  RuntimeCall._();

  factory RuntimeCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RuntimeCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RuntimeCall_PalletOneof>
      _RuntimeCall_PalletOneofByTag = {
    1: RuntimeCall_PalletOneof.balanceCall,
    2: RuntimeCall_PalletOneof.stakingCall,
    3: RuntimeCall_PalletOneof.identityCall,
    4: RuntimeCall_PalletOneof.utilityCall,
    0: RuntimeCall_PalletOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RuntimeCall',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<Balance>(1, _omitFieldNames ? '' : 'balanceCall',
        subBuilder: Balance.create)
    ..aOM<Staking>(2, _omitFieldNames ? '' : 'stakingCall',
        subBuilder: Staking.create)
    ..aOM<Identity>(3, _omitFieldNames ? '' : 'identityCall',
        subBuilder: Identity.create)
    ..aOM<Utility>(4, _omitFieldNames ? '' : 'utilityCall',
        subBuilder: Utility.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RuntimeCall clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RuntimeCall copyWith(void Function(RuntimeCall) updates) =>
      super.copyWith((message) => updates(message as RuntimeCall))
          as RuntimeCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeCall create() => RuntimeCall._();
  @$core.override
  RuntimeCall createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RuntimeCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RuntimeCall>(create);
  static RuntimeCall? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  RuntimeCall_PalletOneof whichPalletOneof() =>
      _RuntimeCall_PalletOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearPalletOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Balance get balanceCall => $_getN(0);
  @$pb.TagNumber(1)
  set balanceCall(Balance value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBalanceCall() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalanceCall() => $_clearField(1);
  @$pb.TagNumber(1)
  Balance ensureBalanceCall() => $_ensure(0);

  @$pb.TagNumber(2)
  Staking get stakingCall => $_getN(1);
  @$pb.TagNumber(2)
  set stakingCall(Staking value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStakingCall() => $_has(1);
  @$pb.TagNumber(2)
  void clearStakingCall() => $_clearField(2);
  @$pb.TagNumber(2)
  Staking ensureStakingCall() => $_ensure(1);

  @$pb.TagNumber(3)
  Identity get identityCall => $_getN(2);
  @$pb.TagNumber(3)
  set identityCall(Identity value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasIdentityCall() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdentityCall() => $_clearField(3);
  @$pb.TagNumber(3)
  Identity ensureIdentityCall() => $_ensure(2);

  @$pb.TagNumber(4)
  Utility get utilityCall => $_getN(3);
  @$pb.TagNumber(4)
  set utilityCall(Utility value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUtilityCall() => $_has(3);
  @$pb.TagNumber(4)
  void clearUtilityCall() => $_clearField(4);
  @$pb.TagNumber(4)
  Utility ensureUtilityCall() => $_ensure(3);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? blockHash,
    $core.List<$core.int>? genesisHash,
    $fixnum.Int64? nonce,
    $core.int? specVersion,
    $core.int? transactionVersion,
    $core.List<$core.int>? tip,
    $0.Era? era,
    $core.List<$core.int>? privateKey,
    $core.int? network,
    RuntimeCall? runtimeCall,
  }) {
    final result = create();
    if (blockHash != null) result.blockHash = blockHash;
    if (genesisHash != null) result.genesisHash = genesisHash;
    if (nonce != null) result.nonce = nonce;
    if (specVersion != null) result.specVersion = specVersion;
    if (transactionVersion != null)
      result.transactionVersion = transactionVersion;
    if (tip != null) result.tip = tip;
    if (era != null) result.era = era;
    if (privateKey != null) result.privateKey = privateKey;
    if (network != null) result.network = network;
    if (runtimeCall != null) result.runtimeCall = runtimeCall;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'blockHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'genesisHash', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'specVersion',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'transactionVersion',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'tip', $pb.PbFieldType.OY)
    ..aOM<$0.Era>(7, _omitFieldNames ? '' : 'era', subBuilder: $0.Era.create)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aI(9, _omitFieldNames ? '' : 'network', fieldType: $pb.PbFieldType.OU3)
    ..aOM<RuntimeCall>(10, _omitFieldNames ? '' : 'runtimeCall',
        subBuilder: RuntimeCall.create)
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

  /// Recent block hash, or genesis hash if era is not set
  @$pb.TagNumber(1)
  $core.List<$core.int> get blockHash => $_getN(0);
  @$pb.TagNumber(1)
  set blockHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBlockHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockHash() => $_clearField(1);

  /// Genesis block hash (identifies the chain)
  @$pb.TagNumber(2)
  $core.List<$core.int> get genesisHash => $_getN(1);
  @$pb.TagNumber(2)
  set genesisHash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGenesisHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearGenesisHash() => $_clearField(2);

  /// Current account nonce
  @$pb.TagNumber(3)
  $fixnum.Int64 get nonce => $_getI64(2);
  @$pb.TagNumber(3)
  set nonce($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearNonce() => $_clearField(3);

  /// Specification version, e.g. 26.
  @$pb.TagNumber(4)
  $core.int get specVersion => $_getIZ(3);
  @$pb.TagNumber(4)
  set specVersion($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSpecVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearSpecVersion() => $_clearField(4);

  /// Transaction version, e.g. 5.
  @$pb.TagNumber(5)
  $core.int get transactionVersion => $_getIZ(4);
  @$pb.TagNumber(5)
  set transactionVersion($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTransactionVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransactionVersion() => $_clearField(5);

  /// Optional tip to pay, big integer
  @$pb.TagNumber(6)
  $core.List<$core.int> get tip => $_getN(5);
  @$pb.TagNumber(6)
  set tip($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTip() => $_has(5);
  @$pb.TagNumber(6)
  void clearTip() => $_clearField(6);

  /// Optional time validity limit, recommended, for replay-protection.  Empty means Immortal.
  @$pb.TagNumber(7)
  $0.Era get era => $_getN(6);
  @$pb.TagNumber(7)
  set era($0.Era value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasEra() => $_has(6);
  @$pb.TagNumber(7)
  void clearEra() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Era ensureEra() => $_ensure(6);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(8)
  $core.List<$core.int> get privateKey => $_getN(7);
  @$pb.TagNumber(8)
  set privateKey($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPrivateKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrivateKey() => $_clearField(8);

  /// Network type
  @$pb.TagNumber(9)
  $core.int get network => $_getIZ(8);
  @$pb.TagNumber(9)
  set network($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNetwork() => $_has(8);
  @$pb.TagNumber(9)
  void clearNetwork() => $_clearField(9);

  /// Payload call
  @$pb.TagNumber(10)
  RuntimeCall get runtimeCall => $_getN(9);
  @$pb.TagNumber(10)
  set runtimeCall(RuntimeCall value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRuntimeCall() => $_has(9);
  @$pb.TagNumber(10)
  void clearRuntimeCall() => $_clearField(10);
  @$pb.TagNumber(10)
  RuntimeCall ensureRuntimeCall() => $_ensure(9);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $1.SigningError? error,
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Polymesh.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aE<$1.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $1.SigningError.values)
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
  $1.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($1.SigningError value) => $_setField(2, value);
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
