// This is a generated file - do not edit.
//
// Generated from Decred.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Bitcoin.pb.dart' as $0;
import 'BitcoinV2.pb.dart' as $1;
import 'Common.pbenum.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// A transfer transaction
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.int? serializeType,
    $core.int? version,
    $core.Iterable<TransactionInput>? inputs,
    $core.Iterable<TransactionOutput>? outputs,
    $core.int? lockTime,
    $core.int? expiry,
  }) {
    final result = create();
    if (serializeType != null) result.serializeType = serializeType;
    if (version != null) result.version = version;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    if (lockTime != null) result.lockTime = lockTime;
    if (expiry != null) result.expiry = expiry;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Decred.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'serializeType',
        protoName: 'serializeType', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..pPM<TransactionInput>(3, _omitFieldNames ? '' : 'inputs',
        subBuilder: TransactionInput.create)
    ..pPM<TransactionOutput>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: TransactionOutput.create)
    ..aI(5, _omitFieldNames ? '' : 'lockTime',
        protoName: 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..aI(6, _omitFieldNames ? '' : 'expiry', fieldType: $pb.PbFieldType.OU3)
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

  /// Serialization format
  @$pb.TagNumber(1)
  $core.int get serializeType => $_getIZ(0);
  @$pb.TagNumber(1)
  set serializeType($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSerializeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearSerializeType() => $_clearField(1);

  /// Transaction data format version
  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);

  /// A list of 1 or more transaction inputs or sources for coins.
  @$pb.TagNumber(3)
  $pb.PbList<TransactionInput> get inputs => $_getList(2);

  /// A list of 1 or more transaction outputs or destinations for coins
  @$pb.TagNumber(4)
  $pb.PbList<TransactionOutput> get outputs => $_getList(3);

  /// The time when a transaction can be spent (usually zero, in which case it has no effect).
  @$pb.TagNumber(5)
  $core.int get lockTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set lockTime($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLockTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLockTime() => $_clearField(5);

  /// The block height at which the transaction expires and is no longer valid.
  @$pb.TagNumber(6)
  $core.int get expiry => $_getIZ(5);
  @$pb.TagNumber(6)
  set expiry($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiry() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiry() => $_clearField(6);
}

/// Decred transaction input.
class TransactionInput extends $pb.GeneratedMessage {
  factory TransactionInput({
    $0.OutPoint? previousOutput,
    $core.int? sequence,
    $fixnum.Int64? valueIn,
    $core.int? blockHeight,
    $core.int? blockIndex,
    $core.List<$core.int>? script,
  }) {
    final result = create();
    if (previousOutput != null) result.previousOutput = previousOutput;
    if (sequence != null) result.sequence = sequence;
    if (valueIn != null) result.valueIn = valueIn;
    if (blockHeight != null) result.blockHeight = blockHeight;
    if (blockIndex != null) result.blockIndex = blockIndex;
    if (script != null) result.script = script;
    return result;
  }

  TransactionInput._();

  factory TransactionInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Decred.Proto'),
      createEmptyInstance: create)
    ..aOM<$0.OutPoint>(1, _omitFieldNames ? '' : 'previousOutput',
        protoName: 'previousOutput', subBuilder: $0.OutPoint.create)
    ..aI(2, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(3, _omitFieldNames ? '' : 'valueIn', protoName: 'valueIn')
    ..aI(4, _omitFieldNames ? '' : 'blockHeight',
        protoName: 'blockHeight', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'blockIndex',
        protoName: 'blockIndex', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'script', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionInput copyWith(void Function(TransactionInput) updates) =>
      super.copyWith((message) => updates(message as TransactionInput))
          as TransactionInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInput create() => TransactionInput._();
  @$core.override
  TransactionInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionInput>(create);
  static TransactionInput? _defaultInstance;

  /// Reference to the previous transaction's output.
  @$pb.TagNumber(1)
  $0.OutPoint get previousOutput => $_getN(0);
  @$pb.TagNumber(1)
  set previousOutput($0.OutPoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPreviousOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousOutput() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OutPoint ensurePreviousOutput() => $_ensure(0);

  /// Transaction version as defined by the sender.
  @$pb.TagNumber(2)
  $core.int get sequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequence() => $_clearField(2);

  /// The amount of the input
  @$pb.TagNumber(3)
  $fixnum.Int64 get valueIn => $_getI64(2);
  @$pb.TagNumber(3)
  set valueIn($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValueIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearValueIn() => $_clearField(3);

  /// Creation block height
  @$pb.TagNumber(4)
  $core.int get blockHeight => $_getIZ(3);
  @$pb.TagNumber(4)
  set blockHeight($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBlockHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockHeight() => $_clearField(4);

  /// Index within the block
  @$pb.TagNumber(5)
  $core.int get blockIndex => $_getIZ(4);
  @$pb.TagNumber(5)
  set blockIndex($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBlockIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlockIndex() => $_clearField(5);

  /// Computational script for confirming transaction authorization.
  @$pb.TagNumber(6)
  $core.List<$core.int> get script => $_getN(5);
  @$pb.TagNumber(6)
  set script($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasScript() => $_has(5);
  @$pb.TagNumber(6)
  void clearScript() => $_clearField(6);
}

/// Decred transaction output.
class TransactionOutput extends $pb.GeneratedMessage {
  factory TransactionOutput({
    $fixnum.Int64? value,
    $core.int? version,
    $core.List<$core.int>? script,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (version != null) result.version = version;
    if (script != null) result.script = script;
    return result;
  }

  TransactionOutput._();

  factory TransactionOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Decred.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..aI(2, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'script', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionOutput copyWith(void Function(TransactionOutput) updates) =>
      super.copyWith((message) => updates(message as TransactionOutput))
          as TransactionOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionOutput create() => TransactionOutput._();
  @$core.override
  TransactionOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionOutput>(create);
  static TransactionOutput? _defaultInstance;

  /// Transaction amount.
  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// Transaction output version.
  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);

  /// Usually contains the public key as a Decred script setting up conditions to claim this output.
  @$pb.TagNumber(3)
  $core.List<$core.int> get script => $_getN(2);
  @$pb.TagNumber(3)
  set script($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScript() => $_has(2);
  @$pb.TagNumber(3)
  void clearScript() => $_clearField(3);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    Transaction? transaction,
    $core.List<$core.int>? encoded,
    $core.String? transactionId,
    $2.SigningError? error,
    $core.String? errorMessage,
    $1.SigningOutput? signingResultV2,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    if (encoded != null) result.encoded = encoded;
    if (transactionId != null) result.transactionId = transactionId;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (signingResultV2 != null) result.signingResultV2 = signingResultV2;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Decred.Proto'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'transactionId')
    ..aE<$2.SigningError>(4, _omitFieldNames ? '' : 'error',
        enumValues: $2.SigningError.values)
    ..aOS(5, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<$1.SigningOutput>(6, _omitFieldNames ? '' : 'signingResultV2',
        subBuilder: $1.SigningOutput.create)
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

  /// Resulting transaction. Note that the amount may be different than the requested amount to account for fees and available funds.
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

  /// Transaction id
  @$pb.TagNumber(3)
  $core.String get transactionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set transactionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionId() => $_clearField(3);

  /// Optional error
  @$pb.TagNumber(4)
  $2.SigningError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error($2.SigningError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get errorMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set errorMessage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasErrorMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearErrorMessage() => $_clearField(5);

  /// Result of a transaction signing using the Bitcoin 2.0 protocol.
  /// Set if `Bitcoin.Proto.SigningInput.signing_v2` used.
  @$pb.TagNumber(6)
  $1.SigningOutput get signingResultV2 => $_getN(5);
  @$pb.TagNumber(6)
  set signingResultV2($1.SigningOutput value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSigningResultV2() => $_has(5);
  @$pb.TagNumber(6)
  void clearSigningResultV2() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.SigningOutput ensureSigningResultV2() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
