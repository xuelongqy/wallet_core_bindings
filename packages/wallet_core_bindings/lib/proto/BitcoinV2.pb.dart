// This is a generated file - do not edit.
//
// Generated from BitcoinV2.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'BabylonStaking.pb.dart' as $1;
import 'BitcoinV2.pbenum.dart';
import 'Common.pbenum.dart' as $4;
import 'DecredV2.pb.dart' as $3;
import 'Utxo.pb.dart' as $0;
import 'Zcash.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'BitcoinV2.pbenum.dart';

enum PublicKeyOrHash_Variant { pubkey, hash, notSet }

/// Either a public key or public key hash.
class PublicKeyOrHash extends $pb.GeneratedMessage {
  factory PublicKeyOrHash({
    $core.List<$core.int>? pubkey,
    $core.List<$core.int>? hash,
  }) {
    final result = create();
    if (pubkey != null) result.pubkey = pubkey;
    if (hash != null) result.hash = hash;
    return result;
  }

  PublicKeyOrHash._();

  factory PublicKeyOrHash.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublicKeyOrHash.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, PublicKeyOrHash_Variant>
      _PublicKeyOrHash_VariantByTag = {
    1: PublicKeyOrHash_Variant.pubkey,
    2: PublicKeyOrHash_Variant.hash,
    0: PublicKeyOrHash_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublicKeyOrHash',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'pubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKeyOrHash clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKeyOrHash copyWith(void Function(PublicKeyOrHash) updates) =>
      super.copyWith((message) => updates(message as PublicKeyOrHash))
          as PublicKeyOrHash;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicKeyOrHash create() => PublicKeyOrHash._();
  @$core.override
  PublicKeyOrHash createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublicKeyOrHash getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublicKeyOrHash>(create);
  static PublicKeyOrHash? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  PublicKeyOrHash_Variant whichVariant() =>
      _PublicKeyOrHash_VariantByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearVariant() => $_clearField($_whichOneof(0));

  /// Public key bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get pubkey => $_getN(0);
  @$pb.TagNumber(1)
  set pubkey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPubkey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPubkey() => $_clearField(1);

  /// Public key hash.
  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);
}

/// Public key and corresponding signature.
class PublicKeySignature extends $pb.GeneratedMessage {
  factory PublicKeySignature({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (signature != null) result.signature = signature;
    return result;
  }

  PublicKeySignature._();

  factory PublicKeySignature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublicKeySignature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublicKeySignature',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKeySignature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKeySignature copyWith(void Function(PublicKeySignature) updates) =>
      super.copyWith((message) => updates(message as PublicKeySignature))
          as PublicKeySignature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicKeySignature create() => PublicKeySignature._();
  @$core.override
  PublicKeySignature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublicKeySignature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublicKeySignature>(create);
  static PublicKeySignature? _defaultInstance;

  /// Public key bytes. Type of the public key depends on the context.
  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);

  /// Signature 64-length byte array.
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);
}

/// Optional sequence number, used for timelocks, replace-by-fee, etc.
class Input_Sequence extends $pb.GeneratedMessage {
  factory Input_Sequence({
    $core.int? sequence,
  }) {
    final result = create();
    if (sequence != null) result.sequence = sequence;
    return result;
  }

  Input_Sequence._();

  factory Input_Sequence.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Input_Sequence.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.Sequence',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_Sequence clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_Sequence copyWith(void Function(Input_Sequence) updates) =>
      super.copyWith((message) => updates(message as Input_Sequence))
          as Input_Sequence;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_Sequence create() => Input_Sequence._();
  @$core.override
  Input_Sequence createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Input_Sequence getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_Sequence>(create);
  static Input_Sequence? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sequence => $_getIZ(0);
  @$pb.TagNumber(1)
  set sequence($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSequence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSequence() => $_clearField(1);
}

enum Input_InputBuilder_Variant {
  p2pk,
  p2pkh,
  p2wpkh,
  p2trKeyPath,
  brc20Inscribe,
  babylonStakingTimelockPath,
  babylonStakingUnbondingPath,
  babylonStakingSlashingPath,
  babylonUnbondingTimelockPath,
  babylonUnbondingSlashingPath,
  notSet
}

class Input_InputBuilder extends $pb.GeneratedMessage {
  factory Input_InputBuilder({
    $core.List<$core.int>? p2pk,
    PublicKeyOrHash? p2pkh,
    PublicKeyOrHash? p2wpkh,
    $core.List<$core.int>? p2trKeyPath,
    Input_InputBrc20Inscription? brc20Inscribe,
    $1.InputBuilder_StakingTimelockPath? babylonStakingTimelockPath,
    $1.InputBuilder_StakingUnbondingPath? babylonStakingUnbondingPath,
    $1.InputBuilder_StakingSlashingPath? babylonStakingSlashingPath,
    $1.InputBuilder_UnbondingTimelockPath? babylonUnbondingTimelockPath,
    $1.InputBuilder_UnbondingSlashingPath? babylonUnbondingSlashingPath,
  }) {
    final result = create();
    if (p2pk != null) result.p2pk = p2pk;
    if (p2pkh != null) result.p2pkh = p2pkh;
    if (p2wpkh != null) result.p2wpkh = p2wpkh;
    if (p2trKeyPath != null) result.p2trKeyPath = p2trKeyPath;
    if (brc20Inscribe != null) result.brc20Inscribe = brc20Inscribe;
    if (babylonStakingTimelockPath != null)
      result.babylonStakingTimelockPath = babylonStakingTimelockPath;
    if (babylonStakingUnbondingPath != null)
      result.babylonStakingUnbondingPath = babylonStakingUnbondingPath;
    if (babylonStakingSlashingPath != null)
      result.babylonStakingSlashingPath = babylonStakingSlashingPath;
    if (babylonUnbondingTimelockPath != null)
      result.babylonUnbondingTimelockPath = babylonUnbondingTimelockPath;
    if (babylonUnbondingSlashingPath != null)
      result.babylonUnbondingSlashingPath = babylonUnbondingSlashingPath;
    return result;
  }

  Input_InputBuilder._();

  factory Input_InputBuilder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Input_InputBuilder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Input_InputBuilder_Variant>
      _Input_InputBuilder_VariantByTag = {
    2: Input_InputBuilder_Variant.p2pk,
    3: Input_InputBuilder_Variant.p2pkh,
    5: Input_InputBuilder_Variant.p2wpkh,
    7: Input_InputBuilder_Variant.p2trKeyPath,
    9: Input_InputBuilder_Variant.brc20Inscribe,
    15: Input_InputBuilder_Variant.babylonStakingTimelockPath,
    16: Input_InputBuilder_Variant.babylonStakingUnbondingPath,
    17: Input_InputBuilder_Variant.babylonStakingSlashingPath,
    18: Input_InputBuilder_Variant.babylonUnbondingTimelockPath,
    19: Input_InputBuilder_Variant.babylonUnbondingSlashingPath,
    0: Input_InputBuilder_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputBuilder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 5, 7, 9, 15, 16, 17, 18, 19])
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'p2pk', $pb.PbFieldType.OY)
    ..aOM<PublicKeyOrHash>(3, _omitFieldNames ? '' : 'p2pkh',
        subBuilder: PublicKeyOrHash.create)
    ..aOM<PublicKeyOrHash>(5, _omitFieldNames ? '' : 'p2wpkh',
        subBuilder: PublicKeyOrHash.create)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'p2trKeyPath', $pb.PbFieldType.OY)
    ..aOM<Input_InputBrc20Inscription>(
        9, _omitFieldNames ? '' : 'brc20Inscribe',
        subBuilder: Input_InputBrc20Inscription.create)
    ..aOM<$1.InputBuilder_StakingTimelockPath>(
        15, _omitFieldNames ? '' : 'babylonStakingTimelockPath',
        subBuilder: $1.InputBuilder_StakingTimelockPath.create)
    ..aOM<$1.InputBuilder_StakingUnbondingPath>(
        16, _omitFieldNames ? '' : 'babylonStakingUnbondingPath',
        subBuilder: $1.InputBuilder_StakingUnbondingPath.create)
    ..aOM<$1.InputBuilder_StakingSlashingPath>(
        17, _omitFieldNames ? '' : 'babylonStakingSlashingPath',
        subBuilder: $1.InputBuilder_StakingSlashingPath.create)
    ..aOM<$1.InputBuilder_UnbondingTimelockPath>(
        18, _omitFieldNames ? '' : 'babylonUnbondingTimelockPath',
        subBuilder: $1.InputBuilder_UnbondingTimelockPath.create)
    ..aOM<$1.InputBuilder_UnbondingSlashingPath>(
        19, _omitFieldNames ? '' : 'babylonUnbondingSlashingPath',
        subBuilder: $1.InputBuilder_UnbondingSlashingPath.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_InputBuilder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_InputBuilder copyWith(void Function(Input_InputBuilder) updates) =>
      super.copyWith((message) => updates(message as Input_InputBuilder))
          as Input_InputBuilder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputBuilder create() => Input_InputBuilder._();
  @$core.override
  Input_InputBuilder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Input_InputBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputBuilder>(create);
  static Input_InputBuilder? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  @$pb.TagNumber(7)
  @$pb.TagNumber(9)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  Input_InputBuilder_Variant whichVariant() =>
      _Input_InputBuilder_VariantByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  @$pb.TagNumber(7)
  @$pb.TagNumber(9)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  void clearVariant() => $_clearField($_whichOneof(0));

  /// Pay-to-Public-Key, specify the public key.
  @$pb.TagNumber(2)
  $core.List<$core.int> get p2pk => $_getN(0);
  @$pb.TagNumber(2)
  set p2pk($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(2)
  $core.bool hasP2pk() => $_has(0);
  @$pb.TagNumber(2)
  void clearP2pk() => $_clearField(2);

  /// Pay-to-Public-Key-Hash, specify the public key.
  @$pb.TagNumber(3)
  PublicKeyOrHash get p2pkh => $_getN(1);
  @$pb.TagNumber(3)
  set p2pkh(PublicKeyOrHash value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasP2pkh() => $_has(1);
  @$pb.TagNumber(3)
  void clearP2pkh() => $_clearField(3);
  @$pb.TagNumber(3)
  PublicKeyOrHash ensureP2pkh() => $_ensure(1);

  /// Pay-to-Public-Key-Hash, specify the public key.
  @$pb.TagNumber(5)
  PublicKeyOrHash get p2wpkh => $_getN(2);
  @$pb.TagNumber(5)
  set p2wpkh(PublicKeyOrHash value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasP2wpkh() => $_has(2);
  @$pb.TagNumber(5)
  void clearP2wpkh() => $_clearField(5);
  @$pb.TagNumber(5)
  PublicKeyOrHash ensureP2wpkh() => $_ensure(2);

  /// Pay-to-Taproot-key-path (balance transfers), specify the public key.
  @$pb.TagNumber(7)
  $core.List<$core.int> get p2trKeyPath => $_getN(3);
  @$pb.TagNumber(7)
  set p2trKeyPath($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(7)
  $core.bool hasP2trKeyPath() => $_has(3);
  @$pb.TagNumber(7)
  void clearP2trKeyPath() => $_clearField(7);

  /// Create a BRC20 inscription.
  @$pb.TagNumber(9)
  Input_InputBrc20Inscription get brc20Inscribe => $_getN(4);
  @$pb.TagNumber(9)
  set brc20Inscribe(Input_InputBrc20Inscription value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasBrc20Inscribe() => $_has(4);
  @$pb.TagNumber(9)
  void clearBrc20Inscribe() => $_clearField(9);
  @$pb.TagNumber(9)
  Input_InputBrc20Inscription ensureBrc20Inscribe() => $_ensure(4);

  /// Spend a Staking Output via timelock path (staking time expired).
  /// In other words, create a Withdraw transaction.
  @$pb.TagNumber(15)
  $1.InputBuilder_StakingTimelockPath get babylonStakingTimelockPath =>
      $_getN(5);
  @$pb.TagNumber(15)
  set babylonStakingTimelockPath($1.InputBuilder_StakingTimelockPath value) =>
      $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasBabylonStakingTimelockPath() => $_has(5);
  @$pb.TagNumber(15)
  void clearBabylonStakingTimelockPath() => $_clearField(15);
  @$pb.TagNumber(15)
  $1.InputBuilder_StakingTimelockPath ensureBabylonStakingTimelockPath() =>
      $_ensure(5);

  /// Spend a Staking Output via unbonding path.
  /// In other words, create an Unbonding transaction.
  @$pb.TagNumber(16)
  $1.InputBuilder_StakingUnbondingPath get babylonStakingUnbondingPath =>
      $_getN(6);
  @$pb.TagNumber(16)
  set babylonStakingUnbondingPath($1.InputBuilder_StakingUnbondingPath value) =>
      $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasBabylonStakingUnbondingPath() => $_has(6);
  @$pb.TagNumber(16)
  void clearBabylonStakingUnbondingPath() => $_clearField(16);
  @$pb.TagNumber(16)
  $1.InputBuilder_StakingUnbondingPath ensureBabylonStakingUnbondingPath() =>
      $_ensure(6);

  /// Spend a Staking Output via slashing path.
  /// In other words, generate an unsigned slashing transaction, pre-sign the staker's signature only and share to Babylon PoS chain.
  @$pb.TagNumber(17)
  $1.InputBuilder_StakingSlashingPath get babylonStakingSlashingPath =>
      $_getN(7);
  @$pb.TagNumber(17)
  set babylonStakingSlashingPath($1.InputBuilder_StakingSlashingPath value) =>
      $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasBabylonStakingSlashingPath() => $_has(7);
  @$pb.TagNumber(17)
  void clearBabylonStakingSlashingPath() => $_clearField(17);
  @$pb.TagNumber(17)
  $1.InputBuilder_StakingSlashingPath ensureBabylonStakingSlashingPath() =>
      $_ensure(7);

  /// Spend an Unbonding Output via timelock path (unbonding time expired).
  /// In other words, create a Withdraw transaction spending an Unbonding transaction.
  @$pb.TagNumber(18)
  $1.InputBuilder_UnbondingTimelockPath get babylonUnbondingTimelockPath =>
      $_getN(8);
  @$pb.TagNumber(18)
  set babylonUnbondingTimelockPath(
          $1.InputBuilder_UnbondingTimelockPath value) =>
      $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasBabylonUnbondingTimelockPath() => $_has(8);
  @$pb.TagNumber(18)
  void clearBabylonUnbondingTimelockPath() => $_clearField(18);
  @$pb.TagNumber(18)
  $1.InputBuilder_UnbondingTimelockPath ensureBabylonUnbondingTimelockPath() =>
      $_ensure(8);

  /// Spend an Unbonding Output via slashing path.
  /// In other words, generate an unsigned Slashing transaction, pre-sign the staker's signature only and share to Babylon PoS chain.
  @$pb.TagNumber(19)
  $1.InputBuilder_UnbondingSlashingPath get babylonUnbondingSlashingPath =>
      $_getN(9);
  @$pb.TagNumber(19)
  set babylonUnbondingSlashingPath(
          $1.InputBuilder_UnbondingSlashingPath value) =>
      $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasBabylonUnbondingSlashingPath() => $_has(9);
  @$pb.TagNumber(19)
  void clearBabylonUnbondingSlashingPath() => $_clearField(19);
  @$pb.TagNumber(19)
  $1.InputBuilder_UnbondingSlashingPath ensureBabylonUnbondingSlashingPath() =>
      $_ensure(9);
}

class Input_InputTaprootScriptPath extends $pb.GeneratedMessage {
  factory Input_InputTaprootScriptPath({
    $core.List<$core.int>? payload,
    $core.List<$core.int>? controlBlock,
  }) {
    final result = create();
    if (payload != null) result.payload = payload;
    if (controlBlock != null) result.controlBlock = controlBlock;
    return result;
  }

  Input_InputTaprootScriptPath._();

  factory Input_InputTaprootScriptPath.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Input_InputTaprootScriptPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputTaprootScriptPath',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'controlBlock', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_InputTaprootScriptPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_InputTaprootScriptPath copyWith(
          void Function(Input_InputTaprootScriptPath) updates) =>
      super.copyWith(
              (message) => updates(message as Input_InputTaprootScriptPath))
          as Input_InputTaprootScriptPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputTaprootScriptPath create() =>
      Input_InputTaprootScriptPath._();
  @$core.override
  Input_InputTaprootScriptPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Input_InputTaprootScriptPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputTaprootScriptPath>(create);
  static Input_InputTaprootScriptPath? _defaultInstance;

  /// The payload of the Taproot transaction.
  @$pb.TagNumber(2)
  $core.List<$core.int> get payload => $_getN(0);
  @$pb.TagNumber(2)
  set payload($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(2)
  void clearPayload() => $_clearField(2);

  /// The control block of the Taproot transaction required for claiming.
  @$pb.TagNumber(3)
  $core.List<$core.int> get controlBlock => $_getN(1);
  @$pb.TagNumber(3)
  set controlBlock($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(3)
  $core.bool hasControlBlock() => $_has(1);
  @$pb.TagNumber(3)
  void clearControlBlock() => $_clearField(3);
}

class Input_InputBrc20Inscription extends $pb.GeneratedMessage {
  factory Input_InputBrc20Inscription({
    $core.List<$core.int>? inscribeTo,
    $core.String? ticker,
    $core.String? transferAmount,
  }) {
    final result = create();
    if (inscribeTo != null) result.inscribeTo = inscribeTo;
    if (ticker != null) result.ticker = ticker;
    if (transferAmount != null) result.transferAmount = transferAmount;
    return result;
  }

  Input_InputBrc20Inscription._();

  factory Input_InputBrc20Inscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Input_InputBrc20Inscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input.InputBrc20Inscription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'inscribeTo', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'ticker')
    ..aOS(4, _omitFieldNames ? '' : 'transferAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_InputBrc20Inscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input_InputBrc20Inscription copyWith(
          void Function(Input_InputBrc20Inscription) updates) =>
      super.copyWith(
              (message) => updates(message as Input_InputBrc20Inscription))
          as Input_InputBrc20Inscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input_InputBrc20Inscription create() =>
      Input_InputBrc20Inscription._();
  @$core.override
  Input_InputBrc20Inscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Input_InputBrc20Inscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Input_InputBrc20Inscription>(create);
  static Input_InputBrc20Inscription? _defaultInstance;

  /// The recipient of the inscription, usually the sender.
  @$pb.TagNumber(2)
  $core.List<$core.int> get inscribeTo => $_getN(0);
  @$pb.TagNumber(2)
  set inscribeTo($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(2)
  $core.bool hasInscribeTo() => $_has(0);
  @$pb.TagNumber(2)
  void clearInscribeTo() => $_clearField(2);

  /// The ticker of the BRC20 inscription.
  @$pb.TagNumber(3)
  $core.String get ticker => $_getSZ(1);
  @$pb.TagNumber(3)
  set ticker($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasTicker() => $_has(1);
  @$pb.TagNumber(3)
  void clearTicker() => $_clearField(3);

  /// The BRC20 token transfer amount.
  @$pb.TagNumber(4)
  $core.String get transferAmount => $_getSZ(2);
  @$pb.TagNumber(4)
  set transferAmount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasTransferAmount() => $_has(2);
  @$pb.TagNumber(4)
  void clearTransferAmount() => $_clearField(4);
}

enum Input_ClaimingScript { scriptBuilder, scriptData, receiverAddress, notSet }

class Input extends $pb.GeneratedMessage {
  factory Input({
    $0.OutPoint? outPoint,
    $fixnum.Int64? value,
    $core.int? sighashType,
    Input_Sequence? sequence,
    Input_InputBuilder? scriptBuilder,
    $core.List<$core.int>? scriptData,
    $core.String? receiverAddress,
  }) {
    final result = create();
    if (outPoint != null) result.outPoint = outPoint;
    if (value != null) result.value = value;
    if (sighashType != null) result.sighashType = sighashType;
    if (sequence != null) result.sequence = sequence;
    if (scriptBuilder != null) result.scriptBuilder = scriptBuilder;
    if (scriptData != null) result.scriptData = scriptData;
    if (receiverAddress != null) result.receiverAddress = receiverAddress;
    return result;
  }

  Input._();

  factory Input.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Input.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Input_ClaimingScript>
      _Input_ClaimingScriptByTag = {
    5: Input_ClaimingScript.scriptBuilder,
    6: Input_ClaimingScript.scriptData,
    7: Input_ClaimingScript.receiverAddress,
    0: Input_ClaimingScript.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Input',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 7])
    ..aOM<$0.OutPoint>(1, _omitFieldNames ? '' : 'outPoint',
        subBuilder: $0.OutPoint.create)
    ..aInt64(2, _omitFieldNames ? '' : 'value')
    ..aI(3, _omitFieldNames ? '' : 'sighashType',
        fieldType: $pb.PbFieldType.OU3)
    ..aOM<Input_Sequence>(4, _omitFieldNames ? '' : 'sequence',
        subBuilder: Input_Sequence.create)
    ..aOM<Input_InputBuilder>(5, _omitFieldNames ? '' : 'scriptBuilder',
        subBuilder: Input_InputBuilder.create)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'scriptData', $pb.PbFieldType.OY)
    ..aOS(7, _omitFieldNames ? '' : 'receiverAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Input copyWith(void Function(Input) updates) =>
      super.copyWith((message) => updates(message as Input)) as Input;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Input create() => Input._();
  @$core.override
  Input createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Input getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Input>(create);
  static Input? _defaultInstance;

  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  Input_ClaimingScript whichClaimingScript() =>
      _Input_ClaimingScriptByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  void clearClaimingScript() => $_clearField($_whichOneof(0));

  /// Reference to the previous transaction's output.
  @$pb.TagNumber(1)
  $0.OutPoint get outPoint => $_getN(0);
  @$pb.TagNumber(1)
  set outPoint($0.OutPoint value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutPoint() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.OutPoint ensureOutPoint() => $_ensure(0);

  /// The amount of satoshis of this input.
  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  /// The sighash type, normally `All`.
  /// See `TWBitcoinSigHashType` enum.
  @$pb.TagNumber(3)
  $core.int get sighashType => $_getIZ(2);
  @$pb.TagNumber(3)
  set sighashType($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSighashType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSighashType() => $_clearField(3);

  /// Optional sequence number, used for timelocks, replace-by-fee, etc.
  /// Leave empty to use a default 4294967295 (0xFFFFFFFF) value.
  @$pb.TagNumber(4)
  Input_Sequence get sequence => $_getN(3);
  @$pb.TagNumber(4)
  set sequence(Input_Sequence value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequence() => $_clearField(4);
  @$pb.TagNumber(4)
  Input_Sequence ensureSequence() => $_ensure(3);

  /// Construct claiming script with a builder pattern.
  @$pb.TagNumber(5)
  Input_InputBuilder get scriptBuilder => $_getN(4);
  @$pb.TagNumber(5)
  set scriptBuilder(Input_InputBuilder value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasScriptBuilder() => $_has(4);
  @$pb.TagNumber(5)
  void clearScriptBuilder() => $_clearField(5);
  @$pb.TagNumber(5)
  Input_InputBuilder ensureScriptBuilder() => $_ensure(4);

  /// Spending script pubkey data.
  /// Use this variant if the UTXO claiming script is known already, otherwise use `InputBuilder`.
  /// Please note that the signing method (eg "legacy" or "segwit") will be determined by parsing the script data as:
  /// - P2PK, P2PKH - legacy signing method;
  /// - P2WPKH - segwit signing method.
  @$pb.TagNumber(6)
  $core.List<$core.int> get scriptData => $_getN(5);
  @$pb.TagNumber(6)
  set scriptData($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasScriptData() => $_has(5);
  @$pb.TagNumber(6)
  void clearScriptData() => $_clearField(6);

  /// Derive a spending script pubkey from a receiver address.
  /// E.g "bc1" segwit address will be P2WPKH claiming script.
  /// TODO consider deprecating this because we can't determine if the script pubkey is P2PK or P2PKH actually.
  @$pb.TagNumber(7)
  $core.String get receiverAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set receiverAddress($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasReceiverAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceiverAddress() => $_clearField(7);
}

enum Output_OutputBuilder_Variant {
  p2sh,
  p2pk,
  p2pkh,
  p2wsh,
  p2wpkh,
  p2trKeyPath,
  p2trScriptPath,
  p2trDangerousAssumeTweaked,
  brc20Inscribe,
  opReturn,
  babylonStaking,
  babylonUnbonding,
  babylonStakingOpReturn,
  notSet
}

class Output_OutputBuilder extends $pb.GeneratedMessage {
  factory Output_OutputBuilder({
    Output_RedeemScriptOrHash? p2sh,
    $core.List<$core.int>? p2pk,
    PublicKeyOrHash? p2pkh,
    Output_RedeemScriptOrHash? p2wsh,
    PublicKeyOrHash? p2wpkh,
    $core.List<$core.int>? p2trKeyPath,
    Output_OutputTaprootScriptPath? p2trScriptPath,
    $core.List<$core.int>? p2trDangerousAssumeTweaked,
    Output_OutputBrc20Inscription? brc20Inscribe,
    $core.List<$core.int>? opReturn,
    $1.OutputBuilder_StakingOutput? babylonStaking,
    $1.OutputBuilder_UnbondingOutput? babylonUnbonding,
    $1.OutputBuilder_OpReturn? babylonStakingOpReturn,
  }) {
    final result = create();
    if (p2sh != null) result.p2sh = p2sh;
    if (p2pk != null) result.p2pk = p2pk;
    if (p2pkh != null) result.p2pkh = p2pkh;
    if (p2wsh != null) result.p2wsh = p2wsh;
    if (p2wpkh != null) result.p2wpkh = p2wpkh;
    if (p2trKeyPath != null) result.p2trKeyPath = p2trKeyPath;
    if (p2trScriptPath != null) result.p2trScriptPath = p2trScriptPath;
    if (p2trDangerousAssumeTweaked != null)
      result.p2trDangerousAssumeTweaked = p2trDangerousAssumeTweaked;
    if (brc20Inscribe != null) result.brc20Inscribe = brc20Inscribe;
    if (opReturn != null) result.opReturn = opReturn;
    if (babylonStaking != null) result.babylonStaking = babylonStaking;
    if (babylonUnbonding != null) result.babylonUnbonding = babylonUnbonding;
    if (babylonStakingOpReturn != null)
      result.babylonStakingOpReturn = babylonStakingOpReturn;
    return result;
  }

  Output_OutputBuilder._();

  factory Output_OutputBuilder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Output_OutputBuilder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Output_OutputBuilder_Variant>
      _Output_OutputBuilder_VariantByTag = {
    1: Output_OutputBuilder_Variant.p2sh,
    2: Output_OutputBuilder_Variant.p2pk,
    3: Output_OutputBuilder_Variant.p2pkh,
    4: Output_OutputBuilder_Variant.p2wsh,
    5: Output_OutputBuilder_Variant.p2wpkh,
    6: Output_OutputBuilder_Variant.p2trKeyPath,
    7: Output_OutputBuilder_Variant.p2trScriptPath,
    8: Output_OutputBuilder_Variant.p2trDangerousAssumeTweaked,
    9: Output_OutputBuilder_Variant.brc20Inscribe,
    12: Output_OutputBuilder_Variant.opReturn,
    15: Output_OutputBuilder_Variant.babylonStaking,
    16: Output_OutputBuilder_Variant.babylonUnbonding,
    17: Output_OutputBuilder_Variant.babylonStakingOpReturn,
    0: Output_OutputBuilder_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputBuilder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 15, 16, 17])
    ..aOM<Output_RedeemScriptOrHash>(1, _omitFieldNames ? '' : 'p2sh',
        subBuilder: Output_RedeemScriptOrHash.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'p2pk', $pb.PbFieldType.OY)
    ..aOM<PublicKeyOrHash>(3, _omitFieldNames ? '' : 'p2pkh',
        subBuilder: PublicKeyOrHash.create)
    ..aOM<Output_RedeemScriptOrHash>(4, _omitFieldNames ? '' : 'p2wsh',
        subBuilder: Output_RedeemScriptOrHash.create)
    ..aOM<PublicKeyOrHash>(5, _omitFieldNames ? '' : 'p2wpkh',
        subBuilder: PublicKeyOrHash.create)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'p2trKeyPath', $pb.PbFieldType.OY)
    ..aOM<Output_OutputTaprootScriptPath>(
        7, _omitFieldNames ? '' : 'p2trScriptPath',
        subBuilder: Output_OutputTaprootScriptPath.create)
    ..a<$core.List<$core.int>>(8,
        _omitFieldNames ? '' : 'p2trDangerousAssumeTweaked', $pb.PbFieldType.OY)
    ..aOM<Output_OutputBrc20Inscription>(
        9, _omitFieldNames ? '' : 'brc20Inscribe',
        subBuilder: Output_OutputBrc20Inscription.create)
    ..a<$core.List<$core.int>>(
        12, _omitFieldNames ? '' : 'opReturn', $pb.PbFieldType.OY)
    ..aOM<$1.OutputBuilder_StakingOutput>(
        15, _omitFieldNames ? '' : 'babylonStaking',
        subBuilder: $1.OutputBuilder_StakingOutput.create)
    ..aOM<$1.OutputBuilder_UnbondingOutput>(
        16, _omitFieldNames ? '' : 'babylonUnbonding',
        subBuilder: $1.OutputBuilder_UnbondingOutput.create)
    ..aOM<$1.OutputBuilder_OpReturn>(
        17, _omitFieldNames ? '' : 'babylonStakingOpReturn',
        subBuilder: $1.OutputBuilder_OpReturn.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_OutputBuilder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_OutputBuilder copyWith(void Function(Output_OutputBuilder) updates) =>
      super.copyWith((message) => updates(message as Output_OutputBuilder))
          as Output_OutputBuilder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputBuilder create() => Output_OutputBuilder._();
  @$core.override
  Output_OutputBuilder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Output_OutputBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputBuilder>(create);
  static Output_OutputBuilder? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(12)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  Output_OutputBuilder_Variant whichVariant() =>
      _Output_OutputBuilder_VariantByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(12)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  void clearVariant() => $_clearField($_whichOneof(0));

  /// Pay-to-Script-Hash, specify the redeem script or its hash.
  @$pb.TagNumber(1)
  Output_RedeemScriptOrHash get p2sh => $_getN(0);
  @$pb.TagNumber(1)
  set p2sh(Output_RedeemScriptOrHash value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasP2sh() => $_has(0);
  @$pb.TagNumber(1)
  void clearP2sh() => $_clearField(1);
  @$pb.TagNumber(1)
  Output_RedeemScriptOrHash ensureP2sh() => $_ensure(0);

  /// Pay-to-Public-Key, specify the public key.
  @$pb.TagNumber(2)
  $core.List<$core.int> get p2pk => $_getN(1);
  @$pb.TagNumber(2)
  set p2pk($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasP2pk() => $_has(1);
  @$pb.TagNumber(2)
  void clearP2pk() => $_clearField(2);

  /// Pay-to-Public-Key-Hash, specify the public key or its hash.
  @$pb.TagNumber(3)
  PublicKeyOrHash get p2pkh => $_getN(2);
  @$pb.TagNumber(3)
  set p2pkh(PublicKeyOrHash value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasP2pkh() => $_has(2);
  @$pb.TagNumber(3)
  void clearP2pkh() => $_clearField(3);
  @$pb.TagNumber(3)
  PublicKeyOrHash ensureP2pkh() => $_ensure(2);

  /// Pay-to-Witness-Script-Hash, specify the redeem script or its hash.
  @$pb.TagNumber(4)
  Output_RedeemScriptOrHash get p2wsh => $_getN(3);
  @$pb.TagNumber(4)
  set p2wsh(Output_RedeemScriptOrHash value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasP2wsh() => $_has(3);
  @$pb.TagNumber(4)
  void clearP2wsh() => $_clearField(4);
  @$pb.TagNumber(4)
  Output_RedeemScriptOrHash ensureP2wsh() => $_ensure(3);

  /// Pay-to-Public-Key-Hash, specify the public key or its hash.
  @$pb.TagNumber(5)
  PublicKeyOrHash get p2wpkh => $_getN(4);
  @$pb.TagNumber(5)
  set p2wpkh(PublicKeyOrHash value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasP2wpkh() => $_has(4);
  @$pb.TagNumber(5)
  void clearP2wpkh() => $_clearField(5);
  @$pb.TagNumber(5)
  PublicKeyOrHash ensureP2wpkh() => $_ensure(4);

  /// Pay-to-Taproot-key-path (balance transfers), specify the public key.
  @$pb.TagNumber(6)
  $core.List<$core.int> get p2trKeyPath => $_getN(5);
  @$pb.TagNumber(6)
  set p2trKeyPath($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasP2trKeyPath() => $_has(5);
  @$pb.TagNumber(6)
  void clearP2trKeyPath() => $_clearField(6);

  /// Pay-to-Taproot-script-path (complex transfers)
  @$pb.TagNumber(7)
  Output_OutputTaprootScriptPath get p2trScriptPath => $_getN(6);
  @$pb.TagNumber(7)
  set p2trScriptPath(Output_OutputTaprootScriptPath value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasP2trScriptPath() => $_has(6);
  @$pb.TagNumber(7)
  void clearP2trScriptPath() => $_clearField(7);
  @$pb.TagNumber(7)
  Output_OutputTaprootScriptPath ensureP2trScriptPath() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get p2trDangerousAssumeTweaked => $_getN(7);
  @$pb.TagNumber(8)
  set p2trDangerousAssumeTweaked($core.List<$core.int> value) =>
      $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasP2trDangerousAssumeTweaked() => $_has(7);
  @$pb.TagNumber(8)
  void clearP2trDangerousAssumeTweaked() => $_clearField(8);

  @$pb.TagNumber(9)
  Output_OutputBrc20Inscription get brc20Inscribe => $_getN(8);
  @$pb.TagNumber(9)
  set brc20Inscribe(Output_OutputBrc20Inscription value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasBrc20Inscribe() => $_has(8);
  @$pb.TagNumber(9)
  void clearBrc20Inscribe() => $_clearField(9);
  @$pb.TagNumber(9)
  Output_OutputBrc20Inscription ensureBrc20Inscribe() => $_ensure(8);

  /// OP_RETURN output. In most cases, with a zero-amount.
  @$pb.TagNumber(12)
  $core.List<$core.int> get opReturn => $_getN(9);
  @$pb.TagNumber(12)
  set opReturn($core.List<$core.int> value) => $_setBytes(9, value);
  @$pb.TagNumber(12)
  $core.bool hasOpReturn() => $_has(9);
  @$pb.TagNumber(12)
  void clearOpReturn() => $_clearField(12);

  /// Create a Babylon `Staking` output.
  @$pb.TagNumber(15)
  $1.OutputBuilder_StakingOutput get babylonStaking => $_getN(10);
  @$pb.TagNumber(15)
  set babylonStaking($1.OutputBuilder_StakingOutput value) =>
      $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasBabylonStaking() => $_has(10);
  @$pb.TagNumber(15)
  void clearBabylonStaking() => $_clearField(15);
  @$pb.TagNumber(15)
  $1.OutputBuilder_StakingOutput ensureBabylonStaking() => $_ensure(10);

  /// Create a Babylon `Unbonding` output.
  @$pb.TagNumber(16)
  $1.OutputBuilder_UnbondingOutput get babylonUnbonding => $_getN(11);
  @$pb.TagNumber(16)
  set babylonUnbonding($1.OutputBuilder_UnbondingOutput value) =>
      $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasBabylonUnbonding() => $_has(11);
  @$pb.TagNumber(16)
  void clearBabylonUnbonding() => $_clearField(16);
  @$pb.TagNumber(16)
  $1.OutputBuilder_UnbondingOutput ensureBabylonUnbonding() => $_ensure(11);

  /// Create a Babylon `Staking` OP_RETURN output.
  @$pb.TagNumber(17)
  $1.OutputBuilder_OpReturn get babylonStakingOpReturn => $_getN(12);
  @$pb.TagNumber(17)
  set babylonStakingOpReturn($1.OutputBuilder_OpReturn value) =>
      $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasBabylonStakingOpReturn() => $_has(12);
  @$pb.TagNumber(17)
  void clearBabylonStakingOpReturn() => $_clearField(17);
  @$pb.TagNumber(17)
  $1.OutputBuilder_OpReturn ensureBabylonStakingOpReturn() => $_ensure(12);
}

enum Output_RedeemScriptOrHash_Variant { redeemScript, hash, notSet }

/// Either a redeem script or its hash.
class Output_RedeemScriptOrHash extends $pb.GeneratedMessage {
  factory Output_RedeemScriptOrHash({
    $core.List<$core.int>? redeemScript,
    $core.List<$core.int>? hash,
  }) {
    final result = create();
    if (redeemScript != null) result.redeemScript = redeemScript;
    if (hash != null) result.hash = hash;
    return result;
  }

  Output_RedeemScriptOrHash._();

  factory Output_RedeemScriptOrHash.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Output_RedeemScriptOrHash.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Output_RedeemScriptOrHash_Variant>
      _Output_RedeemScriptOrHash_VariantByTag = {
    1: Output_RedeemScriptOrHash_Variant.redeemScript,
    2: Output_RedeemScriptOrHash_Variant.hash,
    0: Output_RedeemScriptOrHash_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.RedeemScriptOrHash',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'redeemScript', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_RedeemScriptOrHash clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_RedeemScriptOrHash copyWith(
          void Function(Output_RedeemScriptOrHash) updates) =>
      super.copyWith((message) => updates(message as Output_RedeemScriptOrHash))
          as Output_RedeemScriptOrHash;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_RedeemScriptOrHash create() => Output_RedeemScriptOrHash._();
  @$core.override
  Output_RedeemScriptOrHash createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Output_RedeemScriptOrHash getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_RedeemScriptOrHash>(create);
  static Output_RedeemScriptOrHash? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  Output_RedeemScriptOrHash_Variant whichVariant() =>
      _Output_RedeemScriptOrHash_VariantByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearVariant() => $_clearField($_whichOneof(0));

  /// Redeem script bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get redeemScript => $_getN(0);
  @$pb.TagNumber(1)
  set redeemScript($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRedeemScript() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedeemScript() => $_clearField(1);

  /// Public key hash.
  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);
}

class Output_OutputTaprootScriptPath extends $pb.GeneratedMessage {
  factory Output_OutputTaprootScriptPath({
    $core.List<$core.int>? internalKey,
    $core.List<$core.int>? merkleRoot,
  }) {
    final result = create();
    if (internalKey != null) result.internalKey = internalKey;
    if (merkleRoot != null) result.merkleRoot = merkleRoot;
    return result;
  }

  Output_OutputTaprootScriptPath._();

  factory Output_OutputTaprootScriptPath.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Output_OutputTaprootScriptPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

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

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_OutputTaprootScriptPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_OutputTaprootScriptPath copyWith(
          void Function(Output_OutputTaprootScriptPath) updates) =>
      super.copyWith(
              (message) => updates(message as Output_OutputTaprootScriptPath))
          as Output_OutputTaprootScriptPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputTaprootScriptPath create() =>
      Output_OutputTaprootScriptPath._();
  @$core.override
  Output_OutputTaprootScriptPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Output_OutputTaprootScriptPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputTaprootScriptPath>(create);
  static Output_OutputTaprootScriptPath? _defaultInstance;

  /// The internal key, usually the public key of the recipient.
  @$pb.TagNumber(1)
  $core.List<$core.int> get internalKey => $_getN(0);
  @$pb.TagNumber(1)
  set internalKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInternalKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearInternalKey() => $_clearField(1);

  /// The merkle root of the Taproot script(s), required to compute the sighash.
  @$pb.TagNumber(2)
  $core.List<$core.int> get merkleRoot => $_getN(1);
  @$pb.TagNumber(2)
  set merkleRoot($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMerkleRoot() => $_has(1);
  @$pb.TagNumber(2)
  void clearMerkleRoot() => $_clearField(2);
}

class Output_OutputBrc20Inscription extends $pb.GeneratedMessage {
  factory Output_OutputBrc20Inscription({
    $core.List<$core.int>? inscribeTo,
    $core.String? ticker,
    $core.String? transferAmount,
  }) {
    final result = create();
    if (inscribeTo != null) result.inscribeTo = inscribeTo;
    if (ticker != null) result.ticker = ticker;
    if (transferAmount != null) result.transferAmount = transferAmount;
    return result;
  }

  Output_OutputBrc20Inscription._();

  factory Output_OutputBrc20Inscription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Output_OutputBrc20Inscription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output.OutputBrc20Inscription',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'inscribeTo', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'ticker')
    ..aOS(3, _omitFieldNames ? '' : 'transferAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_OutputBrc20Inscription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output_OutputBrc20Inscription copyWith(
          void Function(Output_OutputBrc20Inscription) updates) =>
      super.copyWith(
              (message) => updates(message as Output_OutputBrc20Inscription))
          as Output_OutputBrc20Inscription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output_OutputBrc20Inscription create() =>
      Output_OutputBrc20Inscription._();
  @$core.override
  Output_OutputBrc20Inscription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Output_OutputBrc20Inscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Output_OutputBrc20Inscription>(create);
  static Output_OutputBrc20Inscription? _defaultInstance;

  /// The recipient of the inscription, usually the sender.
  @$pb.TagNumber(1)
  $core.List<$core.int> get inscribeTo => $_getN(0);
  @$pb.TagNumber(1)
  set inscribeTo($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInscribeTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInscribeTo() => $_clearField(1);

  /// The ticker of the BRC20 inscription.
  @$pb.TagNumber(2)
  $core.String get ticker => $_getSZ(1);
  @$pb.TagNumber(2)
  set ticker($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTicker() => $_has(1);
  @$pb.TagNumber(2)
  void clearTicker() => $_clearField(2);

  /// The BRC20 token transfer amount.
  @$pb.TagNumber(3)
  $core.String get transferAmount => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferAmount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferAmount() => $_clearField(3);
}

enum Output_ToRecipient { builder, customScriptPubkey, toAddress, notSet }

class Output extends $pb.GeneratedMessage {
  factory Output({
    $fixnum.Int64? value,
    Output_OutputBuilder? builder,
    $core.List<$core.int>? customScriptPubkey,
    $core.String? toAddress,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (builder != null) result.builder = builder;
    if (customScriptPubkey != null)
      result.customScriptPubkey = customScriptPubkey;
    if (toAddress != null) result.toAddress = toAddress;
    return result;
  }

  Output._();

  factory Output.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Output.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Output_ToRecipient>
      _Output_ToRecipientByTag = {
    2: Output_ToRecipient.builder,
    3: Output_ToRecipient.customScriptPubkey,
    4: Output_ToRecipient.toAddress,
    0: Output_ToRecipient.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Output',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..aOM<Output_OutputBuilder>(2, _omitFieldNames ? '' : 'builder',
        subBuilder: Output_OutputBuilder.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'customScriptPubkey', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'toAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Output copyWith(void Function(Output) updates) =>
      super.copyWith((message) => updates(message as Output)) as Output;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Output create() => Output._();
  @$core.override
  Output createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Output getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Output>(create);
  static Output? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  Output_ToRecipient whichToRecipient() =>
      _Output_ToRecipientByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearToRecipient() => $_clearField($_whichOneof(0));

  /// The amount of satoshis to send.
  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// Construct output with builder pattern.
  @$pb.TagNumber(2)
  Output_OutputBuilder get builder => $_getN(1);
  @$pb.TagNumber(2)
  set builder(Output_OutputBuilder value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBuilder() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuilder() => $_clearField(2);
  @$pb.TagNumber(2)
  Output_OutputBuilder ensureBuilder() => $_ensure(1);

  /// Construct output by providing the scriptPubkey directly.
  @$pb.TagNumber(3)
  $core.List<$core.int> get customScriptPubkey => $_getN(2);
  @$pb.TagNumber(3)
  set customScriptPubkey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomScriptPubkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomScriptPubkey() => $_clearField(3);

  /// Derive the expected output from the provided address.
  @$pb.TagNumber(4)
  $core.String get toAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set toAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearToAddress() => $_clearField(4);
}

class ChainInfo extends $pb.GeneratedMessage {
  factory ChainInfo({
    $core.int? p2pkhPrefix,
    $core.int? p2shPrefix,
    $core.String? hrp,
  }) {
    final result = create();
    if (p2pkhPrefix != null) result.p2pkhPrefix = p2pkhPrefix;
    if (p2shPrefix != null) result.p2shPrefix = p2shPrefix;
    if (hrp != null) result.hrp = hrp;
    return result;
  }

  ChainInfo._();

  factory ChainInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChainInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChainInfo',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'p2pkhPrefix',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'p2shPrefix', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'hrp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainInfo copyWith(void Function(ChainInfo) updates) =>
      super.copyWith((message) => updates(message as ChainInfo)) as ChainInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainInfo create() => ChainInfo._();
  @$core.override
  ChainInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChainInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainInfo>(create);
  static ChainInfo? _defaultInstance;

  /// P2PKH prefix for this chain.
  @$pb.TagNumber(1)
  $core.int get p2pkhPrefix => $_getIZ(0);
  @$pb.TagNumber(1)
  set p2pkhPrefix($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasP2pkhPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearP2pkhPrefix() => $_clearField(1);

  /// P2SH prefix for this coin type.
  @$pb.TagNumber(2)
  $core.int get p2shPrefix => $_getIZ(1);
  @$pb.TagNumber(2)
  set p2shPrefix($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasP2shPrefix() => $_has(1);
  @$pb.TagNumber(2)
  void clearP2shPrefix() => $_clearField(2);

  /// HRP for this coin type if applicable.
  @$pb.TagNumber(3)
  $core.String get hrp => $_getSZ(2);
  @$pb.TagNumber(3)
  set hrp($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHrp() => $_has(2);
  @$pb.TagNumber(3)
  void clearHrp() => $_clearField(3);
}

enum TransactionBuilder_DustPolicy { fixedDustThreshold, notSet }

enum TransactionBuilder_ChainSpecific { zcashExtraData, notSet }

/// Transaction builder used in `SigningInput`.
class TransactionBuilder extends $pb.GeneratedMessage {
  factory TransactionBuilder({
    TransactionVersion? version,
    $core.int? lockTime,
    $core.Iterable<Input>? inputs,
    $core.Iterable<Output>? outputs,
    InputSelector? inputSelector,
    $fixnum.Int64? feePerVb,
    Output? changeOutput,
    Output? maxAmountOutput,
    $fixnum.Int64? fixedDustThreshold,
    $2.TransactionBuilderExtraData? zcashExtraData,
  }) {
    final result = create();
    if (version != null) result.version = version;
    if (lockTime != null) result.lockTime = lockTime;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    if (inputSelector != null) result.inputSelector = inputSelector;
    if (feePerVb != null) result.feePerVb = feePerVb;
    if (changeOutput != null) result.changeOutput = changeOutput;
    if (maxAmountOutput != null) result.maxAmountOutput = maxAmountOutput;
    if (fixedDustThreshold != null)
      result.fixedDustThreshold = fixedDustThreshold;
    if (zcashExtraData != null) result.zcashExtraData = zcashExtraData;
    return result;
  }

  TransactionBuilder._();

  factory TransactionBuilder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionBuilder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TransactionBuilder_DustPolicy>
      _TransactionBuilder_DustPolicyByTag = {
    10: TransactionBuilder_DustPolicy.fixedDustThreshold,
    0: TransactionBuilder_DustPolicy.notSet
  };
  static const $core.Map<$core.int, TransactionBuilder_ChainSpecific>
      _TransactionBuilder_ChainSpecificByTag = {
    20: TransactionBuilder_ChainSpecific.zcashExtraData,
    0: TransactionBuilder_ChainSpecific.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionBuilder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [10])
    ..oo(1, [20])
    ..aE<TransactionVersion>(1, _omitFieldNames ? '' : 'version',
        enumValues: TransactionVersion.values)
    ..aI(2, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..pPM<Input>(3, _omitFieldNames ? '' : 'inputs', subBuilder: Input.create)
    ..pPM<Output>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: Output.create)
    ..aE<InputSelector>(5, _omitFieldNames ? '' : 'inputSelector',
        enumValues: InputSelector.values)
    ..aInt64(6, _omitFieldNames ? '' : 'feePerVb')
    ..aOM<Output>(7, _omitFieldNames ? '' : 'changeOutput',
        subBuilder: Output.create)
    ..aOM<Output>(8, _omitFieldNames ? '' : 'maxAmountOutput',
        subBuilder: Output.create)
    ..aInt64(10, _omitFieldNames ? '' : 'fixedDustThreshold')
    ..aOM<$2.TransactionBuilderExtraData>(
        20, _omitFieldNames ? '' : 'zcashExtraData',
        subBuilder: $2.TransactionBuilderExtraData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionBuilder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionBuilder copyWith(void Function(TransactionBuilder) updates) =>
      super.copyWith((message) => updates(message as TransactionBuilder))
          as TransactionBuilder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionBuilder create() => TransactionBuilder._();
  @$core.override
  TransactionBuilder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionBuilder>(create);
  static TransactionBuilder? _defaultInstance;

  @$pb.TagNumber(10)
  TransactionBuilder_DustPolicy whichDustPolicy() =>
      _TransactionBuilder_DustPolicyByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  void clearDustPolicy() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(20)
  TransactionBuilder_ChainSpecific whichChainSpecific() =>
      _TransactionBuilder_ChainSpecificByTag[$_whichOneof(1)]!;
  @$pb.TagNumber(20)
  void clearChainSpecific() => $_clearField($_whichOneof(1));

  /// Transaction version.
  @$pb.TagNumber(1)
  TransactionVersion get version => $_getN(0);
  @$pb.TagNumber(1)
  set version(TransactionVersion value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => $_clearField(1);

  /// (optional) Block height or timestamp indicating at what point transactions can be included in a block.
  /// Zero by default.
  @$pb.TagNumber(2)
  $core.int get lockTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set lockTime($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLockTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockTime() => $_clearField(2);

  /// The inputs to spend.
  @$pb.TagNumber(3)
  $pb.PbList<Input> get inputs => $_getList(2);

  /// The output of the transaction. Note that the change output is specified
  /// in the `change_output` field.
  @$pb.TagNumber(4)
  $pb.PbList<Output> get outputs => $_getList(3);

  /// How the inputs should be selected.
  @$pb.TagNumber(5)
  InputSelector get inputSelector => $_getN(4);
  @$pb.TagNumber(5)
  set inputSelector(InputSelector value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasInputSelector() => $_has(4);
  @$pb.TagNumber(5)
  void clearInputSelector() => $_clearField(5);

  /// The amount of satoshis per vbyte ("satVb"), used for fee calculation.
  /// Can be satoshis per byte ("satB") **ONLY** when transaction does not contain segwit UTXOs.
  @$pb.TagNumber(6)
  $fixnum.Int64 get feePerVb => $_getI64(5);
  @$pb.TagNumber(6)
  set feePerVb($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFeePerVb() => $_has(5);
  @$pb.TagNumber(6)
  void clearFeePerVb() => $_clearField(6);

  /// (optional) The change output to be added (return to sender) at the end of the outputs list.
  /// The `Output.value` will be overwritten, leave default.
  /// Note there can be no change output if the change amount is less than dust threshold.
  /// Leave empty to explicitly disable change output creation.
  @$pb.TagNumber(7)
  Output get changeOutput => $_getN(6);
  @$pb.TagNumber(7)
  set changeOutput(Output value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasChangeOutput() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangeOutput() => $_clearField(7);
  @$pb.TagNumber(7)
  Output ensureChangeOutput() => $_ensure(6);

  /// The only output with a max available amount to be send.
  /// If set, `SigningInput.outputs` and `SigningInput.change` will be ignored.
  /// The `Output.value` will be overwritten, leave default.
  @$pb.TagNumber(8)
  Output get maxAmountOutput => $_getN(7);
  @$pb.TagNumber(8)
  set maxAmountOutput(Output value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasMaxAmountOutput() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxAmountOutput() => $_clearField(8);
  @$pb.TagNumber(8)
  Output ensureMaxAmountOutput() => $_ensure(7);

  /// Use a constant "Dust" threshold.
  @$pb.TagNumber(10)
  $fixnum.Int64 get fixedDustThreshold => $_getI64(8);
  @$pb.TagNumber(10)
  set fixedDustThreshold($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(10)
  $core.bool hasFixedDustThreshold() => $_has(8);
  @$pb.TagNumber(10)
  void clearFixedDustThreshold() => $_clearField(10);

  /// ZCash specific transaction data.
  @$pb.TagNumber(20)
  $2.TransactionBuilderExtraData get zcashExtraData => $_getN(9);
  @$pb.TagNumber(20)
  set zcashExtraData($2.TransactionBuilderExtraData value) =>
      $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasZcashExtraData() => $_has(9);
  @$pb.TagNumber(20)
  void clearZcashExtraData() => $_clearField(20);
  @$pb.TagNumber(20)
  $2.TransactionBuilderExtraData ensureZcashExtraData() => $_ensure(9);
}

/// Partially Signed Bitcoin Transaction.
class Psbt extends $pb.GeneratedMessage {
  factory Psbt({
    $core.List<$core.int>? psbt,
  }) {
    final result = create();
    if (psbt != null) result.psbt = psbt;
    return result;
  }

  Psbt._();

  factory Psbt.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Psbt.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Psbt',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'psbt', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Psbt clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Psbt copyWith(void Function(Psbt) updates) =>
      super.copyWith((message) => updates(message as Psbt)) as Psbt;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Psbt create() => Psbt._();
  @$core.override
  Psbt createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Psbt getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Psbt>(create);
  static Psbt? _defaultInstance;

  /// Partially Signed Bitcoin Transaction binary encoded.
  @$pb.TagNumber(1)
  $core.List<$core.int> get psbt => $_getN(0);
  @$pb.TagNumber(1)
  set psbt($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPsbt() => $_has(0);
  @$pb.TagNumber(1)
  void clearPsbt() => $_clearField(1);
}

enum SigningInput_Transaction { builder, psbt, notSet }

class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.Iterable<$core.List<$core.int>>? privateKeys,
    $core.Iterable<$core.List<$core.int>>? publicKeys,
    ChainInfo? chainInfo,
    $core.bool? dangerousUseFixedSchnorrRng,
    TransactionBuilder? builder,
    Psbt? psbt,
  }) {
    final result = create();
    if (privateKeys != null) result.privateKeys.addAll(privateKeys);
    if (publicKeys != null) result.publicKeys.addAll(publicKeys);
    if (chainInfo != null) result.chainInfo = chainInfo;
    if (dangerousUseFixedSchnorrRng != null)
      result.dangerousUseFixedSchnorrRng = dangerousUseFixedSchnorrRng;
    if (builder != null) result.builder = builder;
    if (psbt != null) result.psbt = psbt;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_Transaction>
      _SigningInput_TransactionByTag = {
    10: SigningInput_Transaction.builder,
    11: SigningInput_Transaction.psbt,
    0: SigningInput_Transaction.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKeys', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKeys', $pb.PbFieldType.PY)
    ..aOM<ChainInfo>(3, _omitFieldNames ? '' : 'chainInfo',
        subBuilder: ChainInfo.create)
    ..aOB(4, _omitFieldNames ? '' : 'dangerousUseFixedSchnorrRng')
    ..aOM<TransactionBuilder>(10, _omitFieldNames ? '' : 'builder',
        subBuilder: TransactionBuilder.create)
    ..aOM<Psbt>(11, _omitFieldNames ? '' : 'psbt', subBuilder: Psbt.create)
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

  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  SigningInput_Transaction whichTransaction() =>
      _SigningInput_TransactionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  void clearTransaction() => $_clearField($_whichOneof(0));

  /// User private keys.
  /// Only required if the `sign` method is called.
  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get privateKeys => $_getList(0);

  /// User public keys.
  /// Only required if the `plan`, `preImageHash` methods are called.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get publicKeys => $_getList(1);

  /// Chain info includes p2pkh, p2sh address prefixes.
  /// The parameter needs to be set if an input/output has a receiver address pattern.
  @$pb.TagNumber(3)
  ChainInfo get chainInfo => $_getN(2);
  @$pb.TagNumber(3)
  set chainInfo(ChainInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChainInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  ChainInfo ensureChainInfo() => $_ensure(2);

  /// Whether disable auxiliary random data when signing.
  /// Use for testing **ONLY**.
  @$pb.TagNumber(4)
  $core.bool get dangerousUseFixedSchnorrRng => $_getBF(3);
  @$pb.TagNumber(4)
  set dangerousUseFixedSchnorrRng($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDangerousUseFixedSchnorrRng() => $_has(3);
  @$pb.TagNumber(4)
  void clearDangerousUseFixedSchnorrRng() => $_clearField(4);

  /// Build a transaction to be signed.
  @$pb.TagNumber(10)
  TransactionBuilder get builder => $_getN(4);
  @$pb.TagNumber(10)
  set builder(TransactionBuilder value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasBuilder() => $_has(4);
  @$pb.TagNumber(10)
  void clearBuilder() => $_clearField(10);
  @$pb.TagNumber(10)
  TransactionBuilder ensureBuilder() => $_ensure(4);

  /// Finalize a Partially Signed Bitcoin Transaction by signing the rest of UTXOs.
  @$pb.TagNumber(11)
  Psbt get psbt => $_getN(5);
  @$pb.TagNumber(11)
  set psbt(Psbt value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPsbt() => $_has(5);
  @$pb.TagNumber(11)
  void clearPsbt() => $_clearField(11);
  @$pb.TagNumber(11)
  Psbt ensurePsbt() => $_ensure(5);
}

class TransactionPlan extends $pb.GeneratedMessage {
  factory TransactionPlan({
    $4.SigningError? error,
    $core.String? errorMessage,
    $core.Iterable<Input>? inputs,
    $core.Iterable<Output>? outputs,
    $fixnum.Int64? availableAmount,
    $fixnum.Int64? sendAmount,
    $fixnum.Int64? vsizeEstimate,
    $fixnum.Int64? feeEstimate,
    $fixnum.Int64? change,
  }) {
    final result = create();
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    if (availableAmount != null) result.availableAmount = availableAmount;
    if (sendAmount != null) result.sendAmount = sendAmount;
    if (vsizeEstimate != null) result.vsizeEstimate = vsizeEstimate;
    if (feeEstimate != null) result.feeEstimate = feeEstimate;
    if (change != null) result.change = change;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aE<$4.SigningError>(1, _omitFieldNames ? '' : 'error',
        enumValues: $4.SigningError.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..pPM<Input>(3, _omitFieldNames ? '' : 'inputs', subBuilder: Input.create)
    ..pPM<Output>(4, _omitFieldNames ? '' : 'outputs',
        subBuilder: Output.create)
    ..aInt64(5, _omitFieldNames ? '' : 'availableAmount')
    ..aInt64(6, _omitFieldNames ? '' : 'sendAmount')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'vsizeEstimate', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(8, _omitFieldNames ? '' : 'feeEstimate')
    ..aInt64(9, _omitFieldNames ? '' : 'change')
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

  /// A possible error, `OK` if none.
  @$pb.TagNumber(1)
  $4.SigningError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($4.SigningError value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => $_clearField(1);

  /// Error description.
  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);

  /// Selected unspent transaction outputs (subset of all input UTXOs).
  @$pb.TagNumber(3)
  $pb.PbList<Input> get inputs => $_getList(2);

  /// Transaction outputs including a change output if applied.
  @$pb.TagNumber(4)
  $pb.PbList<Output> get outputs => $_getList(3);

  /// Maximum available amount in all the transaction input UTXOs.
  /// That is an amount that will be spent by this transaction.
  @$pb.TagNumber(5)
  $fixnum.Int64 get availableAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set availableAmount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAvailableAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvailableAmount() => $_clearField(5);

  /// Total sending amount in all the transaction outputs.
  /// That is an amount that will be sent (including change output if applied).
  @$pb.TagNumber(6)
  $fixnum.Int64 get sendAmount => $_getI64(5);
  @$pb.TagNumber(6)
  set sendAmount($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSendAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearSendAmount() => $_clearField(6);

  /// The estimated `vsize` in `vbytes`.
  /// It is used to compare how much blockweight needs to be allocated to confirm a transaction.
  /// For non-segwit transactions, `vsize` = `size`.
  @$pb.TagNumber(7)
  $fixnum.Int64 get vsizeEstimate => $_getI64(6);
  @$pb.TagNumber(7)
  set vsizeEstimate($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVsizeEstimate() => $_has(6);
  @$pb.TagNumber(7)
  void clearVsizeEstimate() => $_clearField(7);

  /// The estimated fees of the transaction in satoshis.
  @$pb.TagNumber(8)
  $fixnum.Int64 get feeEstimate => $_getI64(7);
  @$pb.TagNumber(8)
  set feeEstimate($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFeeEstimate() => $_has(7);
  @$pb.TagNumber(8)
  void clearFeeEstimate() => $_clearField(8);

  /// Remaining change.
  /// Zero if not applied.
  @$pb.TagNumber(9)
  $fixnum.Int64 get change => $_getI64(8);
  @$pb.TagNumber(9)
  set change($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasChange() => $_has(8);
  @$pb.TagNumber(9)
  void clearChange() => $_clearField(9);
}

class PreSigningOutput_Sighash extends $pb.GeneratedMessage {
  factory PreSigningOutput_Sighash({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? sighash,
    PreSigningOutput_SigningMethod? signingMethod,
    PreSigningOutput_TaprootTweak? tweak,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (sighash != null) result.sighash = sighash;
    if (signingMethod != null) result.signingMethod = signingMethod;
    if (tweak != null) result.tweak = tweak;
    return result;
  }

  PreSigningOutput_Sighash._();

  factory PreSigningOutput_Sighash.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreSigningOutput_Sighash.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreSigningOutput.Sighash',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'sighash', $pb.PbFieldType.OY)
    ..aE<PreSigningOutput_SigningMethod>(
        3, _omitFieldNames ? '' : 'signingMethod',
        enumValues: PreSigningOutput_SigningMethod.values)
    ..aOM<PreSigningOutput_TaprootTweak>(4, _omitFieldNames ? '' : 'tweak',
        subBuilder: PreSigningOutput_TaprootTweak.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreSigningOutput_Sighash clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreSigningOutput_Sighash copyWith(
          void Function(PreSigningOutput_Sighash) updates) =>
      super.copyWith((message) => updates(message as PreSigningOutput_Sighash))
          as PreSigningOutput_Sighash;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreSigningOutput_Sighash create() => PreSigningOutput_Sighash._();
  @$core.override
  PreSigningOutput_Sighash createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreSigningOutput_Sighash getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreSigningOutput_Sighash>(create);
  static PreSigningOutput_Sighash? _defaultInstance;

  /// Public key used for signing.
  /// Please note it can be tweaked in case of P2TR scriptPubkey.
  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);

  /// The sighash to be signed.
  @$pb.TagNumber(2)
  $core.List<$core.int> get sighash => $_getN(1);
  @$pb.TagNumber(2)
  set sighash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSighash() => $_has(1);
  @$pb.TagNumber(2)
  void clearSighash() => $_clearField(2);

  /// Signing method to be used to sign the sighash.
  @$pb.TagNumber(3)
  PreSigningOutput_SigningMethod get signingMethod => $_getN(2);
  @$pb.TagNumber(3)
  set signingMethod(PreSigningOutput_SigningMethod value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSigningMethod() => $_has(2);
  @$pb.TagNumber(3)
  void clearSigningMethod() => $_clearField(3);

  /// Taproot tweak if `Taproot` signing method is used.
  /// Empty if there is no need to tweak the private to sign the sighash.
  @$pb.TagNumber(4)
  PreSigningOutput_TaprootTweak get tweak => $_getN(3);
  @$pb.TagNumber(4)
  set tweak(PreSigningOutput_TaprootTweak value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTweak() => $_has(3);
  @$pb.TagNumber(4)
  void clearTweak() => $_clearField(4);
  @$pb.TagNumber(4)
  PreSigningOutput_TaprootTweak ensureTweak() => $_ensure(3);
}

class PreSigningOutput_TaprootTweak extends $pb.GeneratedMessage {
  factory PreSigningOutput_TaprootTweak({
    $core.List<$core.int>? merkleRoot,
  }) {
    final result = create();
    if (merkleRoot != null) result.merkleRoot = merkleRoot;
    return result;
  }

  PreSigningOutput_TaprootTweak._();

  factory PreSigningOutput_TaprootTweak.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PreSigningOutput_TaprootTweak.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PreSigningOutput.TaprootTweak',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'merkleRoot', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreSigningOutput_TaprootTweak clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PreSigningOutput_TaprootTweak copyWith(
          void Function(PreSigningOutput_TaprootTweak) updates) =>
      super.copyWith(
              (message) => updates(message as PreSigningOutput_TaprootTweak))
          as PreSigningOutput_TaprootTweak;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreSigningOutput_TaprootTweak create() =>
      PreSigningOutput_TaprootTweak._();
  @$core.override
  PreSigningOutput_TaprootTweak createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PreSigningOutput_TaprootTweak getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PreSigningOutput_TaprootTweak>(create);
  static PreSigningOutput_TaprootTweak? _defaultInstance;

  /// 32 bytes merkle root of the script tree.
  /// Empty if there are no scripts, and the private key should be tweaked without a merkle root.
  @$pb.TagNumber(1)
  $core.List<$core.int> get merkleRoot => $_getN(0);
  @$pb.TagNumber(1)
  set merkleRoot($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMerkleRoot() => $_has(0);
  @$pb.TagNumber(1)
  void clearMerkleRoot() => $_clearField(1);
}

class PreSigningOutput extends $pb.GeneratedMessage {
  factory PreSigningOutput({
    $4.SigningError? error,
    $core.String? errorMessage,
    $core.Iterable<PreSigningOutput_Sighash>? sighashes,
  }) {
    final result = create();
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (sighashes != null) result.sighashes.addAll(sighashes);
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..aE<$4.SigningError>(1, _omitFieldNames ? '' : 'error',
        enumValues: $4.SigningError.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..pPM<PreSigningOutput_Sighash>(4, _omitFieldNames ? '' : 'sighashes',
        subBuilder: PreSigningOutput_Sighash.create)
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

  /// A possible error, `OK` if none.
  @$pb.TagNumber(1)
  $4.SigningError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($4.SigningError value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => $_clearField(1);

  /// Error description.
  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);

  /// The sighashes to be signed; ECDSA for legacy and Segwit, Schnorr for Taproot.
  @$pb.TagNumber(4)
  $pb.PbList<PreSigningOutput_Sighash> get sighashes => $_getList(2);
}

enum SigningOutput_Transaction { bitcoin, zcash, decred, notSet }

class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $4.SigningError? error,
    $core.String? errorMessage,
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? txid,
    $fixnum.Int64? vsize,
    $fixnum.Int64? weight,
    $fixnum.Int64? fee,
    Psbt? psbt,
    $0.Transaction? bitcoin,
    $2.Transaction? zcash,
    $3.Transaction? decred,
  }) {
    final result = create();
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (encoded != null) result.encoded = encoded;
    if (txid != null) result.txid = txid;
    if (vsize != null) result.vsize = vsize;
    if (weight != null) result.weight = weight;
    if (fee != null) result.fee = fee;
    if (psbt != null) result.psbt = psbt;
    if (bitcoin != null) result.bitcoin = bitcoin;
    if (zcash != null) result.zcash = zcash;
    if (decred != null) result.decred = decred;
    return result;
  }

  SigningOutput._();

  factory SigningOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningOutput_Transaction>
      _SigningOutput_TransactionByTag = {
    15: SigningOutput_Transaction.bitcoin,
    16: SigningOutput_Transaction.zcash,
    17: SigningOutput_Transaction.decred,
    0: SigningOutput_Transaction.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.BitcoinV2.Proto'),
      createEmptyInstance: create)
    ..oo(0, [15, 16, 17])
    ..aE<$4.SigningError>(1, _omitFieldNames ? '' : 'error',
        enumValues: $4.SigningError.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'txid', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'vsize', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'weight', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(8, _omitFieldNames ? '' : 'fee')
    ..aOM<Psbt>(9, _omitFieldNames ? '' : 'psbt', subBuilder: Psbt.create)
    ..aOM<$0.Transaction>(15, _omitFieldNames ? '' : 'bitcoin',
        subBuilder: $0.Transaction.create)
    ..aOM<$2.Transaction>(16, _omitFieldNames ? '' : 'zcash',
        subBuilder: $2.Transaction.create)
    ..aOM<$3.Transaction>(17, _omitFieldNames ? '' : 'decred',
        subBuilder: $3.Transaction.create)
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

  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  SigningOutput_Transaction whichTransaction() =>
      _SigningOutput_TransactionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  void clearTransaction() => $_clearField($_whichOneof(0));

  /// A possible error, `OK` if none.
  @$pb.TagNumber(1)
  $4.SigningError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($4.SigningError value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => $_clearField(1);

  /// Error description.
  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);

  /// The encoded transaction that can be submitted to the network.
  @$pb.TagNumber(4)
  $core.List<$core.int> get encoded => $_getN(2);
  @$pb.TagNumber(4)
  set encoded($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(4)
  $core.bool hasEncoded() => $_has(2);
  @$pb.TagNumber(4)
  void clearEncoded() => $_clearField(4);

  /// The transaction ID (hash).
  @$pb.TagNumber(5)
  $core.List<$core.int> get txid => $_getN(3);
  @$pb.TagNumber(5)
  set txid($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(5)
  $core.bool hasTxid() => $_has(3);
  @$pb.TagNumber(5)
  void clearTxid() => $_clearField(5);

  /// The total `vsize` in `vbytes`.
  /// It is used to compare how much blockweight needs to be allocated to confirm a transaction.
  /// For non-segwit transactions, `vsize` = `size`.
  @$pb.TagNumber(6)
  $fixnum.Int64 get vsize => $_getI64(4);
  @$pb.TagNumber(6)
  set vsize($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(6)
  $core.bool hasVsize() => $_has(4);
  @$pb.TagNumber(6)
  void clearVsize() => $_clearField(6);

  /// Transaction weight is defined as Base transaction size * 3 + Total transaction size
  /// (ie. the same method as calculating Block weight from Base size and Total size).
  @$pb.TagNumber(7)
  $fixnum.Int64 get weight => $_getI64(5);
  @$pb.TagNumber(7)
  set weight($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(7)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(7)
  void clearWeight() => $_clearField(7);

  /// The total and final fee of the transaction in satoshis.
  @$pb.TagNumber(8)
  $fixnum.Int64 get fee => $_getI64(6);
  @$pb.TagNumber(8)
  set fee($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(8)
  $core.bool hasFee() => $_has(6);
  @$pb.TagNumber(8)
  void clearFee() => $_clearField(8);

  /// Optional. Signed transaction serialized as PSBT.
  /// Set if `SigningInput.psbt` is used.
  @$pb.TagNumber(9)
  Psbt get psbt => $_getN(7);
  @$pb.TagNumber(9)
  set psbt(Psbt value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasPsbt() => $_has(7);
  @$pb.TagNumber(9)
  void clearPsbt() => $_clearField(9);
  @$pb.TagNumber(9)
  Psbt ensurePsbt() => $_ensure(7);

  /// Standard Bitcoin transaction.
  @$pb.TagNumber(15)
  $0.Transaction get bitcoin => $_getN(8);
  @$pb.TagNumber(15)
  set bitcoin($0.Transaction value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasBitcoin() => $_has(8);
  @$pb.TagNumber(15)
  void clearBitcoin() => $_clearField(15);
  @$pb.TagNumber(15)
  $0.Transaction ensureBitcoin() => $_ensure(8);

  /// ZCash transaction.
  @$pb.TagNumber(16)
  $2.Transaction get zcash => $_getN(9);
  @$pb.TagNumber(16)
  set zcash($2.Transaction value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasZcash() => $_has(9);
  @$pb.TagNumber(16)
  void clearZcash() => $_clearField(16);
  @$pb.TagNumber(16)
  $2.Transaction ensureZcash() => $_ensure(9);

  /// Decred transaction.
  @$pb.TagNumber(17)
  $3.Transaction get decred => $_getN(10);
  @$pb.TagNumber(17)
  set decred($3.Transaction value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasDecred() => $_has(10);
  @$pb.TagNumber(17)
  void clearDecred() => $_clearField(17);
  @$pb.TagNumber(17)
  $3.Transaction ensureDecred() => $_ensure(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
