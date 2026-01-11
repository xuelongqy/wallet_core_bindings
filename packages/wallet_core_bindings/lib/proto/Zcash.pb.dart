// This is a generated file - do not edit.
//
// Generated from Zcash.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Utxo.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class TransactionBuilderExtraData extends $pb.GeneratedMessage {
  factory TransactionBuilderExtraData({
    $core.List<$core.int>? branchId,
    $core.int? expiryHeight,
    $core.bool? zip0317,
  }) {
    final result = create();
    if (branchId != null) result.branchId = branchId;
    if (expiryHeight != null) result.expiryHeight = expiryHeight;
    if (zip0317 != null) result.zip0317 = zip0317;
    return result;
  }

  TransactionBuilderExtraData._();

  factory TransactionBuilderExtraData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionBuilderExtraData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionBuilderExtraData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Zcash.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'branchId', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'expiryHeight',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'zip0317', protoName: 'zip_0317')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionBuilderExtraData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionBuilderExtraData copyWith(
          void Function(TransactionBuilderExtraData) updates) =>
      super.copyWith(
              (message) => updates(message as TransactionBuilderExtraData))
          as TransactionBuilderExtraData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionBuilderExtraData create() =>
      TransactionBuilderExtraData._();
  @$core.override
  TransactionBuilderExtraData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionBuilderExtraData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionBuilderExtraData>(create);
  static TransactionBuilderExtraData? _defaultInstance;

  /// Currently, `branch_id` is the only configurable Zcash specific parameter.
  /// There can also be `version_group_id` configured in the future.
  @$pb.TagNumber(1)
  $core.List<$core.int> get branchId => $_getN(0);
  @$pb.TagNumber(1)
  set branchId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBranchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBranchId() => $_clearField(1);

  /// Zero in most cases.
  @$pb.TagNumber(2)
  $core.int get expiryHeight => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiryHeight($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiryHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiryHeight() => $_clearField(2);

  /// Whether to calculate the fee according to ZIP-0317 for the given transaction
  /// https://zips.z.cash/zip-0317#fee-calculation
  @$pb.TagNumber(3)
  $core.bool get zip0317 => $_getBF(2);
  @$pb.TagNumber(3)
  set zip0317($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasZip0317() => $_has(2);
  @$pb.TagNumber(3)
  void clearZip0317() => $_clearField(3);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.int? version,
    $core.int? versionGroupId,
    $core.Iterable<$0.TransactionInput>? inputs,
    $core.Iterable<$0.TransactionOutput>? outputs,
    $core.int? lockTime,
    $core.int? expiryHeight,
    $fixnum.Int64? saplingValueBalance,
    $core.List<$core.int>? branchId,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (versionGroupId != null) result.versionGroupId = versionGroupId;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    if (lockTime != null) result.lockTime = lockTime;
    if (expiryHeight != null) result.expiryHeight = expiryHeight;
    if (saplingValueBalance != null)
      result.saplingValueBalance = saplingValueBalance;
    if (branchId != null) result.branchId = branchId;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Zcash.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'versionGroupId',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<$0.TransactionInput>(3, _omitFieldNames ? '' : 'inputs',
        subBuilder: $0.TransactionInput.create)
    ..pPM<$0.TransactionOutput>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: $0.TransactionOutput.create)
    ..aI(5, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..aI(6, _omitFieldNames ? '' : 'expiryHeight',
        fieldType: $pb.PbFieldType.OU3)
    ..aInt64(7, _omitFieldNames ? '' : 'saplingValueBalance')
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'branchId', $pb.PbFieldType.OY)
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

  /// / Transaction version.
  /// / Currently, version 4 (0x80000004) is supported only.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// If transaction version is 4 (0x80000004), version group ID is 0x892F2085.
  @$pb.TagNumber(2)
  $core.int get versionGroupId => $_getIZ(1);
  @$pb.TagNumber(2)
  set versionGroupId($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersionGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionGroupId() => $_clearField(2);

  /// The transaction inputs.
  @$pb.TagNumber(3)
  $pb.PbList<$0.TransactionInput> get inputs => $_getList(2);

  /// The transaction outputs.
  @$pb.TagNumber(4)
  $pb.PbList<$0.TransactionOutput> get outputs => $_getList(3);

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

  /// Expiry height.
  @$pb.TagNumber(6)
  $core.int get expiryHeight => $_getIZ(5);
  @$pb.TagNumber(6)
  set expiryHeight($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiryHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryHeight() => $_clearField(6);

  /// Sapling value balance for the transaction.
  /// Always 0 for a transparent transaction.
  @$pb.TagNumber(7)
  $fixnum.Int64 get saplingValueBalance => $_getI64(6);
  @$pb.TagNumber(7)
  set saplingValueBalance($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSaplingValueBalance() => $_has(6);
  @$pb.TagNumber(7)
  void clearSaplingValueBalance() => $_clearField(7);

  /// Consensus branch ID for the epoch of the block containing the transaction.
  @$pb.TagNumber(8)
  $core.List<$core.int> get branchId => $_getN(7);
  @$pb.TagNumber(8)
  set branchId($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBranchId() => $_has(7);
  @$pb.TagNumber(8)
  void clearBranchId() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
