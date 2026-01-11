// This is a generated file - do not edit.
//
// Generated from BabylonStaking.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
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

  /// Public key bytes. Can be either compressed (33 bytes) or x-only (32 bytes).
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

class StakingInfo extends $pb.GeneratedMessage {
  factory StakingInfo({
    $core.List<$core.int>? stakerPublicKey,
    $core.List<$core.int>? finalityProviderPublicKey,
    $core.int? stakingTime,
    $core.Iterable<$core.List<$core.int>>? covenantCommitteePublicKeys,
    $core.int? covenantQuorum,
  }) {
    final result = create();
    if (stakerPublicKey != null) result.stakerPublicKey = stakerPublicKey;
    if (finalityProviderPublicKey != null)
      result.finalityProviderPublicKey = finalityProviderPublicKey;
    if (stakingTime != null) result.stakingTime = stakingTime;
    if (covenantCommitteePublicKeys != null)
      result.covenantCommitteePublicKeys.addAll(covenantCommitteePublicKeys);
    if (covenantQuorum != null) result.covenantQuorum = covenantQuorum;
    return result;
  }

  StakingInfo._();

  factory StakingInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StakingInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StakingInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'stakerPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2,
        _omitFieldNames ? '' : 'finalityProviderPublicKey', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'stakingTime',
        fieldType: $pb.PbFieldType.OU3)
    ..p<$core.List<$core.int>>(
        4,
        _omitFieldNames ? '' : 'covenantCommitteePublicKeys',
        $pb.PbFieldType.PY)
    ..aI(5, _omitFieldNames ? '' : 'covenantQuorum',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StakingInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StakingInfo copyWith(void Function(StakingInfo) updates) =>
      super.copyWith((message) => updates(message as StakingInfo))
          as StakingInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StakingInfo create() => StakingInfo._();
  @$core.override
  StakingInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StakingInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StakingInfo>(create);
  static StakingInfo? _defaultInstance;

  /// User's public key.
  @$pb.TagNumber(1)
  $core.List<$core.int> get stakerPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set stakerPublicKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStakerPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakerPublicKey() => $_clearField(1);

  /// Finality provider's public key chosen by the user.
  @$pb.TagNumber(2)
  $core.List<$core.int> get finalityProviderPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set finalityProviderPublicKey($core.List<$core.int> value) =>
      $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFinalityProviderPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearFinalityProviderPublicKey() => $_clearField(2);

  /// Staking Output's lock time.
  /// Equal to `global_parameters.staking_time` when creating a Staking transaction.
  /// or `global_parameters.unbonding_time` when creating an Unbonding transaction.
  @$pb.TagNumber(3)
  $core.int get stakingTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set stakingTime($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStakingTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStakingTime() => $_clearField(3);

  /// Retrieved from global_parameters.covenant_pks.
  /// Babylon nodes that can approve Unbonding tx or Slash the staked position when acting bad.
  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get covenantCommitteePublicKeys =>
      $_getList(3);

  /// Retrieved from global_parameters.covenant_quorum.
  /// Specifies the quorum required by the covenant committee for unbonding transactions to be confirmed.
  @$pb.TagNumber(5)
  $core.int get covenantQuorum => $_getIZ(4);
  @$pb.TagNumber(5)
  set covenantQuorum($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCovenantQuorum() => $_has(4);
  @$pb.TagNumber(5)
  void clearCovenantQuorum() => $_clearField(5);
}

/// Spend a Staking Output via timelock path (staking time expired).
/// In other words, create a Withdraw transaction.
class InputBuilder_StakingTimelockPath extends $pb.GeneratedMessage {
  factory InputBuilder_StakingTimelockPath({
    StakingInfo? params,
  }) {
    final result = create();
    if (params != null) result.params = params;
    return result;
  }

  InputBuilder_StakingTimelockPath._();

  factory InputBuilder_StakingTimelockPath.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputBuilder_StakingTimelockPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputBuilder.StakingTimelockPath',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_StakingTimelockPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_StakingTimelockPath copyWith(
          void Function(InputBuilder_StakingTimelockPath) updates) =>
      super.copyWith(
              (message) => updates(message as InputBuilder_StakingTimelockPath))
          as InputBuilder_StakingTimelockPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputBuilder_StakingTimelockPath create() =>
      InputBuilder_StakingTimelockPath._();
  @$core.override
  InputBuilder_StakingTimelockPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputBuilder_StakingTimelockPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputBuilder_StakingTimelockPath>(
          create);
  static InputBuilder_StakingTimelockPath? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);
}

/// Spend a Staking Output via unbonding path.
/// In other words, create an Unbonding transaction.
class InputBuilder_StakingUnbondingPath extends $pb.GeneratedMessage {
  factory InputBuilder_StakingUnbondingPath({
    StakingInfo? params,
    $core.Iterable<PublicKeySignature>? covenantCommitteeSignatures,
  }) {
    final result = create();
    if (params != null) result.params = params;
    if (covenantCommitteeSignatures != null)
      result.covenantCommitteeSignatures.addAll(covenantCommitteeSignatures);
    return result;
  }

  InputBuilder_StakingUnbondingPath._();

  factory InputBuilder_StakingUnbondingPath.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputBuilder_StakingUnbondingPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputBuilder.StakingUnbondingPath',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..pPM<PublicKeySignature>(
        2, _omitFieldNames ? '' : 'covenantCommitteeSignatures',
        subBuilder: PublicKeySignature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_StakingUnbondingPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_StakingUnbondingPath copyWith(
          void Function(InputBuilder_StakingUnbondingPath) updates) =>
      super.copyWith((message) =>
              updates(message as InputBuilder_StakingUnbondingPath))
          as InputBuilder_StakingUnbondingPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputBuilder_StakingUnbondingPath create() =>
      InputBuilder_StakingUnbondingPath._();
  @$core.override
  InputBuilder_StakingUnbondingPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputBuilder_StakingUnbondingPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputBuilder_StakingUnbondingPath>(
          create);
  static InputBuilder_StakingUnbondingPath? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);

  /// Signatures signed by covenant committees.
  /// There can be less signatures than covenant public keys, but not less than `covenant_quorum`.
  @$pb.TagNumber(2)
  $pb.PbList<PublicKeySignature> get covenantCommitteeSignatures =>
      $_getList(1);
}

/// Spend a Staking Output via slashing path.
/// Slashing path is only used in [ExpressOfInterest](https://github.com/babylonlabs-io/babylon-proto-ts/blob/ef42d04959b326849fe8c9773ab23802573ad407/src/generated/babylon/btcstaking/v1/tx.ts#L61).
/// In other words, generate an unsigned Slashing transaction, pre-sign the staker's signature only and share to Babylon PoS chain.
class InputBuilder_StakingSlashingPath extends $pb.GeneratedMessage {
  factory InputBuilder_StakingSlashingPath({
    StakingInfo? params,
    PublicKeySignature? finalityProviderSignature,
  }) {
    final result = create();
    if (params != null) result.params = params;
    if (finalityProviderSignature != null)
      result.finalityProviderSignature = finalityProviderSignature;
    return result;
  }

  InputBuilder_StakingSlashingPath._();

  factory InputBuilder_StakingSlashingPath.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputBuilder_StakingSlashingPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputBuilder.StakingSlashingPath',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..aOM<PublicKeySignature>(
        2, _omitFieldNames ? '' : 'finalityProviderSignature',
        subBuilder: PublicKeySignature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_StakingSlashingPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_StakingSlashingPath copyWith(
          void Function(InputBuilder_StakingSlashingPath) updates) =>
      super.copyWith(
              (message) => updates(message as InputBuilder_StakingSlashingPath))
          as InputBuilder_StakingSlashingPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputBuilder_StakingSlashingPath create() =>
      InputBuilder_StakingSlashingPath._();
  @$core.override
  InputBuilder_StakingSlashingPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputBuilder_StakingSlashingPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputBuilder_StakingSlashingPath>(
          create);
  static InputBuilder_StakingSlashingPath? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);

  /// Empty in most of the cases. Staker's signature can be calculated without the fp signature.
  @$pb.TagNumber(2)
  PublicKeySignature get finalityProviderSignature => $_getN(1);
  @$pb.TagNumber(2)
  set finalityProviderSignature(PublicKeySignature value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFinalityProviderSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearFinalityProviderSignature() => $_clearField(2);
  @$pb.TagNumber(2)
  PublicKeySignature ensureFinalityProviderSignature() => $_ensure(1);
}

/// Spend an Unbonding Output via timelock path (unbonding time expired).
/// In other words, create a Withdraw transaction spending an Unbonding transaction.
class InputBuilder_UnbondingTimelockPath extends $pb.GeneratedMessage {
  factory InputBuilder_UnbondingTimelockPath({
    StakingInfo? params,
  }) {
    final result = create();
    if (params != null) result.params = params;
    return result;
  }

  InputBuilder_UnbondingTimelockPath._();

  factory InputBuilder_UnbondingTimelockPath.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputBuilder_UnbondingTimelockPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputBuilder.UnbondingTimelockPath',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_UnbondingTimelockPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_UnbondingTimelockPath copyWith(
          void Function(InputBuilder_UnbondingTimelockPath) updates) =>
      super.copyWith((message) =>
              updates(message as InputBuilder_UnbondingTimelockPath))
          as InputBuilder_UnbondingTimelockPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputBuilder_UnbondingTimelockPath create() =>
      InputBuilder_UnbondingTimelockPath._();
  @$core.override
  InputBuilder_UnbondingTimelockPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputBuilder_UnbondingTimelockPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputBuilder_UnbondingTimelockPath>(
          create);
  static InputBuilder_UnbondingTimelockPath? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);
}

/// Spend an Unbonding Output via slashing path.
/// Slashing path is only used in [ExpressOfInterest](https://github.com/babylonlabs-io/babylon-proto-ts/blob/ef42d04959b326849fe8c9773ab23802573ad407/src/generated/babylon/btcstaking/v1/tx.ts#L61).
/// In other words, generate an unsigned Slashing transaction, pre-sign the staker's signature only and share to Babylon PoS chain.
class InputBuilder_UnbondingSlashingPath extends $pb.GeneratedMessage {
  factory InputBuilder_UnbondingSlashingPath({
    StakingInfo? params,
    PublicKeySignature? finalityProviderSignature,
  }) {
    final result = create();
    if (params != null) result.params = params;
    if (finalityProviderSignature != null)
      result.finalityProviderSignature = finalityProviderSignature;
    return result;
  }

  InputBuilder_UnbondingSlashingPath._();

  factory InputBuilder_UnbondingSlashingPath.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputBuilder_UnbondingSlashingPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputBuilder.UnbondingSlashingPath',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..aOM<PublicKeySignature>(
        2, _omitFieldNames ? '' : 'finalityProviderSignature',
        subBuilder: PublicKeySignature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_UnbondingSlashingPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder_UnbondingSlashingPath copyWith(
          void Function(InputBuilder_UnbondingSlashingPath) updates) =>
      super.copyWith((message) =>
              updates(message as InputBuilder_UnbondingSlashingPath))
          as InputBuilder_UnbondingSlashingPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputBuilder_UnbondingSlashingPath create() =>
      InputBuilder_UnbondingSlashingPath._();
  @$core.override
  InputBuilder_UnbondingSlashingPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputBuilder_UnbondingSlashingPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputBuilder_UnbondingSlashingPath>(
          create);
  static InputBuilder_UnbondingSlashingPath? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);

  /// Empty in most of the cases. Staker's signature can be calculated without the fp signature.
  @$pb.TagNumber(2)
  PublicKeySignature get finalityProviderSignature => $_getN(1);
  @$pb.TagNumber(2)
  set finalityProviderSignature(PublicKeySignature value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFinalityProviderSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearFinalityProviderSignature() => $_clearField(2);
  @$pb.TagNumber(2)
  PublicKeySignature ensureFinalityProviderSignature() => $_ensure(1);
}

class InputBuilder extends $pb.GeneratedMessage {
  factory InputBuilder() => create();

  InputBuilder._();

  factory InputBuilder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputBuilder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputBuilder',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputBuilder copyWith(void Function(InputBuilder) updates) =>
      super.copyWith((message) => updates(message as InputBuilder))
          as InputBuilder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputBuilder create() => InputBuilder._();
  @$core.override
  InputBuilder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputBuilder>(create);
  static InputBuilder? _defaultInstance;
}

/// Create a Staking Output.
class OutputBuilder_StakingOutput extends $pb.GeneratedMessage {
  factory OutputBuilder_StakingOutput({
    StakingInfo? params,
  }) {
    final result = create();
    if (params != null) result.params = params;
    return result;
  }

  OutputBuilder_StakingOutput._();

  factory OutputBuilder_StakingOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputBuilder_StakingOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputBuilder.StakingOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder_StakingOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder_StakingOutput copyWith(
          void Function(OutputBuilder_StakingOutput) updates) =>
      super.copyWith(
              (message) => updates(message as OutputBuilder_StakingOutput))
          as OutputBuilder_StakingOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputBuilder_StakingOutput create() =>
      OutputBuilder_StakingOutput._();
  @$core.override
  OutputBuilder_StakingOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputBuilder_StakingOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputBuilder_StakingOutput>(create);
  static OutputBuilder_StakingOutput? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);
}

/// Create an Unbonding Output.
class OutputBuilder_UnbondingOutput extends $pb.GeneratedMessage {
  factory OutputBuilder_UnbondingOutput({
    StakingInfo? params,
  }) {
    final result = create();
    if (params != null) result.params = params;
    return result;
  }

  OutputBuilder_UnbondingOutput._();

  factory OutputBuilder_UnbondingOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputBuilder_UnbondingOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputBuilder.UnbondingOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..aOM<StakingInfo>(1, _omitFieldNames ? '' : 'params',
        subBuilder: StakingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder_UnbondingOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder_UnbondingOutput copyWith(
          void Function(OutputBuilder_UnbondingOutput) updates) =>
      super.copyWith(
              (message) => updates(message as OutputBuilder_UnbondingOutput))
          as OutputBuilder_UnbondingOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputBuilder_UnbondingOutput create() =>
      OutputBuilder_UnbondingOutput._();
  @$core.override
  OutputBuilder_UnbondingOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputBuilder_UnbondingOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputBuilder_UnbondingOutput>(create);
  static OutputBuilder_UnbondingOutput? _defaultInstance;

  @$pb.TagNumber(1)
  StakingInfo get params => $_getN(0);
  @$pb.TagNumber(1)
  set params(StakingInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => $_clearField(1);
  @$pb.TagNumber(1)
  StakingInfo ensureParams() => $_ensure(0);
}

/// Creates an OP_RETURN output used to identify the staking transaction among other transactions in the Bitcoin ledger.
class OutputBuilder_OpReturn extends $pb.GeneratedMessage {
  factory OutputBuilder_OpReturn({
    $core.List<$core.int>? tag,
    $core.List<$core.int>? stakerPublicKey,
    $core.List<$core.int>? finalityProviderPublicKey,
    $core.int? stakingTime,
  }) {
    final result = create();
    if (tag != null) result.tag = tag;
    if (stakerPublicKey != null) result.stakerPublicKey = stakerPublicKey;
    if (finalityProviderPublicKey != null)
      result.finalityProviderPublicKey = finalityProviderPublicKey;
    if (stakingTime != null) result.stakingTime = stakingTime;
    return result;
  }

  OutputBuilder_OpReturn._();

  factory OutputBuilder_OpReturn.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputBuilder_OpReturn.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputBuilder.OpReturn',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'tag', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'stakerPublicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3,
        _omitFieldNames ? '' : 'finalityProviderPublicKey', $pb.PbFieldType.OY)
    ..aI(4, _omitFieldNames ? '' : 'stakingTime',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder_OpReturn clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder_OpReturn copyWith(
          void Function(OutputBuilder_OpReturn) updates) =>
      super.copyWith((message) => updates(message as OutputBuilder_OpReturn))
          as OutputBuilder_OpReturn;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputBuilder_OpReturn create() => OutputBuilder_OpReturn._();
  @$core.override
  OutputBuilder_OpReturn createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputBuilder_OpReturn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputBuilder_OpReturn>(create);
  static OutputBuilder_OpReturn? _defaultInstance;

  /// Retrieved from global_parameters.Tag.
  @$pb.TagNumber(1)
  $core.List<$core.int> get tag => $_getN(0);
  @$pb.TagNumber(1)
  set tag($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTag() => $_clearField(1);

  /// User's public key.
  @$pb.TagNumber(2)
  $core.List<$core.int> get stakerPublicKey => $_getN(1);
  @$pb.TagNumber(2)
  set stakerPublicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStakerPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearStakerPublicKey() => $_clearField(2);

  /// Finality provider's public key chosen by the user.
  @$pb.TagNumber(3)
  $core.List<$core.int> get finalityProviderPublicKey => $_getN(2);
  @$pb.TagNumber(3)
  set finalityProviderPublicKey($core.List<$core.int> value) =>
      $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFinalityProviderPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearFinalityProviderPublicKey() => $_clearField(3);

  /// global_parameters.min_staking_time <= staking_time <= global_parameters.max_staking_time.
  @$pb.TagNumber(4)
  $core.int get stakingTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set stakingTime($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStakingTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStakingTime() => $_clearField(4);
}

class OutputBuilder extends $pb.GeneratedMessage {
  factory OutputBuilder() => create();

  OutputBuilder._();

  factory OutputBuilder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutputBuilder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutputBuilder',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.BabylonStaking.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutputBuilder copyWith(void Function(OutputBuilder) updates) =>
      super.copyWith((message) => updates(message as OutputBuilder))
          as OutputBuilder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutputBuilder create() => OutputBuilder._();
  @$core.override
  OutputBuilder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutputBuilder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputBuilder>(create);
  static OutputBuilder? _defaultInstance;
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
