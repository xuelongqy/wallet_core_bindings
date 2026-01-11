// This is a generated file - do not edit.
//
// Generated from Sui.proto.

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

/// Object info (including Coins).
class ObjectRef extends $pb.GeneratedMessage {
  factory ObjectRef({
    $core.String? objectId,
    $fixnum.Int64? version,
    $core.String? objectDigest,
  }) {
    final result = create();
    if (objectId != null) result.objectId = objectId;
    if (version != null) result.version = version;
    if (objectDigest != null) result.objectDigest = objectDigest;
    return result;
  }

  ObjectRef._();

  factory ObjectRef.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ObjectRef.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ObjectRef',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'objectDigest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ObjectRef clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ObjectRef copyWith(void Function(ObjectRef) updates) =>
      super.copyWith((message) => updates(message as ObjectRef)) as ObjectRef;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ObjectRef create() => ObjectRef._();
  @$core.override
  ObjectRef createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ObjectRef getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ObjectRef>(create);
  static ObjectRef? _defaultInstance;

  /// Hex string representing the object ID.
  @$pb.TagNumber(1)
  $core.String get objectId => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectId() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectId() => $_clearField(1);

  /// Object version.
  @$pb.TagNumber(2)
  $fixnum.Int64 get version => $_getI64(1);
  @$pb.TagNumber(2)
  set version($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);

  /// Base58 string representing the object digest.
  @$pb.TagNumber(3)
  $core.String get objectDigest => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectDigest($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasObjectDigest() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectDigest() => $_clearField(3);
}

/// Optional amount.
class Amount extends $pb.GeneratedMessage {
  factory Amount({
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    return result;
  }

  Amount._();

  factory Amount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Amount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Amount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Amount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Amount copyWith(void Function(Amount) updates) =>
      super.copyWith((message) => updates(message as Amount)) as Amount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Amount create() => Amount._();
  @$core.override
  Amount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Amount getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Amount>(create);
  static Amount? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);
}

/// Base64 encoded msg to sign (string)
class SignDirect extends $pb.GeneratedMessage {
  factory SignDirect({
    $core.String? unsignedTxMsg,
  }) {
    final result = create();
    if (unsignedTxMsg != null) result.unsignedTxMsg = unsignedTxMsg;
    return result;
  }

  SignDirect._();

  factory SignDirect.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SignDirect.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignDirect',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'unsignedTxMsg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignDirect clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SignDirect copyWith(void Function(SignDirect) updates) =>
      super.copyWith((message) => updates(message as SignDirect)) as SignDirect;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignDirect create() => SignDirect._();
  @$core.override
  SignDirect createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SignDirect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignDirect>(create);
  static SignDirect? _defaultInstance;

  /// Obtain by calling any write RpcJson on SUI
  @$pb.TagNumber(1)
  $core.String get unsignedTxMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set unsignedTxMsg($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUnsignedTxMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnsignedTxMsg() => $_clearField(1);
}

/// Send `Coin<T>` to a list of addresses, where T can be any coin type, following a list of amounts.
/// The object specified in the gas field will be used to pay the gas fee for the transaction.
/// The gas object can not appear in input_coins.
/// https://docs.sui.io/sui-api-ref#unsafe_pay
class Pay extends $pb.GeneratedMessage {
  factory Pay({
    $core.Iterable<ObjectRef>? inputCoins,
    $core.Iterable<$core.String>? recipients,
    $core.Iterable<$fixnum.Int64>? amounts,
    ObjectRef? gas,
  }) {
    final result = create();
    if (inputCoins != null) result.inputCoins.addAll(inputCoins);
    if (recipients != null) result.recipients.addAll(recipients);
    if (amounts != null) result.amounts.addAll(amounts);
    if (gas != null) result.gas = gas;
    return result;
  }

  Pay._();

  factory Pay.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Pay.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pay',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..pPM<ObjectRef>(1, _omitFieldNames ? '' : 'inputCoins',
        subBuilder: ObjectRef.create)
    ..pPS(2, _omitFieldNames ? '' : 'recipients')
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amounts', $pb.PbFieldType.KU6)
    ..aOM<ObjectRef>(4, _omitFieldNames ? '' : 'gas',
        subBuilder: ObjectRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pay clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pay copyWith(void Function(Pay) updates) =>
      super.copyWith((message) => updates(message as Pay)) as Pay;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pay create() => Pay._();
  @$core.override
  Pay createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Pay getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pay>(create);
  static Pay? _defaultInstance;

  /// The Sui coins to be used in this transaction, including the coin for gas payment.
  @$pb.TagNumber(1)
  $pb.PbList<ObjectRef> get inputCoins => $_getList(0);

  /// The recipients' addresses, the length of this vector must be the same as amounts.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get recipients => $_getList(1);

  /// The amounts to be transferred to recipients, following the same order.
  @$pb.TagNumber(3)
  $pb.PbList<$fixnum.Int64> get amounts => $_getList(2);

  /// Gas object to be used in this transaction.
  @$pb.TagNumber(4)
  ObjectRef get gas => $_getN(3);
  @$pb.TagNumber(4)
  set gas(ObjectRef value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGas() => $_has(3);
  @$pb.TagNumber(4)
  void clearGas() => $_clearField(4);
  @$pb.TagNumber(4)
  ObjectRef ensureGas() => $_ensure(3);
}

/// Send SUI coins to a list of addresses, following a list of amounts.
/// This is for SUI coin only and does not require a separate gas coin object.
/// https://docs.sui.io/sui-api-ref#unsafe_paysui
class PaySui extends $pb.GeneratedMessage {
  factory PaySui({
    $core.Iterable<ObjectRef>? inputCoins,
    $core.Iterable<$core.String>? recipients,
    $core.Iterable<$fixnum.Int64>? amounts,
  }) {
    final result = create();
    if (inputCoins != null) result.inputCoins.addAll(inputCoins);
    if (recipients != null) result.recipients.addAll(recipients);
    if (amounts != null) result.amounts.addAll(amounts);
    return result;
  }

  PaySui._();

  factory PaySui.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PaySui.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PaySui',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..pPM<ObjectRef>(1, _omitFieldNames ? '' : 'inputCoins',
        subBuilder: ObjectRef.create)
    ..pPS(2, _omitFieldNames ? '' : 'recipients')
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amounts', $pb.PbFieldType.KU6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaySui clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaySui copyWith(void Function(PaySui) updates) =>
      super.copyWith((message) => updates(message as PaySui)) as PaySui;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaySui create() => PaySui._();
  @$core.override
  PaySui createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PaySui getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaySui>(create);
  static PaySui? _defaultInstance;

  /// The Sui coins to be used in this transaction, including the coin for gas payment.
  @$pb.TagNumber(1)
  $pb.PbList<ObjectRef> get inputCoins => $_getList(0);

  /// The recipients' addresses, the length of this vector must be the same as amounts.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get recipients => $_getList(1);

  /// The amounts to be transferred to recipients, following the same order.
  @$pb.TagNumber(3)
  $pb.PbList<$fixnum.Int64> get amounts => $_getList(2);
}

/// Send all SUI coins to one recipient.
/// This is for SUI coin only and does not require a separate gas coin object.
/// https://docs.sui.io/sui-api-ref#unsafe_payallsui
class PayAllSui extends $pb.GeneratedMessage {
  factory PayAllSui({
    $core.Iterable<ObjectRef>? inputCoins,
    $core.String? recipient,
  }) {
    final result = create();
    if (inputCoins != null) result.inputCoins.addAll(inputCoins);
    if (recipient != null) result.recipient = recipient;
    return result;
  }

  PayAllSui._();

  factory PayAllSui.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayAllSui.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayAllSui',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..pPM<ObjectRef>(1, _omitFieldNames ? '' : 'inputCoins',
        subBuilder: ObjectRef.create)
    ..aOS(2, _omitFieldNames ? '' : 'recipient')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayAllSui clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayAllSui copyWith(void Function(PayAllSui) updates) =>
      super.copyWith((message) => updates(message as PayAllSui)) as PayAllSui;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayAllSui create() => PayAllSui._();
  @$core.override
  PayAllSui createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayAllSui getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayAllSui>(create);
  static PayAllSui? _defaultInstance;

  /// The Sui coins to be used in this transaction, including the coin for gas payment.
  @$pb.TagNumber(1)
  $pb.PbList<ObjectRef> get inputCoins => $_getList(0);

  /// The recipient address.
  @$pb.TagNumber(2)
  $core.String get recipient => $_getSZ(1);
  @$pb.TagNumber(2)
  set recipient($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecipient() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecipient() => $_clearField(2);
}

/// Add stake to a validator's staking pool using multiple coins and amount.
/// https://docs.sui.io/sui-api-ref#unsafe_requestaddstake
class RequestAddStake extends $pb.GeneratedMessage {
  factory RequestAddStake({
    $core.Iterable<ObjectRef>? coins,
    Amount? amount,
    $core.String? validator,
    ObjectRef? gas,
  }) {
    final result = create();
    if (coins != null) result.coins.addAll(coins);
    if (amount != null) result.amount = amount;
    if (validator != null) result.validator = validator;
    if (gas != null) result.gas = gas;
    return result;
  }

  RequestAddStake._();

  factory RequestAddStake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestAddStake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestAddStake',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..pPM<ObjectRef>(1, _omitFieldNames ? '' : 'coins',
        subBuilder: ObjectRef.create)
    ..aOM<Amount>(2, _omitFieldNames ? '' : 'amount', subBuilder: Amount.create)
    ..aOS(3, _omitFieldNames ? '' : 'validator')
    ..aOM<ObjectRef>(4, _omitFieldNames ? '' : 'gas',
        subBuilder: ObjectRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestAddStake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestAddStake copyWith(void Function(RequestAddStake) updates) =>
      super.copyWith((message) => updates(message as RequestAddStake))
          as RequestAddStake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestAddStake create() => RequestAddStake._();
  @$core.override
  RequestAddStake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestAddStake getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestAddStake>(create);
  static RequestAddStake? _defaultInstance;

  /// Coin<SUI> objects to stake.
  @$pb.TagNumber(1)
  $pb.PbList<ObjectRef> get coins => $_getList(0);

  /// Optional stake amount.
  @$pb.TagNumber(2)
  Amount get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount(Amount value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
  @$pb.TagNumber(2)
  Amount ensureAmount() => $_ensure(1);

  /// The validator's Sui address.
  @$pb.TagNumber(3)
  $core.String get validator => $_getSZ(2);
  @$pb.TagNumber(3)
  set validator($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValidator() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidator() => $_clearField(3);

  /// Gas object to be used in this transaction.
  @$pb.TagNumber(4)
  ObjectRef get gas => $_getN(3);
  @$pb.TagNumber(4)
  set gas(ObjectRef value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasGas() => $_has(3);
  @$pb.TagNumber(4)
  void clearGas() => $_clearField(4);
  @$pb.TagNumber(4)
  ObjectRef ensureGas() => $_ensure(3);
}

/// Withdraw stake from a validator's staking pool.
/// https://docs.sui.io/sui-api-ref#unsafe_requestwithdrawstake
class RequestWithdrawStake extends $pb.GeneratedMessage {
  factory RequestWithdrawStake({
    ObjectRef? stakedSui,
    ObjectRef? gas,
  }) {
    final result = create();
    if (stakedSui != null) result.stakedSui = stakedSui;
    if (gas != null) result.gas = gas;
    return result;
  }

  RequestWithdrawStake._();

  factory RequestWithdrawStake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestWithdrawStake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestWithdrawStake',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOM<ObjectRef>(1, _omitFieldNames ? '' : 'stakedSui',
        subBuilder: ObjectRef.create)
    ..aOM<ObjectRef>(2, _omitFieldNames ? '' : 'gas',
        subBuilder: ObjectRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestWithdrawStake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestWithdrawStake copyWith(void Function(RequestWithdrawStake) updates) =>
      super.copyWith((message) => updates(message as RequestWithdrawStake))
          as RequestWithdrawStake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestWithdrawStake create() => RequestWithdrawStake._();
  @$core.override
  RequestWithdrawStake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestWithdrawStake getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestWithdrawStake>(create);
  static RequestWithdrawStake? _defaultInstance;

  /// StakedSui object ID.
  @$pb.TagNumber(1)
  ObjectRef get stakedSui => $_getN(0);
  @$pb.TagNumber(1)
  set stakedSui(ObjectRef value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStakedSui() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakedSui() => $_clearField(1);
  @$pb.TagNumber(1)
  ObjectRef ensureStakedSui() => $_ensure(0);

  /// Gas object to be used in this transaction.
  @$pb.TagNumber(2)
  ObjectRef get gas => $_getN(1);
  @$pb.TagNumber(2)
  set gas(ObjectRef value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGas() => $_has(1);
  @$pb.TagNumber(2)
  void clearGas() => $_clearField(2);
  @$pb.TagNumber(2)
  ObjectRef ensureGas() => $_ensure(1);
}

/// / Transfer an object from one address to another. The object's type must allow public transfers.
/// / https://docs.sui.io/sui-api-ref#unsafe_transferobject
class TransferObject extends $pb.GeneratedMessage {
  factory TransferObject({
    ObjectRef? object,
    $core.String? recipient,
    ObjectRef? gas,
  }) {
    final result = create();
    if (object != null) result.object = object;
    if (recipient != null) result.recipient = recipient;
    if (gas != null) result.gas = gas;
    return result;
  }

  TransferObject._();

  factory TransferObject.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferObject.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferObject',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOM<ObjectRef>(1, _omitFieldNames ? '' : 'object',
        subBuilder: ObjectRef.create)
    ..aOS(2, _omitFieldNames ? '' : 'recipient')
    ..aOM<ObjectRef>(3, _omitFieldNames ? '' : 'gas',
        subBuilder: ObjectRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferObject clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferObject copyWith(void Function(TransferObject) updates) =>
      super.copyWith((message) => updates(message as TransferObject))
          as TransferObject;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferObject create() => TransferObject._();
  @$core.override
  TransferObject createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferObject getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferObject>(create);
  static TransferObject? _defaultInstance;

  /// Object ID to be transferred.
  @$pb.TagNumber(1)
  ObjectRef get object => $_getN(0);
  @$pb.TagNumber(1)
  set object(ObjectRef value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasObject() => $_has(0);
  @$pb.TagNumber(1)
  void clearObject() => $_clearField(1);
  @$pb.TagNumber(1)
  ObjectRef ensureObject() => $_ensure(0);

  /// The recipient address.
  @$pb.TagNumber(2)
  $core.String get recipient => $_getSZ(1);
  @$pb.TagNumber(2)
  set recipient($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecipient() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecipient() => $_clearField(2);

  /// Gas object to be used in this transaction.
  @$pb.TagNumber(3)
  ObjectRef get gas => $_getN(2);
  @$pb.TagNumber(3)
  set gas(ObjectRef value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGas() => $_has(2);
  @$pb.TagNumber(3)
  void clearGas() => $_clearField(3);
  @$pb.TagNumber(3)
  ObjectRef ensureGas() => $_ensure(2);
}

enum SigningInput_TransactionPayload {
  signDirectMessage,
  pay,
  paySui,
  payAllSui,
  requestAddStake,
  requestWithdrawStake,
  transferObject,
  rawJson,
  notSet
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    $core.String? signer,
    SignDirect? signDirectMessage,
    Pay? pay,
    PaySui? paySui,
    PayAllSui? payAllSui,
    RequestAddStake? requestAddStake,
    RequestWithdrawStake? requestWithdrawStake,
    TransferObject? transferObject,
    $core.String? rawJson,
    $fixnum.Int64? gasBudget,
    $fixnum.Int64? referenceGasPrice,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (signer != null) result.signer = signer;
    if (signDirectMessage != null) result.signDirectMessage = signDirectMessage;
    if (pay != null) result.pay = pay;
    if (paySui != null) result.paySui = paySui;
    if (payAllSui != null) result.payAllSui = payAllSui;
    if (requestAddStake != null) result.requestAddStake = requestAddStake;
    if (requestWithdrawStake != null)
      result.requestWithdrawStake = requestWithdrawStake;
    if (transferObject != null) result.transferObject = transferObject;
    if (rawJson != null) result.rawJson = rawJson;
    if (gasBudget != null) result.gasBudget = gasBudget;
    if (referenceGasPrice != null) result.referenceGasPrice = referenceGasPrice;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_TransactionPayload>
      _SigningInput_TransactionPayloadByTag = {
    3: SigningInput_TransactionPayload.signDirectMessage,
    4: SigningInput_TransactionPayload.pay,
    5: SigningInput_TransactionPayload.paySui,
    6: SigningInput_TransactionPayload.payAllSui,
    7: SigningInput_TransactionPayload.requestAddStake,
    8: SigningInput_TransactionPayload.requestWithdrawStake,
    9: SigningInput_TransactionPayload.transferObject,
    10: SigningInput_TransactionPayload.rawJson,
    0: SigningInput_TransactionPayload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7, 8, 9, 10])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'signer')
    ..aOM<SignDirect>(3, _omitFieldNames ? '' : 'signDirectMessage',
        subBuilder: SignDirect.create)
    ..aOM<Pay>(4, _omitFieldNames ? '' : 'pay', subBuilder: Pay.create)
    ..aOM<PaySui>(5, _omitFieldNames ? '' : 'paySui', subBuilder: PaySui.create)
    ..aOM<PayAllSui>(6, _omitFieldNames ? '' : 'payAllSui',
        subBuilder: PayAllSui.create)
    ..aOM<RequestAddStake>(7, _omitFieldNames ? '' : 'requestAddStake',
        subBuilder: RequestAddStake.create)
    ..aOM<RequestWithdrawStake>(
        8, _omitFieldNames ? '' : 'requestWithdrawStake',
        subBuilder: RequestWithdrawStake.create)
    ..aOM<TransferObject>(9, _omitFieldNames ? '' : 'transferObject',
        subBuilder: TransferObject.create)
    ..aOS(10, _omitFieldNames ? '' : 'rawJson')
    ..a<$fixnum.Int64>(
        12, _omitFieldNames ? '' : 'gasBudget', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        13, _omitFieldNames ? '' : 'referenceGasPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
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

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  SigningInput_TransactionPayload whichTransactionPayload() =>
      _SigningInput_TransactionPayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  void clearTransactionPayload() => $_clearField($_whichOneof(0));

  /// Private key to sign the transaction (bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// Optional transaction signer.
  /// Needs to be set if no private key provided at `TransactionCompiler` module.
  @$pb.TagNumber(2)
  $core.String get signer => $_getSZ(1);
  @$pb.TagNumber(2)
  set signer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSigner() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigner() => $_clearField(2);

  @$pb.TagNumber(3)
  SignDirect get signDirectMessage => $_getN(2);
  @$pb.TagNumber(3)
  set signDirectMessage(SignDirect value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSignDirectMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignDirectMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  SignDirect ensureSignDirectMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  Pay get pay => $_getN(3);
  @$pb.TagNumber(4)
  set pay(Pay value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPay() => $_has(3);
  @$pb.TagNumber(4)
  void clearPay() => $_clearField(4);
  @$pb.TagNumber(4)
  Pay ensurePay() => $_ensure(3);

  @$pb.TagNumber(5)
  PaySui get paySui => $_getN(4);
  @$pb.TagNumber(5)
  set paySui(PaySui value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPaySui() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaySui() => $_clearField(5);
  @$pb.TagNumber(5)
  PaySui ensurePaySui() => $_ensure(4);

  @$pb.TagNumber(6)
  PayAllSui get payAllSui => $_getN(5);
  @$pb.TagNumber(6)
  set payAllSui(PayAllSui value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPayAllSui() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayAllSui() => $_clearField(6);
  @$pb.TagNumber(6)
  PayAllSui ensurePayAllSui() => $_ensure(5);

  @$pb.TagNumber(7)
  RequestAddStake get requestAddStake => $_getN(6);
  @$pb.TagNumber(7)
  set requestAddStake(RequestAddStake value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasRequestAddStake() => $_has(6);
  @$pb.TagNumber(7)
  void clearRequestAddStake() => $_clearField(7);
  @$pb.TagNumber(7)
  RequestAddStake ensureRequestAddStake() => $_ensure(6);

  @$pb.TagNumber(8)
  RequestWithdrawStake get requestWithdrawStake => $_getN(7);
  @$pb.TagNumber(8)
  set requestWithdrawStake(RequestWithdrawStake value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRequestWithdrawStake() => $_has(7);
  @$pb.TagNumber(8)
  void clearRequestWithdrawStake() => $_clearField(8);
  @$pb.TagNumber(8)
  RequestWithdrawStake ensureRequestWithdrawStake() => $_ensure(7);

  @$pb.TagNumber(9)
  TransferObject get transferObject => $_getN(8);
  @$pb.TagNumber(9)
  set transferObject(TransferObject value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasTransferObject() => $_has(8);
  @$pb.TagNumber(9)
  void clearTransferObject() => $_clearField(9);
  @$pb.TagNumber(9)
  TransferObject ensureTransferObject() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get rawJson => $_getSZ(9);
  @$pb.TagNumber(10)
  set rawJson($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRawJson() => $_has(9);
  @$pb.TagNumber(10)
  void clearRawJson() => $_clearField(10);

  /// The gas budget, the transaction will fail if the gas cost exceed the budget.
  @$pb.TagNumber(12)
  $fixnum.Int64 get gasBudget => $_getI64(10);
  @$pb.TagNumber(12)
  set gasBudget($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(12)
  $core.bool hasGasBudget() => $_has(10);
  @$pb.TagNumber(12)
  void clearGasBudget() => $_clearField(12);

  /// Reference gas price.
  @$pb.TagNumber(13)
  $fixnum.Int64 get referenceGasPrice => $_getI64(11);
  @$pb.TagNumber(13)
  set referenceGasPrice($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(13)
  $core.bool hasReferenceGasPrice() => $_has(11);
  @$pb.TagNumber(13)
  void clearReferenceGasPrice() => $_clearField(13);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? unsignedTx,
    $core.String? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (unsignedTx != null) result.unsignedTx = unsignedTx;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'unsignedTx')
    ..aOS(2, _omitFieldNames ? '' : 'signature')
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

  /// / The raw transaction without indent in base64
  @$pb.TagNumber(1)
  $core.String get unsignedTx => $_getSZ(0);
  @$pb.TagNumber(1)
  set unsignedTx($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUnsignedTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnsignedTx() => $_clearField(1);

  /// / The signature encoded in base64
  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// Error code, 0 is ok, other codes will be treated as errors.
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// Error description.
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);
}

/// Message signing input.
class MessageSigningInput extends $pb.GeneratedMessage {
  factory MessageSigningInput({
    $core.List<$core.int>? privateKey,
    $core.String? message,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (message != null) result.message = message;
    return result;
  }

  MessageSigningInput._();

  factory MessageSigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageSigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageSigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningInput copyWith(void Function(MessageSigningInput) updates) =>
      super.copyWith((message) => updates(message as MessageSigningInput))
          as MessageSigningInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageSigningInput create() => MessageSigningInput._();
  @$core.override
  MessageSigningInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageSigningInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageSigningInput>(create);
  static MessageSigningInput? _defaultInstance;

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// A UTF-8 regular message to sign.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Message signing output.
class MessageSigningOutput extends $pb.GeneratedMessage {
  factory MessageSigningOutput({
    $core.String? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  MessageSigningOutput._();

  factory MessageSigningOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageSigningOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageSigningOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signature')
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningOutput copyWith(void Function(MessageSigningOutput) updates) =>
      super.copyWith((message) => updates(message as MessageSigningOutput))
          as MessageSigningOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageSigningOutput create() => MessageSigningOutput._();
  @$core.override
  MessageSigningOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageSigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageSigningOutput>(create);
  static MessageSigningOutput? _defaultInstance;

  /// The signature, a 97-byte array encoded in base64.
  /// The first byte indicates the signature scheme (currently set to 0x00, as we only support ED25519).
  /// The following 64 bytes represent the raw ED25519 signature, while the next 32 bytes contain the public key.
  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

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

/// Message verifying input.
class MessageVerifyingInput extends $pb.GeneratedMessage {
  factory MessageVerifyingInput({
    $core.String? message,
    $core.List<$core.int>? publicKey,
    $core.String? signature,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (publicKey != null) result.publicKey = publicKey;
    if (signature != null) result.signature = signature;
    return result;
  }

  MessageVerifyingInput._();

  factory MessageVerifyingInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageVerifyingInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageVerifyingInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'signature')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageVerifyingInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageVerifyingInput copyWith(
          void Function(MessageVerifyingInput) updates) =>
      super.copyWith((message) => updates(message as MessageVerifyingInput))
          as MessageVerifyingInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageVerifyingInput create() => MessageVerifyingInput._();
  @$core.override
  MessageVerifyingInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageVerifyingInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageVerifyingInput>(create);
  static MessageVerifyingInput? _defaultInstance;

  /// The message signed.
  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  /// Public key that will verify the message.
  /// It must be equal to the public key encoded in the signature.
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  /// The signature, a 97-byte array encoded in base64.
  /// Same as the signature field in MessageSigningOutput.
  @$pb.TagNumber(3)
  $core.String get signature => $_getSZ(2);
  @$pb.TagNumber(3)
  set signature($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
