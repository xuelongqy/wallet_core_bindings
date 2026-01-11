// This is a generated file - do not edit.
//
// Generated from DecredV2.proto.

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

/// Decred transaction out-point reference.
class OutPoint extends $pb.GeneratedMessage {
  factory OutPoint({
    $core.List<$core.int>? hash,
    $core.int? vout,
    $core.int? tree,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (vout != null) result.vout = vout;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.DecredV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'tree', fieldType: $pb.PbFieldType.OU3)
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
  /// The referenced transaction ID in REVERSED order.
  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => $_clearField(1);

  /// The position in the previous transactions output that this input references.
  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => $_clearField(2);

  /// The tree in utxo, only works for DCR.
  @$pb.TagNumber(3)
  $core.int get tree => $_getIZ(2);
  @$pb.TagNumber(3)
  set tree($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTree() => $_has(2);
  @$pb.TagNumber(3)
  void clearTree() => $_clearField(3);
}

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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.DecredV2.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'serializeType',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..pPM<TransactionInput>(3, _omitFieldNames ? '' : 'inputs',
        subBuilder: TransactionInput.create)
    ..pPM<TransactionOutput>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: TransactionOutput.create)
    ..aI(5, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
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

  /// Transaction version.
  /// Currently, version 1 is supported only.
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

  /// Block height or timestamp indicating at what point transactions can be included in a block.
  /// Zero by default.
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
    OutPoint? outPoint,
    $core.int? sequence,
    $fixnum.Int64? value,
    $core.int? blockHeight,
    $core.int? blockIndex,
    $core.List<$core.int>? scriptSig,
  }) {
    final result = create();
    if (outPoint != null) result.outPoint = outPoint;
    if (sequence != null) result.sequence = sequence;
    if (value != null) result.value = value;
    if (blockHeight != null) result.blockHeight = blockHeight;
    if (blockIndex != null) result.blockIndex = blockIndex;
    if (scriptSig != null) result.scriptSig = scriptSig;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.DecredV2.Proto'),
      createEmptyInstance: create)
    ..aOM<OutPoint>(1, _omitFieldNames ? '' : 'outPoint',
        subBuilder: OutPoint.create)
    ..aI(2, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(3, _omitFieldNames ? '' : 'value')
    ..aI(4, _omitFieldNames ? '' : 'blockHeight',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'blockIndex', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'scriptSig', $pb.PbFieldType.OY)
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
  OutPoint get outPoint => $_getN(0);
  @$pb.TagNumber(1)
  set outPoint(OutPoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutPoint() => $_clearField(1);
  @$pb.TagNumber(1)
  OutPoint ensureOutPoint() => $_ensure(0);

  /// Transaction version as defined by the sender.
  @$pb.TagNumber(2)
  $core.int get sequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequence() => $_clearField(2);

  /// The amount of the input.
  @$pb.TagNumber(3)
  $fixnum.Int64 get value => $_getI64(2);
  @$pb.TagNumber(3)
  set value($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);

  /// Creation block height.
  @$pb.TagNumber(4)
  $core.int get blockHeight => $_getIZ(3);
  @$pb.TagNumber(4)
  set blockHeight($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBlockHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockHeight() => $_clearField(4);

  /// Index within the block.
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
  $core.List<$core.int> get scriptSig => $_getN(5);
  @$pb.TagNumber(6)
  set scriptSig($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasScriptSig() => $_has(5);
  @$pb.TagNumber(6)
  void clearScriptSig() => $_clearField(6);
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.DecredV2.Proto'),
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
