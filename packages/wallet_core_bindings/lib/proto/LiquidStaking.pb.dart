// This is a generated file - do not edit.
//
// Generated from LiquidStaking.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Aptos.pb.dart' as $2;
import 'Cosmos.pb.dart' as $1;
import 'Ethereum.pb.dart' as $0;
import 'LiquidStaking.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'LiquidStaking.pbenum.dart';

/// Message to represent the status of an operation
class Status extends $pb.GeneratedMessage {
  factory Status({
    StatusCode? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  Status._();

  factory Status.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Status.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Status',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..aE<StatusCode>(1, _omitFieldNames ? '' : 'code',
        enumValues: StatusCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Status clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Status copyWith(void Function(Status) updates) =>
      super.copyWith((message) => updates(message as Status)) as Status;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  @$core.override
  Status createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Status getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status? _defaultInstance;

  /// Status code of the operation
  @$pb.TagNumber(1)
  StatusCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(StatusCode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// Optional error message, populated in case of error
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Message to represent the asset for staking operations
class Asset extends $pb.GeneratedMessage {
  factory Asset({
    Coin? stakingToken,
    $core.String? liquidToken,
    $core.String? denom,
    $core.String? fromAddress,
  }) {
    final result = create();
    if (stakingToken != null) result.stakingToken = stakingToken;
    if (liquidToken != null) result.liquidToken = liquidToken;
    if (denom != null) result.denom = denom;
    if (fromAddress != null) result.fromAddress = fromAddress;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..aE<Coin>(1, _omitFieldNames ? '' : 'stakingToken',
        enumValues: Coin.values)
    ..aOS(2, _omitFieldNames ? '' : 'liquidToken')
    ..aOS(3, _omitFieldNames ? '' : 'denom')
    ..aOS(4, _omitFieldNames ? '' : 'fromAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  /// Coin to be staked
  @$pb.TagNumber(1)
  Coin get stakingToken => $_getN(0);
  @$pb.TagNumber(1)
  set stakingToken(Coin value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStakingToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingToken() => $_clearField(1);

  /// Optional, liquid_token to be manipulated: unstake, claim rewards
  @$pb.TagNumber(2)
  $core.String get liquidToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set liquidToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLiquidToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearLiquidToken() => $_clearField(2);

  /// Denom of the asset to be manipulated, required by some liquid staking protocols
  @$pb.TagNumber(3)
  $core.String get denom => $_getSZ(2);
  @$pb.TagNumber(3)
  set denom($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDenom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDenom() => $_clearField(3);

  /// Address for building the appropriate input
  @$pb.TagNumber(4)
  $core.String get fromAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set fromAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFromAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromAddress() => $_clearField(4);
}

/// Message to represent a stake operation
class Stake extends $pb.GeneratedMessage {
  factory Stake({
    Asset? asset,
    $core.String? amount,
  }) {
    final result = create();
    if (asset != null) result.asset = asset;
    if (amount != null) result.amount = amount;
    return result;
  }

  Stake._();

  factory Stake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Stake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Stake',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'asset', subBuilder: Asset.create)
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stake copyWith(void Function(Stake) updates) =>
      super.copyWith((message) => updates(message as Stake)) as Stake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Stake create() => Stake._();
  @$core.override
  Stake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Stake getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stake>(create);
  static Stake? _defaultInstance;

  @$pb.TagNumber(1)
  Asset get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(Asset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  Asset ensureAsset() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// Message to represent an unstake operation
class Unstake extends $pb.GeneratedMessage {
  factory Unstake({
    Asset? asset,
    $core.String? amount,
    $core.String? receiverAddress,
    $core.String? receiverChainId,
  }) {
    final result = create();
    if (asset != null) result.asset = asset;
    if (amount != null) result.amount = amount;
    if (receiverAddress != null) result.receiverAddress = receiverAddress;
    if (receiverChainId != null) result.receiverChainId = receiverChainId;
    return result;
  }

  Unstake._();

  factory Unstake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Unstake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Unstake',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'asset', subBuilder: Asset.create)
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..aOS(3, _omitFieldNames ? '' : 'receiverAddress')
    ..aOS(4, _omitFieldNames ? '' : 'receiverChainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Unstake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Unstake copyWith(void Function(Unstake) updates) =>
      super.copyWith((message) => updates(message as Unstake)) as Unstake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Unstake create() => Unstake._();
  @$core.override
  Unstake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Unstake getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Unstake>(create);
  static Unstake? _defaultInstance;

  @$pb.TagNumber(1)
  Asset get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(Asset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  Asset ensureAsset() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Some cross-chain protocols propose u to setup a receiver_address
  @$pb.TagNumber(3)
  $core.String get receiverAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiverAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiverAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverAddress() => $_clearField(3);

  /// Some cross-chain protocols propose u to set the receiver chain_id, it allows auto-claim after probation period
  @$pb.TagNumber(4)
  $core.String get receiverChainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set receiverChainId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiverChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverChainId() => $_clearField(4);
}

/// Message to represent a withdraw operation
class Withdraw extends $pb.GeneratedMessage {
  factory Withdraw({
    Asset? asset,
    $core.String? amount,
    $core.String? idx,
  }) {
    final result = create();
    if (asset != null) result.asset = asset;
    if (amount != null) result.amount = amount;
    if (idx != null) result.idx = idx;
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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'asset', subBuilder: Asset.create)
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..aOS(3, _omitFieldNames ? '' : 'idx')
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

  @$pb.TagNumber(1)
  Asset get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(Asset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  Asset ensureAsset() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Sometimes withdraw is just the index of a request, amount is already known by the SC
  @$pb.TagNumber(3)
  $core.String get idx => $_getSZ(2);
  @$pb.TagNumber(3)
  set idx($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIdx() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdx() => $_clearField(3);
}

enum Input_Action { stake, unstake, withdraw, notSet }

/// Message to represent the input for a liquid staking operation
class Input extends $pb.GeneratedMessage {
  factory Input({
    Stake? stake,
    Unstake? unstake,
    Withdraw? withdraw,
    $core.String? smartContractAddress,
    Protocol? protocol,
    Blockchain? blockchain,
  }) {
    final result = create();
    if (stake != null) result.stake = stake;
    if (unstake != null) result.unstake = unstake;
    if (withdraw != null) result.withdraw = withdraw;
    if (smartContractAddress != null)
      result.smartContractAddress = smartContractAddress;
    if (protocol != null) result.protocol = protocol;
    if (blockchain != null) result.blockchain = blockchain;
    return result;
  }

  Input._();

  factory Input.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Input.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Input_Action> _Input_ActionByTag = {
    1: Input_Action.stake,
    2: Input_Action.unstake,
    3: Input_Action.withdraw,
    0: Input_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<Stake>(1, _omitFieldNames ? '' : 'stake', subBuilder: Stake.create)
    ..aOM<Unstake>(2, _omitFieldNames ? '' : 'unstake',
        subBuilder: Unstake.create)
    ..aOM<Withdraw>(3, _omitFieldNames ? '' : 'withdraw',
        subBuilder: Withdraw.create)
    ..aOS(4, _omitFieldNames ? '' : 'smartContractAddress')
    ..aE<Protocol>(5, _omitFieldNames ? '' : 'protocol',
        enumValues: Protocol.values)
    ..aE<Blockchain>(6, _omitFieldNames ? '' : 'blockchain',
        enumValues: Blockchain.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input copyWith(void Function(Input) updates) =>
      super.copyWith((message) => updates(message as Input)) as Input;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input create() => Input._();
  @$core.override
  Input createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Input getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Input>(create);
  static Input? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  Input_Action whichAction() => _Input_ActionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearAction() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Stake get stake => $_getN(0);
  @$pb.TagNumber(1)
  set stake(Stake value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStake() => $_has(0);
  @$pb.TagNumber(1)
  void clearStake() => $_clearField(1);
  @$pb.TagNumber(1)
  Stake ensureStake() => $_ensure(0);

  @$pb.TagNumber(2)
  Unstake get unstake => $_getN(1);
  @$pb.TagNumber(2)
  set unstake(Unstake value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUnstake() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnstake() => $_clearField(2);
  @$pb.TagNumber(2)
  Unstake ensureUnstake() => $_ensure(1);

  @$pb.TagNumber(3)
  Withdraw get withdraw => $_getN(2);
  @$pb.TagNumber(3)
  set withdraw(Withdraw value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasWithdraw() => $_has(2);
  @$pb.TagNumber(3)
  void clearWithdraw() => $_clearField(3);
  @$pb.TagNumber(3)
  Withdraw ensureWithdraw() => $_ensure(2);

  /// Optional smart contract address for EVM-based chains
  @$pb.TagNumber(4)
  $core.String get smartContractAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set smartContractAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSmartContractAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearSmartContractAddress() => $_clearField(4);

  /// Protocol to be used for liquid staking
  @$pb.TagNumber(5)
  Protocol get protocol => $_getN(4);
  @$pb.TagNumber(5)
  set protocol(Protocol value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProtocol() => $_has(4);
  @$pb.TagNumber(5)
  void clearProtocol() => $_clearField(5);

  /// Target blockchain for the liquid staking operation
  @$pb.TagNumber(6)
  Blockchain get blockchain => $_getN(5);
  @$pb.TagNumber(6)
  set blockchain(Blockchain value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasBlockchain() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlockchain() => $_clearField(6);
}

enum Output_SigningInputOneof { ethereum, cosmos, aptos, notSet }

/// Message to represent the output of a liquid staking operation
class Output extends $pb.GeneratedMessage {
  factory Output({
    Status? status,
    $0.SigningInput? ethereum,
    $1.SigningInput? cosmos,
    $2.SigningInput? aptos,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (ethereum != null) result.ethereum = ethereum;
    if (cosmos != null) result.cosmos = cosmos;
    if (aptos != null) result.aptos = aptos;
    return result;
  }

  Output._();

  factory Output.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Output.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Output_SigningInputOneof>
      _Output_SigningInputOneofByTag = {
    2: Output_SigningInputOneof.ethereum,
    3: Output_SigningInputOneof.cosmos,
    4: Output_SigningInputOneof.aptos,
    0: Output_SigningInputOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.LiquidStaking.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOM<Status>(1, _omitFieldNames ? '' : 'status', subBuilder: Status.create)
    ..aOM<$0.SigningInput>(2, _omitFieldNames ? '' : 'ethereum',
        subBuilder: $0.SigningInput.create)
    ..aOM<$1.SigningInput>(3, _omitFieldNames ? '' : 'cosmos',
        subBuilder: $1.SigningInput.create)
    ..aOM<$2.SigningInput>(4, _omitFieldNames ? '' : 'aptos',
        subBuilder: $2.SigningInput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output copyWith(void Function(Output) updates) =>
      super.copyWith((message) => updates(message as Output)) as Output;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output create() => Output._();
  @$core.override
  Output createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Output getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Output>(create);
  static Output? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  Output_SigningInputOneof whichSigningInputOneof() =>
      _Output_SigningInputOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearSigningInputOneof() => $_clearField($_whichOneof(0));

  /// Status of the liquid staking operation
  @$pb.TagNumber(1)
  Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
  @$pb.TagNumber(1)
  Status ensureStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.SigningInput get ethereum => $_getN(1);
  @$pb.TagNumber(2)
  set ethereum($0.SigningInput value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEthereum() => $_has(1);
  @$pb.TagNumber(2)
  void clearEthereum() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SigningInput ensureEthereum() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.SigningInput get cosmos => $_getN(2);
  @$pb.TagNumber(3)
  set cosmos($1.SigningInput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCosmos() => $_has(2);
  @$pb.TagNumber(3)
  void clearCosmos() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.SigningInput ensureCosmos() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.SigningInput get aptos => $_getN(3);
  @$pb.TagNumber(4)
  set aptos($2.SigningInput value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAptos() => $_has(3);
  @$pb.TagNumber(4)
  void clearAptos() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.SigningInput ensureAptos() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
