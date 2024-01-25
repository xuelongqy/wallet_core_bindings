//
//  Generated code. Do not modify.
//  source: Utxo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Utxo.pbenum.dart';

export 'Utxo.pbenum.dart';

class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.int? version,
    LockTime? lockTime,
    $core.Iterable<TxIn>? inputs,
    $core.Iterable<TxOut>? outputs,
    InputSelector? inputSelector,
    $fixnum.Int64? weightBase,
    $core.List<$core.int>? changeScriptPubkey,
    $core.bool? disableChangeOutput,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    if (inputSelector != null) {
      $result.inputSelector = inputSelector;
    }
    if (weightBase != null) {
      $result.weightBase = weightBase;
    }
    if (changeScriptPubkey != null) {
      $result.changeScriptPubkey = changeScriptPubkey;
    }
    if (disableChangeOutput != null) {
      $result.disableChangeOutput = disableChangeOutput;
    }
    return $result;
  }
  SigningInput._() : super();
  factory SigningInput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SigningInput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<LockTime>(2, _omitFieldNames ? '' : 'lockTime',
        subBuilder: LockTime.create)
    ..pc<TxIn>(3, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: TxIn.create)
    ..pc<TxOut>(4, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM,
        subBuilder: TxOut.create)
    ..e<InputSelector>(
        5, _omitFieldNames ? '' : 'inputSelector', $pb.PbFieldType.OE,
        defaultOrMaker: InputSelector.SelectAscending,
        valueOf: InputSelector.valueOf,
        enumValues: InputSelector.values)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'weightBase', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'changeScriptPubkey', $pb.PbFieldType.OY)
    ..aOB(8, _omitFieldNames ? '' : 'disableChangeOutput')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SigningInput clone() => SigningInput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SigningInput copyWith(void Function(SigningInput) updates) =>
      super.copyWith((message) => updates(message as SigningInput))
          as SigningInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningInput create() => SigningInput._();
  SigningInput createEmptyInstance() => create();
  static $pb.PbList<SigningInput> createRepeated() =>
      $pb.PbList<SigningInput>();
  @$core.pragma('dart2js:noInline')
  static SigningInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningInput>(create);
  static SigningInput? _defaultInstance;

  /// The protocol version.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// Block height or timestamp indicating at what point transactions can be
  /// included in a block.
  @$pb.TagNumber(2)
  LockTime get lockTime => $_getN(1);
  @$pb.TagNumber(2)
  set lockTime(LockTime v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockTime() => clearField(2);
  @$pb.TagNumber(2)
  LockTime ensureLockTime() => $_ensure(1);

  /// The inputs of the transaction.
  @$pb.TagNumber(3)
  $core.List<TxIn> get inputs => $_getList(2);

  /// The outputs of the transaction.
  @$pb.TagNumber(4)
  $core.List<TxOut> get outputs => $_getList(3);

  /// How inputs should be selected.
  @$pb.TagNumber(5)
  InputSelector get inputSelector => $_getN(4);
  @$pb.TagNumber(5)
  set inputSelector(InputSelector v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInputSelector() => $_has(4);
  @$pb.TagNumber(5)
  void clearInputSelector() => clearField(5);

  /// The base unit per weight. In the case of Bitcoin, that would refer to
  /// satoshis by vbyte ("satVb").
  @$pb.TagNumber(6)
  $fixnum.Int64 get weightBase => $_getI64(5);
  @$pb.TagNumber(6)
  set weightBase($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWeightBase() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeightBase() => clearField(6);

  /// The change output where to send left-over funds to (usually the sender).
  @$pb.TagNumber(7)
  $core.List<$core.int> get changeScriptPubkey => $_getN(6);
  @$pb.TagNumber(7)
  set changeScriptPubkey($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasChangeScriptPubkey() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangeScriptPubkey() => clearField(7);

  /// Explicility disable change output creation.
  @$pb.TagNumber(8)
  $core.bool get disableChangeOutput => $_getBF(7);
  @$pb.TagNumber(8)
  set disableChangeOutput($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDisableChangeOutput() => $_has(7);
  @$pb.TagNumber(8)
  void clearDisableChangeOutput() => clearField(8);
}

enum LockTime_Variant { blocks, seconds, notSet }

class LockTime extends $pb.GeneratedMessage {
  factory LockTime({
    $core.int? blocks,
    $core.int? seconds,
  }) {
    final $result = create();
    if (blocks != null) {
      $result.blocks = blocks;
    }
    if (seconds != null) {
      $result.seconds = seconds;
    }
    return $result;
  }
  LockTime._() : super();
  factory LockTime.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LockTime.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, LockTime_Variant> _LockTime_VariantByTag = {
    1: LockTime_Variant.blocks,
    2: LockTime_Variant.seconds,
    0: LockTime_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LockTime',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'blocks', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'seconds', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LockTime clone() => LockTime()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LockTime copyWith(void Function(LockTime) updates) =>
      super.copyWith((message) => updates(message as LockTime)) as LockTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LockTime create() => LockTime._();
  LockTime createEmptyInstance() => create();
  static $pb.PbList<LockTime> createRepeated() => $pb.PbList<LockTime>();
  @$core.pragma('dart2js:noInline')
  static LockTime getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LockTime>(create);
  static LockTime? _defaultInstance;

  LockTime_Variant whichVariant() => _LockTime_VariantByTag[$_whichOneof(0)]!;
  void clearVariant() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get blocks => $_getIZ(0);
  @$pb.TagNumber(1)
  set blocks($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBlocks() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlocks() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get seconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set seconds($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeconds() => clearField(2);
}

class TxIn extends $pb.GeneratedMessage {
  factory TxIn({
    $core.List<$core.int>? txid,
    $core.int? vout,
    $fixnum.Int64? value,
    $core.int? sequence,
    $core.List<$core.int>? scriptPubkey,
    SighashType? sighashType,
    SigningMethod? signingMethod,
    $fixnum.Int64? weightEstimate,
    $core.List<$core.int>? leafHash,
  }) {
    final $result = create();
    if (txid != null) {
      $result.txid = txid;
    }
    if (vout != null) {
      $result.vout = vout;
    }
    if (value != null) {
      $result.value = value;
    }
    if (sequence != null) {
      $result.sequence = sequence;
    }
    if (scriptPubkey != null) {
      $result.scriptPubkey = scriptPubkey;
    }
    if (sighashType != null) {
      $result.sighashType = sighashType;
    }
    if (signingMethod != null) {
      $result.signingMethod = signingMethod;
    }
    if (weightEstimate != null) {
      $result.weightEstimate = weightEstimate;
    }
    if (leafHash != null) {
      $result.leafHash = leafHash;
    }
    return $result;
  }
  TxIn._() : super();
  factory TxIn.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TxIn.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxIn',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'vout', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'scriptPubkey', $pb.PbFieldType.OY)
    ..e<SighashType>(
        8, _omitFieldNames ? '' : 'sighashType', $pb.PbFieldType.OE,
        defaultOrMaker: SighashType.UseDefault,
        valueOf: SighashType.valueOf,
        enumValues: SighashType.values)
    ..e<SigningMethod>(
        9, _omitFieldNames ? '' : 'signingMethod', $pb.PbFieldType.OE,
        defaultOrMaker: SigningMethod.Legacy,
        valueOf: SigningMethod.valueOf,
        enumValues: SigningMethod.values)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'weightEstimate', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        11, _omitFieldNames ? '' : 'leafHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TxIn clone() => TxIn()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TxIn copyWith(void Function(TxIn) updates) =>
      super.copyWith((message) => updates(message as TxIn)) as TxIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxIn create() => TxIn._();
  TxIn createEmptyInstance() => create();
  static $pb.PbList<TxIn> createRepeated() => $pb.PbList<TxIn>();
  @$core.pragma('dart2js:noInline')
  static TxIn getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxIn>(create);
  static TxIn? _defaultInstance;

  /// The referenced transaction ID in REVERSED order.
  @$pb.TagNumber(1)
  $core.List<$core.int> get txid => $_getN(0);
  @$pb.TagNumber(1)
  set txid($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTxid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxid() => clearField(1);

  /// The position in the previous transactions output that this input
  /// references.
  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => clearField(2);

  /// The value of this input, such as satoshis. Required for producing
  /// Segwit/Taproot transactions.
  @$pb.TagNumber(3)
  $fixnum.Int64 get value => $_getI64(2);
  @$pb.TagNumber(3)
  set value($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);

  /// The sequence number, used for timelocks, replace-by-fee, etc. Normally
  /// this number is simply 4294967295 (0xFFFFFFFF) .
  @$pb.TagNumber(4)
  $core.int get sequence => $_getIZ(3);
  @$pb.TagNumber(4)
  set sequence($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequence() => clearField(4);

  /// The spending condition of the referenced output.
  @$pb.TagNumber(7)
  $core.List<$core.int> get scriptPubkey => $_getN(4);
  @$pb.TagNumber(7)
  set scriptPubkey($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScriptPubkey() => $_has(4);
  @$pb.TagNumber(7)
  void clearScriptPubkey() => clearField(7);

  /// The sighash type, normally `SighashType::UseDefault` (All).
  @$pb.TagNumber(8)
  SighashType get sighashType => $_getN(5);
  @$pb.TagNumber(8)
  set sighashType(SighashType v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSighashType() => $_has(5);
  @$pb.TagNumber(8)
  void clearSighashType() => clearField(8);

  /// The signing method.
  @$pb.TagNumber(9)
  SigningMethod get signingMethod => $_getN(6);
  @$pb.TagNumber(9)
  set signingMethod(SigningMethod v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSigningMethod() => $_has(6);
  @$pb.TagNumber(9)
  void clearSigningMethod() => clearField(9);

  /// The estimated weight of the input, required for estimating fees.
  @$pb.TagNumber(10)
  $fixnum.Int64 get weightEstimate => $_getI64(7);
  @$pb.TagNumber(10)
  set weightEstimate($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWeightEstimate() => $_has(7);
  @$pb.TagNumber(10)
  void clearWeightEstimate() => clearField(10);

  /// If this input is a Taproot script-path (complex transaction), then this
  /// leaf hash is required in order to compute the sighash.
  @$pb.TagNumber(11)
  $core.List<$core.int> get leafHash => $_getN(8);
  @$pb.TagNumber(11)
  set leafHash($core.List<$core.int> v) {
    $_setBytes(8, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasLeafHash() => $_has(8);
  @$pb.TagNumber(11)
  void clearLeafHash() => clearField(11);
}

/// The output of a transaction.
class TxOut extends $pb.GeneratedMessage {
  factory TxOut({
    $fixnum.Int64? value,
    $core.List<$core.int>? scriptPubkey,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (scriptPubkey != null) {
      $result.scriptPubkey = scriptPubkey;
    }
    return $result;
  }
  TxOut._() : super();
  factory TxOut.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TxOut.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxOut',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'scriptPubkey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TxOut clone() => TxOut()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TxOut copyWith(void Function(TxOut) updates) =>
      super.copyWith((message) => updates(message as TxOut)) as TxOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxOut create() => TxOut._();
  TxOut createEmptyInstance() => create();
  static $pb.PbList<TxOut> createRepeated() => $pb.PbList<TxOut>();
  @$core.pragma('dart2js:noInline')
  static TxOut getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxOut>(create);
  static TxOut? _defaultInstance;

  /// The value of the output.
  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  /// The spending condition of the output.
  @$pb.TagNumber(2)
  $core.List<$core.int> get scriptPubkey => $_getN(1);
  @$pb.TagNumber(2)
  set scriptPubkey($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScriptPubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearScriptPubkey() => clearField(2);
}

class PreSigningOutput extends $pb.GeneratedMessage {
  factory PreSigningOutput({
    Error? error,
    $core.List<$core.int>? txid,
    $core.Iterable<Sighash>? sighashes,
    $core.Iterable<TxIn>? inputs,
    $core.Iterable<TxOut>? outputs,
    $fixnum.Int64? weightEstimate,
    $fixnum.Int64? feeEstimate,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (sighashes != null) {
      $result.sighashes.addAll(sighashes);
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    if (weightEstimate != null) {
      $result.weightEstimate = weightEstimate;
    }
    if (feeEstimate != null) {
      $result.feeEstimate = feeEstimate;
    }
    return $result;
  }
  PreSigningOutput._() : super();
  factory PreSigningOutput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PreSigningOutput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreSigningOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..e<Error>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: Error.OK,
        valueOf: Error.valueOf,
        enumValues: Error.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..pc<Sighash>(3, _omitFieldNames ? '' : 'sighashes', $pb.PbFieldType.PM,
        subBuilder: Sighash.create)
    ..pc<TxIn>(4, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: TxIn.create)
    ..pc<TxOut>(5, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM,
        subBuilder: TxOut.create)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'weightEstimate', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'feeEstimate', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PreSigningOutput clone() => PreSigningOutput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PreSigningOutput copyWith(void Function(PreSigningOutput) updates) =>
      super.copyWith((message) => updates(message as PreSigningOutput))
          as PreSigningOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreSigningOutput create() => PreSigningOutput._();
  PreSigningOutput createEmptyInstance() => create();
  static $pb.PbList<PreSigningOutput> createRepeated() =>
      $pb.PbList<PreSigningOutput>();
  @$core.pragma('dart2js:noInline')
  static PreSigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreSigningOutput>(create);
  static PreSigningOutput? _defaultInstance;

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(1)
  Error get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(Error v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  /// The transaction ID in NON-reversed order. Note that this must be reversed
  /// when referencing in future transactions.
  @$pb.TagNumber(2)
  $core.List<$core.int> get txid => $_getN(1);
  @$pb.TagNumber(2)
  set txid($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxid() => clearField(2);

  /// / Sighashes to be signed; ECDSA for legacy and Segwit, Schnorr for Taproot.
  @$pb.TagNumber(3)
  $core.List<Sighash> get sighashes => $_getList(2);

  /// The raw inputs.
  @$pb.TagNumber(4)
  $core.List<TxIn> get inputs => $_getList(3);

  /// The raw outputs.
  @$pb.TagNumber(5)
  $core.List<TxOut> get outputs => $_getList(4);

  /// The estimated weight of the transaction.
  @$pb.TagNumber(6)
  $fixnum.Int64 get weightEstimate => $_getI64(5);
  @$pb.TagNumber(6)
  set weightEstimate($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWeightEstimate() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeightEstimate() => clearField(6);

  /// The estimated fee of the transaction denominated in the base unit (such
  /// as satoshis).
  @$pb.TagNumber(7)
  $fixnum.Int64 get feeEstimate => $_getI64(6);
  @$pb.TagNumber(7)
  set feeEstimate($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFeeEstimate() => $_has(6);
  @$pb.TagNumber(7)
  void clearFeeEstimate() => clearField(7);
}

class Sighash extends $pb.GeneratedMessage {
  factory Sighash({
    $core.List<$core.int>? sighash,
    SigningMethod? signingMethod,
    SighashType? sighashType,
  }) {
    final $result = create();
    if (sighash != null) {
      $result.sighash = sighash;
    }
    if (signingMethod != null) {
      $result.signingMethod = signingMethod;
    }
    if (sighashType != null) {
      $result.sighashType = sighashType;
    }
    return $result;
  }
  Sighash._() : super();
  factory Sighash.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Sighash.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sighash',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'sighash', $pb.PbFieldType.OY)
    ..e<SigningMethod>(
        2, _omitFieldNames ? '' : 'signingMethod', $pb.PbFieldType.OE,
        defaultOrMaker: SigningMethod.Legacy,
        valueOf: SigningMethod.valueOf,
        enumValues: SigningMethod.values)
    ..e<SighashType>(
        3, _omitFieldNames ? '' : 'sighashType', $pb.PbFieldType.OE,
        defaultOrMaker: SighashType.UseDefault,
        valueOf: SighashType.valueOf,
        enumValues: SighashType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Sighash clone() => Sighash()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Sighash copyWith(void Function(Sighash) updates) =>
      super.copyWith((message) => updates(message as Sighash)) as Sighash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sighash create() => Sighash._();
  Sighash createEmptyInstance() => create();
  static $pb.PbList<Sighash> createRepeated() => $pb.PbList<Sighash>();
  @$core.pragma('dart2js:noInline')
  static Sighash getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sighash>(create);
  static Sighash? _defaultInstance;

  /// The sighash to be signed.
  @$pb.TagNumber(1)
  $core.List<$core.int> get sighash => $_getN(0);
  @$pb.TagNumber(1)
  set sighash($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSighash() => $_has(0);
  @$pb.TagNumber(1)
  void clearSighash() => clearField(1);

  /// The used signing method for this sighash.
  @$pb.TagNumber(2)
  SigningMethod get signingMethod => $_getN(1);
  @$pb.TagNumber(2)
  set signingMethod(SigningMethod v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSigningMethod() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigningMethod() => clearField(2);

  /// The used sighash type for this sighash.
  @$pb.TagNumber(3)
  SighashType get sighashType => $_getN(2);
  @$pb.TagNumber(3)
  set sighashType(SighashType v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSighashType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSighashType() => clearField(3);
}

class PreSerialization extends $pb.GeneratedMessage {
  factory PreSerialization({
    $core.int? version,
    LockTime? lockTime,
    $core.Iterable<TxInClaim>? inputs,
    $core.Iterable<TxOut>? outputs,
    $fixnum.Int64? weightBase,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    if (weightBase != null) {
      $result.weightBase = weightBase;
    }
    return $result;
  }
  PreSerialization._() : super();
  factory PreSerialization.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PreSerialization.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreSerialization',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<LockTime>(2, _omitFieldNames ? '' : 'lockTime',
        subBuilder: LockTime.create)
    ..pc<TxInClaim>(3, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: TxInClaim.create)
    ..pc<TxOut>(4, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM,
        subBuilder: TxOut.create)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'weightBase', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PreSerialization clone() => PreSerialization()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PreSerialization copyWith(void Function(PreSerialization) updates) =>
      super.copyWith((message) => updates(message as PreSerialization))
          as PreSerialization;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreSerialization create() => PreSerialization._();
  PreSerialization createEmptyInstance() => create();
  static $pb.PbList<PreSerialization> createRepeated() =>
      $pb.PbList<PreSerialization>();
  @$core.pragma('dart2js:noInline')
  static PreSerialization getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreSerialization>(create);
  static PreSerialization? _defaultInstance;

  /// The protocol version, is currently expected to be 1 or 2 (BIP68)
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// Block height or timestamp indicating at what point transactions can be
  /// included in a block.
  @$pb.TagNumber(2)
  LockTime get lockTime => $_getN(1);
  @$pb.TagNumber(2)
  set lockTime(LockTime v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockTime() => clearField(2);
  @$pb.TagNumber(2)
  LockTime ensureLockTime() => $_ensure(1);

  /// The transaction inputs containing the serialized claim scripts.
  @$pb.TagNumber(3)
  $core.List<TxInClaim> get inputs => $_getList(2);

  /// The transaction outputs.
  @$pb.TagNumber(4)
  $core.List<TxOut> get outputs => $_getList(3);

  /// The base unit per weight. In the case of Bitcoin, that would refer to
  /// satoshis ("satVb").
  @$pb.TagNumber(5)
  $fixnum.Int64 get weightBase => $_getI64(4);
  @$pb.TagNumber(5)
  set weightBase($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWeightBase() => $_has(4);
  @$pb.TagNumber(5)
  void clearWeightBase() => clearField(5);
}

class TxInClaim extends $pb.GeneratedMessage {
  factory TxInClaim({
    $core.List<$core.int>? txid,
    $core.int? vout,
    $fixnum.Int64? value,
    $core.int? sequence,
    $core.List<$core.int>? scriptSig,
    $core.Iterable<$core.List<$core.int>>? witnessItems,
  }) {
    final $result = create();
    if (txid != null) {
      $result.txid = txid;
    }
    if (vout != null) {
      $result.vout = vout;
    }
    if (value != null) {
      $result.value = value;
    }
    if (sequence != null) {
      $result.sequence = sequence;
    }
    if (scriptSig != null) {
      $result.scriptSig = scriptSig;
    }
    if (witnessItems != null) {
      $result.witnessItems.addAll(witnessItems);
    }
    return $result;
  }
  TxInClaim._() : super();
  factory TxInClaim.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TxInClaim.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TxInClaim',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'vout', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'scriptSig', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'witnessItems', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TxInClaim clone() => TxInClaim()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TxInClaim copyWith(void Function(TxInClaim) updates) =>
      super.copyWith((message) => updates(message as TxInClaim)) as TxInClaim;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxInClaim create() => TxInClaim._();
  TxInClaim createEmptyInstance() => create();
  static $pb.PbList<TxInClaim> createRepeated() => $pb.PbList<TxInClaim>();
  @$core.pragma('dart2js:noInline')
  static TxInClaim getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxInClaim>(create);
  static TxInClaim? _defaultInstance;

  /// The referenced transaction hash.
  @$pb.TagNumber(1)
  $core.List<$core.int> get txid => $_getN(0);
  @$pb.TagNumber(1)
  set txid($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTxid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxid() => clearField(1);

  /// The index of the referenced output.
  @$pb.TagNumber(2)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(2)
  set vout($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => clearField(2);

  /// The value of this input, such as satoshis.
  @$pb.TagNumber(3)
  $fixnum.Int64 get value => $_getI64(2);
  @$pb.TagNumber(3)
  set value($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);

  /// The sequence number (TODO).
  @$pb.TagNumber(4)
  $core.int get sequence => $_getIZ(3);
  @$pb.TagNumber(4)
  set sequence($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequence() => clearField(4);

  /// The script used for claiming an input.
  @$pb.TagNumber(5)
  $core.List<$core.int> get scriptSig => $_getN(4);
  @$pb.TagNumber(5)
  set scriptSig($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScriptSig() => $_has(4);
  @$pb.TagNumber(5)
  void clearScriptSig() => clearField(5);

  /// The script used for claiming an input.
  @$pb.TagNumber(6)
  $core.List<$core.List<$core.int>> get witnessItems => $_getList(5);
}

class SerializedTransaction extends $pb.GeneratedMessage {
  factory SerializedTransaction({
    Error? error,
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? txid,
    $fixnum.Int64? weight,
    $fixnum.Int64? fee,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (encoded != null) {
      $result.encoded = encoded;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (weight != null) {
      $result.weight = weight;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    return $result;
  }
  SerializedTransaction._() : super();
  factory SerializedTransaction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SerializedTransaction.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SerializedTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Utxo.Proto'),
      createEmptyInstance: create)
    ..e<Error>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: Error.OK,
        valueOf: Error.valueOf,
        enumValues: Error.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'weight', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SerializedTransaction clone() =>
      SerializedTransaction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SerializedTransaction copyWith(
          void Function(SerializedTransaction) updates) =>
      super.copyWith((message) => updates(message as SerializedTransaction))
          as SerializedTransaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SerializedTransaction create() => SerializedTransaction._();
  SerializedTransaction createEmptyInstance() => create();
  static $pb.PbList<SerializedTransaction> createRepeated() =>
      $pb.PbList<SerializedTransaction>();
  @$core.pragma('dart2js:noInline')
  static SerializedTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SerializedTransaction>(create);
  static SerializedTransaction? _defaultInstance;

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(1)
  Error get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(Error v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  /// The encoded transaction, ready to be submitted to the network.
  @$pb.TagNumber(2)
  $core.List<$core.int> get encoded => $_getN(1);
  @$pb.TagNumber(2)
  set encoded($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEncoded() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncoded() => clearField(2);

  /// The transaction ID.
  @$pb.TagNumber(3)
  $core.List<$core.int> get txid => $_getN(2);
  @$pb.TagNumber(3)
  set txid($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTxid() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxid() => clearField(3);

  /// The total and final weight of the transaction.
  @$pb.TagNumber(4)
  $fixnum.Int64 get weight => $_getI64(3);
  @$pb.TagNumber(4)
  set weight($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeight() => clearField(4);

  /// The total and final fee of the transaction denominated in the base unit
  /// (such as satoshis).
  @$pb.TagNumber(5)
  $fixnum.Int64 get fee => $_getI64(4);
  @$pb.TagNumber(5)
  set fee($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearFee() => clearField(5);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
