// This is a generated file - do not edit.
//
// Generated from Algorand.proto.

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

/// Simple transfer message, transfer an amount to an address
class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.String? toAddress,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    return result;
  }

  Transfer._();

  factory Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Algorand.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transfer copyWith(void Function(Transfer) updates) =>
      super.copyWith((message) => updates(message as Transfer)) as Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  @$core.override
  Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  /// Destination address (string)
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Amount
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// Asset Transfer message, with assetID
class AssetTransfer extends $pb.GeneratedMessage {
  factory AssetTransfer({
    $core.String? toAddress,
    $fixnum.Int64? amount,
    $fixnum.Int64? assetId,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    if (assetId != null) result.assetId = assetId;
    return result;
  }

  AssetTransfer._();

  factory AssetTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetTransfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Algorand.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'assetId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetTransfer copyWith(void Function(AssetTransfer) updates) =>
      super.copyWith((message) => updates(message as AssetTransfer))
          as AssetTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetTransfer create() => AssetTransfer._();
  @$core.override
  AssetTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetTransfer>(create);
  static AssetTransfer? _defaultInstance;

  /// Destination address (string)
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Amount
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// ID of the asset being transferred
  @$pb.TagNumber(3)
  $fixnum.Int64 get assetId => $_getI64(2);
  @$pb.TagNumber(3)
  set assetId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAssetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetId() => $_clearField(3);
}

/// Opt-in message for an asset
class AssetOptIn extends $pb.GeneratedMessage {
  factory AssetOptIn({
    $fixnum.Int64? assetId,
  }) {
    final result = create();
    if (assetId != null) result.assetId = assetId;
    return result;
  }

  AssetOptIn._();

  factory AssetOptIn.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetOptIn.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetOptIn',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Algorand.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'assetId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetOptIn clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetOptIn copyWith(void Function(AssetOptIn) updates) =>
      super.copyWith((message) => updates(message as AssetOptIn)) as AssetOptIn;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetOptIn create() => AssetOptIn._();
  @$core.override
  AssetOptIn createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetOptIn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetOptIn>(create);
  static AssetOptIn? _defaultInstance;

  /// ID of the asset
  @$pb.TagNumber(1)
  $fixnum.Int64 get assetId => $_getI64(0);
  @$pb.TagNumber(1)
  set assetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);
}

enum SigningInput_MessageOneof { transfer, assetTransfer, assetOptIn, notSet }

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.String? genesisId,
    $core.List<$core.int>? genesisHash,
    $core.List<$core.int>? note,
    $core.List<$core.int>? privateKey,
    $fixnum.Int64? firstRound,
    $fixnum.Int64? lastRound,
    $fixnum.Int64? fee,
    $core.List<$core.int>? publicKey,
    Transfer? transfer,
    AssetTransfer? assetTransfer,
    AssetOptIn? assetOptIn,
  }) {
    final result = create();
    if (genesisId != null) result.genesisId = genesisId;
    if (genesisHash != null) result.genesisHash = genesisHash;
    if (note != null) result.note = note;
    if (privateKey != null) result.privateKey = privateKey;
    if (firstRound != null) result.firstRound = firstRound;
    if (lastRound != null) result.lastRound = lastRound;
    if (fee != null) result.fee = fee;
    if (publicKey != null) result.publicKey = publicKey;
    if (transfer != null) result.transfer = transfer;
    if (assetTransfer != null) result.assetTransfer = assetTransfer;
    if (assetOptIn != null) result.assetOptIn = assetOptIn;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_MessageOneof>
      _SigningInput_MessageOneofByTag = {
    10: SigningInput_MessageOneof.transfer,
    11: SigningInput_MessageOneof.assetTransfer,
    12: SigningInput_MessageOneof.assetOptIn,
    0: SigningInput_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Algorand.Proto'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12])
    ..aOS(1, _omitFieldNames ? '' : 'genesisId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'genesisHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'note', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'firstRound', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'lastRound', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aOM<Transfer>(10, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..aOM<AssetTransfer>(11, _omitFieldNames ? '' : 'assetTransfer',
        subBuilder: AssetTransfer.create)
    ..aOM<AssetOptIn>(12, _omitFieldNames ? '' : 'assetOptIn',
        subBuilder: AssetOptIn.create)
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
  @$pb.TagNumber(12)
  SigningInput_MessageOneof whichMessageOneof() =>
      _SigningInput_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  /// network / chain id
  @$pb.TagNumber(1)
  $core.String get genesisId => $_getSZ(0);
  @$pb.TagNumber(1)
  set genesisId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGenesisId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGenesisId() => $_clearField(1);

  /// network / chain hash
  @$pb.TagNumber(2)
  $core.List<$core.int> get genesisHash => $_getN(1);
  @$pb.TagNumber(2)
  set genesisHash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGenesisHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearGenesisHash() => $_clearField(2);

  /// binary note data
  @$pb.TagNumber(3)
  $core.List<$core.int> get note => $_getN(2);
  @$pb.TagNumber(3)
  set note($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => $_clearField(3);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(4)
  $core.List<$core.int> get privateKey => $_getN(3);
  @$pb.TagNumber(4)
  set privateKey($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrivateKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrivateKey() => $_clearField(4);

  /// network / first round
  @$pb.TagNumber(5)
  $fixnum.Int64 get firstRound => $_getI64(4);
  @$pb.TagNumber(5)
  set firstRound($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFirstRound() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstRound() => $_clearField(5);

  /// network / last round
  @$pb.TagNumber(6)
  $fixnum.Int64 get lastRound => $_getI64(5);
  @$pb.TagNumber(6)
  set lastRound($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLastRound() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastRound() => $_clearField(6);

  /// fee amount
  @$pb.TagNumber(7)
  $fixnum.Int64 get fee => $_getI64(6);
  @$pb.TagNumber(7)
  set fee($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFee() => $_has(6);
  @$pb.TagNumber(7)
  void clearFee() => $_clearField(7);

  /// public key
  @$pb.TagNumber(8)
  $core.List<$core.int> get publicKey => $_getN(7);
  @$pb.TagNumber(8)
  set publicKey($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPublicKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearPublicKey() => $_clearField(8);

  @$pb.TagNumber(10)
  Transfer get transfer => $_getN(8);
  @$pb.TagNumber(10)
  set transfer(Transfer value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTransfer() => $_has(8);
  @$pb.TagNumber(10)
  void clearTransfer() => $_clearField(10);
  @$pb.TagNumber(10)
  Transfer ensureTransfer() => $_ensure(8);

  @$pb.TagNumber(11)
  AssetTransfer get assetTransfer => $_getN(9);
  @$pb.TagNumber(11)
  set assetTransfer(AssetTransfer value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasAssetTransfer() => $_has(9);
  @$pb.TagNumber(11)
  void clearAssetTransfer() => $_clearField(11);
  @$pb.TagNumber(11)
  AssetTransfer ensureAssetTransfer() => $_ensure(9);

  @$pb.TagNumber(12)
  AssetOptIn get assetOptIn => $_getN(10);
  @$pb.TagNumber(12)
  set assetOptIn(AssetOptIn value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasAssetOptIn() => $_has(10);
  @$pb.TagNumber(12)
  void clearAssetOptIn() => $_clearField(12);
  @$pb.TagNumber(12)
  AssetOptIn ensureAssetOptIn() => $_ensure(10);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $core.String? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (signature != null) result.signature = signature;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Algorand.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'signature')
    ..aE<$0.SigningError>(3, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
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

  /// Signed and encoded transaction bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// Signature in base64.
  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// Error code, 0 is ok, other codes will be treated as errors.
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// Error description.
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
