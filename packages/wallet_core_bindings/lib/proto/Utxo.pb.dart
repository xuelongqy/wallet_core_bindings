// This is a generated file - do not edit.
//
// Generated from Utxo.proto.

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

/// Bitcoin transaction out-point reference.
class OutPoint extends $pb.GeneratedMessage {
  factory OutPoint({
    $core.List<$core.int>? hash,
    $core.int? vout,
  }) {
    final result = create();
    if (hash != null) result.hash = hash;
    if (vout != null) result.vout = vout;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'vout', fieldType: $pb.PbFieldType.OU3)
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
}

class TransactionInput extends $pb.GeneratedMessage {
  factory TransactionInput({
    OutPoint? outPoint,
    $core.int? sequence,
    $core.List<$core.int>? scriptSig,
    $core.Iterable<$core.List<$core.int>>? witnessItems,
  }) {
    final result = create();
    if (outPoint != null) result.outPoint = outPoint;
    if (sequence != null) result.sequence = sequence;
    if (scriptSig != null) result.scriptSig = scriptSig;
    if (witnessItems != null) result.witnessItems.addAll(witnessItems);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..aOM<OutPoint>(1, _omitFieldNames ? '' : 'outPoint',
        subBuilder: OutPoint.create)
    ..aI(2, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'scriptSig', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'witnessItems', $pb.PbFieldType.PY)
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

  /// The sequence number, used for timelocks, replace-by-fee, etc.
  @$pb.TagNumber(2)
  $core.int get sequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequence() => $_clearField(2);

  /// The script for claiming the input (non-Segwit/non-Taproot).
  @$pb.TagNumber(3)
  $core.List<$core.int> get scriptSig => $_getN(2);
  @$pb.TagNumber(3)
  set scriptSig($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScriptSig() => $_has(2);
  @$pb.TagNumber(3)
  void clearScriptSig() => $_clearField(3);

  /// The script for claiming the input (Segit/Taproot).
  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get witnessItems => $_getList(3);
}

class TransactionOutput extends $pb.GeneratedMessage {
  factory TransactionOutput({
    $core.List<$core.int>? scriptPubkey,
    $fixnum.Int64? value,
  }) {
    final result = create();
    if (scriptPubkey != null) result.scriptPubkey = scriptPubkey;
    if (value != null) result.value = value;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'scriptPubkey', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'value')
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

  /// The condition for claiming the output.
  @$pb.TagNumber(1)
  $core.List<$core.int> get scriptPubkey => $_getN(0);
  @$pb.TagNumber(1)
  set scriptPubkey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScriptPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearScriptPubkey() => $_clearField(1);

  /// The amount of satoshis to spend.
  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
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

  /// The protocol version, is currently expected to be 1 or 2 (BIP68).
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// Block height or timestamp indicating at what point transactions can be included in a block.
  /// Zero by default.
  @$pb.TagNumber(2)
  $core.int get lockTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set lockTime($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockTime() => $_clearField(2);

  /// The transaction inputs.
  @$pb.TagNumber(3)
  $pb.PbList<TransactionInput> get inputs => $_getList(2);

  /// The transaction outputs.
  @$pb.TagNumber(4)
  $pb.PbList<TransactionOutput> get outputs => $_getList(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
