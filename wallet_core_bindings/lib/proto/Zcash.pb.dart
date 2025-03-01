//
//  Generated code. Do not modify.
//  source: Zcash.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Utxo.pb.dart' as $1;

class TransactionBuilderExtraData extends $pb.GeneratedMessage {
  factory TransactionBuilderExtraData({
    $core.List<$core.int>? branchId,
    $core.int? expiryHeight,
    $core.bool? zip0317,
  }) {
    final $result = create();
    if (branchId != null) {
      $result.branchId = branchId;
    }
    if (expiryHeight != null) {
      $result.expiryHeight = expiryHeight;
    }
    if (zip0317 != null) {
      $result.zip0317 = zip0317;
    }
    return $result;
  }
  TransactionBuilderExtraData._() : super();
  factory TransactionBuilderExtraData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionBuilderExtraData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionBuilderExtraData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Zcash.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'branchId', $pb.PbFieldType.OY)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'expiryHeight', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'zip0317', protoName: 'zip_0317')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionBuilderExtraData clone() =>
      TransactionBuilderExtraData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionBuilderExtraData copyWith(
          void Function(TransactionBuilderExtraData) updates) =>
      super.copyWith(
              (message) => updates(message as TransactionBuilderExtraData))
          as TransactionBuilderExtraData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionBuilderExtraData create() =>
      TransactionBuilderExtraData._();
  TransactionBuilderExtraData createEmptyInstance() => create();
  static $pb.PbList<TransactionBuilderExtraData> createRepeated() =>
      $pb.PbList<TransactionBuilderExtraData>();
  @$core.pragma('dart2js:noInline')
  static TransactionBuilderExtraData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionBuilderExtraData>(create);
  static TransactionBuilderExtraData? _defaultInstance;

  /// Currently, `branch_id` is the only configurable Zcash specific parameter.
  /// There can also be `version_group_id` configured in the future.
  @$pb.TagNumber(1)
  $core.List<$core.int> get branchId => $_getN(0);
  @$pb.TagNumber(1)
  set branchId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBranchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBranchId() => clearField(1);

  /// Zero in most cases.
  @$pb.TagNumber(2)
  $core.int get expiryHeight => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiryHeight($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExpiryHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiryHeight() => clearField(2);

  /// Whether to calculate the fee according to ZIP-0317 for the given transaction
  /// https://zips.z.cash/zip-0317#fee-calculation
  @$pb.TagNumber(3)
  $core.bool get zip0317 => $_getBF(2);
  @$pb.TagNumber(3)
  set zip0317($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasZip0317() => $_has(2);
  @$pb.TagNumber(3)
  void clearZip0317() => clearField(3);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.int? version,
    $core.int? versionGroupId,
    $core.Iterable<$1.TransactionInput>? inputs,
    $core.Iterable<$1.TransactionOutput>? outputs,
    $core.int? lockTime,
    $core.int? expiryHeight,
    $fixnum.Int64? saplingValueBalance,
    $core.List<$core.int>? branchId,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (versionGroupId != null) {
      $result.versionGroupId = versionGroupId;
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (expiryHeight != null) {
      $result.expiryHeight = expiryHeight;
    }
    if (saplingValueBalance != null) {
      $result.saplingValueBalance = saplingValueBalance;
    }
    if (branchId != null) {
      $result.branchId = branchId;
    }
    return $result;
  }
  Transaction._() : super();
  factory Transaction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Zcash.Proto'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'versionGroupId', $pb.PbFieldType.OU3)
    ..pc<$1.TransactionInput>(
        3, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: $1.TransactionInput.create)
    ..pc<$1.TransactionOutput>(
        4, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM,
        subBuilder: $1.TransactionOutput.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'expiryHeight', $pb.PbFieldType.OU3)
    ..aInt64(7, _omitFieldNames ? '' : 'saplingValueBalance')
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'branchId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Transaction copyWith(void Function(Transaction) updates) =>
      super.copyWith((message) => updates(message as Transaction))
          as Transaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  /// / Transaction version.
  /// / Currently, version 4 (0x80000004) is supported only.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// If transaction version is 4 (0x80000004), version group ID is 0x892F2085.
  @$pb.TagNumber(2)
  $core.int get versionGroupId => $_getIZ(1);
  @$pb.TagNumber(2)
  set versionGroupId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersionGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionGroupId() => clearField(2);

  /// The transaction inputs.
  @$pb.TagNumber(3)
  $core.List<$1.TransactionInput> get inputs => $_getList(2);

  /// The transaction outputs.
  @$pb.TagNumber(4)
  $core.List<$1.TransactionOutput> get outputs => $_getList(3);

  /// Block height or timestamp indicating at what point transactions can be included in a block.
  /// Zero by default.
  @$pb.TagNumber(5)
  $core.int get lockTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set lockTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLockTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLockTime() => clearField(5);

  /// Expiry height.
  @$pb.TagNumber(6)
  $core.int get expiryHeight => $_getIZ(5);
  @$pb.TagNumber(6)
  set expiryHeight($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExpiryHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryHeight() => clearField(6);

  /// Sapling value balance for the transaction.
  /// Always 0 for a transparent transaction.
  @$pb.TagNumber(7)
  $fixnum.Int64 get saplingValueBalance => $_getI64(6);
  @$pb.TagNumber(7)
  set saplingValueBalance($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSaplingValueBalance() => $_has(6);
  @$pb.TagNumber(7)
  void clearSaplingValueBalance() => clearField(7);

  /// Consensus branch ID for the epoch of the block containing the transaction.
  @$pb.TagNumber(8)
  $core.List<$core.int> get branchId => $_getN(7);
  @$pb.TagNumber(8)
  set branchId($core.List<$core.int> v) {
    $_setBytes(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBranchId() => $_has(7);
  @$pb.TagNumber(8)
  void clearBranchId() => clearField(8);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
