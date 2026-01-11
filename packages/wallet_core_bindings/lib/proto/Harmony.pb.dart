// This is a generated file - do not edit.
//
// Generated from Harmony.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum SigningInput_MessageOneof { transactionMessage, stakingMessage, notSet }

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? chainId,
    $core.List<$core.int>? privateKey,
    TransactionMessage? transactionMessage,
    StakingMessage? stakingMessage,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (privateKey != null) result.privateKey = privateKey;
    if (transactionMessage != null)
      result.transactionMessage = transactionMessage;
    if (stakingMessage != null) result.stakingMessage = stakingMessage;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_MessageOneof>
      _SigningInput_MessageOneofByTag = {
    3: SigningInput_MessageOneof.transactionMessage,
    4: SigningInput_MessageOneof.stakingMessage,
    0: SigningInput_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'chainId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<TransactionMessage>(3, _omitFieldNames ? '' : 'transactionMessage',
        subBuilder: TransactionMessage.create)
    ..aOM<StakingMessage>(4, _omitFieldNames ? '' : 'stakingMessage',
        subBuilder: StakingMessage.create)
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
  SigningInput_MessageOneof whichMessageOneof() =>
      _SigningInput_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  /// Chain identifier (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get chainId => $_getN(0);
  @$pb.TagNumber(1)
  set chainId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => $_clearField(2);

  @$pb.TagNumber(3)
  TransactionMessage get transactionMessage => $_getN(2);
  @$pb.TagNumber(3)
  set transactionMessage(TransactionMessage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  TransactionMessage ensureTransactionMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  StakingMessage get stakingMessage => $_getN(3);
  @$pb.TagNumber(4)
  set stakingMessage(StakingMessage value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStakingMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearStakingMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  StakingMessage ensureStakingMessage() => $_ensure(3);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? v,
    $core.List<$core.int>? r,
    $core.List<$core.int>? s,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (v != null) result.v = v;
    if (r != null) result.r = r;
    if (s != null) result.s = s;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'v', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'r', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 's', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(5, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(6, _omitFieldNames ? '' : 'errorMessage')
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

  /// THE V,R,S components of the signature
  @$pb.TagNumber(2)
  $core.List<$core.int> get v => $_getN(1);
  @$pb.TagNumber(2)
  set v($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasV() => $_has(1);
  @$pb.TagNumber(2)
  void clearV() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get r => $_getN(2);
  @$pb.TagNumber(3)
  set r($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(2);
  @$pb.TagNumber(3)
  void clearR() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get s => $_getN(3);
  @$pb.TagNumber(4)
  set s($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasS() => $_has(3);
  @$pb.TagNumber(4)
  void clearS() => $_clearField(4);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(5)
  $0.SigningError get error => $_getN(4);
  @$pb.TagNumber(5)
  set error($0.SigningError value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);

  /// error code description
  @$pb.TagNumber(6)
  $core.String get errorMessage => $_getSZ(5);
  @$pb.TagNumber(6)
  set errorMessage($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasErrorMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearErrorMessage() => $_clearField(6);
}

/// A Transfer message
class TransactionMessage extends $pb.GeneratedMessage {
  factory TransactionMessage({
    $core.List<$core.int>? nonce,
    $core.List<$core.int>? gasPrice,
    $core.List<$core.int>? gasLimit,
    $core.String? toAddress,
    $core.List<$core.int>? amount,
    $core.List<$core.int>? payload,
    $core.List<$core.int>? fromShardId,
    $core.List<$core.int>? toShardId,
  }) {
    final result = create();
    if (nonce != null) result.nonce = nonce;
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    if (payload != null) result.payload = payload;
    if (fromShardId != null) result.fromShardId = fromShardId;
    if (toShardId != null) result.toShardId = toShardId;
    return result;
  }

  TransactionMessage._();

  factory TransactionMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionMessage',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'gasLimit', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'toAddress')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'fromShardId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'toShardId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionMessage copyWith(void Function(TransactionMessage) updates) =>
      super.copyWith((message) => updates(message as TransactionMessage))
          as TransactionMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionMessage create() => TransactionMessage._();
  @$core.override
  TransactionMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionMessage>(create);
  static TransactionMessage? _defaultInstance;

  /// Nonce (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => $_clearField(1);

  /// Gas price (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get gasPrice => $_getN(1);
  @$pb.TagNumber(2)
  set gasPrice($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearGasPrice() => $_clearField(2);

  /// Gas limit (uint256, serialized big endian)
  @$pb.TagNumber(3)
  $core.List<$core.int> get gasLimit => $_getN(2);
  @$pb.TagNumber(3)
  set gasLimit($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearGasLimit() => $_clearField(3);

  /// Recipient's address.
  @$pb.TagNumber(4)
  $core.String get toAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set toAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearToAddress() => $_clearField(4);

  /// Amount to send in wei (uint256, serialized big endian)
  @$pb.TagNumber(5)
  $core.List<$core.int> get amount => $_getN(4);
  @$pb.TagNumber(5)
  set amount($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => $_clearField(5);

  /// Optional payload
  @$pb.TagNumber(6)
  $core.List<$core.int> get payload => $_getN(5);
  @$pb.TagNumber(6)
  set payload($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPayload() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayload() => $_clearField(6);

  /// From shard ID (uint256, serialized big endian)
  @$pb.TagNumber(7)
  $core.List<$core.int> get fromShardId => $_getN(6);
  @$pb.TagNumber(7)
  set fromShardId($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFromShardId() => $_has(6);
  @$pb.TagNumber(7)
  void clearFromShardId() => $_clearField(7);

  /// To Shard ID (uint256, serialized big endian)
  @$pb.TagNumber(8)
  $core.List<$core.int> get toShardId => $_getN(7);
  @$pb.TagNumber(8)
  set toShardId($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasToShardId() => $_has(7);
  @$pb.TagNumber(8)
  void clearToShardId() => $_clearField(8);
}

enum StakingMessage_StakeMsg {
  createValidatorMessage,
  editValidatorMessage,
  delegateMessage,
  undelegateMessage,
  collectRewards,
  notSet
}

/// A Staking message.
class StakingMessage extends $pb.GeneratedMessage {
  factory StakingMessage({
    DirectiveCreateValidator? createValidatorMessage,
    DirectiveEditValidator? editValidatorMessage,
    DirectiveDelegate? delegateMessage,
    DirectiveUndelegate? undelegateMessage,
    DirectiveCollectRewards? collectRewards,
    $core.List<$core.int>? nonce,
    $core.List<$core.int>? gasPrice,
    $core.List<$core.int>? gasLimit,
  }) {
    final result = create();
    if (createValidatorMessage != null)
      result.createValidatorMessage = createValidatorMessage;
    if (editValidatorMessage != null)
      result.editValidatorMessage = editValidatorMessage;
    if (delegateMessage != null) result.delegateMessage = delegateMessage;
    if (undelegateMessage != null) result.undelegateMessage = undelegateMessage;
    if (collectRewards != null) result.collectRewards = collectRewards;
    if (nonce != null) result.nonce = nonce;
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasLimit != null) result.gasLimit = gasLimit;
    return result;
  }

  StakingMessage._();

  factory StakingMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StakingMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, StakingMessage_StakeMsg>
      _StakingMessage_StakeMsgByTag = {
    1: StakingMessage_StakeMsg.createValidatorMessage,
    2: StakingMessage_StakeMsg.editValidatorMessage,
    3: StakingMessage_StakeMsg.delegateMessage,
    4: StakingMessage_StakeMsg.undelegateMessage,
    5: StakingMessage_StakeMsg.collectRewards,
    0: StakingMessage_StakeMsg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StakingMessage',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<DirectiveCreateValidator>(
        1, _omitFieldNames ? '' : 'createValidatorMessage',
        subBuilder: DirectiveCreateValidator.create)
    ..aOM<DirectiveEditValidator>(
        2, _omitFieldNames ? '' : 'editValidatorMessage',
        subBuilder: DirectiveEditValidator.create)
    ..aOM<DirectiveDelegate>(3, _omitFieldNames ? '' : 'delegateMessage',
        subBuilder: DirectiveDelegate.create)
    ..aOM<DirectiveUndelegate>(4, _omitFieldNames ? '' : 'undelegateMessage',
        subBuilder: DirectiveUndelegate.create)
    ..aOM<DirectiveCollectRewards>(5, _omitFieldNames ? '' : 'collectRewards',
        subBuilder: DirectiveCollectRewards.create)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'gasLimit', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StakingMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StakingMessage copyWith(void Function(StakingMessage) updates) =>
      super.copyWith((message) => updates(message as StakingMessage))
          as StakingMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StakingMessage create() => StakingMessage._();
  @$core.override
  StakingMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StakingMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StakingMessage>(create);
  static StakingMessage? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  StakingMessage_StakeMsg whichStakeMsg() =>
      _StakingMessage_StakeMsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearStakeMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DirectiveCreateValidator get createValidatorMessage => $_getN(0);
  @$pb.TagNumber(1)
  set createValidatorMessage(DirectiveCreateValidator value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCreateValidatorMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateValidatorMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  DirectiveCreateValidator ensureCreateValidatorMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  DirectiveEditValidator get editValidatorMessage => $_getN(1);
  @$pb.TagNumber(2)
  set editValidatorMessage(DirectiveEditValidator value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEditValidatorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearEditValidatorMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  DirectiveEditValidator ensureEditValidatorMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  DirectiveDelegate get delegateMessage => $_getN(2);
  @$pb.TagNumber(3)
  set delegateMessage(DirectiveDelegate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDelegateMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelegateMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  DirectiveDelegate ensureDelegateMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  DirectiveUndelegate get undelegateMessage => $_getN(3);
  @$pb.TagNumber(4)
  set undelegateMessage(DirectiveUndelegate value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUndelegateMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearUndelegateMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  DirectiveUndelegate ensureUndelegateMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  DirectiveCollectRewards get collectRewards => $_getN(4);
  @$pb.TagNumber(5)
  set collectRewards(DirectiveCollectRewards value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCollectRewards() => $_has(4);
  @$pb.TagNumber(5)
  void clearCollectRewards() => $_clearField(5);
  @$pb.TagNumber(5)
  DirectiveCollectRewards ensureCollectRewards() => $_ensure(4);

  /// Nonce (uint256, serialized big endian)
  @$pb.TagNumber(6)
  $core.List<$core.int> get nonce => $_getN(5);
  @$pb.TagNumber(6)
  set nonce($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNonce() => $_has(5);
  @$pb.TagNumber(6)
  void clearNonce() => $_clearField(6);

  /// Gas price (uint256, serialized big endian)
  @$pb.TagNumber(7)
  $core.List<$core.int> get gasPrice => $_getN(6);
  @$pb.TagNumber(7)
  set gasPrice($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGasPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearGasPrice() => $_clearField(7);

  /// Gas limit (uint256, serialized big endian)
  @$pb.TagNumber(8)
  $core.List<$core.int> get gasLimit => $_getN(7);
  @$pb.TagNumber(8)
  set gasLimit($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGasLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearGasLimit() => $_clearField(8);
}

/// Description for a validator
class Description extends $pb.GeneratedMessage {
  factory Description({
    $core.String? name,
    $core.String? identity,
    $core.String? website,
    $core.String? securityContact,
    $core.String? details,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (identity != null) result.identity = identity;
    if (website != null) result.website = website;
    if (securityContact != null) result.securityContact = securityContact;
    if (details != null) result.details = details;
    return result;
  }

  Description._();

  factory Description.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Description.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Description',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'identity')
    ..aOS(3, _omitFieldNames ? '' : 'website')
    ..aOS(4, _omitFieldNames ? '' : 'securityContact')
    ..aOS(5, _omitFieldNames ? '' : 'details')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Description clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Description copyWith(void Function(Description) updates) =>
      super.copyWith((message) => updates(message as Description))
          as Description;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Description create() => Description._();
  @$core.override
  Description createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Description getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Description>(create);
  static Description? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get identity => $_getSZ(1);
  @$pb.TagNumber(2)
  set identity($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentity() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get website => $_getSZ(2);
  @$pb.TagNumber(3)
  set website($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWebsite() => $_has(2);
  @$pb.TagNumber(3)
  void clearWebsite() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get securityContact => $_getSZ(3);
  @$pb.TagNumber(4)
  set securityContact($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSecurityContact() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecurityContact() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get details => $_getSZ(4);
  @$pb.TagNumber(5)
  set details($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDetails() => $_has(4);
  @$pb.TagNumber(5)
  void clearDetails() => $_clearField(5);
}

/// A variable precision number
class Decimal extends $pb.GeneratedMessage {
  factory Decimal({
    $core.List<$core.int>? value,
    $core.List<$core.int>? precision,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (precision != null) result.precision = precision;
    return result;
  }

  Decimal._();

  factory Decimal.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Decimal.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Decimal',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'precision', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Decimal clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Decimal copyWith(void Function(Decimal) updates) =>
      super.copyWith((message) => updates(message as Decimal)) as Decimal;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Decimal create() => Decimal._();
  @$core.override
  Decimal createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Decimal getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Decimal>(create);
  static Decimal? _defaultInstance;

  /// The 'raw' value
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// The precision (number of decimals)
  @$pb.TagNumber(2)
  $core.List<$core.int> get precision => $_getN(1);
  @$pb.TagNumber(2)
  set precision($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrecision() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrecision() => $_clearField(2);
}

/// Represents validator commission rule
class CommissionRate extends $pb.GeneratedMessage {
  factory CommissionRate({
    Decimal? rate,
    Decimal? maxRate,
    Decimal? maxChangeRate,
  }) {
    final result = create();
    if (rate != null) result.rate = rate;
    if (maxRate != null) result.maxRate = maxRate;
    if (maxChangeRate != null) result.maxChangeRate = maxChangeRate;
    return result;
  }

  CommissionRate._();

  factory CommissionRate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommissionRate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommissionRate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOM<Decimal>(1, _omitFieldNames ? '' : 'rate', subBuilder: Decimal.create)
    ..aOM<Decimal>(2, _omitFieldNames ? '' : 'maxRate',
        subBuilder: Decimal.create)
    ..aOM<Decimal>(3, _omitFieldNames ? '' : 'maxChangeRate',
        subBuilder: Decimal.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommissionRate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommissionRate copyWith(void Function(CommissionRate) updates) =>
      super.copyWith((message) => updates(message as CommissionRate))
          as CommissionRate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommissionRate create() => CommissionRate._();
  @$core.override
  CommissionRate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommissionRate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommissionRate>(create);
  static CommissionRate? _defaultInstance;

  /// The rate
  @$pb.TagNumber(1)
  Decimal get rate => $_getN(0);
  @$pb.TagNumber(1)
  set rate(Decimal value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRate() => $_has(0);
  @$pb.TagNumber(1)
  void clearRate() => $_clearField(1);
  @$pb.TagNumber(1)
  Decimal ensureRate() => $_ensure(0);

  /// Maximum rate
  @$pb.TagNumber(2)
  Decimal get maxRate => $_getN(1);
  @$pb.TagNumber(2)
  set maxRate(Decimal value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxRate() => $_clearField(2);
  @$pb.TagNumber(2)
  Decimal ensureMaxRate() => $_ensure(1);

  /// Maximum of rate change
  @$pb.TagNumber(3)
  Decimal get maxChangeRate => $_getN(2);
  @$pb.TagNumber(3)
  set maxChangeRate(Decimal value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxChangeRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxChangeRate() => $_clearField(3);
  @$pb.TagNumber(3)
  Decimal ensureMaxChangeRate() => $_ensure(2);
}

/// Create Validator directive
class DirectiveCreateValidator extends $pb.GeneratedMessage {
  factory DirectiveCreateValidator({
    $core.String? validatorAddress,
    Description? description,
    CommissionRate? commissionRates,
    $core.List<$core.int>? minSelfDelegation,
    $core.List<$core.int>? maxTotalDelegation,
    $core.Iterable<$core.List<$core.int>>? slotPubKeys,
    $core.Iterable<$core.List<$core.int>>? slotKeySigs,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (validatorAddress != null) result.validatorAddress = validatorAddress;
    if (description != null) result.description = description;
    if (commissionRates != null) result.commissionRates = commissionRates;
    if (minSelfDelegation != null) result.minSelfDelegation = minSelfDelegation;
    if (maxTotalDelegation != null)
      result.maxTotalDelegation = maxTotalDelegation;
    if (slotPubKeys != null) result.slotPubKeys.addAll(slotPubKeys);
    if (slotKeySigs != null) result.slotKeySigs.addAll(slotKeySigs);
    if (amount != null) result.amount = amount;
    return result;
  }

  DirectiveCreateValidator._();

  factory DirectiveCreateValidator.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectiveCreateValidator.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectiveCreateValidator',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'validatorAddress')
    ..aOM<Description>(2, _omitFieldNames ? '' : 'description',
        subBuilder: Description.create)
    ..aOM<CommissionRate>(3, _omitFieldNames ? '' : 'commissionRates',
        subBuilder: CommissionRate.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'minSelfDelegation', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'maxTotalDelegation', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'slotPubKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'slotKeySigs', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveCreateValidator clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveCreateValidator copyWith(
          void Function(DirectiveCreateValidator) updates) =>
      super.copyWith((message) => updates(message as DirectiveCreateValidator))
          as DirectiveCreateValidator;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectiveCreateValidator create() => DirectiveCreateValidator._();
  @$core.override
  DirectiveCreateValidator createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectiveCreateValidator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectiveCreateValidator>(create);
  static DirectiveCreateValidator? _defaultInstance;

  /// Address of validator
  @$pb.TagNumber(1)
  $core.String get validatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddress() => $_clearField(1);

  /// Description, name etc.
  @$pb.TagNumber(2)
  Description get description => $_getN(1);
  @$pb.TagNumber(2)
  set description(Description value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);
  @$pb.TagNumber(2)
  Description ensureDescription() => $_ensure(1);

  /// Rates
  @$pb.TagNumber(3)
  CommissionRate get commissionRates => $_getN(2);
  @$pb.TagNumber(3)
  set commissionRates(CommissionRate value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCommissionRates() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommissionRates() => $_clearField(3);
  @$pb.TagNumber(3)
  CommissionRate ensureCommissionRates() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get minSelfDelegation => $_getN(3);
  @$pb.TagNumber(4)
  set minSelfDelegation($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMinSelfDelegation() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinSelfDelegation() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get maxTotalDelegation => $_getN(4);
  @$pb.TagNumber(5)
  set maxTotalDelegation($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxTotalDelegation() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxTotalDelegation() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.List<$core.int>> get slotPubKeys => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.List<$core.int>> get slotKeySigs => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get amount => $_getN(7);
  @$pb.TagNumber(8)
  set amount($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearAmount() => $_clearField(8);
}

/// Edit Validator directive
class DirectiveEditValidator extends $pb.GeneratedMessage {
  factory DirectiveEditValidator({
    $core.String? validatorAddress,
    Description? description,
    Decimal? commissionRate,
    $core.List<$core.int>? minSelfDelegation,
    $core.List<$core.int>? maxTotalDelegation,
    $core.List<$core.int>? slotKeyToRemove,
    $core.List<$core.int>? slotKeyToAdd,
    $core.List<$core.int>? slotKeyToAddSig,
    $core.List<$core.int>? active,
  }) {
    final result = create();
    if (validatorAddress != null) result.validatorAddress = validatorAddress;
    if (description != null) result.description = description;
    if (commissionRate != null) result.commissionRate = commissionRate;
    if (minSelfDelegation != null) result.minSelfDelegation = minSelfDelegation;
    if (maxTotalDelegation != null)
      result.maxTotalDelegation = maxTotalDelegation;
    if (slotKeyToRemove != null) result.slotKeyToRemove = slotKeyToRemove;
    if (slotKeyToAdd != null) result.slotKeyToAdd = slotKeyToAdd;
    if (slotKeyToAddSig != null) result.slotKeyToAddSig = slotKeyToAddSig;
    if (active != null) result.active = active;
    return result;
  }

  DirectiveEditValidator._();

  factory DirectiveEditValidator.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectiveEditValidator.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectiveEditValidator',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'validatorAddress')
    ..aOM<Description>(2, _omitFieldNames ? '' : 'description',
        subBuilder: Description.create)
    ..aOM<Decimal>(3, _omitFieldNames ? '' : 'commissionRate',
        subBuilder: Decimal.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'minSelfDelegation', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'maxTotalDelegation', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'slotKeyToRemove', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'slotKeyToAdd', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'slotKeyToAddSig', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'active', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveEditValidator clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveEditValidator copyWith(
          void Function(DirectiveEditValidator) updates) =>
      super.copyWith((message) => updates(message as DirectiveEditValidator))
          as DirectiveEditValidator;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectiveEditValidator create() => DirectiveEditValidator._();
  @$core.override
  DirectiveEditValidator createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectiveEditValidator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectiveEditValidator>(create);
  static DirectiveEditValidator? _defaultInstance;

  /// Validator address
  @$pb.TagNumber(1)
  $core.String get validatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  Description get description => $_getN(1);
  @$pb.TagNumber(2)
  set description(Description value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);
  @$pb.TagNumber(2)
  Description ensureDescription() => $_ensure(1);

  @$pb.TagNumber(3)
  Decimal get commissionRate => $_getN(2);
  @$pb.TagNumber(3)
  set commissionRate(Decimal value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCommissionRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommissionRate() => $_clearField(3);
  @$pb.TagNumber(3)
  Decimal ensureCommissionRate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get minSelfDelegation => $_getN(3);
  @$pb.TagNumber(4)
  set minSelfDelegation($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMinSelfDelegation() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinSelfDelegation() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get maxTotalDelegation => $_getN(4);
  @$pb.TagNumber(5)
  set maxTotalDelegation($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxTotalDelegation() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxTotalDelegation() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get slotKeyToRemove => $_getN(5);
  @$pb.TagNumber(6)
  set slotKeyToRemove($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSlotKeyToRemove() => $_has(5);
  @$pb.TagNumber(6)
  void clearSlotKeyToRemove() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get slotKeyToAdd => $_getN(6);
  @$pb.TagNumber(7)
  set slotKeyToAdd($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSlotKeyToAdd() => $_has(6);
  @$pb.TagNumber(7)
  void clearSlotKeyToAdd() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get slotKeyToAddSig => $_getN(7);
  @$pb.TagNumber(8)
  set slotKeyToAddSig($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSlotKeyToAddSig() => $_has(7);
  @$pb.TagNumber(8)
  void clearSlotKeyToAddSig() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get active => $_getN(8);
  @$pb.TagNumber(9)
  set active($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasActive() => $_has(8);
  @$pb.TagNumber(9)
  void clearActive() => $_clearField(9);
}

/// Delegate directive
class DirectiveDelegate extends $pb.GeneratedMessage {
  factory DirectiveDelegate({
    $core.String? delegatorAddress,
    $core.String? validatorAddress,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (delegatorAddress != null) result.delegatorAddress = delegatorAddress;
    if (validatorAddress != null) result.validatorAddress = validatorAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  DirectiveDelegate._();

  factory DirectiveDelegate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectiveDelegate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectiveDelegate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'delegatorAddress')
    ..aOS(2, _omitFieldNames ? '' : 'validatorAddress')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveDelegate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveDelegate copyWith(void Function(DirectiveDelegate) updates) =>
      super.copyWith((message) => updates(message as DirectiveDelegate))
          as DirectiveDelegate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectiveDelegate create() => DirectiveDelegate._();
  @$core.override
  DirectiveDelegate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectiveDelegate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectiveDelegate>(create);
  static DirectiveDelegate? _defaultInstance;

  /// Delegator address
  @$pb.TagNumber(1)
  $core.String get delegatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddress() => $_clearField(1);

  /// Validator address
  @$pb.TagNumber(2)
  $core.String get validatorAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set validatorAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddress() => $_clearField(2);

  /// Delegate amount (uint256, serialized big endian)
  @$pb.TagNumber(3)
  $core.List<$core.int> get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Undelegate directive
class DirectiveUndelegate extends $pb.GeneratedMessage {
  factory DirectiveUndelegate({
    $core.String? delegatorAddress,
    $core.String? validatorAddress,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (delegatorAddress != null) result.delegatorAddress = delegatorAddress;
    if (validatorAddress != null) result.validatorAddress = validatorAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  DirectiveUndelegate._();

  factory DirectiveUndelegate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectiveUndelegate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectiveUndelegate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'delegatorAddress')
    ..aOS(2, _omitFieldNames ? '' : 'validatorAddress')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveUndelegate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveUndelegate copyWith(void Function(DirectiveUndelegate) updates) =>
      super.copyWith((message) => updates(message as DirectiveUndelegate))
          as DirectiveUndelegate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectiveUndelegate create() => DirectiveUndelegate._();
  @$core.override
  DirectiveUndelegate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectiveUndelegate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectiveUndelegate>(create);
  static DirectiveUndelegate? _defaultInstance;

  /// Delegator address
  @$pb.TagNumber(1)
  $core.String get delegatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddress() => $_clearField(1);

  /// Validator address
  @$pb.TagNumber(2)
  $core.String get validatorAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set validatorAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddress() => $_clearField(2);

  /// Undelegate amount (uint256, serialized big endian)
  @$pb.TagNumber(3)
  $core.List<$core.int> get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Collect reward
class DirectiveCollectRewards extends $pb.GeneratedMessage {
  factory DirectiveCollectRewards({
    $core.String? delegatorAddress,
  }) {
    final result = create();
    if (delegatorAddress != null) result.delegatorAddress = delegatorAddress;
    return result;
  }

  DirectiveCollectRewards._();

  factory DirectiveCollectRewards.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectiveCollectRewards.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectiveCollectRewards',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Harmony.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'delegatorAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveCollectRewards clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectiveCollectRewards copyWith(
          void Function(DirectiveCollectRewards) updates) =>
      super.copyWith((message) => updates(message as DirectiveCollectRewards))
          as DirectiveCollectRewards;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectiveCollectRewards create() => DirectiveCollectRewards._();
  @$core.override
  DirectiveCollectRewards createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectiveCollectRewards getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectiveCollectRewards>(create);
  static DirectiveCollectRewards? _defaultInstance;

  /// Delegator address
  @$pb.TagNumber(1)
  $core.String get delegatorAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddress() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
