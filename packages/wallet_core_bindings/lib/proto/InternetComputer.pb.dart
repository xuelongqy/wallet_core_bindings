// This is a generated file - do not edit.
//
// Generated from InternetComputer.proto.

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

/// ICP ledger transfer arguments
class Transaction_Transfer extends $pb.GeneratedMessage {
  factory Transaction_Transfer({
    $core.String? toAccountIdentifier,
    $fixnum.Int64? amount,
    $fixnum.Int64? memo,
    $fixnum.Int64? currentTimestampNanos,
    $fixnum.Int64? permittedDrift,
  }) {
    final result = create();
    if (toAccountIdentifier != null)
      result.toAccountIdentifier = toAccountIdentifier;
    if (amount != null) result.amount = amount;
    if (memo != null) result.memo = memo;
    if (currentTimestampNanos != null)
      result.currentTimestampNanos = currentTimestampNanos;
    if (permittedDrift != null) result.permittedDrift = permittedDrift;
    return result;
  }

  Transaction_Transfer._();

  factory Transaction_Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.Transfer',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.InternetComputer.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAccountIdentifier')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'memo', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'currentTimestampNanos', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'permittedDrift', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_Transfer copyWith(void Function(Transaction_Transfer) updates) =>
      super.copyWith((message) => updates(message as Transaction_Transfer))
          as Transaction_Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_Transfer create() => Transaction_Transfer._();
  @$core.override
  Transaction_Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_Transfer>(create);
  static Transaction_Transfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get toAccountIdentifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAccountIdentifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAccountIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAccountIdentifier() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get memo => $_getI64(2);
  @$pb.TagNumber(3)
  set memo($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemo() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get currentTimestampNanos => $_getI64(3);
  @$pb.TagNumber(4)
  set currentTimestampNanos($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentTimestampNanos() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentTimestampNanos() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get permittedDrift => $_getI64(4);
  @$pb.TagNumber(5)
  set permittedDrift($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPermittedDrift() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermittedDrift() => $_clearField(5);
}

enum Transaction_TransactionOneof { transfer, notSet }

/// Internet Computer Transactions
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    Transaction_Transfer? transfer,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    return result;
  }

  Transaction._();

  factory Transaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Transaction_TransactionOneof>
      _Transaction_TransactionOneofByTag = {
    1: Transaction_TransactionOneof.transfer,
    0: Transaction_TransactionOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.InternetComputer.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Transaction_Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transaction_Transfer.create)
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

  @$pb.TagNumber(1)
  Transaction_TransactionOneof whichTransactionOneof() =>
      _Transaction_TransactionOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearTransactionOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Transaction_Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transaction_Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction_Transfer ensureTransfer() => $_ensure(0);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    Transaction? transaction,
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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.InternetComputer.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<Transaction>(2, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
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
  Transaction get transaction => $_getN(1);
  @$pb.TagNumber(2)
  set transaction(Transaction value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransaction() => $_clearField(2);
  @$pb.TagNumber(2)
  Transaction ensureTransaction() => $_ensure(1);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? signedTransaction,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (signedTransaction != null) result.signedTransaction = signedTransaction;
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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.InternetComputer.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signedTransaction', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
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
  /// NOTE: Before sending to the Rosetta node, this value should be hex-encoded before using with the JSON structure.
  @$pb.TagNumber(1)
  $core.List<$core.int> get signedTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set signedTransaction($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedTransaction() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.SigningError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

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
