// This is a generated file - do not edit.
//
// Generated from Hedera.proto.

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

/// An exact date and time. This is the same data structure as the protobuf Timestamp.proto
/// (see the comments in https://github.com/google/protobuf/blob/master/src/google/protobuf/timestamp.proto)
class Timestamp extends $pb.GeneratedMessage {
  factory Timestamp({
    $fixnum.Int64? seconds,
    $core.int? nanos,
  }) {
    final result = create();
    if (seconds != null) result.seconds = seconds;
    if (nanos != null) result.nanos = nanos;
    return result;
  }

  Timestamp._();

  factory Timestamp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Timestamp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Timestamp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Hedera.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seconds')
    ..aI(2, _omitFieldNames ? '' : 'nanos')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Timestamp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Timestamp copyWith(void Function(Timestamp) updates) =>
      super.copyWith((message) => updates(message as Timestamp)) as Timestamp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timestamp create() => Timestamp._();
  @$core.override
  Timestamp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Timestamp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timestamp>(create);
  static Timestamp? _defaultInstance;

  /// Number of complete seconds since the start of the epoch
  @$pb.TagNumber(1)
  $fixnum.Int64 get seconds => $_getI64(0);
  @$pb.TagNumber(1)
  set seconds($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeconds() => $_clearField(1);

  /// Number of nanoseconds since the start of the last second
  @$pb.TagNumber(2)
  $core.int get nanos => $_getIZ(1);
  @$pb.TagNumber(2)
  set nanos($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNanos() => $_has(1);
  @$pb.TagNumber(2)
  void clearNanos() => $_clearField(2);
}

/// The ID for a transaction. This is used for retrieving receipts and records for a transaction, for
/// appending to a file right after creating it, for instantiating a smart contract with bytecode in
/// a file just created, and internally by the network for detecting when duplicate transactions are
/// submitted. A user might get a transaction processed faster by submitting it to N nodes, each with
/// a different node account, but all with the same TransactionID. Then, the transaction will take
/// effect when the first of all those nodes submits the transaction and it reaches consensus. The
/// other transactions will not take effect. So this could make the transaction take effect faster,
/// if any given node might be slow. However, the full transaction fee is charged for each
/// transaction, so the total fee is N times as much if the transaction is sent to N nodes.
///
/// Applicable to Scheduled Transactions:
///  - The ID of a Scheduled Transaction has transactionValidStart and accountIDs inherited from the
///    ScheduleCreate transaction that created it. That is to say that they are equal
///  - The scheduled property is true for Scheduled Transactions
///  - transactionValidStart, accountID and scheduled properties should be omitted
class TransactionID extends $pb.GeneratedMessage {
  factory TransactionID({
    Timestamp? transactionValidStart,
    $core.String? accountID,
    $core.bool? scheduled,
    $core.int? nonce,
  }) {
    final result = create();
    if (transactionValidStart != null)
      result.transactionValidStart = transactionValidStart;
    if (accountID != null) result.accountID = accountID;
    if (scheduled != null) result.scheduled = scheduled;
    if (nonce != null) result.nonce = nonce;
    return result;
  }

  TransactionID._();

  factory TransactionID.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionID.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionID',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Hedera.Proto'),
      createEmptyInstance: create)
    ..aOM<Timestamp>(1, _omitFieldNames ? '' : 'transactionValidStart',
        protoName: 'transactionValidStart', subBuilder: Timestamp.create)
    ..aOS(2, _omitFieldNames ? '' : 'accountID', protoName: 'accountID')
    ..aOB(3, _omitFieldNames ? '' : 'scheduled')
    ..aI(4, _omitFieldNames ? '' : 'nonce')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionID clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionID copyWith(void Function(TransactionID) updates) =>
      super.copyWith((message) => updates(message as TransactionID))
          as TransactionID;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionID create() => TransactionID._();
  @$core.override
  TransactionID createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionID getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionID>(create);
  static TransactionID? _defaultInstance;

  /// The transaction is invalid if consensusTimestamp < transactionID.transactionStartValid
  @$pb.TagNumber(1)
  Timestamp get transactionValidStart => $_getN(0);
  @$pb.TagNumber(1)
  set transactionValidStart(Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionValidStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionValidStart() => $_clearField(1);
  @$pb.TagNumber(1)
  Timestamp ensureTransactionValidStart() => $_ensure(0);

  /// The Account ID that paid for this transaction
  @$pb.TagNumber(2)
  $core.String get accountID => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountID($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccountID() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountID() => $_clearField(2);

  /// Whether the Transaction is of type Scheduled or no
  @$pb.TagNumber(3)
  $core.bool get scheduled => $_getBF(2);
  @$pb.TagNumber(3)
  set scheduled($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScheduled() => $_has(2);
  @$pb.TagNumber(3)
  void clearScheduled() => $_clearField(3);

  /// The identifier for an internal transaction that was spawned as part
  /// of handling a user transaction. (These internal transactions share the
  /// transactionValidStart and accountID of the user transaction, so a
  /// nonce is necessary to give them a unique TransactionID.)
  ///
  /// An example is when a "parent" ContractCreate or ContractCall transaction
  /// calls one or more HTS precompiled contracts; each of the "child" transactions spawned for a precompile has a id
  /// with a different nonce.
  @$pb.TagNumber(4)
  $core.int get nonce => $_getIZ(3);
  @$pb.TagNumber(4)
  set nonce($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => $_clearField(4);
}

/// Necessary fields to process a TransferMessage
class TransferMessage extends $pb.GeneratedMessage {
  factory TransferMessage({
    $core.String? from,
    $core.String? to,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    return result;
  }

  TransferMessage._();

  factory TransferMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferMessage',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Hedera.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OS6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferMessage copyWith(void Function(TransferMessage) updates) =>
      super.copyWith((message) => updates(message as TransferMessage))
          as TransferMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferMessage create() => TransferMessage._();
  @$core.override
  TransferMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferMessage>(create);
  static TransferMessage? _defaultInstance;

  /// Source Account address (string)
  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// Destination Account address (string)
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// Amount to be transferred (sint64)
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

enum TransactionBody_Data { transfer, notSet }

/// A single transaction. All transaction types are possible here.
class TransactionBody extends $pb.GeneratedMessage {
  factory TransactionBody({
    TransactionID? transactionID,
    $core.String? nodeAccountID,
    $fixnum.Int64? transactionFee,
    $fixnum.Int64? transactionValidDuration,
    $core.String? memo,
    TransferMessage? transfer,
  }) {
    final result = create();
    if (transactionID != null) result.transactionID = transactionID;
    if (nodeAccountID != null) result.nodeAccountID = nodeAccountID;
    if (transactionFee != null) result.transactionFee = transactionFee;
    if (transactionValidDuration != null)
      result.transactionValidDuration = transactionValidDuration;
    if (memo != null) result.memo = memo;
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  TransactionBody._();

  factory TransactionBody.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionBody.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TransactionBody_Data>
      _TransactionBody_DataByTag = {
    6: TransactionBody_Data.transfer,
    0: TransactionBody_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionBody',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Hedera.Proto'),
      createEmptyInstance: create)
    ..oo(0, [6])
    ..aOM<TransactionID>(1, _omitFieldNames ? '' : 'transactionID',
        protoName: 'transactionID', subBuilder: TransactionID.create)
    ..aOS(2, _omitFieldNames ? '' : 'nodeAccountID', protoName: 'nodeAccountID')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'transactionFee', $pb.PbFieldType.OU6,
        protoName: 'transactionFee', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(4, _omitFieldNames ? '' : 'transactionValidDuration',
        protoName: 'transactionValidDuration')
    ..aOS(5, _omitFieldNames ? '' : 'memo')
    ..aOM<TransferMessage>(6, _omitFieldNames ? '' : 'transfer',
        subBuilder: TransferMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionBody clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionBody copyWith(void Function(TransactionBody) updates) =>
      super.copyWith((message) => updates(message as TransactionBody))
          as TransactionBody;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionBody create() => TransactionBody._();
  @$core.override
  TransactionBody createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionBody getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionBody>(create);
  static TransactionBody? _defaultInstance;

  @$pb.TagNumber(6)
  TransactionBody_Data whichData() =>
      _TransactionBody_DataByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(6)
  void clearData() => $_clearField($_whichOneof(0));

  /// The ID for this transaction, which includes the payer's account (the account paying the transaction fee).
  /// If two transactions have the same transactionID, they won't both have an effect
  @$pb.TagNumber(1)
  TransactionID get transactionID => $_getN(0);
  @$pb.TagNumber(1)
  set transactionID(TransactionID value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionID() => $_clearField(1);
  @$pb.TagNumber(1)
  TransactionID ensureTransactionID() => $_ensure(0);

  /// The account of the node that submits the client's transaction to the network
  @$pb.TagNumber(2)
  $core.String get nodeAccountID => $_getSZ(1);
  @$pb.TagNumber(2)
  set nodeAccountID($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeAccountID() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeAccountID() => $_clearField(2);

  /// The maximum transaction fee the client is willing to pay
  @$pb.TagNumber(3)
  $fixnum.Int64 get transactionFee => $_getI64(2);
  @$pb.TagNumber(3)
  set transactionFee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionFee() => $_clearField(3);

  /// The transaction is invalid if consensusTimestamp > transactionID.transactionValidStart + transactionValidDuration
  @$pb.TagNumber(4)
  $fixnum.Int64 get transactionValidDuration => $_getI64(3);
  @$pb.TagNumber(4)
  set transactionValidDuration($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransactionValidDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionValidDuration() => $_clearField(4);

  /// Any notes or descriptions that should be put into the record (max length 100)
  @$pb.TagNumber(5)
  $core.String get memo => $_getSZ(4);
  @$pb.TagNumber(5)
  set memo($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMemo() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemo() => $_clearField(5);

  /// Transfer amount between accounts
  @$pb.TagNumber(6)
  TransferMessage get transfer => $_getN(5);
  @$pb.TagNumber(6)
  set transfer(TransferMessage value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTransfer() => $_has(5);
  @$pb.TagNumber(6)
  void clearTransfer() => $_clearField(6);
  @$pb.TagNumber(6)
  TransferMessage ensureTransfer() => $_ensure(5);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    TransactionBody? body,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (body != null) result.body = body;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Hedera.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<TransactionBody>(2, _omitFieldNames ? '' : 'body',
        subBuilder: TransactionBody.create)
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

  /// Private key to sign the transaction (bytes)
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// The transaction body
  @$pb.TagNumber(2)
  TransactionBody get body => $_getN(1);
  @$pb.TagNumber(2)
  set body(TransactionBody value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => $_clearField(2);
  @$pb.TagNumber(2)
  TransactionBody ensureBody() => $_ensure(1);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Hedera.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
