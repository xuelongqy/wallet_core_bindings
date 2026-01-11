// This is a generated file - do not edit.
//
// Generated from Aptos.proto.

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

/// Necessary fields to process a TransferMessage
class TransferMessage extends $pb.GeneratedMessage {
  factory TransferMessage({
    $core.String? to,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    return result;
  }

  TransferMessage._();

  factory TransferMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferMessage copyWith(void Function(TransferMessage) updates) =>
      super.copyWith((message) => updates(message as TransferMessage))
          as TransferMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferMessage create() => TransferMessage._();
  @$core.override
  TransferMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferMessage>(create);
  static TransferMessage? _defaultInstance;

  /// Destination Account address (string)
  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => $_clearField(1);

  /// Amount to be transferred (uint64)
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// Necessary tag for type function argument
class StructTag extends $pb.GeneratedMessage {
  factory StructTag({
    $core.String? accountAddress,
    $core.String? module,
    $core.String? name,
  }) {
    final result = create();
    if (accountAddress != null) result.accountAddress = accountAddress;
    if (module != null) result.module = module;
    if (name != null) result.name = name;
    return result;
  }

  StructTag._();

  factory StructTag.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StructTag.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StructTag',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountAddress')
    ..aOS(2, _omitFieldNames ? '' : 'module')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StructTag clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StructTag copyWith(void Function(StructTag) updates) =>
      super.copyWith((message) => updates(message as StructTag)) as StructTag;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StructTag create() => StructTag._();
  @$core.override
  StructTag createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StructTag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StructTag>(create);
  static StructTag? _defaultInstance;

  /// Address of the account
  @$pb.TagNumber(1)
  $core.String get accountAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountAddress() => $_clearField(1);

  /// Module name
  @$pb.TagNumber(2)
  $core.String get module => $_getSZ(1);
  @$pb.TagNumber(2)
  set module($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasModule() => $_has(1);
  @$pb.TagNumber(2)
  void clearModule() => $_clearField(2);

  /// Identifier
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);
}

/// Necessary fields to process a `0x1::coin::transfer` function.
class TokenTransferMessage extends $pb.GeneratedMessage {
  factory TokenTransferMessage({
    $core.String? to,
    $fixnum.Int64? amount,
    StructTag? function,
  }) {
    final result = create();
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    if (function != null) result.function = function;
    return result;
  }

  TokenTransferMessage._();

  factory TokenTransferMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransferMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransferMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<StructTag>(3, _omitFieldNames ? '' : 'function',
        subBuilder: StructTag.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransferMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransferMessage copyWith(void Function(TokenTransferMessage) updates) =>
      super.copyWith((message) => updates(message as TokenTransferMessage))
          as TokenTransferMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransferMessage create() => TokenTransferMessage._();
  @$core.override
  TokenTransferMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransferMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransferMessage>(create);
  static TokenTransferMessage? _defaultInstance;

  /// Destination Account address (string)
  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => $_clearField(1);

  /// Amount to be transferred (uint64)
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// token function to call, e.g BTC: 0x43417434fd869edee76cca2a4d2301e528a1551b1d719b75c350c3c97d15b8b9::coins::BTC
  @$pb.TagNumber(3)
  StructTag get function => $_getN(2);
  @$pb.TagNumber(3)
  set function(StructTag value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFunction() => $_has(2);
  @$pb.TagNumber(3)
  void clearFunction() => $_clearField(3);
  @$pb.TagNumber(3)
  StructTag ensureFunction() => $_ensure(2);
}

/// Necessary fields to process a `0x1::aptos_account::transfer_coins` function.
/// Can be used to transfer tokens with registering the recipient account if needed.
class TokenTransferCoinsMessage extends $pb.GeneratedMessage {
  factory TokenTransferCoinsMessage({
    $core.String? to,
    $fixnum.Int64? amount,
    StructTag? function,
  }) {
    final result = create();
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    if (function != null) result.function = function;
    return result;
  }

  TokenTransferCoinsMessage._();

  factory TokenTransferCoinsMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransferCoinsMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransferCoinsMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<StructTag>(3, _omitFieldNames ? '' : 'function',
        subBuilder: StructTag.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransferCoinsMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransferCoinsMessage copyWith(
          void Function(TokenTransferCoinsMessage) updates) =>
      super.copyWith((message) => updates(message as TokenTransferCoinsMessage))
          as TokenTransferCoinsMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransferCoinsMessage create() => TokenTransferCoinsMessage._();
  @$core.override
  TokenTransferCoinsMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransferCoinsMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransferCoinsMessage>(create);
  static TokenTransferCoinsMessage? _defaultInstance;

  /// Destination Account address (string)
  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => $_clearField(1);

  /// Amount to be transferred (uint64)
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// token function to call, e.g BTC: 0x43417434fd869edee76cca2a4d2301e528a1551b1d719b75c350c3c97d15b8b9::coins::BTC
  @$pb.TagNumber(3)
  StructTag get function => $_getN(2);
  @$pb.TagNumber(3)
  set function(StructTag value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFunction() => $_has(2);
  @$pb.TagNumber(3)
  void clearFunction() => $_clearField(3);
  @$pb.TagNumber(3)
  StructTag ensureFunction() => $_ensure(2);
}

class FungibleAssetTransferMessage extends $pb.GeneratedMessage {
  factory FungibleAssetTransferMessage({
    $core.String? metadataAddress,
    $core.String? to,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (metadataAddress != null) result.metadataAddress = metadataAddress;
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    return result;
  }

  FungibleAssetTransferMessage._();

  factory FungibleAssetTransferMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FungibleAssetTransferMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FungibleAssetTransferMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'metadataAddress')
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FungibleAssetTransferMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FungibleAssetTransferMessage copyWith(
          void Function(FungibleAssetTransferMessage) updates) =>
      super.copyWith(
              (message) => updates(message as FungibleAssetTransferMessage))
          as FungibleAssetTransferMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FungibleAssetTransferMessage create() =>
      FungibleAssetTransferMessage._();
  @$core.override
  FungibleAssetTransferMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FungibleAssetTransferMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FungibleAssetTransferMessage>(create);
  static FungibleAssetTransferMessage? _defaultInstance;

  /// Fungible Asset address (string)
  @$pb.TagNumber(1)
  $core.String get metadataAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set metadataAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMetadataAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadataAddress() => $_clearField(1);

  /// Destination Account address (string)
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// Amount to be transferred (uint64)
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Necessary fields to process a CreateAccountMessage
class CreateAccountMessage extends $pb.GeneratedMessage {
  factory CreateAccountMessage({
    $core.String? authKey,
  }) {
    final result = create();
    if (authKey != null) result.authKey = authKey;
    return result;
  }

  CreateAccountMessage._();

  factory CreateAccountMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAccountMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAccountMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'authKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccountMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccountMessage copyWith(void Function(CreateAccountMessage) updates) =>
      super.copyWith((message) => updates(message as CreateAccountMessage))
          as CreateAccountMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccountMessage create() => CreateAccountMessage._();
  @$core.override
  CreateAccountMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAccountMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAccountMessage>(create);
  static CreateAccountMessage? _defaultInstance;

  /// auth account address to create
  @$pb.TagNumber(1)
  $core.String get authKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set authKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthKey() => $_clearField(1);
}

/// Necessary fields to process an OfferNftMessage
class OfferNftMessage extends $pb.GeneratedMessage {
  factory OfferNftMessage({
    $core.String? receiver,
    $core.String? creator,
    $core.String? collectionName,
    $core.String? name,
    $fixnum.Int64? propertyVersion,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (receiver != null) result.receiver = receiver;
    if (creator != null) result.creator = creator;
    if (collectionName != null) result.collectionName = collectionName;
    if (name != null) result.name = name;
    if (propertyVersion != null) result.propertyVersion = propertyVersion;
    if (amount != null) result.amount = amount;
    return result;
  }

  OfferNftMessage._();

  factory OfferNftMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OfferNftMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OfferNftMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'receiver')
    ..aOS(2, _omitFieldNames ? '' : 'creator')
    ..aOS(3, _omitFieldNames ? '' : 'collectionName',
        protoName: 'collectionName')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'propertyVersion', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OfferNftMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OfferNftMessage copyWith(void Function(OfferNftMessage) updates) =>
      super.copyWith((message) => updates(message as OfferNftMessage))
          as OfferNftMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OfferNftMessage create() => OfferNftMessage._();
  @$core.override
  OfferNftMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OfferNftMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OfferNftMessage>(create);
  static OfferNftMessage? _defaultInstance;

  /// Receiver address
  @$pb.TagNumber(1)
  $core.String get receiver => $_getSZ(0);
  @$pb.TagNumber(1)
  set receiver($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiver() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiver() => $_clearField(1);

  /// Creator address
  @$pb.TagNumber(2)
  $core.String get creator => $_getSZ(1);
  @$pb.TagNumber(2)
  set creator($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreator() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreator() => $_clearField(2);

  /// Name of the collection
  @$pb.TagNumber(3)
  $core.String get collectionName => $_getSZ(2);
  @$pb.TagNumber(3)
  set collectionName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCollectionName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCollectionName() => $_clearField(3);

  /// Name of the NFT
  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  /// Property version (should be often 0)
  @$pb.TagNumber(5)
  $fixnum.Int64 get propertyVersion => $_getI64(4);
  @$pb.TagNumber(5)
  set propertyVersion($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPropertyVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropertyVersion() => $_clearField(5);

  /// Amount of NFT's to transfer (should be often 1)
  @$pb.TagNumber(6)
  $fixnum.Int64 get amount => $_getI64(5);
  @$pb.TagNumber(6)
  set amount($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearAmount() => $_clearField(6);
}

/// Necessary fields to process an CancelOfferNftMessage
class CancelOfferNftMessage extends $pb.GeneratedMessage {
  factory CancelOfferNftMessage({
    $core.String? receiver,
    $core.String? creator,
    $core.String? collectionName,
    $core.String? name,
    $fixnum.Int64? propertyVersion,
  }) {
    final result = create();
    if (receiver != null) result.receiver = receiver;
    if (creator != null) result.creator = creator;
    if (collectionName != null) result.collectionName = collectionName;
    if (name != null) result.name = name;
    if (propertyVersion != null) result.propertyVersion = propertyVersion;
    return result;
  }

  CancelOfferNftMessage._();

  factory CancelOfferNftMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelOfferNftMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelOfferNftMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'receiver')
    ..aOS(2, _omitFieldNames ? '' : 'creator')
    ..aOS(3, _omitFieldNames ? '' : 'collectionName',
        protoName: 'collectionName')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'propertyVersion', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelOfferNftMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelOfferNftMessage copyWith(
          void Function(CancelOfferNftMessage) updates) =>
      super.copyWith((message) => updates(message as CancelOfferNftMessage))
          as CancelOfferNftMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelOfferNftMessage create() => CancelOfferNftMessage._();
  @$core.override
  CancelOfferNftMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelOfferNftMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelOfferNftMessage>(create);
  static CancelOfferNftMessage? _defaultInstance;

  /// Receiver address
  @$pb.TagNumber(1)
  $core.String get receiver => $_getSZ(0);
  @$pb.TagNumber(1)
  set receiver($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiver() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiver() => $_clearField(1);

  /// Creator address
  @$pb.TagNumber(2)
  $core.String get creator => $_getSZ(1);
  @$pb.TagNumber(2)
  set creator($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreator() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreator() => $_clearField(2);

  /// Name of the collection
  @$pb.TagNumber(3)
  $core.String get collectionName => $_getSZ(2);
  @$pb.TagNumber(3)
  set collectionName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCollectionName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCollectionName() => $_clearField(3);

  /// Name of the NFT
  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  /// Property version (should be often 0)
  @$pb.TagNumber(5)
  $fixnum.Int64 get propertyVersion => $_getI64(4);
  @$pb.TagNumber(5)
  set propertyVersion($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPropertyVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropertyVersion() => $_clearField(5);
}

/// Necessary fields to process an ClaimNftMessage
class ClaimNftMessage extends $pb.GeneratedMessage {
  factory ClaimNftMessage({
    $core.String? sender,
    $core.String? creator,
    $core.String? collectionName,
    $core.String? name,
    $fixnum.Int64? propertyVersion,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (creator != null) result.creator = creator;
    if (collectionName != null) result.collectionName = collectionName;
    if (name != null) result.name = name;
    if (propertyVersion != null) result.propertyVersion = propertyVersion;
    return result;
  }

  ClaimNftMessage._();

  factory ClaimNftMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimNftMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimNftMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'creator')
    ..aOS(3, _omitFieldNames ? '' : 'collectionName',
        protoName: 'collectionName')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'propertyVersion', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimNftMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimNftMessage copyWith(void Function(ClaimNftMessage) updates) =>
      super.copyWith((message) => updates(message as ClaimNftMessage))
          as ClaimNftMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimNftMessage create() => ClaimNftMessage._();
  @$core.override
  ClaimNftMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimNftMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimNftMessage>(create);
  static ClaimNftMessage? _defaultInstance;

  /// Sender address
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);

  /// Creator address
  @$pb.TagNumber(2)
  $core.String get creator => $_getSZ(1);
  @$pb.TagNumber(2)
  set creator($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreator() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreator() => $_clearField(2);

  /// Name of the collection
  @$pb.TagNumber(3)
  $core.String get collectionName => $_getSZ(2);
  @$pb.TagNumber(3)
  set collectionName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCollectionName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCollectionName() => $_clearField(3);

  /// Name of the NFT
  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  /// Property version (should be often 0)
  @$pb.TagNumber(5)
  $fixnum.Int64 get propertyVersion => $_getI64(4);
  @$pb.TagNumber(5)
  set propertyVersion($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPropertyVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropertyVersion() => $_clearField(5);
}

class TortugaClaim extends $pb.GeneratedMessage {
  factory TortugaClaim({
    $fixnum.Int64? idx,
  }) {
    final result = create();
    if (idx != null) result.idx = idx;
    return result;
  }

  TortugaClaim._();

  factory TortugaClaim.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TortugaClaim.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TortugaClaim',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'idx', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TortugaClaim clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TortugaClaim copyWith(void Function(TortugaClaim) updates) =>
      super.copyWith((message) => updates(message as TortugaClaim))
          as TortugaClaim;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TortugaClaim create() => TortugaClaim._();
  @$core.override
  TortugaClaim createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TortugaClaim getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TortugaClaim>(create);
  static TortugaClaim? _defaultInstance;

  /// idx of ticket to claim
  @$pb.TagNumber(1)
  $fixnum.Int64 get idx => $_getI64(0);
  @$pb.TagNumber(1)
  set idx($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdx() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdx() => $_clearField(1);
}

class TortugaStake extends $pb.GeneratedMessage {
  factory TortugaStake({
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    return result;
  }

  TortugaStake._();

  factory TortugaStake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TortugaStake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TortugaStake',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TortugaStake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TortugaStake copyWith(void Function(TortugaStake) updates) =>
      super.copyWith((message) => updates(message as TortugaStake))
          as TortugaStake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TortugaStake create() => TortugaStake._();
  @$core.override
  TortugaStake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TortugaStake getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TortugaStake>(create);
  static TortugaStake? _defaultInstance;

  /// Amount to be stake
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);
}

class TortugaUnstake extends $pb.GeneratedMessage {
  factory TortugaUnstake({
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    return result;
  }

  TortugaUnstake._();

  factory TortugaUnstake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TortugaUnstake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TortugaUnstake',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TortugaUnstake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TortugaUnstake copyWith(void Function(TortugaUnstake) updates) =>
      super.copyWith((message) => updates(message as TortugaUnstake))
          as TortugaUnstake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TortugaUnstake create() => TortugaUnstake._();
  @$core.override
  TortugaUnstake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TortugaUnstake getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TortugaUnstake>(create);
  static TortugaUnstake? _defaultInstance;

  /// Amount to be stake
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);
}

enum LiquidStaking_LiquidStakeTransactionPayload {
  stake,
  unstake,
  claim,
  notSet
}

class LiquidStaking extends $pb.GeneratedMessage {
  factory LiquidStaking({
    $core.String? smartContractAddress,
    TortugaStake? stake,
    TortugaUnstake? unstake,
    TortugaClaim? claim,
  }) {
    final result = create();
    if (smartContractAddress != null)
      result.smartContractAddress = smartContractAddress;
    if (stake != null) result.stake = stake;
    if (unstake != null) result.unstake = unstake;
    if (claim != null) result.claim = claim;
    return result;
  }

  LiquidStaking._();

  factory LiquidStaking.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LiquidStaking.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, LiquidStaking_LiquidStakeTransactionPayload>
      _LiquidStaking_LiquidStakeTransactionPayloadByTag = {
    2: LiquidStaking_LiquidStakeTransactionPayload.stake,
    3: LiquidStaking_LiquidStakeTransactionPayload.unstake,
    4: LiquidStaking_LiquidStakeTransactionPayload.claim,
    0: LiquidStaking_LiquidStakeTransactionPayload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LiquidStaking',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'smartContractAddress')
    ..aOM<TortugaStake>(2, _omitFieldNames ? '' : 'stake',
        subBuilder: TortugaStake.create)
    ..aOM<TortugaUnstake>(3, _omitFieldNames ? '' : 'unstake',
        subBuilder: TortugaUnstake.create)
    ..aOM<TortugaClaim>(4, _omitFieldNames ? '' : 'claim',
        subBuilder: TortugaClaim.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LiquidStaking clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LiquidStaking copyWith(void Function(LiquidStaking) updates) =>
      super.copyWith((message) => updates(message as LiquidStaking))
          as LiquidStaking;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LiquidStaking create() => LiquidStaking._();
  @$core.override
  LiquidStaking createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LiquidStaking getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LiquidStaking>(create);
  static LiquidStaking? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  LiquidStaking_LiquidStakeTransactionPayload
      whichLiquidStakeTransactionPayload() =>
          _LiquidStaking_LiquidStakeTransactionPayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearLiquidStakeTransactionPayload() => $_clearField($_whichOneof(0));

  /// Smart contract address of liquid staking module
  @$pb.TagNumber(1)
  $core.String get smartContractAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set smartContractAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSmartContractAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearSmartContractAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  TortugaStake get stake => $_getN(1);
  @$pb.TagNumber(2)
  set stake(TortugaStake value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStake() => $_has(1);
  @$pb.TagNumber(2)
  void clearStake() => $_clearField(2);
  @$pb.TagNumber(2)
  TortugaStake ensureStake() => $_ensure(1);

  @$pb.TagNumber(3)
  TortugaUnstake get unstake => $_getN(2);
  @$pb.TagNumber(3)
  set unstake(TortugaUnstake value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUnstake() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnstake() => $_clearField(3);
  @$pb.TagNumber(3)
  TortugaUnstake ensureUnstake() => $_ensure(2);

  @$pb.TagNumber(4)
  TortugaClaim get claim => $_getN(3);
  @$pb.TagNumber(4)
  set claim(TortugaClaim value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasClaim() => $_has(3);
  @$pb.TagNumber(4)
  void clearClaim() => $_clearField(4);
  @$pb.TagNumber(4)
  TortugaClaim ensureClaim() => $_ensure(3);
}

enum NftMessage_NftTransactionPayload {
  offerNft,
  cancelOfferNft,
  claimNft,
  notSet
}

class NftMessage extends $pb.GeneratedMessage {
  factory NftMessage({
    OfferNftMessage? offerNft,
    CancelOfferNftMessage? cancelOfferNft,
    ClaimNftMessage? claimNft,
  }) {
    final result = create();
    if (offerNft != null) result.offerNft = offerNft;
    if (cancelOfferNft != null) result.cancelOfferNft = cancelOfferNft;
    if (claimNft != null) result.claimNft = claimNft;
    return result;
  }

  NftMessage._();

  factory NftMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NftMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, NftMessage_NftTransactionPayload>
      _NftMessage_NftTransactionPayloadByTag = {
    1: NftMessage_NftTransactionPayload.offerNft,
    2: NftMessage_NftTransactionPayload.cancelOfferNft,
    3: NftMessage_NftTransactionPayload.claimNft,
    0: NftMessage_NftTransactionPayload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NftMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<OfferNftMessage>(1, _omitFieldNames ? '' : 'offerNft',
        subBuilder: OfferNftMessage.create)
    ..aOM<CancelOfferNftMessage>(2, _omitFieldNames ? '' : 'cancelOfferNft',
        subBuilder: CancelOfferNftMessage.create)
    ..aOM<ClaimNftMessage>(3, _omitFieldNames ? '' : 'claimNft',
        subBuilder: ClaimNftMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NftMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NftMessage copyWith(void Function(NftMessage) updates) =>
      super.copyWith((message) => updates(message as NftMessage)) as NftMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NftMessage create() => NftMessage._();
  @$core.override
  NftMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NftMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NftMessage>(create);
  static NftMessage? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  NftMessage_NftTransactionPayload whichNftTransactionPayload() =>
      _NftMessage_NftTransactionPayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearNftTransactionPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  OfferNftMessage get offerNft => $_getN(0);
  @$pb.TagNumber(1)
  set offerNft(OfferNftMessage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOfferNft() => $_has(0);
  @$pb.TagNumber(1)
  void clearOfferNft() => $_clearField(1);
  @$pb.TagNumber(1)
  OfferNftMessage ensureOfferNft() => $_ensure(0);

  @$pb.TagNumber(2)
  CancelOfferNftMessage get cancelOfferNft => $_getN(1);
  @$pb.TagNumber(2)
  set cancelOfferNft(CancelOfferNftMessage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCancelOfferNft() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelOfferNft() => $_clearField(2);
  @$pb.TagNumber(2)
  CancelOfferNftMessage ensureCancelOfferNft() => $_ensure(1);

  @$pb.TagNumber(3)
  ClaimNftMessage get claimNft => $_getN(2);
  @$pb.TagNumber(3)
  set claimNft(ClaimNftMessage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClaimNft() => $_has(2);
  @$pb.TagNumber(3)
  void clearClaimNft() => $_clearField(3);
  @$pb.TagNumber(3)
  ClaimNftMessage ensureClaimNft() => $_ensure(2);
}

enum SigningInput_TransactionPayload {
  transfer,
  tokenTransfer,
  createAccount,
  nftMessage,
  liquidStakingMessage,
  tokenTransferCoins,
  fungibleAssetTransfer,
  notSet
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.String? sender,
    $fixnum.Int64? sequenceNumber,
    $fixnum.Int64? maxGasAmount,
    $fixnum.Int64? gasUnitPrice,
    $fixnum.Int64? expirationTimestampSecs,
    $core.int? chainId,
    $core.List<$core.int>? privateKey,
    $core.String? anyEncoded,
    TransferMessage? transfer,
    TokenTransferMessage? tokenTransfer,
    CreateAccountMessage? createAccount,
    NftMessage? nftMessage,
    LiquidStaking? liquidStakingMessage,
    TokenTransferCoinsMessage? tokenTransferCoins,
    FungibleAssetTransferMessage? fungibleAssetTransfer,
    $core.String? abi,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (sequenceNumber != null) result.sequenceNumber = sequenceNumber;
    if (maxGasAmount != null) result.maxGasAmount = maxGasAmount;
    if (gasUnitPrice != null) result.gasUnitPrice = gasUnitPrice;
    if (expirationTimestampSecs != null)
      result.expirationTimestampSecs = expirationTimestampSecs;
    if (chainId != null) result.chainId = chainId;
    if (privateKey != null) result.privateKey = privateKey;
    if (anyEncoded != null) result.anyEncoded = anyEncoded;
    if (transfer != null) result.transfer = transfer;
    if (tokenTransfer != null) result.tokenTransfer = tokenTransfer;
    if (createAccount != null) result.createAccount = createAccount;
    if (nftMessage != null) result.nftMessage = nftMessage;
    if (liquidStakingMessage != null)
      result.liquidStakingMessage = liquidStakingMessage;
    if (tokenTransferCoins != null)
      result.tokenTransferCoins = tokenTransferCoins;
    if (fungibleAssetTransfer != null)
      result.fungibleAssetTransfer = fungibleAssetTransfer;
    if (abi != null) result.abi = abi;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_TransactionPayload>
      _SigningInput_TransactionPayloadByTag = {
    9: SigningInput_TransactionPayload.transfer,
    10: SigningInput_TransactionPayload.tokenTransfer,
    11: SigningInput_TransactionPayload.createAccount,
    12: SigningInput_TransactionPayload.nftMessage,
    14: SigningInput_TransactionPayload.liquidStakingMessage,
    15: SigningInput_TransactionPayload.tokenTransferCoins,
    16: SigningInput_TransactionPayload.fungibleAssetTransfer,
    0: SigningInput_TransactionPayload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..oo(0, [9, 10, 11, 12, 14, 15, 16])
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aInt64(2, _omitFieldNames ? '' : 'sequenceNumber')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'maxGasAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'gasUnitPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'expirationTimestampSecs',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'chainId', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'anyEncoded')
    ..aOM<TransferMessage>(9, _omitFieldNames ? '' : 'transfer',
        subBuilder: TransferMessage.create)
    ..aOM<TokenTransferMessage>(10, _omitFieldNames ? '' : 'tokenTransfer',
        subBuilder: TokenTransferMessage.create)
    ..aOM<CreateAccountMessage>(11, _omitFieldNames ? '' : 'createAccount',
        subBuilder: CreateAccountMessage.create)
    ..aOM<NftMessage>(12, _omitFieldNames ? '' : 'nftMessage',
        subBuilder: NftMessage.create)
    ..aOM<LiquidStaking>(14, _omitFieldNames ? '' : 'liquidStakingMessage',
        subBuilder: LiquidStaking.create)
    ..aOM<TokenTransferCoinsMessage>(
        15, _omitFieldNames ? '' : 'tokenTransferCoins',
        subBuilder: TokenTransferCoinsMessage.create)
    ..aOM<FungibleAssetTransferMessage>(
        16, _omitFieldNames ? '' : 'fungibleAssetTransfer',
        subBuilder: FungibleAssetTransferMessage.create)
    ..aOS(21, _omitFieldNames ? '' : 'abi')
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

  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  SigningInput_TransactionPayload whichTransactionPayload() =>
      _SigningInput_TransactionPayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  void clearTransactionPayload() => $_clearField($_whichOneof(0));

  /// Sender Account address (string)
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);

  /// Sequence number, incremented atomically for each tx present on the account, start at 0 (int64)
  @$pb.TagNumber(2)
  $fixnum.Int64 get sequenceNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set sequenceNumber($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequenceNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequenceNumber() => $_clearField(2);

  /// Max gas amount that the user is willing to pay (uint64)
  @$pb.TagNumber(3)
  $fixnum.Int64 get maxGasAmount => $_getI64(2);
  @$pb.TagNumber(3)
  set maxGasAmount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxGasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxGasAmount() => $_clearField(3);

  /// Gas unit price - queried through API (uint64)
  @$pb.TagNumber(4)
  $fixnum.Int64 get gasUnitPrice => $_getI64(3);
  @$pb.TagNumber(4)
  set gasUnitPrice($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGasUnitPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearGasUnitPrice() => $_clearField(4);

  /// Expiration timestamp for the transaction, can't be in the past (uint64)
  @$pb.TagNumber(5)
  $fixnum.Int64 get expirationTimestampSecs => $_getI64(4);
  @$pb.TagNumber(5)
  set expirationTimestampSecs($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpirationTimestampSecs() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpirationTimestampSecs() => $_clearField(5);

  /// Chain id 1 (mainnet) 32(devnet) (uint32 - casted in uint8_t later)
  @$pb.TagNumber(6)
  $core.int get chainId => $_getIZ(5);
  @$pb.TagNumber(6)
  set chainId($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChainId() => $_has(5);
  @$pb.TagNumber(6)
  void clearChainId() => $_clearField(6);

  /// Private key to sign the transaction (bytes)
  @$pb.TagNumber(7)
  $core.List<$core.int> get privateKey => $_getN(6);
  @$pb.TagNumber(7)
  set privateKey($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPrivateKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrivateKey() => $_clearField(7);

  /// hex encoded function to sign, use it for smart contract approval (string)
  @$pb.TagNumber(8)
  $core.String get anyEncoded => $_getSZ(7);
  @$pb.TagNumber(8)
  set anyEncoded($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAnyEncoded() => $_has(7);
  @$pb.TagNumber(8)
  void clearAnyEncoded() => $_clearField(8);

  @$pb.TagNumber(9)
  TransferMessage get transfer => $_getN(8);
  @$pb.TagNumber(9)
  set transfer(TransferMessage value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasTransfer() => $_has(8);
  @$pb.TagNumber(9)
  void clearTransfer() => $_clearField(9);
  @$pb.TagNumber(9)
  TransferMessage ensureTransfer() => $_ensure(8);

  @$pb.TagNumber(10)
  TokenTransferMessage get tokenTransfer => $_getN(9);
  @$pb.TagNumber(10)
  set tokenTransfer(TokenTransferMessage value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTokenTransfer() => $_has(9);
  @$pb.TagNumber(10)
  void clearTokenTransfer() => $_clearField(10);
  @$pb.TagNumber(10)
  TokenTransferMessage ensureTokenTransfer() => $_ensure(9);

  @$pb.TagNumber(11)
  CreateAccountMessage get createAccount => $_getN(10);
  @$pb.TagNumber(11)
  set createAccount(CreateAccountMessage value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasCreateAccount() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreateAccount() => $_clearField(11);
  @$pb.TagNumber(11)
  CreateAccountMessage ensureCreateAccount() => $_ensure(10);

  @$pb.TagNumber(12)
  NftMessage get nftMessage => $_getN(11);
  @$pb.TagNumber(12)
  set nftMessage(NftMessage value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasNftMessage() => $_has(11);
  @$pb.TagNumber(12)
  void clearNftMessage() => $_clearField(12);
  @$pb.TagNumber(12)
  NftMessage ensureNftMessage() => $_ensure(11);

  @$pb.TagNumber(14)
  LiquidStaking get liquidStakingMessage => $_getN(12);
  @$pb.TagNumber(14)
  set liquidStakingMessage(LiquidStaking value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasLiquidStakingMessage() => $_has(12);
  @$pb.TagNumber(14)
  void clearLiquidStakingMessage() => $_clearField(14);
  @$pb.TagNumber(14)
  LiquidStaking ensureLiquidStakingMessage() => $_ensure(12);

  @$pb.TagNumber(15)
  TokenTransferCoinsMessage get tokenTransferCoins => $_getN(13);
  @$pb.TagNumber(15)
  set tokenTransferCoins(TokenTransferCoinsMessage value) =>
      $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasTokenTransferCoins() => $_has(13);
  @$pb.TagNumber(15)
  void clearTokenTransferCoins() => $_clearField(15);
  @$pb.TagNumber(15)
  TokenTransferCoinsMessage ensureTokenTransferCoins() => $_ensure(13);

  @$pb.TagNumber(16)
  FungibleAssetTransferMessage get fungibleAssetTransfer => $_getN(14);
  @$pb.TagNumber(16)
  set fungibleAssetTransfer(FungibleAssetTransferMessage value) =>
      $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasFungibleAssetTransfer() => $_has(14);
  @$pb.TagNumber(16)
  void clearFungibleAssetTransfer() => $_clearField(16);
  @$pb.TagNumber(16)
  FungibleAssetTransferMessage ensureFungibleAssetTransfer() => $_ensure(14);

  @$pb.TagNumber(21)
  $core.String get abi => $_getSZ(15);
  @$pb.TagNumber(21)
  set abi($core.String value) => $_setString(15, value);
  @$pb.TagNumber(21)
  $core.bool hasAbi() => $_has(15);
  @$pb.TagNumber(21)
  void clearAbi() => $_clearField(21);
}

/// Information related to the signed transaction
class TransactionAuthenticator extends $pb.GeneratedMessage {
  factory TransactionAuthenticator({
    $core.List<$core.int>? signature,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  TransactionAuthenticator._();

  factory TransactionAuthenticator.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionAuthenticator.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionAuthenticator',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionAuthenticator clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionAuthenticator copyWith(
          void Function(TransactionAuthenticator) updates) =>
      super.copyWith((message) => updates(message as TransactionAuthenticator))
          as TransactionAuthenticator;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionAuthenticator create() => TransactionAuthenticator._();
  @$core.override
  TransactionAuthenticator createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionAuthenticator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionAuthenticator>(create);
  static TransactionAuthenticator? _defaultInstance;

  /// Signature part of the signed transaction (bytes)
  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

  /// Public key of the signer (bytes)
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? rawTxn,
    TransactionAuthenticator? authenticator,
    $core.List<$core.int>? encoded,
    $core.String? json,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (rawTxn != null) result.rawTxn = rawTxn;
    if (authenticator != null) result.authenticator = authenticator;
    if (encoded != null) result.encoded = encoded;
    if (json != null) result.json = json;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Aptos.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'rawTxn', $pb.PbFieldType.OY)
    ..aOM<TransactionAuthenticator>(2, _omitFieldNames ? '' : 'authenticator',
        subBuilder: TransactionAuthenticator.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'json')
    ..aE<$0.SigningError>(5, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(6, _omitFieldNames ? '' : 'errorMessage')
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

  /// / The raw transaction (bytes)
  @$pb.TagNumber(1)
  $core.List<$core.int> get rawTxn => $_getN(0);
  @$pb.TagNumber(1)
  set rawTxn($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRawTxn() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawTxn() => $_clearField(1);

  /// / Public key and signature to authenticate
  @$pb.TagNumber(2)
  TransactionAuthenticator get authenticator => $_getN(1);
  @$pb.TagNumber(2)
  set authenticator(TransactionAuthenticator value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthenticator() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthenticator() => $_clearField(2);
  @$pb.TagNumber(2)
  TransactionAuthenticator ensureAuthenticator() => $_ensure(1);

  /// / Signed and encoded transaction bytes.
  @$pb.TagNumber(3)
  $core.List<$core.int> get encoded => $_getN(2);
  @$pb.TagNumber(3)
  set encoded($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEncoded() => $_has(2);
  @$pb.TagNumber(3)
  void clearEncoded() => $_clearField(3);

  /// Transaction json format for api broadcasting (string)
  @$pb.TagNumber(4)
  $core.String get json => $_getSZ(3);
  @$pb.TagNumber(4)
  set json($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearJson() => $_clearField(4);

  /// Error code, 0 is ok, other codes will be treated as errors.
  @$pb.TagNumber(5)
  $0.SigningError get error => $_getN(4);
  @$pb.TagNumber(5)
  set error($0.SigningError value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);

  /// Error description.
  @$pb.TagNumber(6)
  $core.String get errorMessage => $_getSZ(5);
  @$pb.TagNumber(6)
  set errorMessage($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasErrorMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearErrorMessage() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
