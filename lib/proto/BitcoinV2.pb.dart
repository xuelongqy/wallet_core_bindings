//
//  Generated code. Do not modify.
//  source: BitcoinV2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'BitcoinV2.pbenum.dart';
import 'Utxo.pb.dart' as $1;
import 'Utxo.pbenum.dart' as $1;

export 'BitcoinV2.pbenum.dart';

class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.int? version,
    $core.List<$core.int>? privateKey,
    $1.LockTime? lockTime,
    $core.Iterable<Input>? inputs,
    $core.Iterable<Output>? outputs,
    $1.InputSelector? inputSelector,
    $fixnum.Int64? feePerVb,
    Output? changeOutput,
    $core.bool? disableChangeOutput,
    $core.bool? dangerousUseFixedSchnorrRng,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (privateKey != null) {
      $result.privateKey = privateKey;
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
    if (feePerVb != null) {
      $result.feePerVb = feePerVb;
    }
    if (changeOutput != null) {
      $result.changeOutput = changeOutput;
    }
    if (disableChangeOutput != null) {
      $result.disableChangeOutput = disableChangeOutput;
    }
    if (dangerousUseFixedSchnorrRng != null) {
      $result.dangerousUseFixedSchnorrRng = dangerousUseFixedSchnorrRng;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<$1.LockTime>(3, _omitFieldNames ? '' : 'lockTime',
        subBuilder: $1.LockTime.create)
    ..pc<Input>(5, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: Input.create)
    ..pc<Output>(6, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM,
        subBuilder: Output.create)
    ..e<$1.InputSelector>(
        7, _omitFieldNames ? '' : 'inputSelector', $pb.PbFieldType.OE,
        defaultOrMaker: $1.InputSelector.UseAll,
        valueOf: $1.InputSelector.valueOf,
        enumValues: $1.InputSelector.values)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'feePerVb', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Output>(9, _omitFieldNames ? '' : 'changeOutput',
        subBuilder: Output.create)
    ..aOB(10, _omitFieldNames ? '' : 'disableChangeOutput')
    ..aOB(11, _omitFieldNames ? '' : 'dangerousUseFixedSchnorrRng')
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

  /// (optional) The protocol version, is currently expected to be 1 or 2.
  /// Version 2 by default.
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

  /// Only required if the `sign` method is called.
  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => clearField(2);

  /// (optional) Block height or timestamp indicating at what point transactions can be
  /// included in a block. None by default (zero value).
  @$pb.TagNumber(3)
  $1.LockTime get lockTime => $_getN(2);
  @$pb.TagNumber(3)
  set lockTime($1.LockTime v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLockTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearLockTime() => clearField(3);
  @$pb.TagNumber(3)
  $1.LockTime ensureLockTime() => $_ensure(2);

  /// The inputs to spend.
  @$pb.TagNumber(5)
  $core.List<Input> get inputs => $_getList(3);

  /// The output of the transaction. Note that the change output is specified
  /// in the `change_output` field.
  @$pb.TagNumber(6)
  $core.List<Output> get outputs => $_getList(4);

  /// How the inputs should be selected.
  @$pb.TagNumber(7)
  $1.InputSelector get inputSelector => $_getN(5);
  @$pb.TagNumber(7)
  set inputSelector($1.InputSelector v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasInputSelector() => $_has(5);
  @$pb.TagNumber(7)
  void clearInputSelector() => clearField(7);

  /// (optional) The amount of satoshis per vbyte ("satVb"), used for fee calculation.
  @$pb.TagNumber(8)
  $fixnum.Int64 get feePerVb => $_getI64(6);
  @$pb.TagNumber(8)
  set feePerVb($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFeePerVb() => $_has(6);
  @$pb.TagNumber(8)
  void clearFeePerVb() => clearField(8);

  /// The change output to be added (return to sender).
  /// The `value` can be left at 0.
  @$pb.TagNumber(9)
  Output get changeOutput => $_getN(7);
  @$pb.TagNumber(9)
  set changeOutput(Output v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasChangeOutput() => $_has(7);
  @$pb.TagNumber(9)
  void clearChangeOutput() => clearField(9);
  @$pb.TagNumber(9)
  Output ensureChangeOutput() => $_ensure(7);

  /// Explicility disable change output creation.
  @$pb.TagNumber(10)
  $core.bool get disableChangeOutput => $_getBF(8);
  @$pb.TagNumber(10)
  set disableChangeOutput($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDisableChangeOutput() => $_has(8);
  @$pb.TagNumber(10)
  void clearDisableChangeOutput() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get dangerousUseFixedSchnorrRng => $_getBF(9);
  @$pb.TagNumber(11)
  set dangerousUseFixedSchnorrRng($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDangerousUseFixedSchnorrRng() => $_has(9);
  @$pb.TagNumber(11)
  void clearDangerousUseFixedSchnorrRng() => clearField(11);
}

enum Input_InputBuilder_Variant {
  p2sh,
  p2pkh,
  p2wsh,
  p2wpkh,
  p2trKeyPath,
  p2trScriptPath,
  brc20Inscribe,
  ordinalInscribe,
  notSet
}

class Input_InputBuilder extends $pb.GeneratedMessage {
  factory Input_InputBuilder({
    $core.List<$core.int>? p2sh,
    $core.List<$core.int>? p2pkh,
    $core.List<$core.int>? p2wsh,
    $core.List<$core.int>? p2wpkh,
    Input_InputTaprootKeyPath? p2trKeyPath,
    Input_InputTaprootScriptPath? p2trScriptPath,
    Input_InputBrc20Inscription? brc20Inscribe,
    Input_InputOrdinalInscription? ordinalInscribe,
  }) {
    final $result = create();
    if (p2sh != null) {
      $result.p2sh = p2sh;
    }
    if (p2pkh != null) {
      $result.p2pkh = p2pkh;
    }
    if (p2wsh != null) {
      $result.p2wsh = p2wsh;
    }
    if (p2wpkh != null) {
      $result.p2wpkh = p2wpkh;
    }
    if (p2trKeyPath != null) {
      $result.p2trKeyPath = p2trKeyPath;
    }
    if (p2trScriptPath != null) {
      $result.p2trScriptPath = p2trScriptPath;
    }
    if (brc20Inscribe != null) {
      $result.brc20Inscribe = brc20Inscribe;
    }
    if (ordinalInscribe != null) {
      $result.ordinalInscribe = ordinalInscribe;
    }
    return $result;
  }
  Input_InputBuilder._() : super();
  factory Input_InputBuilder.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input_InputBuilder.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Input_InputBuilder_Variant>
      _Input_InputBuilder_VariantByTag = {
    1: Input_InputBuilder_Variant.p2sh,
    2: Input_InputBuilder_Variant.p2pkh,
    3: Input_InputBuilder_Variant.p2wsh,
    6: Input_InputBuilder_Variant.p2wpkh,
    7: Input_InputBuilder_Variant.p2trKeyPath,
    8: Input_InputBuilder_Variant.p2trScriptPath,
    9: Input_InputBuilder_Variant.brc20Inscribe,
    10: Input_InputBuilder_Variant.ordinalInscribe,
    0: Input_InputBuilder_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputBuilder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 6, 7, 8, 9, 10])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'p2sh', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'p2pkh', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'p2wsh', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'p2wpkh', $pb.PbFieldType.OY)
    ..aOM<Input_InputTaprootKeyPath>(7, _omitFieldNames ? '' : 'p2trKeyPath',
        subBuilder: Input_InputTaprootKeyPath.create)
    ..aOM<Input_InputTaprootScriptPath>(
        8, _omitFieldNames ? '' : 'p2trScriptPath',
        subBuilder: Input_InputTaprootScriptPath.create)
    ..aOM<Input_InputBrc20Inscription>(
        9, _omitFieldNames ? '' : 'brc20Inscribe',
        subBuilder: Input_InputBrc20Inscription.create)
    ..aOM<Input_InputOrdinalInscription>(
        10, _omitFieldNames ? '' : 'ordinalInscribe',
        subBuilder: Input_InputOrdinalInscription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input_InputBuilder clone() => Input_InputBuilder()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input_InputBuilder copyWith(void Function(Input_InputBuilder) updates) =>
      super.copyWith((message) => updates(message as Input_InputBuilder))
          as Input_InputBuilder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputBuilder create() => Input_InputBuilder._();
  Input_InputBuilder createEmptyInstance() => create();
  static $pb.PbList<Input_InputBuilder> createRepeated() =>
      $pb.PbList<Input_InputBuilder>();
  @$core.pragma('dart2js:noInline')
  static Input_InputBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputBuilder>(create);
  static Input_InputBuilder? _defaultInstance;

  Input_InputBuilder_Variant whichVariant() =>
      _Input_InputBuilder_VariantByTag[$_whichOneof(0)]!;
  void clearVariant() => clearField($_whichOneof(0));

  /// Pay-to-Script-Hash, specify the redeem script.
  @$pb.TagNumber(1)
  $core.List<$core.int> get p2sh => $_getN(0);
  @$pb.TagNumber(1)
  set p2sh($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasP2sh() => $_has(0);
  @$pb.TagNumber(1)
  void clearP2sh() => clearField(1);

  /// Pay-to-Public-Key-Hash, specify the public key.
  @$pb.TagNumber(2)
  $core.List<$core.int> get p2pkh => $_getN(1);
  @$pb.TagNumber(2)
  set p2pkh($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasP2pkh() => $_has(1);
  @$pb.TagNumber(2)
  void clearP2pkh() => clearField(2);

  /// Pay-to-Witness-Script-Hash, specify the redeem script.
  @$pb.TagNumber(3)
  $core.List<$core.int> get p2wsh => $_getN(2);
  @$pb.TagNumber(3)
  set p2wsh($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasP2wsh() => $_has(2);
  @$pb.TagNumber(3)
  void clearP2wsh() => clearField(3);

  /// Pay-to-Public-Key-Hash, specify the public key.
  @$pb.TagNumber(6)
  $core.List<$core.int> get p2wpkh => $_getN(3);
  @$pb.TagNumber(6)
  set p2wpkh($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasP2wpkh() => $_has(3);
  @$pb.TagNumber(6)
  void clearP2wpkh() => clearField(6);

  /// Pay-to-Taproot-key-path (balance transfers).
  @$pb.TagNumber(7)
  Input_InputTaprootKeyPath get p2trKeyPath => $_getN(4);
  @$pb.TagNumber(7)
  set p2trKeyPath(Input_InputTaprootKeyPath v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasP2trKeyPath() => $_has(4);
  @$pb.TagNumber(7)
  void clearP2trKeyPath() => clearField(7);
  @$pb.TagNumber(7)
  Input_InputTaprootKeyPath ensureP2trKeyPath() => $_ensure(4);

  /// Pay-to-Taproot-script-path (complex transfers).
  @$pb.TagNumber(8)
  Input_InputTaprootScriptPath get p2trScriptPath => $_getN(5);
  @$pb.TagNumber(8)
  set p2trScriptPath(Input_InputTaprootScriptPath v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasP2trScriptPath() => $_has(5);
  @$pb.TagNumber(8)
  void clearP2trScriptPath() => clearField(8);
  @$pb.TagNumber(8)
  Input_InputTaprootScriptPath ensureP2trScriptPath() => $_ensure(5);

  /// Create a BRC20 inscription.
  @$pb.TagNumber(9)
  Input_InputBrc20Inscription get brc20Inscribe => $_getN(6);
  @$pb.TagNumber(9)
  set brc20Inscribe(Input_InputBrc20Inscription v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBrc20Inscribe() => $_has(6);
  @$pb.TagNumber(9)
  void clearBrc20Inscribe() => clearField(9);
  @$pb.TagNumber(9)
  Input_InputBrc20Inscription ensureBrc20Inscribe() => $_ensure(6);

  /// Create an Ordinal (NFT) inscriptiohn.
  @$pb.TagNumber(10)
  Input_InputOrdinalInscription get ordinalInscribe => $_getN(7);
  @$pb.TagNumber(10)
  set ordinalInscribe(Input_InputOrdinalInscription v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOrdinalInscribe() => $_has(7);
  @$pb.TagNumber(10)
  void clearOrdinalInscribe() => clearField(10);
  @$pb.TagNumber(10)
  Input_InputOrdinalInscription ensureOrdinalInscribe() => $_ensure(7);
}

class Input_InputScriptWitness extends $pb.GeneratedMessage {
  factory Input_InputScriptWitness({
    $core.List<$core.int>? scriptPubkey,
    $core.List<$core.int>? scriptSig,
    $core.Iterable<$core.List<$core.int>>? witnessItems,
    $1.SigningMethod? signingMethod,
  }) {
    final $result = create();
    if (scriptPubkey != null) {
      $result.scriptPubkey = scriptPubkey;
    }
    if (scriptSig != null) {
      $result.scriptSig = scriptSig;
    }
    if (witnessItems != null) {
      $result.witnessItems.addAll(witnessItems);
    }
    if (signingMethod != null) {
      $result.signingMethod = signingMethod;
    }
    return $result;
  }
  Input_InputScriptWitness._() : super();
  factory Input_InputScriptWitness.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input_InputScriptWitness.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputScriptWitness',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'scriptPubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'scriptSig', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'witnessItems', $pb.PbFieldType.PY)
    ..e<$1.SigningMethod>(
        5, _omitFieldNames ? '' : 'signingMethod', $pb.PbFieldType.OE,
        defaultOrMaker: $1.SigningMethod.Legacy,
        valueOf: $1.SigningMethod.valueOf,
        enumValues: $1.SigningMethod.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input_InputScriptWitness clone() =>
      Input_InputScriptWitness()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input_InputScriptWitness copyWith(
          void Function(Input_InputScriptWitness) updates) =>
      super.copyWith((message) => updates(message as Input_InputScriptWitness))
          as Input_InputScriptWitness;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputScriptWitness create() => Input_InputScriptWitness._();
  Input_InputScriptWitness createEmptyInstance() => create();
  static $pb.PbList<Input_InputScriptWitness> createRepeated() =>
      $pb.PbList<Input_InputScriptWitness>();
  @$core.pragma('dart2js:noInline')
  static Input_InputScriptWitness getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputScriptWitness>(create);
  static Input_InputScriptWitness? _defaultInstance;

  /// The spending condition of this input.
  @$pb.TagNumber(1)
  $core.List<$core.int> get scriptPubkey => $_getN(0);
  @$pb.TagNumber(1)
  set scriptPubkey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScriptPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearScriptPubkey() => clearField(1);

  /// The claiming script for this input (non-Segwit/non-Taproot)
  @$pb.TagNumber(2)
  $core.List<$core.int> get scriptSig => $_getN(1);
  @$pb.TagNumber(2)
  set scriptSig($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScriptSig() => $_has(1);
  @$pb.TagNumber(2)
  void clearScriptSig() => clearField(2);

  /// The claiming script for this input (Segwit/Taproot)
  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get witnessItems => $_getList(2);

  /// The signing method.
  @$pb.TagNumber(5)
  $1.SigningMethod get signingMethod => $_getN(3);
  @$pb.TagNumber(5)
  set signingMethod($1.SigningMethod v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSigningMethod() => $_has(3);
  @$pb.TagNumber(5)
  void clearSigningMethod() => clearField(5);
}

class Input_InputTaprootKeyPath extends $pb.GeneratedMessage {
  factory Input_InputTaprootKeyPath({
    $core.bool? onePrevout,
    $core.List<$core.int>? publicKey,
  }) {
    final $result = create();
    if (onePrevout != null) {
      $result.onePrevout = onePrevout;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    return $result;
  }
  Input_InputTaprootKeyPath._() : super();
  factory Input_InputTaprootKeyPath.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input_InputTaprootKeyPath.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputTaprootKeyPath',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'onePrevout')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input_InputTaprootKeyPath clone() =>
      Input_InputTaprootKeyPath()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input_InputTaprootKeyPath copyWith(
          void Function(Input_InputTaprootKeyPath) updates) =>
      super.copyWith((message) => updates(message as Input_InputTaprootKeyPath))
          as Input_InputTaprootKeyPath;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputTaprootKeyPath create() => Input_InputTaprootKeyPath._();
  Input_InputTaprootKeyPath createEmptyInstance() => create();
  static $pb.PbList<Input_InputTaprootKeyPath> createRepeated() =>
      $pb.PbList<Input_InputTaprootKeyPath>();
  @$core.pragma('dart2js:noInline')
  static Input_InputTaprootKeyPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputTaprootKeyPath>(create);
  static Input_InputTaprootKeyPath? _defaultInstance;

  /// Whether only one prevout should be used to calculate the Sighash.
  /// Normally this is `false`.
  @$pb.TagNumber(1)
  $core.bool get onePrevout => $_getBF(0);
  @$pb.TagNumber(1)
  set onePrevout($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOnePrevout() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnePrevout() => clearField(1);

  /// The recipient.
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);
}

class Input_InputTaprootScriptPath extends $pb.GeneratedMessage {
  factory Input_InputTaprootScriptPath({
    $core.bool? onePrevout,
    $core.List<$core.int>? payload,
    $core.List<$core.int>? controlBlock,
  }) {
    final $result = create();
    if (onePrevout != null) {
      $result.onePrevout = onePrevout;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    if (controlBlock != null) {
      $result.controlBlock = controlBlock;
    }
    return $result;
  }
  Input_InputTaprootScriptPath._() : super();
  factory Input_InputTaprootScriptPath.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input_InputTaprootScriptPath.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputTaprootScriptPath',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'onePrevout')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'controlBlock', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input_InputTaprootScriptPath clone() =>
      Input_InputTaprootScriptPath()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input_InputTaprootScriptPath copyWith(
          void Function(Input_InputTaprootScriptPath) updates) =>
      super.copyWith(
              (message) => updates(message as Input_InputTaprootScriptPath))
          as Input_InputTaprootScriptPath;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputTaprootScriptPath create() =>
      Input_InputTaprootScriptPath._();
  Input_InputTaprootScriptPath createEmptyInstance() => create();
  static $pb.PbList<Input_InputTaprootScriptPath> createRepeated() =>
      $pb.PbList<Input_InputTaprootScriptPath>();
  @$core.pragma('dart2js:noInline')
  static Input_InputTaprootScriptPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputTaprootScriptPath>(create);
  static Input_InputTaprootScriptPath? _defaultInstance;

  /// Whether only one prevout should be used to calculate the Sighash.
  /// Normally this is `false`.
  @$pb.TagNumber(1)
  $core.bool get onePrevout => $_getBF(0);
  @$pb.TagNumber(1)
  set onePrevout($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOnePrevout() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnePrevout() => clearField(1);

  /// The payload of the Taproot transaction.
  @$pb.TagNumber(2)
  $core.List<$core.int> get payload => $_getN(1);
  @$pb.TagNumber(2)
  set payload($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayload() => clearField(2);

  /// The control block of the Taproot transaction required for claiming.
  @$pb.TagNumber(3)
  $core.List<$core.int> get controlBlock => $_getN(2);
  @$pb.TagNumber(3)
  set controlBlock($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasControlBlock() => $_has(2);
  @$pb.TagNumber(3)
  void clearControlBlock() => clearField(3);
}

class Input_InputOrdinalInscription extends $pb.GeneratedMessage {
  factory Input_InputOrdinalInscription({
    $core.bool? onePrevout,
    $core.List<$core.int>? inscribeTo,
    $core.String? mimeType,
    $core.List<$core.int>? payload,
  }) {
    final $result = create();
    if (onePrevout != null) {
      $result.onePrevout = onePrevout;
    }
    if (inscribeTo != null) {
      $result.inscribeTo = inscribeTo;
    }
    if (mimeType != null) {
      $result.mimeType = mimeType;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  Input_InputOrdinalInscription._() : super();
  factory Input_InputOrdinalInscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input_InputOrdinalInscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputOrdinalInscription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'onePrevout')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'inscribeTo', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'mimeType')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input_InputOrdinalInscription clone() =>
      Input_InputOrdinalInscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input_InputOrdinalInscription copyWith(
          void Function(Input_InputOrdinalInscription) updates) =>
      super.copyWith(
              (message) => updates(message as Input_InputOrdinalInscription))
          as Input_InputOrdinalInscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputOrdinalInscription create() =>
      Input_InputOrdinalInscription._();
  Input_InputOrdinalInscription createEmptyInstance() => create();
  static $pb.PbList<Input_InputOrdinalInscription> createRepeated() =>
      $pb.PbList<Input_InputOrdinalInscription>();
  @$core.pragma('dart2js:noInline')
  static Input_InputOrdinalInscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputOrdinalInscription>(create);
  static Input_InputOrdinalInscription? _defaultInstance;

  /// Whether only one prevout should be used to calculate the Sighash.
  /// Normally this is `false`.
  @$pb.TagNumber(1)
  $core.bool get onePrevout => $_getBF(0);
  @$pb.TagNumber(1)
  set onePrevout($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOnePrevout() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnePrevout() => clearField(1);

  /// The recipient of the inscription, usually the sender.
  @$pb.TagNumber(2)
  $core.List<$core.int> get inscribeTo => $_getN(1);
  @$pb.TagNumber(2)
  set inscribeTo($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInscribeTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInscribeTo() => clearField(2);

  /// The MIME type of the inscription, such as `image/png`, etc.
  @$pb.TagNumber(3)
  $core.String get mimeType => $_getSZ(2);
  @$pb.TagNumber(3)
  set mimeType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMimeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMimeType() => clearField(3);

  /// The actual inscription content.
  @$pb.TagNumber(4)
  $core.List<$core.int> get payload => $_getN(3);
  @$pb.TagNumber(4)
  set payload($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPayload() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayload() => clearField(4);
}

class Input_InputBrc20Inscription extends $pb.GeneratedMessage {
  factory Input_InputBrc20Inscription({
    $core.bool? onePrevout,
    $core.List<$core.int>? inscribeTo,
    $core.String? ticker,
    $fixnum.Int64? transferAmount,
  }) {
    final $result = create();
    if (onePrevout != null) {
      $result.onePrevout = onePrevout;
    }
    if (inscribeTo != null) {
      $result.inscribeTo = inscribeTo;
    }
    if (ticker != null) {
      $result.ticker = ticker;
    }
    if (transferAmount != null) {
      $result.transferAmount = transferAmount;
    }
    return $result;
  }
  Input_InputBrc20Inscription._() : super();
  factory Input_InputBrc20Inscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input_InputBrc20Inscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputBrc20Inscription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'onePrevout')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'inscribeTo', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'ticker')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'transferAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input_InputBrc20Inscription clone() =>
      Input_InputBrc20Inscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input_InputBrc20Inscription copyWith(
          void Function(Input_InputBrc20Inscription) updates) =>
      super.copyWith(
              (message) => updates(message as Input_InputBrc20Inscription))
          as Input_InputBrc20Inscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputBrc20Inscription create() =>
      Input_InputBrc20Inscription._();
  Input_InputBrc20Inscription createEmptyInstance() => create();
  static $pb.PbList<Input_InputBrc20Inscription> createRepeated() =>
      $pb.PbList<Input_InputBrc20Inscription>();
  @$core.pragma('dart2js:noInline')
  static Input_InputBrc20Inscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputBrc20Inscription>(create);
  static Input_InputBrc20Inscription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get onePrevout => $_getBF(0);
  @$pb.TagNumber(1)
  set onePrevout($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOnePrevout() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnePrevout() => clearField(1);

  /// The recipient of the inscription, usually the sender.
  @$pb.TagNumber(2)
  $core.List<$core.int> get inscribeTo => $_getN(1);
  @$pb.TagNumber(2)
  set inscribeTo($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInscribeTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInscribeTo() => clearField(2);

  /// The ticker of the BRC20 inscription.
  @$pb.TagNumber(3)
  $core.String get ticker => $_getSZ(2);
  @$pb.TagNumber(3)
  set ticker($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTicker() => $_has(2);
  @$pb.TagNumber(3)
  void clearTicker() => clearField(3);

  /// The BRC20 token transfer amount.
  @$pb.TagNumber(4)
  $fixnum.Int64 get transferAmount => $_getI64(3);
  @$pb.TagNumber(4)
  set transferAmount($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTransferAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransferAmount() => clearField(4);
}

enum Input_ToRecipient { builder, customScript, notSet }

class Input extends $pb.GeneratedMessage {
  factory Input({
    $core.List<$core.int>? privateKey,
    $core.List<$core.int>? txid,
    $core.int? vout,
    $core.int? sequence,
    $core.bool? sequenceEnableZero,
    $fixnum.Int64? value,
    $1.SighashType? sighashType,
    Input_InputBuilder? builder,
    Input_InputScriptWitness? customScript,
  }) {
    final $result = create();
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (vout != null) {
      $result.vout = vout;
    }
    if (sequence != null) {
      $result.sequence = sequence;
    }
    if (sequenceEnableZero != null) {
      $result.sequenceEnableZero = sequenceEnableZero;
    }
    if (value != null) {
      $result.value = value;
    }
    if (sighashType != null) {
      $result.sighashType = sighashType;
    }
    if (builder != null) {
      $result.builder = builder;
    }
    if (customScript != null) {
      $result.customScript = customScript;
    }
    return $result;
  }
  Input._() : super();
  factory Input.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Input.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Input_ToRecipient> _Input_ToRecipientByTag =
      {
    8: Input_ToRecipient.builder,
    9: Input_ToRecipient.customScript,
    0: Input_ToRecipient.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [8, 9])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'vout', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU3)
    ..aOB(5, _omitFieldNames ? '' : 'sequenceEnableZero')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$1.SighashType>(
        7, _omitFieldNames ? '' : 'sighashType', $pb.PbFieldType.OE,
        defaultOrMaker: $1.SighashType.UseDefault,
        valueOf: $1.SighashType.valueOf,
        enumValues: $1.SighashType.values)
    ..aOM<Input_InputBuilder>(8, _omitFieldNames ? '' : 'builder',
        subBuilder: Input_InputBuilder.create)
    ..aOM<Input_InputScriptWitness>(9, _omitFieldNames ? '' : 'customScript',
        subBuilder: Input_InputScriptWitness.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Input clone() => Input()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Input copyWith(void Function(Input) updates) =>
      super.copyWith((message) => updates(message as Input)) as Input;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input create() => Input._();
  Input createEmptyInstance() => create();
  static $pb.PbList<Input> createRepeated() => $pb.PbList<Input>();
  @$core.pragma('dart2js:noInline')
  static Input getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Input>(create);
  static Input? _defaultInstance;

  Input_ToRecipient whichToRecipient() =>
      _Input_ToRecipientByTag[$_whichOneof(0)]!;
  void clearToRecipient() => clearField($_whichOneof(0));

  /// Use an individual private key for this input. Only required if the `sign`
  /// method is called.
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  /// The referenced transaction ID in REVERSED order.
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

  /// The position in the previous transactions output that this input
  /// references.
  @$pb.TagNumber(3)
  $core.int get vout => $_getIZ(2);
  @$pb.TagNumber(3)
  set vout($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVout() => $_has(2);
  @$pb.TagNumber(3)
  void clearVout() => clearField(3);

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

  /// If the sequence is a zero value, this field must be set to `true`.
  @$pb.TagNumber(5)
  $core.bool get sequenceEnableZero => $_getBF(4);
  @$pb.TagNumber(5)
  set sequenceEnableZero($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSequenceEnableZero() => $_has(4);
  @$pb.TagNumber(5)
  void clearSequenceEnableZero() => clearField(5);

  /// The amount of satoshis of this input. Required for producing
  /// Segwit/Taproot transactions.
  @$pb.TagNumber(6)
  $fixnum.Int64 get value => $_getI64(5);
  @$pb.TagNumber(6)
  set value($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearValue() => clearField(6);

  /// The sighash type, normally `SighashType::UseDefault` (All).
  @$pb.TagNumber(7)
  $1.SighashType get sighashType => $_getN(6);
  @$pb.TagNumber(7)
  set sighashType($1.SighashType v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSighashType() => $_has(6);
  @$pb.TagNumber(7)
  void clearSighashType() => clearField(7);

  /// Construct input with a buildler pattern.
  @$pb.TagNumber(8)
  Input_InputBuilder get builder => $_getN(7);
  @$pb.TagNumber(8)
  set builder(Input_InputBuilder v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBuilder() => $_has(7);
  @$pb.TagNumber(8)
  void clearBuilder() => clearField(8);
  @$pb.TagNumber(8)
  Input_InputBuilder ensureBuilder() => $_ensure(7);

  /// Construct input by providing raw spending information directly.
  @$pb.TagNumber(9)
  Input_InputScriptWitness get customScript => $_getN(8);
  @$pb.TagNumber(9)
  set customScript(Input_InputScriptWitness v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCustomScript() => $_has(8);
  @$pb.TagNumber(9)
  void clearCustomScript() => clearField(9);
  @$pb.TagNumber(9)
  Input_InputScriptWitness ensureCustomScript() => $_ensure(8);
}

enum Output_OutputBuilder_Variant {
  p2sh,
  p2pkh,
  p2wsh,
  p2wpkh,
  p2trKeyPath,
  p2trScriptPath,
  p2trDangerousAssumeTweaked,
  brc20Inscribe,
  ordinalInscribe,
  notSet
}

class Output_OutputBuilder extends $pb.GeneratedMessage {
  factory Output_OutputBuilder({
    Output_OutputRedeemScriptOrHash? p2sh,
    ToPublicKeyOrHash? p2pkh,
    Output_OutputRedeemScriptOrHash? p2wsh,
    ToPublicKeyOrHash? p2wpkh,
    $core.List<$core.int>? p2trKeyPath,
    Output_OutputTaprootScriptPath? p2trScriptPath,
    $core.List<$core.int>? p2trDangerousAssumeTweaked,
    Output_OutputBrc20Inscription? brc20Inscribe,
    Output_OutputOrdinalInscription? ordinalInscribe,
  }) {
    final $result = create();
    if (p2sh != null) {
      $result.p2sh = p2sh;
    }
    if (p2pkh != null) {
      $result.p2pkh = p2pkh;
    }
    if (p2wsh != null) {
      $result.p2wsh = p2wsh;
    }
    if (p2wpkh != null) {
      $result.p2wpkh = p2wpkh;
    }
    if (p2trKeyPath != null) {
      $result.p2trKeyPath = p2trKeyPath;
    }
    if (p2trScriptPath != null) {
      $result.p2trScriptPath = p2trScriptPath;
    }
    if (p2trDangerousAssumeTweaked != null) {
      $result.p2trDangerousAssumeTweaked = p2trDangerousAssumeTweaked;
    }
    if (brc20Inscribe != null) {
      $result.brc20Inscribe = brc20Inscribe;
    }
    if (ordinalInscribe != null) {
      $result.ordinalInscribe = ordinalInscribe;
    }
    return $result;
  }
  Output_OutputBuilder._() : super();
  factory Output_OutputBuilder.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Output_OutputBuilder.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Output_OutputBuilder_Variant>
      _Output_OutputBuilder_VariantByTag = {
    1: Output_OutputBuilder_Variant.p2sh,
    2: Output_OutputBuilder_Variant.p2pkh,
    3: Output_OutputBuilder_Variant.p2wsh,
    4: Output_OutputBuilder_Variant.p2wpkh,
    5: Output_OutputBuilder_Variant.p2trKeyPath,
    6: Output_OutputBuilder_Variant.p2trScriptPath,
    7: Output_OutputBuilder_Variant.p2trDangerousAssumeTweaked,
    8: Output_OutputBuilder_Variant.brc20Inscribe,
    9: Output_OutputBuilder_Variant.ordinalInscribe,
    0: Output_OutputBuilder_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputBuilder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9])
    ..aOM<Output_OutputRedeemScriptOrHash>(1, _omitFieldNames ? '' : 'p2sh',
        subBuilder: Output_OutputRedeemScriptOrHash.create)
    ..aOM<ToPublicKeyOrHash>(2, _omitFieldNames ? '' : 'p2pkh',
        subBuilder: ToPublicKeyOrHash.create)
    ..aOM<Output_OutputRedeemScriptOrHash>(3, _omitFieldNames ? '' : 'p2wsh',
        subBuilder: Output_OutputRedeemScriptOrHash.create)
    ..aOM<ToPublicKeyOrHash>(4, _omitFieldNames ? '' : 'p2wpkh',
        subBuilder: ToPublicKeyOrHash.create)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'p2trKeyPath', $pb.PbFieldType.OY)
    ..aOM<Output_OutputTaprootScriptPath>(
        6, _omitFieldNames ? '' : 'p2trScriptPath',
        subBuilder: Output_OutputTaprootScriptPath.create)
    ..a<$core.List<$core.int>>(7,
        _omitFieldNames ? '' : 'p2trDangerousAssumeTweaked', $pb.PbFieldType.OY)
    ..aOM<Output_OutputBrc20Inscription>(
        8, _omitFieldNames ? '' : 'brc20Inscribe',
        subBuilder: Output_OutputBrc20Inscription.create)
    ..aOM<Output_OutputOrdinalInscription>(
        9, _omitFieldNames ? '' : 'ordinalInscribe',
        subBuilder: Output_OutputOrdinalInscription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Output_OutputBuilder clone() =>
      Output_OutputBuilder()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Output_OutputBuilder copyWith(void Function(Output_OutputBuilder) updates) =>
      super.copyWith((message) => updates(message as Output_OutputBuilder))
          as Output_OutputBuilder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputBuilder create() => Output_OutputBuilder._();
  Output_OutputBuilder createEmptyInstance() => create();
  static $pb.PbList<Output_OutputBuilder> createRepeated() =>
      $pb.PbList<Output_OutputBuilder>();
  @$core.pragma('dart2js:noInline')
  static Output_OutputBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputBuilder>(create);
  static Output_OutputBuilder? _defaultInstance;

  Output_OutputBuilder_Variant whichVariant() =>
      _Output_OutputBuilder_VariantByTag[$_whichOneof(0)]!;
  void clearVariant() => clearField($_whichOneof(0));

  /// Pay-to-Script-Hash, specify the hash.
  @$pb.TagNumber(1)
  Output_OutputRedeemScriptOrHash get p2sh => $_getN(0);
  @$pb.TagNumber(1)
  set p2sh(Output_OutputRedeemScriptOrHash v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasP2sh() => $_has(0);
  @$pb.TagNumber(1)
  void clearP2sh() => clearField(1);
  @$pb.TagNumber(1)
  Output_OutputRedeemScriptOrHash ensureP2sh() => $_ensure(0);

  /// Pay-to-Public-Key-Hash
  @$pb.TagNumber(2)
  ToPublicKeyOrHash get p2pkh => $_getN(1);
  @$pb.TagNumber(2)
  set p2pkh(ToPublicKeyOrHash v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasP2pkh() => $_has(1);
  @$pb.TagNumber(2)
  void clearP2pkh() => clearField(2);
  @$pb.TagNumber(2)
  ToPublicKeyOrHash ensureP2pkh() => $_ensure(1);

  /// Pay-to-Witness-Script-Hash, specify the hash.
  @$pb.TagNumber(3)
  Output_OutputRedeemScriptOrHash get p2wsh => $_getN(2);
  @$pb.TagNumber(3)
  set p2wsh(Output_OutputRedeemScriptOrHash v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasP2wsh() => $_has(2);
  @$pb.TagNumber(3)
  void clearP2wsh() => clearField(3);
  @$pb.TagNumber(3)
  Output_OutputRedeemScriptOrHash ensureP2wsh() => $_ensure(2);

  /// Pay-to-Public-Key-Hash
  @$pb.TagNumber(4)
  ToPublicKeyOrHash get p2wpkh => $_getN(3);
  @$pb.TagNumber(4)
  set p2wpkh(ToPublicKeyOrHash v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasP2wpkh() => $_has(3);
  @$pb.TagNumber(4)
  void clearP2wpkh() => clearField(4);
  @$pb.TagNumber(4)
  ToPublicKeyOrHash ensureP2wpkh() => $_ensure(3);

  /// Pay-to-Taproot-key-path (balance transfers), specify the public key.
  @$pb.TagNumber(5)
  $core.List<$core.int> get p2trKeyPath => $_getN(4);
  @$pb.TagNumber(5)
  set p2trKeyPath($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasP2trKeyPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearP2trKeyPath() => clearField(5);

  /// Pay-to-Taproot-script-path (complex transfers)
  @$pb.TagNumber(6)
  Output_OutputTaprootScriptPath get p2trScriptPath => $_getN(5);
  @$pb.TagNumber(6)
  set p2trScriptPath(Output_OutputTaprootScriptPath v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasP2trScriptPath() => $_has(5);
  @$pb.TagNumber(6)
  void clearP2trScriptPath() => clearField(6);
  @$pb.TagNumber(6)
  Output_OutputTaprootScriptPath ensureP2trScriptPath() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get p2trDangerousAssumeTweaked => $_getN(6);
  @$pb.TagNumber(7)
  set p2trDangerousAssumeTweaked($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasP2trDangerousAssumeTweaked() => $_has(6);
  @$pb.TagNumber(7)
  void clearP2trDangerousAssumeTweaked() => clearField(7);

  @$pb.TagNumber(8)
  Output_OutputBrc20Inscription get brc20Inscribe => $_getN(7);
  @$pb.TagNumber(8)
  set brc20Inscribe(Output_OutputBrc20Inscription v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBrc20Inscribe() => $_has(7);
  @$pb.TagNumber(8)
  void clearBrc20Inscribe() => clearField(8);
  @$pb.TagNumber(8)
  Output_OutputBrc20Inscription ensureBrc20Inscribe() => $_ensure(7);

  @$pb.TagNumber(9)
  Output_OutputOrdinalInscription get ordinalInscribe => $_getN(8);
  @$pb.TagNumber(9)
  set ordinalInscribe(Output_OutputOrdinalInscription v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOrdinalInscribe() => $_has(8);
  @$pb.TagNumber(9)
  void clearOrdinalInscribe() => clearField(9);
  @$pb.TagNumber(9)
  Output_OutputOrdinalInscription ensureOrdinalInscribe() => $_ensure(8);
}

enum Output_OutputRedeemScriptOrHash_Variant { redeemScript, hash, notSet }

class Output_OutputRedeemScriptOrHash extends $pb.GeneratedMessage {
  factory Output_OutputRedeemScriptOrHash({
    $core.List<$core.int>? redeemScript,
    $core.List<$core.int>? hash,
  }) {
    final $result = create();
    if (redeemScript != null) {
      $result.redeemScript = redeemScript;
    }
    if (hash != null) {
      $result.hash = hash;
    }
    return $result;
  }
  Output_OutputRedeemScriptOrHash._() : super();
  factory Output_OutputRedeemScriptOrHash.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Output_OutputRedeemScriptOrHash.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Output_OutputRedeemScriptOrHash_Variant>
      _Output_OutputRedeemScriptOrHash_VariantByTag = {
    1: Output_OutputRedeemScriptOrHash_Variant.redeemScript,
    2: Output_OutputRedeemScriptOrHash_Variant.hash,
    0: Output_OutputRedeemScriptOrHash_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputRedeemScriptOrHash',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'redeemScript', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Output_OutputRedeemScriptOrHash clone() =>
      Output_OutputRedeemScriptOrHash()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Output_OutputRedeemScriptOrHash copyWith(
          void Function(Output_OutputRedeemScriptOrHash) updates) =>
      super.copyWith(
              (message) => updates(message as Output_OutputRedeemScriptOrHash))
          as Output_OutputRedeemScriptOrHash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputRedeemScriptOrHash create() =>
      Output_OutputRedeemScriptOrHash._();
  Output_OutputRedeemScriptOrHash createEmptyInstance() => create();
  static $pb.PbList<Output_OutputRedeemScriptOrHash> createRepeated() =>
      $pb.PbList<Output_OutputRedeemScriptOrHash>();
  @$core.pragma('dart2js:noInline')
  static Output_OutputRedeemScriptOrHash getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputRedeemScriptOrHash>(
          create);
  static Output_OutputRedeemScriptOrHash? _defaultInstance;

  Output_OutputRedeemScriptOrHash_Variant whichVariant() =>
      _Output_OutputRedeemScriptOrHash_VariantByTag[$_whichOneof(0)]!;
  void clearVariant() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get redeemScript => $_getN(0);
  @$pb.TagNumber(1)
  set redeemScript($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRedeemScript() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedeemScript() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);
}

class Output_OutputTaprootScriptPath extends $pb.GeneratedMessage {
  factory Output_OutputTaprootScriptPath({
    $core.List<$core.int>? internalKey,
    $core.List<$core.int>? merkleRoot,
  }) {
    final $result = create();
    if (internalKey != null) {
      $result.internalKey = internalKey;
    }
    if (merkleRoot != null) {
      $result.merkleRoot = merkleRoot;
    }
    return $result;
  }
  Output_OutputTaprootScriptPath._() : super();
  factory Output_OutputTaprootScriptPath.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Output_OutputTaprootScriptPath.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputTaprootScriptPath',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'internalKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'merkleRoot', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Output_OutputTaprootScriptPath clone() =>
      Output_OutputTaprootScriptPath()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Output_OutputTaprootScriptPath copyWith(
          void Function(Output_OutputTaprootScriptPath) updates) =>
      super.copyWith(
              (message) => updates(message as Output_OutputTaprootScriptPath))
          as Output_OutputTaprootScriptPath;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputTaprootScriptPath create() =>
      Output_OutputTaprootScriptPath._();
  Output_OutputTaprootScriptPath createEmptyInstance() => create();
  static $pb.PbList<Output_OutputTaprootScriptPath> createRepeated() =>
      $pb.PbList<Output_OutputTaprootScriptPath>();
  @$core.pragma('dart2js:noInline')
  static Output_OutputTaprootScriptPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputTaprootScriptPath>(create);
  static Output_OutputTaprootScriptPath? _defaultInstance;

  /// The internal key, usually the public key of the recipient.
  @$pb.TagNumber(1)
  $core.List<$core.int> get internalKey => $_getN(0);
  @$pb.TagNumber(1)
  set internalKey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInternalKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearInternalKey() => clearField(1);

  /// The merkle root of the Taproot script(s), required to compute the sighash.
  @$pb.TagNumber(2)
  $core.List<$core.int> get merkleRoot => $_getN(1);
  @$pb.TagNumber(2)
  set merkleRoot($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMerkleRoot() => $_has(1);
  @$pb.TagNumber(2)
  void clearMerkleRoot() => clearField(2);
}

class Output_OutputOrdinalInscription extends $pb.GeneratedMessage {
  factory Output_OutputOrdinalInscription({
    $core.List<$core.int>? inscribeTo,
    $core.String? mimeType,
    $core.List<$core.int>? payload,
  }) {
    final $result = create();
    if (inscribeTo != null) {
      $result.inscribeTo = inscribeTo;
    }
    if (mimeType != null) {
      $result.mimeType = mimeType;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  Output_OutputOrdinalInscription._() : super();
  factory Output_OutputOrdinalInscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Output_OutputOrdinalInscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputOrdinalInscription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'inscribeTo', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'mimeType')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Output_OutputOrdinalInscription clone() =>
      Output_OutputOrdinalInscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Output_OutputOrdinalInscription copyWith(
          void Function(Output_OutputOrdinalInscription) updates) =>
      super.copyWith(
              (message) => updates(message as Output_OutputOrdinalInscription))
          as Output_OutputOrdinalInscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputOrdinalInscription create() =>
      Output_OutputOrdinalInscription._();
  Output_OutputOrdinalInscription createEmptyInstance() => create();
  static $pb.PbList<Output_OutputOrdinalInscription> createRepeated() =>
      $pb.PbList<Output_OutputOrdinalInscription>();
  @$core.pragma('dart2js:noInline')
  static Output_OutputOrdinalInscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputOrdinalInscription>(
          create);
  static Output_OutputOrdinalInscription? _defaultInstance;

  /// The recipient of the inscription, usually the sender.
  @$pb.TagNumber(1)
  $core.List<$core.int> get inscribeTo => $_getN(0);
  @$pb.TagNumber(1)
  set inscribeTo($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInscribeTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInscribeTo() => clearField(1);

  /// The MIME type of the inscription, such as `image/png`, etc.
  @$pb.TagNumber(2)
  $core.String get mimeType => $_getSZ(1);
  @$pb.TagNumber(2)
  set mimeType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMimeType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMimeType() => clearField(2);

  /// The actual inscription content.
  @$pb.TagNumber(3)
  $core.List<$core.int> get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => clearField(3);
}

class Output_OutputBrc20Inscription extends $pb.GeneratedMessage {
  factory Output_OutputBrc20Inscription({
    $core.List<$core.int>? inscribeTo,
    $core.String? ticker,
    $fixnum.Int64? transferAmount,
  }) {
    final $result = create();
    if (inscribeTo != null) {
      $result.inscribeTo = inscribeTo;
    }
    if (ticker != null) {
      $result.ticker = ticker;
    }
    if (transferAmount != null) {
      $result.transferAmount = transferAmount;
    }
    return $result;
  }
  Output_OutputBrc20Inscription._() : super();
  factory Output_OutputBrc20Inscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Output_OutputBrc20Inscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputBrc20Inscription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'inscribeTo', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'ticker')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'transferAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Output_OutputBrc20Inscription clone() =>
      Output_OutputBrc20Inscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Output_OutputBrc20Inscription copyWith(
          void Function(Output_OutputBrc20Inscription) updates) =>
      super.copyWith(
              (message) => updates(message as Output_OutputBrc20Inscription))
          as Output_OutputBrc20Inscription;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputBrc20Inscription create() =>
      Output_OutputBrc20Inscription._();
  Output_OutputBrc20Inscription createEmptyInstance() => create();
  static $pb.PbList<Output_OutputBrc20Inscription> createRepeated() =>
      $pb.PbList<Output_OutputBrc20Inscription>();
  @$core.pragma('dart2js:noInline')
  static Output_OutputBrc20Inscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputBrc20Inscription>(create);
  static Output_OutputBrc20Inscription? _defaultInstance;

  /// The recipient of the inscription, usually the sender.
  @$pb.TagNumber(1)
  $core.List<$core.int> get inscribeTo => $_getN(0);
  @$pb.TagNumber(1)
  set inscribeTo($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInscribeTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInscribeTo() => clearField(1);

  /// The ticker of the BRC20 inscription.
  @$pb.TagNumber(2)
  $core.String get ticker => $_getSZ(1);
  @$pb.TagNumber(2)
  set ticker($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTicker() => $_has(1);
  @$pb.TagNumber(2)
  void clearTicker() => clearField(2);

  /// The BRC20 token transfer amount.
  @$pb.TagNumber(3)
  $fixnum.Int64 get transferAmount => $_getI64(2);
  @$pb.TagNumber(3)
  set transferAmount($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTransferAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferAmount() => clearField(3);
}

enum Output_ToRecipient { builder, customScriptPubkey, fromAddress, notSet }

class Output extends $pb.GeneratedMessage {
  factory Output({
    $fixnum.Int64? value,
    Output_OutputBuilder? builder,
    $core.List<$core.int>? customScriptPubkey,
    $core.String? fromAddress,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (builder != null) {
      $result.builder = builder;
    }
    if (customScriptPubkey != null) {
      $result.customScriptPubkey = customScriptPubkey;
    }
    if (fromAddress != null) {
      $result.fromAddress = fromAddress;
    }
    return $result;
  }
  Output._() : super();
  factory Output.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Output.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Output_ToRecipient>
      _Output_ToRecipientByTag = {
    2: Output_ToRecipient.builder,
    3: Output_ToRecipient.customScriptPubkey,
    4: Output_ToRecipient.fromAddress,
    0: Output_ToRecipient.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Output_OutputBuilder>(2, _omitFieldNames ? '' : 'builder',
        subBuilder: Output_OutputBuilder.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'customScriptPubkey', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'fromAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Output clone() => Output()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Output copyWith(void Function(Output) updates) =>
      super.copyWith((message) => updates(message as Output)) as Output;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output create() => Output._();
  Output createEmptyInstance() => create();
  static $pb.PbList<Output> createRepeated() => $pb.PbList<Output>();
  @$core.pragma('dart2js:noInline')
  static Output getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Output>(create);
  static Output? _defaultInstance;

  Output_ToRecipient whichToRecipient() =>
      _Output_ToRecipientByTag[$_whichOneof(0)]!;
  void clearToRecipient() => clearField($_whichOneof(0));

  /// The amount of satoshis to spend.
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

  /// Construct output with builder pattern.
  @$pb.TagNumber(2)
  Output_OutputBuilder get builder => $_getN(1);
  @$pb.TagNumber(2)
  set builder(Output_OutputBuilder v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBuilder() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuilder() => clearField(2);
  @$pb.TagNumber(2)
  Output_OutputBuilder ensureBuilder() => $_ensure(1);

  /// Construct output by providing the scriptPubkey directly.
  @$pb.TagNumber(3)
  $core.List<$core.int> get customScriptPubkey => $_getN(2);
  @$pb.TagNumber(3)
  set customScriptPubkey($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCustomScriptPubkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomScriptPubkey() => clearField(3);

  /// Derive the expected output from the provided address.
  @$pb.TagNumber(4)
  $core.String get fromAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set fromAddress($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFromAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromAddress() => clearField(4);
}

enum ToPublicKeyOrHash_ToAddress { pubkey, hash, notSet }

class ToPublicKeyOrHash extends $pb.GeneratedMessage {
  factory ToPublicKeyOrHash({
    $core.List<$core.int>? pubkey,
    $core.List<$core.int>? hash,
  }) {
    final $result = create();
    if (pubkey != null) {
      $result.pubkey = pubkey;
    }
    if (hash != null) {
      $result.hash = hash;
    }
    return $result;
  }
  ToPublicKeyOrHash._() : super();
  factory ToPublicKeyOrHash.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ToPublicKeyOrHash.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ToPublicKeyOrHash_ToAddress>
      _ToPublicKeyOrHash_ToAddressByTag = {
    1: ToPublicKeyOrHash_ToAddress.pubkey,
    2: ToPublicKeyOrHash_ToAddress.hash,
    0: ToPublicKeyOrHash_ToAddress.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ToPublicKeyOrHash',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'pubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToPublicKeyOrHash clone() => ToPublicKeyOrHash()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToPublicKeyOrHash copyWith(void Function(ToPublicKeyOrHash) updates) =>
      super.copyWith((message) => updates(message as ToPublicKeyOrHash))
          as ToPublicKeyOrHash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToPublicKeyOrHash create() => ToPublicKeyOrHash._();
  ToPublicKeyOrHash createEmptyInstance() => create();
  static $pb.PbList<ToPublicKeyOrHash> createRepeated() =>
      $pb.PbList<ToPublicKeyOrHash>();
  @$core.pragma('dart2js:noInline')
  static ToPublicKeyOrHash getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToPublicKeyOrHash>(create);
  static ToPublicKeyOrHash? _defaultInstance;

  ToPublicKeyOrHash_ToAddress whichToAddress() =>
      _ToPublicKeyOrHash_ToAddressByTag[$_whichOneof(0)]!;
  void clearToAddress() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get pubkey => $_getN(0);
  @$pb.TagNumber(1)
  set pubkey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPubkey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);
}

/// The output of a transaction.
class PreSigningOutput_TxOut extends $pb.GeneratedMessage {
  factory PreSigningOutput_TxOut({
    $fixnum.Int64? value,
    $core.List<$core.int>? scriptPubkey,
    $core.List<$core.int>? taprootPayload,
    $core.List<$core.int>? controlBlock,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (scriptPubkey != null) {
      $result.scriptPubkey = scriptPubkey;
    }
    if (taprootPayload != null) {
      $result.taprootPayload = taprootPayload;
    }
    if (controlBlock != null) {
      $result.controlBlock = controlBlock;
    }
    return $result;
  }
  PreSigningOutput_TxOut._() : super();
  factory PreSigningOutput_TxOut.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PreSigningOutput_TxOut.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreSigningOutput.TxOut',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'scriptPubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'taprootPayload', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'controlBlock', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PreSigningOutput_TxOut clone() =>
      PreSigningOutput_TxOut()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PreSigningOutput_TxOut copyWith(
          void Function(PreSigningOutput_TxOut) updates) =>
      super.copyWith((message) => updates(message as PreSigningOutput_TxOut))
          as PreSigningOutput_TxOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreSigningOutput_TxOut create() => PreSigningOutput_TxOut._();
  PreSigningOutput_TxOut createEmptyInstance() => create();
  static $pb.PbList<PreSigningOutput_TxOut> createRepeated() =>
      $pb.PbList<PreSigningOutput_TxOut>();
  @$core.pragma('dart2js:noInline')
  static PreSigningOutput_TxOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreSigningOutput_TxOut>(create);
  static PreSigningOutput_TxOut? _defaultInstance;

  /// The value of the output (in satoshis).
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

  /// The payload of the Taproot script.
  @$pb.TagNumber(3)
  $core.List<$core.int> get taprootPayload => $_getN(2);
  @$pb.TagNumber(3)
  set taprootPayload($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTaprootPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaprootPayload() => clearField(3);

  /// The optional control block for a Taproot output (P2TR script-path).
  @$pb.TagNumber(4)
  $core.List<$core.int> get controlBlock => $_getN(3);
  @$pb.TagNumber(4)
  set controlBlock($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasControlBlock() => $_has(3);
  @$pb.TagNumber(4)
  void clearControlBlock() => clearField(4);
}

class PreSigningOutput extends $pb.GeneratedMessage {
  factory PreSigningOutput({
    Error? error,
    $core.String? errorMessage,
    $core.List<$core.int>? txid,
    $core.Iterable<$1.Sighash>? sighashes,
    $core.Iterable<$1.TxIn>? utxoInputs,
    $core.Iterable<PreSigningOutput_TxOut>? utxoOutputs,
    $fixnum.Int64? weightEstimate,
    $fixnum.Int64? feeEstimate,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (txid != null) {
      $result.txid = txid;
    }
    if (sighashes != null) {
      $result.sighashes.addAll(sighashes);
    }
    if (utxoInputs != null) {
      $result.utxoInputs.addAll(utxoInputs);
    }
    if (utxoOutputs != null) {
      $result.utxoOutputs.addAll(utxoOutputs);
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..e<Error>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: Error.OK,
        valueOf: Error.valueOf,
        enumValues: Error.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..pc<$1.Sighash>(4, _omitFieldNames ? '' : 'sighashes', $pb.PbFieldType.PM,
        subBuilder: $1.Sighash.create)
    ..pc<$1.TxIn>(5, _omitFieldNames ? '' : 'utxoInputs', $pb.PbFieldType.PM,
        subBuilder: $1.TxIn.create)
    ..pc<PreSigningOutput_TxOut>(
        6, _omitFieldNames ? '' : 'utxoOutputs', $pb.PbFieldType.PM,
        subBuilder: PreSigningOutput_TxOut.create)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'weightEstimate', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'feeEstimate', $pb.PbFieldType.OU6,
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

  /// A possible error, `OK` if none.
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

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);

  /// The transaction ID in NON-reversed order. Note that this must be reversed
  /// when referencing in future transactions.
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

  /// / The sighashes to be signed; ECDSA for legacy and Segwit, Schnorr for Taproot.
  @$pb.TagNumber(4)
  $core.List<$1.Sighash> get sighashes => $_getList(3);

  /// The raw inputs.
  @$pb.TagNumber(5)
  $core.List<$1.TxIn> get utxoInputs => $_getList(4);

  /// The raw outputs.
  @$pb.TagNumber(6)
  $core.List<PreSigningOutput_TxOut> get utxoOutputs => $_getList(5);

  /// The estimated weight of the transaction.
  @$pb.TagNumber(7)
  $fixnum.Int64 get weightEstimate => $_getI64(6);
  @$pb.TagNumber(7)
  set weightEstimate($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWeightEstimate() => $_has(6);
  @$pb.TagNumber(7)
  void clearWeightEstimate() => clearField(7);

  /// The estimated fees of the transaction in satoshis.
  @$pb.TagNumber(8)
  $fixnum.Int64 get feeEstimate => $_getI64(7);
  @$pb.TagNumber(8)
  set feeEstimate($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFeeEstimate() => $_has(7);
  @$pb.TagNumber(8)
  void clearFeeEstimate() => clearField(8);
}

class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    Error? error,
    $core.String? errorMessage,
    Transaction? transaction,
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? txid,
    $fixnum.Int64? weight,
    $fixnum.Int64? fee,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (transaction != null) {
      $result.transaction = transaction;
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
  SigningOutput._() : super();
  factory SigningOutput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SigningOutput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..e<Error>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: Error.OK,
        valueOf: Error.valueOf,
        enumValues: Error.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<Transaction>(3, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'weight', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SigningOutput clone() => SigningOutput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SigningOutput copyWith(void Function(SigningOutput) updates) =>
      super.copyWith((message) => updates(message as SigningOutput))
          as SigningOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningOutput create() => SigningOutput._();
  SigningOutput createEmptyInstance() => create();
  static $pb.PbList<SigningOutput> createRepeated() =>
      $pb.PbList<SigningOutput>();
  @$core.pragma('dart2js:noInline')
  static SigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningOutput>(create);
  static SigningOutput? _defaultInstance;

  /// A possible error, `OK` if none.
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

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);

  @$pb.TagNumber(3)
  Transaction get transaction => $_getN(2);
  @$pb.TagNumber(3)
  set transaction(Transaction v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTransaction() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransaction() => clearField(3);
  @$pb.TagNumber(3)
  Transaction ensureTransaction() => $_ensure(2);

  /// The encoded transaction that submitted to the network.
  @$pb.TagNumber(4)
  $core.List<$core.int> get encoded => $_getN(3);
  @$pb.TagNumber(4)
  set encoded($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEncoded() => $_has(3);
  @$pb.TagNumber(4)
  void clearEncoded() => clearField(4);

  /// The transaction ID in NON-reversed order. Note that this must be reversed
  /// when referencing in future transactions.
  @$pb.TagNumber(5)
  $core.List<$core.int> get txid => $_getN(4);
  @$pb.TagNumber(5)
  set txid($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTxid() => $_has(4);
  @$pb.TagNumber(5)
  void clearTxid() => clearField(5);

  /// The total and final weight of the transaction.
  @$pb.TagNumber(6)
  $fixnum.Int64 get weight => $_getI64(5);
  @$pb.TagNumber(6)
  set weight($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  /// The total and final fee of the transaction in satoshis.
  @$pb.TagNumber(7)
  $fixnum.Int64 get fee => $_getI64(6);
  @$pb.TagNumber(7)
  set fee($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFee() => $_has(6);
  @$pb.TagNumber(7)
  void clearFee() => clearField(7);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.int? version,
    $1.LockTime? lockTime,
    $core.Iterable<TransactionInput>? inputs,
    $core.Iterable<TransactionOutput>? outputs,
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<$1.LockTime>(2, _omitFieldNames ? '' : 'lockTime',
        subBuilder: $1.LockTime.create)
    ..pc<TransactionInput>(
        3, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: TransactionInput.create)
    ..pc<TransactionOutput>(
        4, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM,
        subBuilder: TransactionOutput.create)
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
  /// included in a block. None by default (zero value).
  @$pb.TagNumber(2)
  $1.LockTime get lockTime => $_getN(1);
  @$pb.TagNumber(2)
  set lockTime($1.LockTime v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockTime() => clearField(2);
  @$pb.TagNumber(2)
  $1.LockTime ensureLockTime() => $_ensure(1);

  /// The transaction inputs.
  @$pb.TagNumber(3)
  $core.List<TransactionInput> get inputs => $_getList(2);

  /// The transaction outputs.
  @$pb.TagNumber(4)
  $core.List<TransactionOutput> get outputs => $_getList(3);
}

class TransactionInput extends $pb.GeneratedMessage {
  factory TransactionInput({
    $core.List<$core.int>? txid,
    $core.int? vout,
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
  TransactionInput._() : super();
  factory TransactionInput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionInput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'vout', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'scriptSig', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'witnessItems', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionInput clone() => TransactionInput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionInput copyWith(void Function(TransactionInput) updates) =>
      super.copyWith((message) => updates(message as TransactionInput))
          as TransactionInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInput create() => TransactionInput._();
  TransactionInput createEmptyInstance() => create();
  static $pb.PbList<TransactionInput> createRepeated() =>
      $pb.PbList<TransactionInput>();
  @$core.pragma('dart2js:noInline')
  static TransactionInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionInput>(create);
  static TransactionInput? _defaultInstance;

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
  @$pb.TagNumber(3)
  $core.int get vout => $_getIZ(1);
  @$pb.TagNumber(3)
  set vout($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(3)
  void clearVout() => clearField(3);

  /// The sequence number, used for timelocks, replace-by-fee, etc. Normally
  /// this number is simply 4294967295 (0xFFFFFFFF) .
  @$pb.TagNumber(4)
  $core.int get sequence => $_getIZ(2);
  @$pb.TagNumber(4)
  set sequence($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(2);
  @$pb.TagNumber(4)
  void clearSequence() => clearField(4);

  /// The script for claiming the input (non-Segwit/non-Taproot).
  @$pb.TagNumber(5)
  $core.List<$core.int> get scriptSig => $_getN(3);
  @$pb.TagNumber(5)
  set scriptSig($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScriptSig() => $_has(3);
  @$pb.TagNumber(5)
  void clearScriptSig() => clearField(5);

  /// The script for claiming the input (Segit/Taproot).
  @$pb.TagNumber(6)
  $core.List<$core.List<$core.int>> get witnessItems => $_getList(4);
}

class TransactionOutput extends $pb.GeneratedMessage {
  factory TransactionOutput({
    $core.List<$core.int>? scriptPubkey,
    $fixnum.Int64? value,
    $core.List<$core.int>? taprootPayload,
    $core.List<$core.int>? controlBlock,
  }) {
    final $result = create();
    if (scriptPubkey != null) {
      $result.scriptPubkey = scriptPubkey;
    }
    if (value != null) {
      $result.value = value;
    }
    if (taprootPayload != null) {
      $result.taprootPayload = taprootPayload;
    }
    if (controlBlock != null) {
      $result.controlBlock = controlBlock;
    }
    return $result;
  }
  TransactionOutput._() : super();
  factory TransactionOutput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionOutput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'scriptPubkey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'taprootPayload', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'controlBlock', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionOutput clone() => TransactionOutput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionOutput copyWith(void Function(TransactionOutput) updates) =>
      super.copyWith((message) => updates(message as TransactionOutput))
          as TransactionOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionOutput create() => TransactionOutput._();
  TransactionOutput createEmptyInstance() => create();
  static $pb.PbList<TransactionOutput> createRepeated() =>
      $pb.PbList<TransactionOutput>();
  @$core.pragma('dart2js:noInline')
  static TransactionOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionOutput>(create);
  static TransactionOutput? _defaultInstance;

  /// The condition for claiming the output.
  @$pb.TagNumber(1)
  $core.List<$core.int> get scriptPubkey => $_getN(0);
  @$pb.TagNumber(1)
  set scriptPubkey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScriptPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearScriptPubkey() => clearField(1);

  /// The amount of satoshis to spend.
  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  /// In case of P2TR script-path (complex scripts), this is the payload that
  /// must later be revealed and is required for claiming.
  @$pb.TagNumber(3)
  $core.List<$core.int> get taprootPayload => $_getN(2);
  @$pb.TagNumber(3)
  set taprootPayload($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTaprootPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaprootPayload() => clearField(3);

  /// In case of P2TR script-path (complex scripts), this is the control block
  /// required for claiming.
  @$pb.TagNumber(4)
  $core.List<$core.int> get controlBlock => $_getN(3);
  @$pb.TagNumber(4)
  set controlBlock($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasControlBlock() => $_has(3);
  @$pb.TagNumber(4)
  void clearControlBlock() => clearField(4);
}

class ComposePlan_ComposeBrc20Plan extends $pb.GeneratedMessage {
  factory ComposePlan_ComposeBrc20Plan({
    $core.List<$core.int>? privateKey,
    $core.Iterable<Input>? inputs,
    $1.InputSelector? inputSelector,
    Output? taggedOutput,
    Input_InputBrc20Inscription? inscription,
    $fixnum.Int64? feePerVb,
    Output? changeOutput,
    $core.bool? disableChangeOutput,
  }) {
    final $result = create();
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (inputSelector != null) {
      $result.inputSelector = inputSelector;
    }
    if (taggedOutput != null) {
      $result.taggedOutput = taggedOutput;
    }
    if (inscription != null) {
      $result.inscription = inscription;
    }
    if (feePerVb != null) {
      $result.feePerVb = feePerVb;
    }
    if (changeOutput != null) {
      $result.changeOutput = changeOutput;
    }
    if (disableChangeOutput != null) {
      $result.disableChangeOutput = disableChangeOutput;
    }
    return $result;
  }
  ComposePlan_ComposeBrc20Plan._() : super();
  factory ComposePlan_ComposeBrc20Plan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ComposePlan_ComposeBrc20Plan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComposePlan.ComposeBrc20Plan',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..pc<Input>(2, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM,
        subBuilder: Input.create)
    ..e<$1.InputSelector>(
        3, _omitFieldNames ? '' : 'inputSelector', $pb.PbFieldType.OE,
        defaultOrMaker: $1.InputSelector.UseAll,
        valueOf: $1.InputSelector.valueOf,
        enumValues: $1.InputSelector.values)
    ..aOM<Output>(4, _omitFieldNames ? '' : 'taggedOutput',
        subBuilder: Output.create)
    ..aOM<Input_InputBrc20Inscription>(5, _omitFieldNames ? '' : 'inscription',
        subBuilder: Input_InputBrc20Inscription.create)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'feePerVb', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Output>(7, _omitFieldNames ? '' : 'changeOutput',
        subBuilder: Output.create)
    ..aOB(8, _omitFieldNames ? '' : 'disableChangeOutput')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ComposePlan_ComposeBrc20Plan clone() =>
      ComposePlan_ComposeBrc20Plan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ComposePlan_ComposeBrc20Plan copyWith(
          void Function(ComposePlan_ComposeBrc20Plan) updates) =>
      super.copyWith(
              (message) => updates(message as ComposePlan_ComposeBrc20Plan))
          as ComposePlan_ComposeBrc20Plan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComposePlan_ComposeBrc20Plan create() =>
      ComposePlan_ComposeBrc20Plan._();
  ComposePlan_ComposeBrc20Plan createEmptyInstance() => create();
  static $pb.PbList<ComposePlan_ComposeBrc20Plan> createRepeated() =>
      $pb.PbList<ComposePlan_ComposeBrc20Plan>();
  @$core.pragma('dart2js:noInline')
  static ComposePlan_ComposeBrc20Plan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComposePlan_ComposeBrc20Plan>(create);
  static ComposePlan_ComposeBrc20Plan? _defaultInstance;

  /// (optional) Sets the private key in the composed transactions. Can
  /// also be added manually.
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  /// The inputs for the commit transaction.
  @$pb.TagNumber(2)
  $core.List<Input> get inputs => $_getList(1);

  /// How the inputs for the commit transaction should be selected.
  @$pb.TagNumber(3)
  $1.InputSelector get inputSelector => $_getN(2);
  @$pb.TagNumber(3)
  set inputSelector($1.InputSelector v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInputSelector() => $_has(2);
  @$pb.TagNumber(3)
  void clearInputSelector() => clearField(3);

  /// The tagged output of the inscription. Commonly a P2WPKH transaction
  /// with the value of 546 (dust limit).
  @$pb.TagNumber(4)
  Output get taggedOutput => $_getN(3);
  @$pb.TagNumber(4)
  set taggedOutput(Output v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTaggedOutput() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaggedOutput() => clearField(4);
  @$pb.TagNumber(4)
  Output ensureTaggedOutput() => $_ensure(3);

  /// The BRC20 payload to inscribe.
  @$pb.TagNumber(5)
  Input_InputBrc20Inscription get inscription => $_getN(4);
  @$pb.TagNumber(5)
  set inscription(Input_InputBrc20Inscription v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInscription() => $_has(4);
  @$pb.TagNumber(5)
  void clearInscription() => clearField(5);
  @$pb.TagNumber(5)
  Input_InputBrc20Inscription ensureInscription() => $_ensure(4);

  /// The amount of satoshis per vbyte ("satVb"), used for fee calculation.
  @$pb.TagNumber(6)
  $fixnum.Int64 get feePerVb => $_getI64(5);
  @$pb.TagNumber(6)
  set feePerVb($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFeePerVb() => $_has(5);
  @$pb.TagNumber(6)
  void clearFeePerVb() => clearField(6);

  /// The change output to be added (return to sender).
  /// The `value` can be left at 0.
  @$pb.TagNumber(7)
  Output get changeOutput => $_getN(6);
  @$pb.TagNumber(7)
  set changeOutput(Output v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasChangeOutput() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangeOutput() => clearField(7);
  @$pb.TagNumber(7)
  Output ensureChangeOutput() => $_ensure(6);

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

enum ComposePlan_Compose { brc20, notSet }

class ComposePlan extends $pb.GeneratedMessage {
  factory ComposePlan({
    ComposePlan_ComposeBrc20Plan? brc20,
  }) {
    final $result = create();
    if (brc20 != null) {
      $result.brc20 = brc20;
    }
    return $result;
  }
  ComposePlan._() : super();
  factory ComposePlan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ComposePlan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ComposePlan_Compose>
      _ComposePlan_ComposeByTag = {
    1: ComposePlan_Compose.brc20,
    0: ComposePlan_Compose.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComposePlan',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<ComposePlan_ComposeBrc20Plan>(1, _omitFieldNames ? '' : 'brc20',
        subBuilder: ComposePlan_ComposeBrc20Plan.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ComposePlan clone() => ComposePlan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ComposePlan copyWith(void Function(ComposePlan) updates) =>
      super.copyWith((message) => updates(message as ComposePlan))
          as ComposePlan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComposePlan create() => ComposePlan._();
  ComposePlan createEmptyInstance() => create();
  static $pb.PbList<ComposePlan> createRepeated() => $pb.PbList<ComposePlan>();
  @$core.pragma('dart2js:noInline')
  static ComposePlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComposePlan>(create);
  static ComposePlan? _defaultInstance;

  ComposePlan_Compose whichCompose() =>
      _ComposePlan_ComposeByTag[$_whichOneof(0)]!;
  void clearCompose() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ComposePlan_ComposeBrc20Plan get brc20 => $_getN(0);
  @$pb.TagNumber(1)
  set brc20(ComposePlan_ComposeBrc20Plan v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBrc20() => $_has(0);
  @$pb.TagNumber(1)
  void clearBrc20() => clearField(1);
  @$pb.TagNumber(1)
  ComposePlan_ComposeBrc20Plan ensureBrc20() => $_ensure(0);
}

class TransactionPlan_Brc20Plan extends $pb.GeneratedMessage {
  factory TransactionPlan_Brc20Plan({
    SigningInput? commit,
    SigningInput? reveal,
  }) {
    final $result = create();
    if (commit != null) {
      $result.commit = commit;
    }
    if (reveal != null) {
      $result.reveal = reveal;
    }
    return $result;
  }
  TransactionPlan_Brc20Plan._() : super();
  factory TransactionPlan_Brc20Plan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionPlan_Brc20Plan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionPlan.Brc20Plan',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aOM<SigningInput>(1, _omitFieldNames ? '' : 'commit',
        subBuilder: SigningInput.create)
    ..aOM<SigningInput>(2, _omitFieldNames ? '' : 'reveal',
        subBuilder: SigningInput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionPlan_Brc20Plan clone() =>
      TransactionPlan_Brc20Plan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionPlan_Brc20Plan copyWith(
          void Function(TransactionPlan_Brc20Plan) updates) =>
      super.copyWith((message) => updates(message as TransactionPlan_Brc20Plan))
          as TransactionPlan_Brc20Plan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionPlan_Brc20Plan create() => TransactionPlan_Brc20Plan._();
  TransactionPlan_Brc20Plan createEmptyInstance() => create();
  static $pb.PbList<TransactionPlan_Brc20Plan> createRepeated() =>
      $pb.PbList<TransactionPlan_Brc20Plan>();
  @$core.pragma('dart2js:noInline')
  static TransactionPlan_Brc20Plan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionPlan_Brc20Plan>(create);
  static TransactionPlan_Brc20Plan? _defaultInstance;

  @$pb.TagNumber(1)
  SigningInput get commit => $_getN(0);
  @$pb.TagNumber(1)
  set commit(SigningInput v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommit() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommit() => clearField(1);
  @$pb.TagNumber(1)
  SigningInput ensureCommit() => $_ensure(0);

  @$pb.TagNumber(2)
  SigningInput get reveal => $_getN(1);
  @$pb.TagNumber(2)
  set reveal(SigningInput v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReveal() => $_has(1);
  @$pb.TagNumber(2)
  void clearReveal() => clearField(2);
  @$pb.TagNumber(2)
  SigningInput ensureReveal() => $_ensure(1);
}

enum TransactionPlan_Plan { brc20, notSet }

class TransactionPlan extends $pb.GeneratedMessage {
  factory TransactionPlan({
    Error? error,
    $core.String? errorMessage,
    TransactionPlan_Brc20Plan? brc20,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (brc20 != null) {
      $result.brc20 = brc20;
    }
    return $result;
  }
  TransactionPlan._() : super();
  factory TransactionPlan.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionPlan.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TransactionPlan_Plan>
      _TransactionPlan_PlanByTag = {
    3: TransactionPlan_Plan.brc20,
    0: TransactionPlan_Plan.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionPlan',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [3])
    ..e<Error>(1, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: Error.OK,
        valueOf: Error.valueOf,
        enumValues: Error.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<TransactionPlan_Brc20Plan>(3, _omitFieldNames ? '' : 'brc20',
        subBuilder: TransactionPlan_Brc20Plan.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionPlan clone() => TransactionPlan()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionPlan copyWith(void Function(TransactionPlan) updates) =>
      super.copyWith((message) => updates(message as TransactionPlan))
          as TransactionPlan;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionPlan create() => TransactionPlan._();
  TransactionPlan createEmptyInstance() => create();
  static $pb.PbList<TransactionPlan> createRepeated() =>
      $pb.PbList<TransactionPlan>();
  @$core.pragma('dart2js:noInline')
  static TransactionPlan getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionPlan>(create);
  static TransactionPlan? _defaultInstance;

  TransactionPlan_Plan whichPlan() =>
      _TransactionPlan_PlanByTag[$_whichOneof(0)]!;
  void clearPlan() => clearField($_whichOneof(0));

  /// A possible error, `OK` if none.
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

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);

  @$pb.TagNumber(3)
  TransactionPlan_Brc20Plan get brc20 => $_getN(2);
  @$pb.TagNumber(3)
  set brc20(TransactionPlan_Brc20Plan v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBrc20() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrc20() => clearField(3);
  @$pb.TagNumber(3)
  TransactionPlan_Brc20Plan ensureBrc20() => $_ensure(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
