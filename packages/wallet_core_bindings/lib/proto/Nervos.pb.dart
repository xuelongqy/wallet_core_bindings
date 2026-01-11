// This is a generated file - do not edit.
//
// Generated from Nervos.proto.

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

/// Nervos transaction plan
class TransactionPlan extends $pb.GeneratedMessage {
  factory TransactionPlan({
    $core.Iterable<CellDep>? cellDeps,
    $core.Iterable<$core.List<$core.int>>? headerDeps,
    $core.Iterable<Cell>? selectedCells,
    $core.Iterable<CellOutput>? outputs,
    $core.Iterable<$core.List<$core.int>>? outputsData,
    $0.SigningError? error,
  }) {
    final result = create();
    if (cellDeps != null) result.cellDeps.addAll(cellDeps);
    if (headerDeps != null) result.headerDeps.addAll(headerDeps);
    if (selectedCells != null) result.selectedCells.addAll(selectedCells);
    if (outputs != null) result.outputs.addAll(outputs);
    if (outputsData != null) result.outputsData.addAll(outputsData);
    if (error != null) result.error = error;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..pPM<CellDep>(1, _omitFieldNames ? '' : 'cellDeps',
        subBuilder: CellDep.create)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'headerDeps', $pb.PbFieldType.PY)
    ..pPM<Cell>(3, _omitFieldNames ? '' : 'selectedCells',
        subBuilder: Cell.create)
    ..pPM<CellOutput>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: CellOutput.create)
    ..p<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'outputsData', $pb.PbFieldType.PY)
    ..aE<$0.SigningError>(6, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
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

  /// A list of cell deps.
  @$pb.TagNumber(1)
  $pb.PbList<CellDep> get cellDeps => $_getList(0);

  /// A list of header deps.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get headerDeps => $_getList(1);

  /// A list of 1 or more selected cells for this transaction
  @$pb.TagNumber(3)
  $pb.PbList<Cell> get selectedCells => $_getList(2);

  /// A list of 1 or more outputs by this transaction
  @$pb.TagNumber(4)
  $pb.PbList<CellOutput> get outputs => $_getList(3);

  /// A list of outputs data.
  @$pb.TagNumber(5)
  $pb.PbList<$core.List<$core.int>> get outputsData => $_getList(4);

  /// Optional error
  @$pb.TagNumber(6)
  $0.SigningError get error => $_getN(5);
  @$pb.TagNumber(6)
  set error($0.SigningError value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);
}

/// Nervos cell dep.
class CellDep extends $pb.GeneratedMessage {
  factory CellDep({
    $core.String? depType,
    OutPoint? outPoint,
  }) {
    final result = create();
    if (depType != null) result.depType = depType;
    if (outPoint != null) result.outPoint = outPoint;
    return result;
  }

  CellDep._();

  factory CellDep.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CellDep.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CellDep',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'depType')
    ..aOM<OutPoint>(2, _omitFieldNames ? '' : 'outPoint',
        subBuilder: OutPoint.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CellDep clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CellDep copyWith(void Function(CellDep) updates) =>
      super.copyWith((message) => updates(message as CellDep)) as CellDep;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CellDep create() => CellDep._();
  @$core.override
  CellDep createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CellDep getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CellDep>(create);
  static CellDep? _defaultInstance;

  /// Prevents the transaction to be mined before an absolute or relative time
  @$pb.TagNumber(1)
  $core.String get depType => $_getSZ(0);
  @$pb.TagNumber(1)
  set depType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDepType() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepType() => $_clearField(1);

  /// Reference to the previous transaction's output.
  @$pb.TagNumber(2)
  OutPoint get outPoint => $_getN(1);
  @$pb.TagNumber(2)
  set outPoint(OutPoint value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOutPoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutPoint() => $_clearField(2);
  @$pb.TagNumber(2)
  OutPoint ensureOutPoint() => $_ensure(1);
}

/// Nervos transaction out-point reference.
class OutPoint extends $pb.GeneratedMessage {
  factory OutPoint({
    $core.List<$core.int>? txHash,
    $core.int? index,
  }) {
    final result = create();
    if (txHash != null) result.txHash = txHash;
    if (index != null) result.index = index;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'txHash', $pb.PbFieldType.OY)
    ..aI(2, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
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

  /// The hash of the referenced transaction.
  @$pb.TagNumber(1)
  $core.List<$core.int> get txHash => $_getN(0);
  @$pb.TagNumber(1)
  set txHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTxHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHash() => $_clearField(1);

  /// The index of the specific output in the transaction.
  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => $_clearField(2);
}

/// Nervos cell output.
class CellOutput extends $pb.GeneratedMessage {
  factory CellOutput({
    $fixnum.Int64? capacity,
    Script? lock,
    Script? type,
  }) {
    final result = create();
    if (capacity != null) result.capacity = capacity;
    if (lock != null) result.lock = lock;
    if (type != null) result.type = type;
    return result;
  }

  CellOutput._();

  factory CellOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CellOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CellOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'capacity', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Script>(2, _omitFieldNames ? '' : 'lock', subBuilder: Script.create)
    ..aOM<Script>(3, _omitFieldNames ? '' : 'type', subBuilder: Script.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CellOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CellOutput copyWith(void Function(CellOutput) updates) =>
      super.copyWith((message) => updates(message as CellOutput)) as CellOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CellOutput create() => CellOutput._();
  @$core.override
  CellOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CellOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CellOutput>(create);
  static CellOutput? _defaultInstance;

  /// Transaction amount.
  @$pb.TagNumber(1)
  $fixnum.Int64 get capacity => $_getI64(0);
  @$pb.TagNumber(1)
  set capacity($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCapacity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCapacity() => $_clearField(1);

  /// Lock script
  @$pb.TagNumber(2)
  Script get lock => $_getN(1);
  @$pb.TagNumber(2)
  set lock(Script value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLock() => $_has(1);
  @$pb.TagNumber(2)
  void clearLock() => $_clearField(2);
  @$pb.TagNumber(2)
  Script ensureLock() => $_ensure(1);

  /// Type script
  @$pb.TagNumber(3)
  Script get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(Script value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);
  @$pb.TagNumber(3)
  Script ensureType() => $_ensure(2);
}

/// Nervos script
class Script extends $pb.GeneratedMessage {
  factory Script({
    $core.List<$core.int>? codeHash,
    $core.String? hashType,
    $core.List<$core.int>? args,
  }) {
    final result = create();
    if (codeHash != null) result.codeHash = codeHash;
    if (hashType != null) result.hashType = hashType;
    if (args != null) result.args = args;
    return result;
  }

  Script._();

  factory Script.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Script.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Script',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'codeHash', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'hashType')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'args', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Script clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Script copyWith(void Function(Script) updates) =>
      super.copyWith((message) => updates(message as Script)) as Script;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Script create() => Script._();
  @$core.override
  Script createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Script getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Script>(create);
  static Script? _defaultInstance;

  /// Code hash
  @$pb.TagNumber(1)
  $core.List<$core.int> get codeHash => $_getN(0);
  @$pb.TagNumber(1)
  set codeHash($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCodeHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearCodeHash() => $_clearField(1);

  /// Hash type
  @$pb.TagNumber(2)
  $core.String get hashType => $_getSZ(1);
  @$pb.TagNumber(2)
  set hashType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHashType() => $_has(1);
  @$pb.TagNumber(2)
  void clearHashType() => $_clearField(2);

  /// args
  @$pb.TagNumber(3)
  $core.List<$core.int> get args => $_getN(2);
  @$pb.TagNumber(3)
  set args($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasArgs() => $_has(2);
  @$pb.TagNumber(3)
  void clearArgs() => $_clearField(3);
}

/// Transfer of native asset
class NativeTransfer extends $pb.GeneratedMessage {
  factory NativeTransfer({
    $core.String? toAddress,
    $core.String? changeAddress,
    $fixnum.Int64? amount,
    $core.bool? useMaxAmount,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (changeAddress != null) result.changeAddress = changeAddress;
    if (amount != null) result.amount = amount;
    if (useMaxAmount != null) result.useMaxAmount = useMaxAmount;
    return result;
  }

  NativeTransfer._();

  factory NativeTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NativeTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NativeTransfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..aOS(2, _omitFieldNames ? '' : 'changeAddress')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, _omitFieldNames ? '' : 'useMaxAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NativeTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NativeTransfer copyWith(void Function(NativeTransfer) updates) =>
      super.copyWith((message) => updates(message as NativeTransfer))
          as NativeTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NativeTransfer create() => NativeTransfer._();
  @$core.override
  NativeTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NativeTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NativeTransfer>(create);
  static NativeTransfer? _defaultInstance;

  /// Recipient's address.
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Change address.
  @$pb.TagNumber(2)
  $core.String get changeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChangeAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeAddress() => $_clearField(2);

  /// Amount to send.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// If sending max amount.
  @$pb.TagNumber(4)
  $core.bool get useMaxAmount => $_getBF(3);
  @$pb.TagNumber(4)
  set useMaxAmount($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUseMaxAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearUseMaxAmount() => $_clearField(4);
}

/// Token transfer (SUDT)
class SudtTransfer extends $pb.GeneratedMessage {
  factory SudtTransfer({
    $core.String? toAddress,
    $core.String? changeAddress,
    $core.List<$core.int>? sudtAddress,
    $core.String? amount,
    $core.bool? useMaxAmount,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (changeAddress != null) result.changeAddress = changeAddress;
    if (sudtAddress != null) result.sudtAddress = sudtAddress;
    if (amount != null) result.amount = amount;
    if (useMaxAmount != null) result.useMaxAmount = useMaxAmount;
    return result;
  }

  SudtTransfer._();

  factory SudtTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SudtTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SudtTransfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..aOS(2, _omitFieldNames ? '' : 'changeAddress')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'sudtAddress', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..aOB(5, _omitFieldNames ? '' : 'useMaxAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudtTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudtTransfer copyWith(void Function(SudtTransfer) updates) =>
      super.copyWith((message) => updates(message as SudtTransfer))
          as SudtTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SudtTransfer create() => SudtTransfer._();
  @$core.override
  SudtTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SudtTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SudtTransfer>(create);
  static SudtTransfer? _defaultInstance;

  /// Recipient's address.
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Change address.
  @$pb.TagNumber(2)
  $core.String get changeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChangeAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeAddress() => $_clearField(2);

  /// SUDT (Simple User Defined Token) address
  @$pb.TagNumber(3)
  $core.List<$core.int> get sudtAddress => $_getN(2);
  @$pb.TagNumber(3)
  set sudtAddress($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSudtAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearSudtAddress() => $_clearField(3);

  /// Amount to send.
  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  /// If sending max amount.
  @$pb.TagNumber(5)
  $core.bool get useMaxAmount => $_getBF(4);
  @$pb.TagNumber(5)
  set useMaxAmount($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUseMaxAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearUseMaxAmount() => $_clearField(5);
}

/// Deposit
class DaoDeposit extends $pb.GeneratedMessage {
  factory DaoDeposit({
    $core.String? toAddress,
    $core.String? changeAddress,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (changeAddress != null) result.changeAddress = changeAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  DaoDeposit._();

  factory DaoDeposit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DaoDeposit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DaoDeposit',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..aOS(2, _omitFieldNames ? '' : 'changeAddress')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DaoDeposit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DaoDeposit copyWith(void Function(DaoDeposit) updates) =>
      super.copyWith((message) => updates(message as DaoDeposit)) as DaoDeposit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DaoDeposit create() => DaoDeposit._();
  @$core.override
  DaoDeposit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DaoDeposit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DaoDeposit>(create);
  static DaoDeposit? _defaultInstance;

  /// Recipient's address.
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Change address.
  @$pb.TagNumber(2)
  $core.String get changeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChangeAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeAddress() => $_clearField(2);

  /// Amount to deposit.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

class DaoWithdrawPhase1 extends $pb.GeneratedMessage {
  factory DaoWithdrawPhase1({
    Cell? depositCell,
    $core.String? changeAddress,
  }) {
    final result = create();
    if (depositCell != null) result.depositCell = depositCell;
    if (changeAddress != null) result.changeAddress = changeAddress;
    return result;
  }

  DaoWithdrawPhase1._();

  factory DaoWithdrawPhase1.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DaoWithdrawPhase1.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DaoWithdrawPhase1',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOM<Cell>(1, _omitFieldNames ? '' : 'depositCell',
        subBuilder: Cell.create)
    ..aOS(2, _omitFieldNames ? '' : 'changeAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DaoWithdrawPhase1 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DaoWithdrawPhase1 copyWith(void Function(DaoWithdrawPhase1) updates) =>
      super.copyWith((message) => updates(message as DaoWithdrawPhase1))
          as DaoWithdrawPhase1;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DaoWithdrawPhase1 create() => DaoWithdrawPhase1._();
  @$core.override
  DaoWithdrawPhase1 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DaoWithdrawPhase1 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DaoWithdrawPhase1>(create);
  static DaoWithdrawPhase1? _defaultInstance;

  /// Deposit cell
  @$pb.TagNumber(1)
  Cell get depositCell => $_getN(0);
  @$pb.TagNumber(1)
  set depositCell(Cell value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDepositCell() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepositCell() => $_clearField(1);
  @$pb.TagNumber(1)
  Cell ensureDepositCell() => $_ensure(0);

  /// Change address.
  @$pb.TagNumber(2)
  $core.String get changeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChangeAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeAddress() => $_clearField(2);
}

class DaoWithdrawPhase2 extends $pb.GeneratedMessage {
  factory DaoWithdrawPhase2({
    Cell? depositCell,
    Cell? withdrawingCell,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (depositCell != null) result.depositCell = depositCell;
    if (withdrawingCell != null) result.withdrawingCell = withdrawingCell;
    if (amount != null) result.amount = amount;
    return result;
  }

  DaoWithdrawPhase2._();

  factory DaoWithdrawPhase2.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DaoWithdrawPhase2.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DaoWithdrawPhase2',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOM<Cell>(1, _omitFieldNames ? '' : 'depositCell',
        subBuilder: Cell.create)
    ..aOM<Cell>(2, _omitFieldNames ? '' : 'withdrawingCell',
        subBuilder: Cell.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DaoWithdrawPhase2 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DaoWithdrawPhase2 copyWith(void Function(DaoWithdrawPhase2) updates) =>
      super.copyWith((message) => updates(message as DaoWithdrawPhase2))
          as DaoWithdrawPhase2;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DaoWithdrawPhase2 create() => DaoWithdrawPhase2._();
  @$core.override
  DaoWithdrawPhase2 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DaoWithdrawPhase2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DaoWithdrawPhase2>(create);
  static DaoWithdrawPhase2? _defaultInstance;

  /// Deposit cell
  @$pb.TagNumber(1)
  Cell get depositCell => $_getN(0);
  @$pb.TagNumber(1)
  set depositCell(Cell value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDepositCell() => $_has(0);
  @$pb.TagNumber(1)
  void clearDepositCell() => $_clearField(1);
  @$pb.TagNumber(1)
  Cell ensureDepositCell() => $_ensure(0);

  /// Withdrawing cell
  @$pb.TagNumber(2)
  Cell get withdrawingCell => $_getN(1);
  @$pb.TagNumber(2)
  set withdrawingCell(Cell value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWithdrawingCell() => $_has(1);
  @$pb.TagNumber(2)
  void clearWithdrawingCell() => $_clearField(2);
  @$pb.TagNumber(2)
  Cell ensureWithdrawingCell() => $_ensure(1);

  /// Amount
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

enum SigningInput_OperationOneof {
  nativeTransfer,
  sudtTransfer,
  daoDeposit,
  daoWithdrawPhase1,
  daoWithdrawPhase2,
  notSet
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $fixnum.Int64? byteFee,
    $core.Iterable<$core.List<$core.int>>? privateKey,
    $core.Iterable<Cell>? cell,
    TransactionPlan? plan,
    NativeTransfer? nativeTransfer,
    SudtTransfer? sudtTransfer,
    DaoDeposit? daoDeposit,
    DaoWithdrawPhase1? daoWithdrawPhase1,
    DaoWithdrawPhase2? daoWithdrawPhase2,
  }) {
    final result = create();
    if (byteFee != null) result.byteFee = byteFee;
    if (privateKey != null) result.privateKey.addAll(privateKey);
    if (cell != null) result.cell.addAll(cell);
    if (plan != null) result.plan = plan;
    if (nativeTransfer != null) result.nativeTransfer = nativeTransfer;
    if (sudtTransfer != null) result.sudtTransfer = sudtTransfer;
    if (daoDeposit != null) result.daoDeposit = daoDeposit;
    if (daoWithdrawPhase1 != null) result.daoWithdrawPhase1 = daoWithdrawPhase1;
    if (daoWithdrawPhase2 != null) result.daoWithdrawPhase2 = daoWithdrawPhase2;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_OperationOneof>
      _SigningInput_OperationOneofByTag = {
    5: SigningInput_OperationOneof.nativeTransfer,
    6: SigningInput_OperationOneof.sudtTransfer,
    7: SigningInput_OperationOneof.daoDeposit,
    8: SigningInput_OperationOneof.daoWithdrawPhase1,
    9: SigningInput_OperationOneof.daoWithdrawPhase2,
    0: SigningInput_OperationOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 7, 8, 9])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'byteFee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.PY)
    ..pPM<Cell>(3, _omitFieldNames ? '' : 'cell', subBuilder: Cell.create)
    ..aOM<TransactionPlan>(4, _omitFieldNames ? '' : 'plan',
        subBuilder: TransactionPlan.create)
    ..aOM<NativeTransfer>(5, _omitFieldNames ? '' : 'nativeTransfer',
        subBuilder: NativeTransfer.create)
    ..aOM<SudtTransfer>(6, _omitFieldNames ? '' : 'sudtTransfer',
        subBuilder: SudtTransfer.create)
    ..aOM<DaoDeposit>(7, _omitFieldNames ? '' : 'daoDeposit',
        subBuilder: DaoDeposit.create)
    ..aOM<DaoWithdrawPhase1>(8, _omitFieldNames ? '' : 'daoWithdrawPhase1',
        subBuilder: DaoWithdrawPhase1.create)
    ..aOM<DaoWithdrawPhase2>(9, _omitFieldNames ? '' : 'daoWithdrawPhase2',
        subBuilder: DaoWithdrawPhase2.create)
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

  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  SigningInput_OperationOneof whichOperationOneof() =>
      _SigningInput_OperationOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  void clearOperationOneof() => $_clearField($_whichOneof(0));

  /// Transaction fee per byte.
  @$pb.TagNumber(1)
  $fixnum.Int64 get byteFee => $_getI64(0);
  @$pb.TagNumber(1)
  set byteFee($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasByteFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearByteFee() => $_clearField(1);

  /// The available secret private keys used for signing (32 bytes each).
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get privateKey => $_getList(1);

  /// Available unspent cell outputs.
  @$pb.TagNumber(3)
  $pb.PbList<Cell> get cell => $_getList(2);

  /// Optional transaction plan
  @$pb.TagNumber(4)
  TransactionPlan get plan => $_getN(3);
  @$pb.TagNumber(4)
  set plan(TransactionPlan value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPlan() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlan() => $_clearField(4);
  @$pb.TagNumber(4)
  TransactionPlan ensurePlan() => $_ensure(3);

  @$pb.TagNumber(5)
  NativeTransfer get nativeTransfer => $_getN(4);
  @$pb.TagNumber(5)
  set nativeTransfer(NativeTransfer value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNativeTransfer() => $_has(4);
  @$pb.TagNumber(5)
  void clearNativeTransfer() => $_clearField(5);
  @$pb.TagNumber(5)
  NativeTransfer ensureNativeTransfer() => $_ensure(4);

  @$pb.TagNumber(6)
  SudtTransfer get sudtTransfer => $_getN(5);
  @$pb.TagNumber(6)
  set sudtTransfer(SudtTransfer value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSudtTransfer() => $_has(5);
  @$pb.TagNumber(6)
  void clearSudtTransfer() => $_clearField(6);
  @$pb.TagNumber(6)
  SudtTransfer ensureSudtTransfer() => $_ensure(5);

  @$pb.TagNumber(7)
  DaoDeposit get daoDeposit => $_getN(6);
  @$pb.TagNumber(7)
  set daoDeposit(DaoDeposit value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDaoDeposit() => $_has(6);
  @$pb.TagNumber(7)
  void clearDaoDeposit() => $_clearField(7);
  @$pb.TagNumber(7)
  DaoDeposit ensureDaoDeposit() => $_ensure(6);

  @$pb.TagNumber(8)
  DaoWithdrawPhase1 get daoWithdrawPhase1 => $_getN(7);
  @$pb.TagNumber(8)
  set daoWithdrawPhase1(DaoWithdrawPhase1 value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasDaoWithdrawPhase1() => $_has(7);
  @$pb.TagNumber(8)
  void clearDaoWithdrawPhase1() => $_clearField(8);
  @$pb.TagNumber(8)
  DaoWithdrawPhase1 ensureDaoWithdrawPhase1() => $_ensure(7);

  @$pb.TagNumber(9)
  DaoWithdrawPhase2 get daoWithdrawPhase2 => $_getN(8);
  @$pb.TagNumber(9)
  set daoWithdrawPhase2(DaoWithdrawPhase2 value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDaoWithdrawPhase2() => $_has(8);
  @$pb.TagNumber(9)
  void clearDaoWithdrawPhase2() => $_clearField(9);
  @$pb.TagNumber(9)
  DaoWithdrawPhase2 ensureDaoWithdrawPhase2() => $_ensure(8);
}

/// An unspent cell output, that can serve as input to a transaction
class Cell extends $pb.GeneratedMessage {
  factory Cell({
    OutPoint? outPoint,
    $fixnum.Int64? capacity,
    Script? lock,
    Script? type,
    $core.List<$core.int>? data,
    $fixnum.Int64? blockNumber,
    $core.List<$core.int>? blockHash,
    $fixnum.Int64? since,
    $core.List<$core.int>? inputType,
    $core.List<$core.int>? outputType,
  }) {
    final result = create();
    if (outPoint != null) result.outPoint = outPoint;
    if (capacity != null) result.capacity = capacity;
    if (lock != null) result.lock = lock;
    if (type != null) result.type = type;
    if (data != null) result.data = data;
    if (blockNumber != null) result.blockNumber = blockNumber;
    if (blockHash != null) result.blockHash = blockHash;
    if (since != null) result.since = since;
    if (inputType != null) result.inputType = inputType;
    if (outputType != null) result.outputType = outputType;
    return result;
  }

  Cell._();

  factory Cell.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Cell.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Cell',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOM<OutPoint>(1, _omitFieldNames ? '' : 'outPoint',
        subBuilder: OutPoint.create)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'capacity', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Script>(3, _omitFieldNames ? '' : 'lock', subBuilder: Script.create)
    ..aOM<Script>(4, _omitFieldNames ? '' : 'type', subBuilder: Script.create)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'blockNumber', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'blockHash', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'since', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'inputType', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'outputType', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Cell clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Cell copyWith(void Function(Cell) updates) =>
      super.copyWith((message) => updates(message as Cell)) as Cell;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Cell create() => Cell._();
  @$core.override
  Cell createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Cell getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Cell>(create);
  static Cell? _defaultInstance;

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

  /// Amount of the cell
  @$pb.TagNumber(2)
  $fixnum.Int64 get capacity => $_getI64(1);
  @$pb.TagNumber(2)
  set capacity($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCapacity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCapacity() => $_clearField(2);

  /// Lock script
  @$pb.TagNumber(3)
  Script get lock => $_getN(2);
  @$pb.TagNumber(3)
  set lock(Script value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLock() => $_has(2);
  @$pb.TagNumber(3)
  void clearLock() => $_clearField(3);
  @$pb.TagNumber(3)
  Script ensureLock() => $_ensure(2);

  /// Type script
  @$pb.TagNumber(4)
  Script get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(Script value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
  @$pb.TagNumber(4)
  Script ensureType() => $_ensure(3);

  /// Data
  @$pb.TagNumber(5)
  $core.List<$core.int> get data => $_getN(4);
  @$pb.TagNumber(5)
  set data($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => $_clearField(5);

  /// Optional block number
  @$pb.TagNumber(6)
  $fixnum.Int64 get blockNumber => $_getI64(5);
  @$pb.TagNumber(6)
  set blockNumber($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBlockNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlockNumber() => $_clearField(6);

  /// Optional block hash
  @$pb.TagNumber(7)
  $core.List<$core.int> get blockHash => $_getN(6);
  @$pb.TagNumber(7)
  set blockHash($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBlockHash() => $_has(6);
  @$pb.TagNumber(7)
  void clearBlockHash() => $_clearField(7);

  /// Optional since the cell is available to spend
  @$pb.TagNumber(8)
  $fixnum.Int64 get since => $_getI64(7);
  @$pb.TagNumber(8)
  set since($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSince() => $_has(7);
  @$pb.TagNumber(8)
  void clearSince() => $_clearField(8);

  /// Optional input type data to be included in witness
  @$pb.TagNumber(9)
  $core.List<$core.int> get inputType => $_getN(8);
  @$pb.TagNumber(9)
  set inputType($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasInputType() => $_has(8);
  @$pb.TagNumber(9)
  void clearInputType() => $_clearField(9);

  /// Optional output type data to be included in witness
  @$pb.TagNumber(10)
  $core.List<$core.int> get outputType => $_getN(9);
  @$pb.TagNumber(10)
  set outputType($core.List<$core.int> value) => $_setBytes(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOutputType() => $_has(9);
  @$pb.TagNumber(10)
  void clearOutputType() => $_clearField(10);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? transactionJson,
    $core.String? transactionId,
    $0.SigningError? error,
  }) {
    final result = create();
    if (transactionJson != null) result.transactionJson = transactionJson;
    if (transactionId != null) result.transactionId = transactionId;
    if (error != null) result.error = error;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Nervos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionJson')
    ..aOS(2, _omitFieldNames ? '' : 'transactionId')
    ..aE<$0.SigningError>(3, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
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
  $core.String get transactionJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionJson($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionJson() => $_clearField(1);

  /// Transaction id
  @$pb.TagNumber(2)
  $core.String get transactionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set transactionId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTransactionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransactionId() => $_clearField(2);

  /// Optional error
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
