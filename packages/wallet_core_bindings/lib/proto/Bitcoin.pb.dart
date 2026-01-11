// This is a generated file - do not edit.
//
// Generated from Bitcoin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Bitcoin.pbenum.dart';
import 'BitcoinV2.pb.dart' as $0;
import 'Common.pbenum.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Bitcoin.pbenum.dart';

/// A transaction, with its inputs and outputs
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.int? version,
    $core.int? lockTime,
    $core.Iterable<TransactionInput>? inputs,
    $core.Iterable<TransactionOutput>? outputs,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (lockTime != null) result.lockTime = lockTime;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OS3)
    ..aI(2, _omitFieldNames ? '' : 'lockTime',
        protoName: 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..pPM<TransactionInput>(3, _omitFieldNames ? '' : 'inputs',
        subBuilder: TransactionInput.create)
    ..pPM<TransactionOutput>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: TransactionOutput.create)
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

  /// Transaction data format version.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// The block number or timestamp at which this transaction is unlocked.
  @$pb.TagNumber(2)
  $core.int get lockTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set lockTime($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockTime() => $_clearField(2);

  /// A list of 1 or more transaction inputs or sources for coins.
  @$pb.TagNumber(3)
  $pb.PbList<TransactionInput> get inputs => $_getList(2);

  /// A list of 1 or more transaction outputs or destinations for coins.
  @$pb.TagNumber(4)
  $pb.PbList<TransactionOutput> get outputs => $_getList(3);
}

/// Bitcoin transaction input.
class TransactionInput extends $pb.GeneratedMessage {
  factory TransactionInput({
    OutPoint? previousOutput,
    $core.int? sequence,
    $core.List<$core.int>? script,
  }) {
    final result = create();
    if (previousOutput != null) result.previousOutput = previousOutput;
    if (sequence != null) result.sequence = sequence;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aOM<OutPoint>(1, _omitFieldNames ? '' : 'previousOutput',
        protoName: 'previousOutput', subBuilder: OutPoint.create)
    ..aI(2, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'script', $pb.PbFieldType.OY)
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
  OutPoint get previousOutput => $_getN(0);
  @$pb.TagNumber(1)
  set previousOutput(OutPoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPreviousOutput() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreviousOutput() => $_clearField(1);
  @$pb.TagNumber(1)
  OutPoint ensurePreviousOutput() => $_ensure(0);

  /// Transaction version as defined by the sender.
  @$pb.TagNumber(2)
  $core.int get sequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequence() => $_clearField(2);

  /// Computational script for confirming transaction authorization.
  @$pb.TagNumber(3)
  $core.List<$core.int> get script => $_getN(2);
  @$pb.TagNumber(3)
  set script($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScript() => $_has(2);
  @$pb.TagNumber(3)
  void clearScript() => $_clearField(3);
}

/// Bitcoin transaction out-point reference.
class OutPoint extends $pb.GeneratedMessage {
  factory OutPoint({
    $core.List<$core.int>? hash,
    $core.int? index,
    $core.int? sequence,
    $core.int? tree,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (index != null) result.index = index;
    if (sequence != null) result.sequence = sequence;
    if (tree != null) result.tree = tree;
    return result;
  }

  OutPoint._();

  factory OutPoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutPoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutPoint',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'tree')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutPoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutPoint copyWith(void Function(OutPoint) updates) =>
      super.copyWith((message) => updates(message as OutPoint)) as OutPoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutPoint create() => OutPoint._();
  @$core.override
  OutPoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutPoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutPoint>(create);
  static OutPoint? _defaultInstance;

  /// The hash of the referenced transaction (network byte order, usually needs to be reversed).
  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);

  /// The index of the specific output in the transaction.
  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => $_clearField(2);

  /// Transaction version as defined by the sender.
  @$pb.TagNumber(3)
  $core.int get sequence => $_getIZ(2);
  @$pb.TagNumber(3)
  set sequence($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSequence() => $_has(2);
  @$pb.TagNumber(3)
  void clearSequence() => $_clearField(3);

  /// The tree in utxo, only works for DCR
  @$pb.TagNumber(4)
  $core.int get tree => $_getIZ(3);
  @$pb.TagNumber(4)
  set tree($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTree() => $_has(3);
  @$pb.TagNumber(4)
  void clearTree() => $_clearField(4);
}

/// Bitcoin transaction output.
class TransactionOutput extends $pb.GeneratedMessage {
  factory TransactionOutput({
    $fixnum.Int64? value,
    $core.List<$core.int>? script,
    $core.List<$core.int>? spendingScript,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (script != null) result.script = script;
    if (spendingScript != null) result.spendingScript = spendingScript;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'script', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'spendingScript', $pb.PbFieldType.OY,
        protoName: 'spendingScript')
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

  /// Usually contains the public key as a Bitcoin script setting up conditions to claim this output.
  @$pb.TagNumber(2)
  $core.List<$core.int> get script => $_getN(1);
  @$pb.TagNumber(2)
  set script($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearScript() => $_clearField(2);

  /// Optional spending script for P2TR script-path transactions.
  @$pb.TagNumber(5)
  $core.List<$core.int> get spendingScript => $_getN(2);
  @$pb.TagNumber(5)
  set spendingScript($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(5)
  $core.bool hasSpendingScript() => $_has(2);
  @$pb.TagNumber(5)
  void clearSpendingScript() => $_clearField(5);
}

/// An unspent transaction output, that can serve as input to a transaction
class UnspentTransaction extends $pb.GeneratedMessage {
  factory UnspentTransaction({
    OutPoint? outPoint,
    $core.List<$core.int>? script,
    $fixnum.Int64? amount,
    TransactionVariant? variant,
    $core.List<$core.int>? spendingScript,
  }) {
    final result = create();
    if (outPoint != null) result.outPoint = outPoint;
    if (script != null) result.script = script;
    if (amount != null) result.amount = amount;
    if (variant != null) result.variant = variant;
    if (spendingScript != null) result.spendingScript = spendingScript;
    return result;
  }

  UnspentTransaction._();

  factory UnspentTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnspentTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnspentTransaction',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aOM<OutPoint>(1, _omitFieldNames ? '' : 'outPoint',
        subBuilder: OutPoint.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'script', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..aE<TransactionVariant>(4, _omitFieldNames ? '' : 'variant',
        enumValues: TransactionVariant.values)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'spendingScript', $pb.PbFieldType.OY,
        protoName: 'spendingScript')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnspentTransaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnspentTransaction copyWith(void Function(UnspentTransaction) updates) =>
      super.copyWith((message) => updates(message as UnspentTransaction))
          as UnspentTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnspentTransaction create() => UnspentTransaction._();
  @$core.override
  UnspentTransaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnspentTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnspentTransaction>(create);
  static UnspentTransaction? _defaultInstance;

  /// The unspent output
  @$pb.TagNumber(1)
  OutPoint get outPoint => $_getN(0);
  @$pb.TagNumber(1)
  set outPoint(OutPoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutPoint() => $_clearField(1);
  @$pb.TagNumber(1)
  OutPoint ensureOutPoint() => $_ensure(0);

  /// Script for claiming this UTXO
  @$pb.TagNumber(2)
  $core.List<$core.int> get script => $_getN(1);
  @$pb.TagNumber(2)
  set script($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearScript() => $_clearField(2);

  /// Amount of the UTXO
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// The transaction variant
  @$pb.TagNumber(4)
  TransactionVariant get variant => $_getN(3);
  @$pb.TagNumber(4)
  set variant(TransactionVariant value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasVariant() => $_has(3);
  @$pb.TagNumber(4)
  void clearVariant() => $_clearField(4);

  /// Optional spending script for P2TR script-path transactions.
  @$pb.TagNumber(5)
  $core.List<$core.int> get spendingScript => $_getN(4);
  @$pb.TagNumber(5)
  set spendingScript($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSpendingScript() => $_has(4);
  @$pb.TagNumber(5)
  void clearSpendingScript() => $_clearField(5);
}

/// Pair of destination address and amount, used for extra outputs
class OutputAddress extends $pb.GeneratedMessage {
  factory OutputAddress({
    $core.String? toAddress,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  OutputAddress._();

  factory OutputAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputAddress',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputAddress copyWith(void Function(OutputAddress) updates) =>
      super.copyWith((message) => updates(message as OutputAddress))
          as OutputAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputAddress create() => OutputAddress._();
  @$core.override
  OutputAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputAddress>(create);
  static OutputAddress? _defaultInstance;

  /// Destination address
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Amount to be paid to this output
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// Optional index of a corresponding output in the transaction.
class OutputIndex extends $pb.GeneratedMessage {
  factory OutputIndex({
    $core.int? index,
  }) {
    final result = create();
    if (index != null) result.index = index;
    return result;
  }

  OutputIndex._();

  factory OutputIndex.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputIndex.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputIndex',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputIndex clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputIndex copyWith(void Function(OutputIndex) updates) =>
      super.copyWith((message) => updates(message as OutputIndex))
          as OutputIndex;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputIndex create() => OutputIndex._();
  @$core.override
  OutputIndex createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputIndex>(create);
  static OutputIndex? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);
}

enum SigningInput_DustPolicy { fixedDustThreshold, notSet }

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.int? hashType,
    $fixnum.Int64? amount,
    $fixnum.Int64? byteFee,
    $core.String? toAddress,
    $core.String? changeAddress,
    $core.Iterable<$core.List<$core.int>>? privateKey,
    $core.Iterable<$core.MapEntry<$core.String, $core.List<$core.int>>>?
        scripts,
    $core.Iterable<UnspentTransaction>? utxo,
    $core.bool? useMaxAmount,
    $core.int? coinType,
    TransactionPlan? plan,
    $core.int? lockTime,
    $core.List<$core.int>? outputOpReturn,
    $core.Iterable<OutputAddress>? extraOutputs,
    $core.bool? useMaxUtxo,
    $core.bool? disableDustFilter,
    $core.int? time,
    $core.bool? zip0317,
    $0.SigningInput? signingV2,
    $fixnum.Int64? fixedDustThreshold,
    OutputIndex? outputOpReturnIndex,
  }) {
    final result = create();
    if (hashType != null) result.hashType = hashType;
    if (amount != null) result.amount = amount;
    if (byteFee != null) result.byteFee = byteFee;
    if (toAddress != null) result.toAddress = toAddress;
    if (changeAddress != null) result.changeAddress = changeAddress;
    if (privateKey != null) result.privateKey.addAll(privateKey);
    if (scripts != null) result.scripts.addEntries(scripts);
    if (utxo != null) result.utxo.addAll(utxo);
    if (useMaxAmount != null) result.useMaxAmount = useMaxAmount;
    if (coinType != null) result.coinType = coinType;
    if (plan != null) result.plan = plan;
    if (lockTime != null) result.lockTime = lockTime;
    if (outputOpReturn != null) result.outputOpReturn = outputOpReturn;
    if (extraOutputs != null) result.extraOutputs.addAll(extraOutputs);
    if (useMaxUtxo != null) result.useMaxUtxo = useMaxUtxo;
    if (disableDustFilter != null) result.disableDustFilter = disableDustFilter;
    if (time != null) result.time = time;
    if (zip0317 != null) result.zip0317 = zip0317;
    if (signingV2 != null) result.signingV2 = signingV2;
    if (fixedDustThreshold != null)
      result.fixedDustThreshold = fixedDustThreshold;
    if (outputOpReturnIndex != null)
      result.outputOpReturnIndex = outputOpReturnIndex;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_DustPolicy>
      _SigningInput_DustPolicyByTag = {
    24: SigningInput_DustPolicy.fixedDustThreshold,
    0: SigningInput_DustPolicy.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..oo(0, [24])
    ..aI(1, _omitFieldNames ? '' : 'hashType', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..aInt64(3, _omitFieldNames ? '' : 'byteFee')
    ..aOS(4, _omitFieldNames ? '' : 'toAddress')
    ..aOS(5, _omitFieldNames ? '' : 'changeAddress')
    ..p<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.PY)
    ..m<$core.String, $core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'scripts',
        entryClassName: 'SigningInput.ScriptsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OY,
        packageName: const $pb.PackageName('TW.Bitcoin.Proto'))
    ..pPM<UnspentTransaction>(8, _omitFieldNames ? '' : 'utxo',
        subBuilder: UnspentTransaction.create)
    ..aOB(9, _omitFieldNames ? '' : 'useMaxAmount')
    ..aI(10, _omitFieldNames ? '' : 'coinType', fieldType: $pb.PbFieldType.OU3)
    ..aOM<TransactionPlan>(11, _omitFieldNames ? '' : 'plan',
        subBuilder: TransactionPlan.create)
    ..aI(12, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        13, _omitFieldNames ? '' : 'outputOpReturn', $pb.PbFieldType.OY)
    ..pPM<OutputAddress>(14, _omitFieldNames ? '' : 'extraOutputs',
        subBuilder: OutputAddress.create)
    ..aOB(15, _omitFieldNames ? '' : 'useMaxUtxo')
    ..aOB(16, _omitFieldNames ? '' : 'disableDustFilter')
    ..aI(17, _omitFieldNames ? '' : 'time', fieldType: $pb.PbFieldType.OU3)
    ..aOB(18, _omitFieldNames ? '' : 'zip0317', protoName: 'zip_0317')
    ..aOM<$0.SigningInput>(21, _omitFieldNames ? '' : 'signingV2',
        subBuilder: $0.SigningInput.create)
    ..aInt64(24, _omitFieldNames ? '' : 'fixedDustThreshold')
    ..aOM<OutputIndex>(26, _omitFieldNames ? '' : 'outputOpReturnIndex',
        subBuilder: OutputIndex.create)
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

  @$pb.TagNumber(24)
  SigningInput_DustPolicy whichDustPolicy() =>
      _SigningInput_DustPolicyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(24)
  void clearDustPolicy() => $_clearField($_whichOneof(0));

  /// Hash type to use when signing.
  @$pb.TagNumber(1)
  $core.int get hashType => $_getIZ(0);
  @$pb.TagNumber(1)
  set hashType($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHashType() => $_has(0);
  @$pb.TagNumber(1)
  void clearHashType() => $_clearField(1);

  /// Amount to send.  Transaction created will have this amount in its output,
  /// except when use_max_amount is set, in that case this amount is not relevant, maximum possible amount will be used (max avail less fee).
  /// If amount is equal or more than the available amount, also max amount will be used.
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Transaction fee rate, satoshis per byte, used to compute required fee (when planning)
  @$pb.TagNumber(3)
  $fixnum.Int64 get byteFee => $_getI64(2);
  @$pb.TagNumber(3)
  set byteFee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasByteFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearByteFee() => $_clearField(3);

  /// Recipient's address, as string.
  @$pb.TagNumber(4)
  $core.String get toAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set toAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearToAddress() => $_clearField(4);

  /// Change address, as string.
  @$pb.TagNumber(5)
  $core.String get changeAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set changeAddress($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChangeAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangeAddress() => $_clearField(5);

  /// The available secret private key or keys required for signing (32 bytes each).
  @$pb.TagNumber(6)
  $pb.PbList<$core.List<$core.int>> get privateKey => $_getList(5);

  /// Available redeem scripts indexed by script hash.
  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.List<$core.int>> get scripts => $_getMap(6);

  /// Available input unspent transaction outputs.
  @$pb.TagNumber(8)
  $pb.PbList<UnspentTransaction> get utxo => $_getList(7);

  /// Set if sending max amount is requested.
  @$pb.TagNumber(9)
  $core.bool get useMaxAmount => $_getBF(8);
  @$pb.TagNumber(9)
  set useMaxAmount($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUseMaxAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearUseMaxAmount() => $_clearField(9);

  /// Coin type (used by forks).
  @$pb.TagNumber(10)
  $core.int get coinType => $_getIZ(9);
  @$pb.TagNumber(10)
  set coinType($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCoinType() => $_has(9);
  @$pb.TagNumber(10)
  void clearCoinType() => $_clearField(10);

  /// Optional transaction plan. If missing, plan will be computed.
  @$pb.TagNumber(11)
  TransactionPlan get plan => $_getN(10);
  @$pb.TagNumber(11)
  set plan(TransactionPlan value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPlan() => $_has(10);
  @$pb.TagNumber(11)
  void clearPlan() => $_clearField(11);
  @$pb.TagNumber(11)
  TransactionPlan ensurePlan() => $_ensure(10);

  /// Optional lockTime, default value 0 means no time locking.
  /// If all inputs have final (`0xffffffff`) sequence numbers then `lockTime` is irrelevant.
  /// Otherwise, the transaction may not be added to a block until after `lockTime`.
  ///  value  < 500000000 : Block number at which this transaction is unlocked
  ///  value >= 500000000 : UNIX timestamp at which this transaction is unlocked
  @$pb.TagNumber(12)
  $core.int get lockTime => $_getIZ(11);
  @$pb.TagNumber(12)
  set lockTime($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasLockTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearLockTime() => $_clearField(12);

  /// Optional zero-amount, OP_RETURN output
  @$pb.TagNumber(13)
  $core.List<$core.int> get outputOpReturn => $_getN(12);
  @$pb.TagNumber(13)
  set outputOpReturn($core.List<$core.int> value) => $_setBytes(12, value);
  @$pb.TagNumber(13)
  $core.bool hasOutputOpReturn() => $_has(12);
  @$pb.TagNumber(13)
  void clearOutputOpReturn() => $_clearField(13);

  /// Optional additional destination addresses, additional to first to_address output
  @$pb.TagNumber(14)
  $pb.PbList<OutputAddress> get extraOutputs => $_getList(13);

  /// If use max utxo.
  @$pb.TagNumber(15)
  $core.bool get useMaxUtxo => $_getBF(14);
  @$pb.TagNumber(15)
  set useMaxUtxo($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasUseMaxUtxo() => $_has(14);
  @$pb.TagNumber(15)
  void clearUseMaxUtxo() => $_clearField(15);

  /// If disable dust filter.
  @$pb.TagNumber(16)
  $core.bool get disableDustFilter => $_getBF(15);
  @$pb.TagNumber(16)
  set disableDustFilter($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasDisableDustFilter() => $_has(15);
  @$pb.TagNumber(16)
  void clearDisableDustFilter() => $_clearField(16);

  /// transaction creation time that will be used for verge(xvg)
  @$pb.TagNumber(17)
  $core.int get time => $_getIZ(16);
  @$pb.TagNumber(17)
  set time($core.int value) => $_setUnsignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasTime() => $_has(16);
  @$pb.TagNumber(17)
  void clearTime() => $_clearField(17);

  /// Whether to calculate the fee according to ZIP-0317 for the given transaction
  /// https://zips.z.cash/zip-0317#fee-calculation
  @$pb.TagNumber(18)
  $core.bool get zip0317 => $_getBF(17);
  @$pb.TagNumber(18)
  set zip0317($core.bool value) => $_setBool(17, value);
  @$pb.TagNumber(18)
  $core.bool hasZip0317() => $_has(17);
  @$pb.TagNumber(18)
  void clearZip0317() => $_clearField(18);

  /// If set, uses Bitcoin 2.0 Signing protocol.
  /// As a result, `Bitcoin.Proto.SigningOutput.signing_result_v2` is set.
  @$pb.TagNumber(21)
  $0.SigningInput get signingV2 => $_getN(18);
  @$pb.TagNumber(21)
  set signingV2($0.SigningInput value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasSigningV2() => $_has(18);
  @$pb.TagNumber(21)
  void clearSigningV2() => $_clearField(21);
  @$pb.TagNumber(21)
  $0.SigningInput ensureSigningV2() => $_ensure(18);

  /// Use a constant "Dust" threshold.
  @$pb.TagNumber(24)
  $fixnum.Int64 get fixedDustThreshold => $_getI64(19);
  @$pb.TagNumber(24)
  set fixedDustThreshold($fixnum.Int64 value) => $_setInt64(19, value);
  @$pb.TagNumber(24)
  $core.bool hasFixedDustThreshold() => $_has(19);
  @$pb.TagNumber(24)
  void clearFixedDustThreshold() => $_clearField(24);

  /// Optional index of the OP_RETURN output in the transaction.
  /// If not set, OP_RETURN output will be pushed as the latest output.
  @$pb.TagNumber(26)
  OutputIndex get outputOpReturnIndex => $_getN(20);
  @$pb.TagNumber(26)
  set outputOpReturnIndex(OutputIndex value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasOutputOpReturnIndex() => $_has(20);
  @$pb.TagNumber(26)
  void clearOutputOpReturnIndex() => $_clearField(26);
  @$pb.TagNumber(26)
  OutputIndex ensureOutputOpReturnIndex() => $_ensure(20);
}

/// Describes a preliminary transaction plan.
class TransactionPlan extends $pb.GeneratedMessage {
  factory TransactionPlan({
    $fixnum.Int64? amount,
    $fixnum.Int64? availableAmount,
    $fixnum.Int64? fee,
    $fixnum.Int64? change,
    $core.Iterable<UnspentTransaction>? utxos,
    $core.List<$core.int>? branchId,
    $1.SigningError? error,
    $core.List<$core.int>? outputOpReturn,
    $core.List<$core.int>? preblockhash,
    $fixnum.Int64? preblockheight,
    $0.TransactionPlan? planningResultV2,
    OutputIndex? outputOpReturnIndex,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (availableAmount != null) result.availableAmount = availableAmount;
    if (fee != null) result.fee = fee;
    if (change != null) result.change = change;
    if (utxos != null) result.utxos.addAll(utxos);
    if (branchId != null) result.branchId = branchId;
    if (error != null) result.error = error;
    if (outputOpReturn != null) result.outputOpReturn = outputOpReturn;
    if (preblockhash != null) result.preblockhash = preblockhash;
    if (preblockheight != null) result.preblockheight = preblockheight;
    if (planningResultV2 != null) result.planningResultV2 = planningResultV2;
    if (outputOpReturnIndex != null)
      result.outputOpReturnIndex = outputOpReturnIndex;
    return result;
  }

  TransactionPlan._();

  factory TransactionPlan.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionPlan.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionPlan',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..aInt64(2, _omitFieldNames ? '' : 'availableAmount')
    ..aInt64(3, _omitFieldNames ? '' : 'fee')
    ..aInt64(4, _omitFieldNames ? '' : 'change')
    ..pPM<UnspentTransaction>(5, _omitFieldNames ? '' : 'utxos',
        subBuilder: UnspentTransaction.create)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'branchId', $pb.PbFieldType.OY)
    ..aE<$1.SigningError>(7, _omitFieldNames ? '' : 'error',
        enumValues: $1.SigningError.values)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'outputOpReturn', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'preblockhash', $pb.PbFieldType.OY)
    ..aInt64(10, _omitFieldNames ? '' : 'preblockheight')
    ..aOM<$0.TransactionPlan>(12, _omitFieldNames ? '' : 'planningResultV2',
        subBuilder: $0.TransactionPlan.create)
    ..aOM<OutputIndex>(14, _omitFieldNames ? '' : 'outputOpReturnIndex',
        subBuilder: OutputIndex.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionPlan clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionPlan copyWith(void Function(TransactionPlan) updates) =>
      super.copyWith((message) => updates(message as TransactionPlan))
          as TransactionPlan;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionPlan create() => TransactionPlan._();
  @$core.override
  TransactionPlan createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionPlan>(create);
  static TransactionPlan? _defaultInstance;

  /// Amount to be received at the other end.
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  /// Maximum available amount in all the input UTXOs.
  @$pb.TagNumber(2)
  $fixnum.Int64 get availableAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set availableAmount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvailableAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvailableAmount() => $_clearField(2);

  /// Estimated transaction fee.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);

  /// Remaining change
  @$pb.TagNumber(4)
  $fixnum.Int64 get change => $_getI64(3);
  @$pb.TagNumber(4)
  set change($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChange() => $_has(3);
  @$pb.TagNumber(4)
  void clearChange() => $_clearField(4);

  /// Selected unspent transaction outputs (subset of all input UTXOs)
  @$pb.TagNumber(5)
  $pb.PbList<UnspentTransaction> get utxos => $_getList(4);

  /// Zcash branch id
  @$pb.TagNumber(6)
  $core.List<$core.int> get branchId => $_getN(5);
  @$pb.TagNumber(6)
  set branchId($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBranchId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBranchId() => $_clearField(6);

  /// Optional error
  @$pb.TagNumber(7)
  $1.SigningError get error => $_getN(6);
  @$pb.TagNumber(7)
  set error($1.SigningError value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => $_clearField(7);

  /// Optional zero-amount, OP_RETURN output
  @$pb.TagNumber(8)
  $core.List<$core.int> get outputOpReturn => $_getN(7);
  @$pb.TagNumber(8)
  set outputOpReturn($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOutputOpReturn() => $_has(7);
  @$pb.TagNumber(8)
  void clearOutputOpReturn() => $_clearField(8);

  /// zen & bitcoin diamond preblockhash
  @$pb.TagNumber(9)
  $core.List<$core.int> get preblockhash => $_getN(8);
  @$pb.TagNumber(9)
  set preblockhash($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPreblockhash() => $_has(8);
  @$pb.TagNumber(9)
  void clearPreblockhash() => $_clearField(9);

  /// zen preblockheight
  @$pb.TagNumber(10)
  $fixnum.Int64 get preblockheight => $_getI64(9);
  @$pb.TagNumber(10)
  set preblockheight($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPreblockheight() => $_has(9);
  @$pb.TagNumber(10)
  void clearPreblockheight() => $_clearField(10);

  /// Result of a transaction planning using the Bitcoin 2.0 protocol.
  /// Set if `Bitcoin.Proto.SigningInput.planning_v2` used.
  @$pb.TagNumber(12)
  $0.TransactionPlan get planningResultV2 => $_getN(10);
  @$pb.TagNumber(12)
  set planningResultV2($0.TransactionPlan value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasPlanningResultV2() => $_has(10);
  @$pb.TagNumber(12)
  void clearPlanningResultV2() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.TransactionPlan ensurePlanningResultV2() => $_ensure(10);

  /// Optional index of the OP_RETURN output in the transaction.
  /// If not set, OP_RETURN output will be pushed as the latest output.
  @$pb.TagNumber(14)
  OutputIndex get outputOpReturnIndex => $_getN(11);
  @$pb.TagNumber(14)
  set outputOpReturnIndex(OutputIndex value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasOutputOpReturnIndex() => $_has(11);
  @$pb.TagNumber(14)
  void clearOutputOpReturnIndex() => $_clearField(14);
  @$pb.TagNumber(14)
  OutputIndex ensureOutputOpReturnIndex() => $_ensure(11);
}

/// Result containing the signed and encoded transaction.
/// Note that the amount may be different than the requested amount to account for fees and available funds.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    Transaction? transaction,
    $core.List<$core.int>? encoded,
    $core.String? transactionId,
    $1.SigningError? error,
    $core.String? errorMessage,
    $0.SigningOutput? signingResultV2,
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'transactionId')
    ..aE<$1.SigningError>(4, _omitFieldNames ? '' : 'error',
        enumValues: $1.SigningError.values)
    ..aOS(5, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<$0.SigningOutput>(7, _omitFieldNames ? '' : 'signingResultV2',
        subBuilder: $0.SigningOutput.create)
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

  /// Resulting transaction.
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

  /// Transaction ID (hash)
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
  $1.SigningError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error($1.SigningError value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);

  /// error description
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
  @$pb.TagNumber(7)
  $0.SigningOutput get signingResultV2 => $_getN(5);
  @$pb.TagNumber(7)
  set signingResultV2($0.SigningOutput value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasSigningResultV2() => $_has(5);
  @$pb.TagNumber(7)
  void clearSigningResultV2() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.SigningOutput ensureSigningResultV2() => $_ensure(5);
}

/// / Pre-image hash to be used for signing
class HashPublicKey extends $pb.GeneratedMessage {
  factory HashPublicKey({
    $core.List<$core.int>? dataHash,
    $core.List<$core.int>? publicKeyHash,
  }) {
    final result = create();
    if (dataHash != null) result.dataHash = dataHash;
    if (publicKeyHash != null) result.publicKeyHash = publicKeyHash;
    return result;
  }

  HashPublicKey._();

  factory HashPublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HashPublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HashPublicKey',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'dataHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKeyHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HashPublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HashPublicKey copyWith(void Function(HashPublicKey) updates) =>
      super.copyWith((message) => updates(message as HashPublicKey))
          as HashPublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HashPublicKey create() => HashPublicKey._();
  @$core.override
  HashPublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HashPublicKey getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HashPublicKey>(create);
  static HashPublicKey? _defaultInstance;

  /// / Pre-image data hash that will be used for signing
  @$pb.TagNumber(1)
  $core.List<$core.int> get dataHash => $_getN(0);
  @$pb.TagNumber(1)
  set dataHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDataHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearDataHash() => $_clearField(1);

  /// / public key hash used for signing
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKeyHash => $_getN(1);
  @$pb.TagNumber(2)
  set publicKeyHash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKeyHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKeyHash() => $_clearField(2);
}

/// / Transaction pre-signing output
class PreSigningOutput extends $pb.GeneratedMessage {
  factory PreSigningOutput({
    $core.Iterable<HashPublicKey>? hashPublicKeys,
    $1.SigningError? error,
    $core.String? errorMessage,
    $0.PreSigningOutput? preSigningResultV2,
  }) {
    final result = create();
    if (hashPublicKeys != null) result.hashPublicKeys.addAll(hashPublicKeys);
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (preSigningResultV2 != null)
      result.preSigningResultV2 = preSigningResultV2;
    return result;
  }

  PreSigningOutput._();

  factory PreSigningOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreSigningOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreSigningOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Bitcoin.Proto'),
      createEmptyInstance: create)
    ..pPM<HashPublicKey>(1, _omitFieldNames ? '' : 'hashPublicKeys',
        subBuilder: HashPublicKey.create)
    ..aE<$1.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $1.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<$0.PreSigningOutput>(7, _omitFieldNames ? '' : 'preSigningResultV2',
        subBuilder: $0.PreSigningOutput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreSigningOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreSigningOutput copyWith(void Function(PreSigningOutput) updates) =>
      super.copyWith((message) => updates(message as PreSigningOutput))
          as PreSigningOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreSigningOutput create() => PreSigningOutput._();
  @$core.override
  PreSigningOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreSigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreSigningOutput>(create);
  static PreSigningOutput? _defaultInstance;

  /// / hash, public key list
  @$pb.TagNumber(1)
  $pb.PbList<HashPublicKey> get hashPublicKeys => $_getList(0);

  /// / error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(2)
  $1.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($1.SigningError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  /// / error description
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  /// Result of a transaction pre-signing using the Bitcoin 2.0 protocol.
  /// Set if `Bitcoin.Proto.SigningInput.signing_v2` used.
  @$pb.TagNumber(7)
  $0.PreSigningOutput get preSigningResultV2 => $_getN(3);
  @$pb.TagNumber(7)
  set preSigningResultV2($0.PreSigningOutput value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasPreSigningResultV2() => $_has(3);
  @$pb.TagNumber(7)
  void clearPreSigningResultV2() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.PreSigningOutput ensurePreSigningResultV2() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
