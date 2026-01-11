// This is a generated file - do not edit.
//
// Generated from IOST.proto.

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
import 'IOST.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'IOST.pbenum.dart';

/// The message defines transaction action struct.
class Action extends $pb.GeneratedMessage {
  factory Action({
    $core.String? contract,
    $core.String? actionName,
    $core.String? data,
  }) {
    final result = create();
    if (contract != null) result.contract = contract;
    if (actionName != null) result.actionName = actionName;
    if (data != null) result.data = data;
    return result;
  }

  Action._();

  factory Action.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'contract')
    ..aOS(2, _omitFieldNames ? '' : 'actionName')
    ..aOS(3, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action copyWith(void Function(Action) updates) =>
      super.copyWith((message) => updates(message as Action)) as Action;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action create() => Action._();
  @$core.override
  Action createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Action>(create);
  static Action? _defaultInstance;

  /// contract name
  @$pb.TagNumber(1)
  $core.String get contract => $_getSZ(0);
  @$pb.TagNumber(1)
  set contract($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContract() => $_has(0);
  @$pb.TagNumber(1)
  void clearContract() => $_clearField(1);

  /// action name
  @$pb.TagNumber(2)
  $core.String get actionName => $_getSZ(1);
  @$pb.TagNumber(2)
  set actionName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionName() => $_clearField(2);

  /// data
  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
}

/// The message defines transaction amount limit struct.
class AmountLimit extends $pb.GeneratedMessage {
  factory AmountLimit({
    $core.String? token,
    $core.String? value,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (value != null) result.value = value;
    return result;
  }

  AmountLimit._();

  factory AmountLimit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AmountLimit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AmountLimit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AmountLimit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AmountLimit copyWith(void Function(AmountLimit) updates) =>
      super.copyWith((message) => updates(message as AmountLimit))
          as AmountLimit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AmountLimit create() => AmountLimit._();
  @$core.override
  AmountLimit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AmountLimit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AmountLimit>(create);
  static AmountLimit? _defaultInstance;

  /// token name
  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  /// limit value
  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

/// The message defines signature struct.
class Signature extends $pb.GeneratedMessage {
  factory Signature({
    Algorithm? algorithm,
    $core.List<$core.int>? signature,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (algorithm != null) result.algorithm = algorithm;
    if (signature != null) result.signature = signature;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  Signature._();

  factory Signature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Signature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Signature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aE<Algorithm>(1, _omitFieldNames ? '' : 'algorithm',
        enumValues: Algorithm.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Signature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Signature copyWith(void Function(Signature) updates) =>
      super.copyWith((message) => updates(message as Signature)) as Signature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Signature create() => Signature._();
  @$core.override
  Signature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Signature getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Signature>(create);
  static Signature? _defaultInstance;

  /// signature algorithm
  @$pb.TagNumber(1)
  Algorithm get algorithm => $_getN(0);
  @$pb.TagNumber(1)
  set algorithm(Algorithm value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAlgorithm() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlgorithm() => $_clearField(1);

  /// signature bytes
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// public key
  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);
}

/// The message defines the transaction request.
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $fixnum.Int64? time,
    $fixnum.Int64? expiration,
    $core.double? gasRatio,
    $core.double? gasLimit,
    $fixnum.Int64? delay,
    $core.int? chainId,
    $core.Iterable<Action>? actions,
    $core.Iterable<AmountLimit>? amountLimit,
    $core.Iterable<$core.String>? signers,
    $core.Iterable<Signature>? signatures,
    $core.String? publisher,
    $core.Iterable<Signature>? publisherSigs,
  }) {
    final result = create();
    if (time != null) result.time = time;
    if (expiration != null) result.expiration = expiration;
    if (gasRatio != null) result.gasRatio = gasRatio;
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (delay != null) result.delay = delay;
    if (chainId != null) result.chainId = chainId;
    if (actions != null) result.actions.addAll(actions);
    if (amountLimit != null) result.amountLimit.addAll(amountLimit);
    if (signers != null) result.signers.addAll(signers);
    if (signatures != null) result.signatures.addAll(signatures);
    if (publisher != null) result.publisher = publisher;
    if (publisherSigs != null) result.publisherSigs.addAll(publisherSigs);
    return result;
  }

  Transaction._();

  factory Transaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'time')
    ..aInt64(2, _omitFieldNames ? '' : 'expiration')
    ..aD(3, _omitFieldNames ? '' : 'gasRatio')
    ..aD(4, _omitFieldNames ? '' : 'gasLimit')
    ..aInt64(5, _omitFieldNames ? '' : 'delay')
    ..aI(6, _omitFieldNames ? '' : 'chainId', fieldType: $pb.PbFieldType.OU3)
    ..pPM<Action>(7, _omitFieldNames ? '' : 'actions',
        subBuilder: Action.create)
    ..pPM<AmountLimit>(8, _omitFieldNames ? '' : 'amountLimit',
        subBuilder: AmountLimit.create)
    ..pPS(9, _omitFieldNames ? '' : 'signers')
    ..pPM<Signature>(10, _omitFieldNames ? '' : 'signatures',
        subBuilder: Signature.create)
    ..aOS(11, _omitFieldNames ? '' : 'publisher')
    ..pPM<Signature>(12, _omitFieldNames ? '' : 'publisherSigs',
        subBuilder: Signature.create)
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

  /// transaction timestamp
  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => $_clearField(1);

  /// expiration timestamp
  @$pb.TagNumber(2)
  $fixnum.Int64 get expiration => $_getI64(1);
  @$pb.TagNumber(2)
  set expiration($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiration() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiration() => $_clearField(2);

  /// gas price
  @$pb.TagNumber(3)
  $core.double get gasRatio => $_getN(2);
  @$pb.TagNumber(3)
  set gasRatio($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGasRatio() => $_has(2);
  @$pb.TagNumber(3)
  void clearGasRatio() => $_clearField(3);

  /// gas limit
  @$pb.TagNumber(4)
  $core.double get gasLimit => $_getN(3);
  @$pb.TagNumber(4)
  set gasLimit($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearGasLimit() => $_clearField(4);

  /// delay nanoseconds
  @$pb.TagNumber(5)
  $fixnum.Int64 get delay => $_getI64(4);
  @$pb.TagNumber(5)
  set delay($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDelay() => $_has(4);
  @$pb.TagNumber(5)
  void clearDelay() => $_clearField(5);

  /// chain id
  @$pb.TagNumber(6)
  $core.int get chainId => $_getIZ(5);
  @$pb.TagNumber(6)
  set chainId($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChainId() => $_has(5);
  @$pb.TagNumber(6)
  void clearChainId() => $_clearField(6);

  /// action list
  @$pb.TagNumber(7)
  $pb.PbList<Action> get actions => $_getList(6);

  /// amount limit
  @$pb.TagNumber(8)
  $pb.PbList<AmountLimit> get amountLimit => $_getList(7);

  /// signer list
  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get signers => $_getList(8);

  /// signatures of signers
  @$pb.TagNumber(10)
  $pb.PbList<Signature> get signatures => $_getList(9);

  /// publisher
  @$pb.TagNumber(11)
  $core.String get publisher => $_getSZ(10);
  @$pb.TagNumber(11)
  set publisher($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPublisher() => $_has(10);
  @$pb.TagNumber(11)
  void clearPublisher() => $_clearField(11);

  /// signatures of publisher
  @$pb.TagNumber(12)
  $pb.PbList<Signature> get publisherSigs => $_getList(11);
}

class AccountInfo extends $pb.GeneratedMessage {
  factory AccountInfo({
    $core.String? name,
    $core.List<$core.int>? activeKey,
    $core.List<$core.int>? ownerKey,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (activeKey != null) result.activeKey = activeKey;
    if (ownerKey != null) result.ownerKey = ownerKey;
    return result;
  }

  AccountInfo._();

  factory AccountInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccountInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'activeKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'ownerKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountInfo copyWith(void Function(AccountInfo) updates) =>
      super.copyWith((message) => updates(message as AccountInfo))
          as AccountInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountInfo create() => AccountInfo._();
  @$core.override
  AccountInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccountInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfo>(create);
  static AccountInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get activeKey => $_getN(1);
  @$pb.TagNumber(2)
  set activeKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActiveKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get ownerKey => $_getN(2);
  @$pb.TagNumber(3)
  set ownerKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOwnerKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerKey() => $_clearField(3);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    AccountInfo? account,
    Transaction? transactionTemplate,
    $core.String? transferDestination,
    $core.String? transferAmount,
    $core.String? transferMemo,
  }) {
    final result = create();
    if (account != null) result.account = account;
    if (transactionTemplate != null)
      result.transactionTemplate = transactionTemplate;
    if (transferDestination != null)
      result.transferDestination = transferDestination;
    if (transferAmount != null) result.transferAmount = transferAmount;
    if (transferMemo != null) result.transferMemo = transferMemo;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aOM<AccountInfo>(1, _omitFieldNames ? '' : 'account',
        subBuilder: AccountInfo.create)
    ..aOM<Transaction>(2, _omitFieldNames ? '' : 'transactionTemplate',
        subBuilder: Transaction.create)
    ..aOS(3, _omitFieldNames ? '' : 'transferDestination')
    ..aOS(4, _omitFieldNames ? '' : 'transferAmount')
    ..aOS(5, _omitFieldNames ? '' : 'transferMemo')
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

  @$pb.TagNumber(1)
  AccountInfo get account => $_getN(0);
  @$pb.TagNumber(1)
  set account(AccountInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => $_clearField(1);
  @$pb.TagNumber(1)
  AccountInfo ensureAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  Transaction get transactionTemplate => $_getN(1);
  @$pb.TagNumber(2)
  set transactionTemplate(Transaction value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransactionTemplate() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransactionTemplate() => $_clearField(2);
  @$pb.TagNumber(2)
  Transaction ensureTransactionTemplate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get transferDestination => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferDestination($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferDestination() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get transferAmount => $_getSZ(3);
  @$pb.TagNumber(4)
  set transferAmount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransferAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransferAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get transferMemo => $_getSZ(4);
  @$pb.TagNumber(5)
  set transferMemo($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTransferMemo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransferMemo() => $_clearField(5);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    Transaction? transaction,
    $core.List<$core.int>? encoded,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.IOST.Proto'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
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

  /// Signed transaction
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

  /// Signed and encoded transaction bytes.
  @$pb.TagNumber(2)
  $core.List<$core.int> get encoded => $_getN(1);
  @$pb.TagNumber(2)
  set encoded($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEncoded() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncoded() => $_clearField(2);

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
