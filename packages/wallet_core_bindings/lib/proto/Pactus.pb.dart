// This is a generated file - do not edit.
//
// Generated from Pactus.proto.

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

enum TransactionMessage_Payload { transfer, bond, notSet }

class TransactionMessage extends $pb.GeneratedMessage {
  factory TransactionMessage({
    $core.int? lockTime,
    $fixnum.Int64? fee,
    $core.String? memo,
    TransferPayload? transfer,
    BondPayload? bond,
  }) {
    final result = create();
    if (lockTime != null) result.lockTime = lockTime;
    if (fee != null) result.fee = fee;
    if (memo != null) result.memo = memo;
    if (transfer != null) result.transfer = transfer;
    if (bond != null) result.bond = bond;
    return result;
  }

  TransactionMessage._();

  factory TransactionMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TransactionMessage_Payload>
      _TransactionMessage_PayloadByTag = {
    10: TransactionMessage_Payload.transfer,
    11: TransactionMessage_Payload.bond,
    0: TransactionMessage_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionMessage',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..aI(1, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(2, _omitFieldNames ? '' : 'fee')
    ..aOS(3, _omitFieldNames ? '' : 'memo')
    ..aOM<TransferPayload>(10, _omitFieldNames ? '' : 'transfer',
        subBuilder: TransferPayload.create)
    ..aOM<BondPayload>(11, _omitFieldNames ? '' : 'bond',
        subBuilder: BondPayload.create)
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

  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  TransactionMessage_Payload whichPayload() =>
      _TransactionMessage_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  void clearPayload() => $_clearField($_whichOneof(0));

  /// The lock time for the transaction.
  @$pb.TagNumber(1)
  $core.int get lockTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set lockTime($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLockTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockTime() => $_clearField(1);

  /// The transaction fee in NanoPAC.
  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => $_clearField(2);

  /// A memo string for the transaction (optional).
  @$pb.TagNumber(3)
  $core.String get memo => $_getSZ(2);
  @$pb.TagNumber(3)
  set memo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemo() => $_clearField(3);

  @$pb.TagNumber(10)
  TransferPayload get transfer => $_getN(3);
  @$pb.TagNumber(10)
  set transfer(TransferPayload value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTransfer() => $_has(3);
  @$pb.TagNumber(10)
  void clearTransfer() => $_clearField(10);
  @$pb.TagNumber(10)
  TransferPayload ensureTransfer() => $_ensure(3);

  @$pb.TagNumber(11)
  BondPayload get bond => $_getN(4);
  @$pb.TagNumber(11)
  set bond(BondPayload value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasBond() => $_has(4);
  @$pb.TagNumber(11)
  void clearBond() => $_clearField(11);
  @$pb.TagNumber(11)
  BondPayload ensureBond() => $_ensure(4);
}

/// Transfer payload for creating a Transfer transaction between two accounts.
class TransferPayload extends $pb.GeneratedMessage {
  factory TransferPayload({
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (receiver != null) result.receiver = receiver;
    if (amount != null) result.amount = amount;
    return result;
  }

  TransferPayload._();

  factory TransferPayload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferPayload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferPayload',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferPayload clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferPayload copyWith(void Function(TransferPayload) updates) =>
      super.copyWith((message) => updates(message as TransferPayload))
          as TransferPayload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferPayload create() => TransferPayload._();
  @$core.override
  TransferPayload createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferPayload>(create);
  static TransferPayload? _defaultInstance;

  /// The sender's account address.
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);

  /// The receiver's account address.
  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => $_clearField(2);

  /// The amount to be transferred, specified in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Bond payload for creating a Bond transaction from an account to a validator.
class BondPayload extends $pb.GeneratedMessage {
  factory BondPayload({
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? stake,
    $core.String? publicKey,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (receiver != null) result.receiver = receiver;
    if (stake != null) result.stake = stake;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  BondPayload._();

  factory BondPayload.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BondPayload.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BondPayload',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..aInt64(3, _omitFieldNames ? '' : 'stake')
    ..aOS(4, _omitFieldNames ? '' : 'publicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BondPayload clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BondPayload copyWith(void Function(BondPayload) updates) =>
      super.copyWith((message) => updates(message as BondPayload))
          as BondPayload;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BondPayload create() => BondPayload._();
  @$core.override
  BondPayload createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BondPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BondPayload>(create);
  static BondPayload? _defaultInstance;

  /// The sender's account address.
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);

  /// The receiver's validator address.
  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => $_clearField(2);

  /// The stake amount in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get stake => $_getI64(2);
  @$pb.TagNumber(3)
  set stake($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStake() => $_has(2);
  @$pb.TagNumber(3)
  void clearStake() => $_clearField(3);

  /// The public key of the validator (only set when creating a new validator).
  @$pb.TagNumber(4)
  $core.String get publicKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicKey() => $_clearField(4);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    TransactionMessage? transaction,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (transaction != null) result.transaction = transaction;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<TransactionMessage>(2, _omitFieldNames ? '' : 'transaction',
        subBuilder: TransactionMessage.create)
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
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  @$pb.TagNumber(2)
  TransactionMessage get transaction => $_getN(1);
  @$pb.TagNumber(2)
  set transaction(TransactionMessage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransaction() => $_clearField(2);
  @$pb.TagNumber(2)
  TransactionMessage ensureTransaction() => $_ensure(1);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? transactionId,
    $core.List<$core.int>? signedTransactionData,
    $core.List<$core.int>? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    if (signedTransactionData != null)
      result.signedTransactionData = signedTransactionData;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'transactionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signedTransactionData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(4, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(5, _omitFieldNames ? '' : 'errorMessage')
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

  /// Transaction ID (Hash).
  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);

  /// Signed and encoded transaction bytes.
  @$pb.TagNumber(2)
  $core.List<$core.int> get signedTransactionData => $_getN(1);
  @$pb.TagNumber(2)
  set signedTransactionData($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignedTransactionData() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedTransactionData() => $_clearField(2);

  /// Signature the signed transaction.
  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);

  /// A possible error, `OK` if none.
  @$pb.TagNumber(4)
  $0.SigningError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error($0.SigningError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);

  /// Detailed error message, if any.
  @$pb.TagNumber(5)
  $core.String get errorMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set errorMessage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasErrorMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearErrorMessage() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
