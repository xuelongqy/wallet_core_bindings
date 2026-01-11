// This is a generated file - do not edit.
//
// Generated from FIO.proto.

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

/// A public blockchain address, such as {"BTC", "bc1qvy4074rggkdr2pzw5vpnn62eg0smzlxwp70d7v"}
class PublicAddress extends $pb.GeneratedMessage {
  factory PublicAddress({
    $core.String? coinSymbol,
    $core.String? address,
  }) {
    final result = create();
    if (coinSymbol != null) result.coinSymbol = coinSymbol;
    if (address != null) result.address = address;
    return result;
  }

  PublicAddress._();

  factory PublicAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublicAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublicAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'coinSymbol')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicAddress copyWith(void Function(PublicAddress) updates) =>
      super.copyWith((message) => updates(message as PublicAddress))
          as PublicAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicAddress create() => PublicAddress._();
  @$core.override
  PublicAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublicAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublicAddress>(create);
  static PublicAddress? _defaultInstance;

  /// Coin symbol for the address (a.k.a. tokenCode)
  @$pb.TagNumber(1)
  $core.String get coinSymbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set coinSymbol($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoinSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoinSymbol() => $_clearField(1);

  /// The address
  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);
}

/// Payload content for New Funds requests
class NewFundsContent extends $pb.GeneratedMessage {
  factory NewFundsContent({
    $core.String? payeePublicAddress,
    $core.String? amount,
    $core.String? coinSymbol,
    $core.String? memo,
    $core.String? hash,
    $core.String? offlineUrl,
  }) {
    final result = create();
    if (payeePublicAddress != null)
      result.payeePublicAddress = payeePublicAddress;
    if (amount != null) result.amount = amount;
    if (coinSymbol != null) result.coinSymbol = coinSymbol;
    if (memo != null) result.memo = memo;
    if (hash != null) result.hash = hash;
    if (offlineUrl != null) result.offlineUrl = offlineUrl;
    return result;
  }

  NewFundsContent._();

  factory NewFundsContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewFundsContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewFundsContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payeePublicAddress')
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..aOS(3, _omitFieldNames ? '' : 'coinSymbol')
    ..aOS(4, _omitFieldNames ? '' : 'memo')
    ..aOS(5, _omitFieldNames ? '' : 'hash')
    ..aOS(6, _omitFieldNames ? '' : 'offlineUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewFundsContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewFundsContent copyWith(void Function(NewFundsContent) updates) =>
      super.copyWith((message) => updates(message as NewFundsContent))
          as NewFundsContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewFundsContent create() => NewFundsContent._();
  @$core.override
  NewFundsContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewFundsContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewFundsContent>(create);
  static NewFundsContent? _defaultInstance;

  /// Public addressed of the payee, on the mentioned blockchain.
  @$pb.TagNumber(1)
  $core.String get payeePublicAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set payeePublicAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPayeePublicAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayeePublicAddress() => $_clearField(1);

  /// Amount requested (as string)
  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Coin symbol of the amount requested (a.k.a. tokenCode)
  @$pb.TagNumber(3)
  $core.String get coinSymbol => $_getSZ(2);
  @$pb.TagNumber(3)
  set coinSymbol($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoinSymbol() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoinSymbol() => $_clearField(3);

  /// Memo free text.  Optional, may be empty.
  @$pb.TagNumber(4)
  $core.String get memo => $_getSZ(3);
  @$pb.TagNumber(4)
  set memo($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMemo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemo() => $_clearField(4);

  /// Hash.  Optional, may be empty.
  @$pb.TagNumber(5)
  $core.String get hash => $_getSZ(4);
  @$pb.TagNumber(5)
  set hash($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasHash() => $_has(4);
  @$pb.TagNumber(5)
  void clearHash() => $_clearField(5);

  /// Attached offline URL.  Optional, may be empty.
  @$pb.TagNumber(6)
  $core.String get offlineUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set offlineUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOfflineUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearOfflineUrl() => $_clearField(6);
}

/// Action for registering a FIO name; register_fio_address
class Action_RegisterFioAddress extends $pb.GeneratedMessage {
  factory Action_RegisterFioAddress({
    $core.String? fioAddress,
    $core.String? ownerFioPublicKey,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (fioAddress != null) result.fioAddress = fioAddress;
    if (ownerFioPublicKey != null) result.ownerFioPublicKey = ownerFioPublicKey;
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_RegisterFioAddress._();

  factory Action_RegisterFioAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_RegisterFioAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.RegisterFioAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fioAddress')
    ..aOS(2, _omitFieldNames ? '' : 'ownerFioPublicKey')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RegisterFioAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RegisterFioAddress copyWith(
          void Function(Action_RegisterFioAddress) updates) =>
      super.copyWith((message) => updates(message as Action_RegisterFioAddress))
          as Action_RegisterFioAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_RegisterFioAddress create() => Action_RegisterFioAddress._();
  @$core.override
  Action_RegisterFioAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_RegisterFioAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_RegisterFioAddress>(create);
  static Action_RegisterFioAddress? _defaultInstance;

  /// The FIO name to be registered. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get fioAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fioAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFioAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFioAddress() => $_clearField(1);

  /// FIO address of the owner. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
  @$pb.TagNumber(2)
  $core.String get ownerFioPublicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set ownerFioPublicKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerFioPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerFioPublicKey() => $_clearField(2);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

/// Acion for adding public chain addresses to a FIO name; add_pub_address
/// Note: actor is not needed, computed from private key
class Action_AddPubAddress extends $pb.GeneratedMessage {
  factory Action_AddPubAddress({
    $core.String? fioAddress,
    $core.Iterable<PublicAddress>? publicAddresses,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (fioAddress != null) result.fioAddress = fioAddress;
    if (publicAddresses != null) result.publicAddresses.addAll(publicAddresses);
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_AddPubAddress._();

  factory Action_AddPubAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_AddPubAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.AddPubAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fioAddress')
    ..pPM<PublicAddress>(2, _omitFieldNames ? '' : 'publicAddresses',
        subBuilder: PublicAddress.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_AddPubAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_AddPubAddress copyWith(void Function(Action_AddPubAddress) updates) =>
      super.copyWith((message) => updates(message as Action_AddPubAddress))
          as Action_AddPubAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_AddPubAddress create() => Action_AddPubAddress._();
  @$core.override
  Action_AddPubAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_AddPubAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_AddPubAddress>(create);
  static Action_AddPubAddress? _defaultInstance;

  /// The FIO name already registered to the owner. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get fioAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fioAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFioAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFioAddress() => $_clearField(1);

  /// List of public addresses to be registered, ex. {{"BTC", "bc1qv...7v"},{"BNB", "bnb1ts3...9s"}}
  @$pb.TagNumber(2)
  $pb.PbList<PublicAddress> get publicAddresses => $_getList(1);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

/// Action for removing public chain addresses from a FIO name; remove_pub_address
/// Note: actor is not needed, computed from private key
class Action_RemovePubAddress extends $pb.GeneratedMessage {
  factory Action_RemovePubAddress({
    $core.String? fioAddress,
    $core.Iterable<PublicAddress>? publicAddresses,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (fioAddress != null) result.fioAddress = fioAddress;
    if (publicAddresses != null) result.publicAddresses.addAll(publicAddresses);
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_RemovePubAddress._();

  factory Action_RemovePubAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_RemovePubAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.RemovePubAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fioAddress')
    ..pPM<PublicAddress>(2, _omitFieldNames ? '' : 'publicAddresses',
        subBuilder: PublicAddress.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RemovePubAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RemovePubAddress copyWith(
          void Function(Action_RemovePubAddress) updates) =>
      super.copyWith((message) => updates(message as Action_RemovePubAddress))
          as Action_RemovePubAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_RemovePubAddress create() => Action_RemovePubAddress._();
  @$core.override
  Action_RemovePubAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_RemovePubAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_RemovePubAddress>(create);
  static Action_RemovePubAddress? _defaultInstance;

  /// The FIO name already registered to the owner. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get fioAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fioAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFioAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFioAddress() => $_clearField(1);

  /// List of public addresses to be unregistered, ex. {{"BTC", "bc1qv...7v"},{"BNB", "bnb1ts3...9s"}}
  @$pb.TagNumber(2)
  $pb.PbList<PublicAddress> get publicAddresses => $_getList(1);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

/// Action for removing public chain addresses from a FIO name; remove_pub_address
/// Note: actor is not needed, computed from private key
class Action_RemoveAllPubAddress extends $pb.GeneratedMessage {
  factory Action_RemoveAllPubAddress({
    $core.String? fioAddress,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (fioAddress != null) result.fioAddress = fioAddress;
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_RemoveAllPubAddress._();

  factory Action_RemoveAllPubAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_RemoveAllPubAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.RemoveAllPubAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fioAddress')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RemoveAllPubAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RemoveAllPubAddress copyWith(
          void Function(Action_RemoveAllPubAddress) updates) =>
      super.copyWith(
              (message) => updates(message as Action_RemoveAllPubAddress))
          as Action_RemoveAllPubAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_RemoveAllPubAddress create() => Action_RemoveAllPubAddress._();
  @$core.override
  Action_RemoveAllPubAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_RemoveAllPubAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_RemoveAllPubAddress>(create);
  static Action_RemoveAllPubAddress? _defaultInstance;

  /// The FIO name already registered to the owner. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get fioAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fioAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFioAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFioAddress() => $_clearField(1);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

/// Action for transferring FIO coins; transfer_tokens_pub_key
/// Note: actor is not needed, computed from private key
class Action_Transfer extends $pb.GeneratedMessage {
  factory Action_Transfer({
    $core.String? payeePublicKey,
    $fixnum.Int64? amount,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (payeePublicKey != null) result.payeePublicKey = payeePublicKey;
    if (amount != null) result.amount = amount;
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_Transfer._();

  factory Action_Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.Transfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payeePublicKey')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_Transfer copyWith(void Function(Action_Transfer) updates) =>
      super.copyWith((message) => updates(message as Action_Transfer))
          as Action_Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_Transfer create() => Action_Transfer._();
  @$core.override
  Action_Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_Transfer>(create);
  static Action_Transfer? _defaultInstance;

  /// FIO address of the payee. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
  @$pb.TagNumber(1)
  $core.String get payeePublicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set payeePublicKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPayeePublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayeePublicKey() => $_clearField(1);

  /// Amount of FIO coins to be transferred.
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

/// Action for renewing a FIO name; renew_fio_address
/// Note: actor is not needed, computed from private key
class Action_RenewFioAddress extends $pb.GeneratedMessage {
  factory Action_RenewFioAddress({
    $core.String? fioAddress,
    $core.String? ownerFioPublicKey,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (fioAddress != null) result.fioAddress = fioAddress;
    if (ownerFioPublicKey != null) result.ownerFioPublicKey = ownerFioPublicKey;
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_RenewFioAddress._();

  factory Action_RenewFioAddress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_RenewFioAddress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.RenewFioAddress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fioAddress')
    ..aOS(2, _omitFieldNames ? '' : 'ownerFioPublicKey')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RenewFioAddress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_RenewFioAddress copyWith(
          void Function(Action_RenewFioAddress) updates) =>
      super.copyWith((message) => updates(message as Action_RenewFioAddress))
          as Action_RenewFioAddress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_RenewFioAddress create() => Action_RenewFioAddress._();
  @$core.override
  Action_RenewFioAddress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_RenewFioAddress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_RenewFioAddress>(create);
  static Action_RenewFioAddress? _defaultInstance;

  /// The FIO name to be renewed. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get fioAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fioAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFioAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFioAddress() => $_clearField(1);

  /// FIO address of the owner. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
  @$pb.TagNumber(2)
  $core.String get ownerFioPublicKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set ownerFioPublicKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerFioPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerFioPublicKey() => $_clearField(2);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

/// Action for creating a new payment request; new_funds_request
/// Note: actor is not needed, computed from private key
class Action_NewFundsRequest extends $pb.GeneratedMessage {
  factory Action_NewFundsRequest({
    $core.String? payerFioName,
    $core.String? payerFioAddress,
    $core.String? payeeFioName,
    NewFundsContent? content,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (payerFioName != null) result.payerFioName = payerFioName;
    if (payerFioAddress != null) result.payerFioAddress = payerFioAddress;
    if (payeeFioName != null) result.payeeFioName = payeeFioName;
    if (content != null) result.content = content;
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_NewFundsRequest._();

  factory Action_NewFundsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_NewFundsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.NewFundsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payerFioName')
    ..aOS(2, _omitFieldNames ? '' : 'payerFioAddress')
    ..aOS(3, _omitFieldNames ? '' : 'payeeFioName')
    ..aOM<NewFundsContent>(4, _omitFieldNames ? '' : 'content',
        subBuilder: NewFundsContent.create)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_NewFundsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_NewFundsRequest copyWith(
          void Function(Action_NewFundsRequest) updates) =>
      super.copyWith((message) => updates(message as Action_NewFundsRequest))
          as Action_NewFundsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_NewFundsRequest create() => Action_NewFundsRequest._();
  @$core.override
  Action_NewFundsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_NewFundsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_NewFundsRequest>(create);
  static Action_NewFundsRequest? _defaultInstance;

  /// The FIO name of the requested payer. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get payerFioName => $_getSZ(0);
  @$pb.TagNumber(1)
  set payerFioName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPayerFioName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayerFioName() => $_clearField(1);

  /// The FIO address (not name) of the payer, owner of payee_fio_name.  Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
  @$pb.TagNumber(2)
  $core.String get payerFioAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set payerFioAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPayerFioAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayerFioAddress() => $_clearField(2);

  /// Own FIO name.  Ex.: "bob@trust"
  @$pb.TagNumber(3)
  $core.String get payeeFioName => $_getSZ(2);
  @$pb.TagNumber(3)
  set payeeFioName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayeeFioName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayeeFioName() => $_clearField(3);

  /// Payload content of the request
  @$pb.TagNumber(4)
  NewFundsContent get content => $_getN(3);
  @$pb.TagNumber(4)
  set content(NewFundsContent value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);
  @$pb.TagNumber(4)
  NewFundsContent ensureContent() => $_ensure(3);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(5)
  $fixnum.Int64 get fee => $_getI64(4);
  @$pb.TagNumber(5)
  set fee($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearFee() => $_clearField(5);
}

/// Action for adding `100 * bundle_sets` bundled transactions to the supplied FIO Handle. When bundles are purchased one or more sets of bundled transactions are added to the existing count.
class Action_AddBundledTransactions extends $pb.GeneratedMessage {
  factory Action_AddBundledTransactions({
    $core.String? fioAddress,
    $fixnum.Int64? bundleSets,
    $fixnum.Int64? fee,
  }) {
    final result = create();
    if (fioAddress != null) result.fioAddress = fioAddress;
    if (bundleSets != null) result.bundleSets = bundleSets;
    if (fee != null) result.fee = fee;
    return result;
  }

  Action_AddBundledTransactions._();

  factory Action_AddBundledTransactions.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action_AddBundledTransactions.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action.AddBundledTransactions',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fioAddress')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'bundleSets', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fee', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_AddBundledTransactions clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action_AddBundledTransactions copyWith(
          void Function(Action_AddBundledTransactions) updates) =>
      super.copyWith(
              (message) => updates(message as Action_AddBundledTransactions))
          as Action_AddBundledTransactions;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action_AddBundledTransactions create() =>
      Action_AddBundledTransactions._();
  @$core.override
  Action_AddBundledTransactions createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action_AddBundledTransactions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Action_AddBundledTransactions>(create);
  static Action_AddBundledTransactions? _defaultInstance;

  /// The FIO name already registered to the owner. Ex.: "alice@trust"
  @$pb.TagNumber(1)
  $core.String get fioAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fioAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFioAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFioAddress() => $_clearField(1);

  /// Number of bundled sets. One set is 100 bundled transactions.
  @$pb.TagNumber(2)
  $fixnum.Int64 get bundleSets => $_getI64(1);
  @$pb.TagNumber(2)
  set bundleSets($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBundleSets() => $_has(1);
  @$pb.TagNumber(2)
  void clearBundleSets() => $_clearField(2);

  /// Max fee to spend, can be obtained using get_fee API.
  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => $_clearField(3);
}

enum Action_MessageOneof {
  registerFioAddressMessage,
  addPubAddressMessage,
  transferMessage,
  renewFioAddressMessage,
  newFundsRequestMessage,
  removePubAddressMessage,
  removeAllPubAddressesMessage,
  addBundledTransactionsMessage,
  notSet
}

/// Different Actions
class Action extends $pb.GeneratedMessage {
  factory Action({
    Action_RegisterFioAddress? registerFioAddressMessage,
    Action_AddPubAddress? addPubAddressMessage,
    Action_Transfer? transferMessage,
    Action_RenewFioAddress? renewFioAddressMessage,
    Action_NewFundsRequest? newFundsRequestMessage,
    Action_RemovePubAddress? removePubAddressMessage,
    Action_RemoveAllPubAddress? removeAllPubAddressesMessage,
    Action_AddBundledTransactions? addBundledTransactionsMessage,
  }) {
    final result = create();
    if (registerFioAddressMessage != null)
      result.registerFioAddressMessage = registerFioAddressMessage;
    if (addPubAddressMessage != null)
      result.addPubAddressMessage = addPubAddressMessage;
    if (transferMessage != null) result.transferMessage = transferMessage;
    if (renewFioAddressMessage != null)
      result.renewFioAddressMessage = renewFioAddressMessage;
    if (newFundsRequestMessage != null)
      result.newFundsRequestMessage = newFundsRequestMessage;
    if (removePubAddressMessage != null)
      result.removePubAddressMessage = removePubAddressMessage;
    if (removeAllPubAddressesMessage != null)
      result.removeAllPubAddressesMessage = removeAllPubAddressesMessage;
    if (addBundledTransactionsMessage != null)
      result.addBundledTransactionsMessage = addBundledTransactionsMessage;
    return result;
  }

  Action._();

  factory Action.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Action_MessageOneof>
      _Action_MessageOneofByTag = {
    1: Action_MessageOneof.registerFioAddressMessage,
    2: Action_MessageOneof.addPubAddressMessage,
    3: Action_MessageOneof.transferMessage,
    4: Action_MessageOneof.renewFioAddressMessage,
    5: Action_MessageOneof.newFundsRequestMessage,
    6: Action_MessageOneof.removePubAddressMessage,
    7: Action_MessageOneof.removeAllPubAddressesMessage,
    8: Action_MessageOneof.addBundledTransactionsMessage,
    0: Action_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aOM<Action_RegisterFioAddress>(
        1, _omitFieldNames ? '' : 'registerFioAddressMessage',
        subBuilder: Action_RegisterFioAddress.create)
    ..aOM<Action_AddPubAddress>(
        2, _omitFieldNames ? '' : 'addPubAddressMessage',
        subBuilder: Action_AddPubAddress.create)
    ..aOM<Action_Transfer>(3, _omitFieldNames ? '' : 'transferMessage',
        subBuilder: Action_Transfer.create)
    ..aOM<Action_RenewFioAddress>(
        4, _omitFieldNames ? '' : 'renewFioAddressMessage',
        subBuilder: Action_RenewFioAddress.create)
    ..aOM<Action_NewFundsRequest>(
        5, _omitFieldNames ? '' : 'newFundsRequestMessage',
        subBuilder: Action_NewFundsRequest.create)
    ..aOM<Action_RemovePubAddress>(
        6, _omitFieldNames ? '' : 'removePubAddressMessage',
        subBuilder: Action_RemovePubAddress.create)
    ..aOM<Action_RemoveAllPubAddress>(
        7, _omitFieldNames ? '' : 'removeAllPubAddressesMessage',
        subBuilder: Action_RemoveAllPubAddress.create)
    ..aOM<Action_AddBundledTransactions>(
        8, _omitFieldNames ? '' : 'addBundledTransactionsMessage',
        subBuilder: Action_AddBundledTransactions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action copyWith(void Function(Action) updates) =>
      super.copyWith((message) => updates(message as Action)) as Action;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action create() => Action._();
  @$core.override
  Action createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Action>(create);
  static Action? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  Action_MessageOneof whichMessageOneof() =>
      _Action_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Action_RegisterFioAddress get registerFioAddressMessage => $_getN(0);
  @$pb.TagNumber(1)
  set registerFioAddressMessage(Action_RegisterFioAddress value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRegisterFioAddressMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegisterFioAddressMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  Action_RegisterFioAddress ensureRegisterFioAddressMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  Action_AddPubAddress get addPubAddressMessage => $_getN(1);
  @$pb.TagNumber(2)
  set addPubAddressMessage(Action_AddPubAddress value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAddPubAddressMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddPubAddressMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  Action_AddPubAddress ensureAddPubAddressMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  Action_Transfer get transferMessage => $_getN(2);
  @$pb.TagNumber(3)
  set transferMessage(Action_Transfer value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  Action_Transfer ensureTransferMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  Action_RenewFioAddress get renewFioAddressMessage => $_getN(3);
  @$pb.TagNumber(4)
  set renewFioAddressMessage(Action_RenewFioAddress value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRenewFioAddressMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearRenewFioAddressMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  Action_RenewFioAddress ensureRenewFioAddressMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  Action_NewFundsRequest get newFundsRequestMessage => $_getN(4);
  @$pb.TagNumber(5)
  set newFundsRequestMessage(Action_NewFundsRequest value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNewFundsRequestMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearNewFundsRequestMessage() => $_clearField(5);
  @$pb.TagNumber(5)
  Action_NewFundsRequest ensureNewFundsRequestMessage() => $_ensure(4);

  @$pb.TagNumber(6)
  Action_RemovePubAddress get removePubAddressMessage => $_getN(5);
  @$pb.TagNumber(6)
  set removePubAddressMessage(Action_RemovePubAddress value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasRemovePubAddressMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemovePubAddressMessage() => $_clearField(6);
  @$pb.TagNumber(6)
  Action_RemovePubAddress ensureRemovePubAddressMessage() => $_ensure(5);

  @$pb.TagNumber(7)
  Action_RemoveAllPubAddress get removeAllPubAddressesMessage => $_getN(6);
  @$pb.TagNumber(7)
  set removeAllPubAddressesMessage(Action_RemoveAllPubAddress value) =>
      $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasRemoveAllPubAddressesMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearRemoveAllPubAddressesMessage() => $_clearField(7);
  @$pb.TagNumber(7)
  Action_RemoveAllPubAddress ensureRemoveAllPubAddressesMessage() =>
      $_ensure(6);

  @$pb.TagNumber(8)
  Action_AddBundledTransactions get addBundledTransactionsMessage => $_getN(7);
  @$pb.TagNumber(8)
  set addBundledTransactionsMessage(Action_AddBundledTransactions value) =>
      $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAddBundledTransactionsMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddBundledTransactionsMessage() => $_clearField(8);
  @$pb.TagNumber(8)
  Action_AddBundledTransactions ensureAddBundledTransactionsMessage() =>
      $_ensure(7);
}

/// Represents current parameters of the FIO blockchain
class ChainParams extends $pb.GeneratedMessage {
  factory ChainParams({
    $core.List<$core.int>? chainId,
    $fixnum.Int64? headBlockNumber,
    $fixnum.Int64? refBlockPrefix,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (headBlockNumber != null) result.headBlockNumber = headBlockNumber;
    if (refBlockPrefix != null) result.refBlockPrefix = refBlockPrefix;
    return result;
  }

  ChainParams._();

  factory ChainParams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChainParams.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChainParams',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'chainId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'headBlockNumber', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'refBlockPrefix', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainParams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChainParams copyWith(void Function(ChainParams) updates) =>
      super.copyWith((message) => updates(message as ChainParams))
          as ChainParams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChainParams create() => ChainParams._();
  @$core.override
  ChainParams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChainParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChainParams>(create);
  static ChainParams? _defaultInstance;

  /// Constant chainId (32 bytes), obtained from get_info API
  @$pb.TagNumber(1)
  $core.List<$core.int> get chainId => $_getN(0);
  @$pb.TagNumber(1)
  set chainId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// The last block number, obtained from get_info API
  @$pb.TagNumber(2)
  $fixnum.Int64 get headBlockNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set headBlockNumber($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHeadBlockNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeadBlockNumber() => $_clearField(2);

  /// Block prefix of last block, obtained from get_block API
  @$pb.TagNumber(3)
  $fixnum.Int64 get refBlockPrefix => $_getI64(2);
  @$pb.TagNumber(3)
  set refBlockPrefix($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefBlockPrefix() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefBlockPrefix() => $_clearField(3);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.int? expiry,
    ChainParams? chainParams,
    $core.List<$core.int>? privateKey,
    $core.String? tpid,
    Action? action,
    $core.String? ownerPublicKey,
  }) {
    final result = create();
    if (expiry != null) result.expiry = expiry;
    if (chainParams != null) result.chainParams = chainParams;
    if (privateKey != null) result.privateKey = privateKey;
    if (tpid != null) result.tpid = tpid;
    if (action != null) result.action = action;
    if (ownerPublicKey != null) result.ownerPublicKey = ownerPublicKey;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'expiry', fieldType: $pb.PbFieldType.OU3)
    ..aOM<ChainParams>(2, _omitFieldNames ? '' : 'chainParams',
        subBuilder: ChainParams.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'tpid')
    ..aOM<Action>(5, _omitFieldNames ? '' : 'action', subBuilder: Action.create)
    ..aOS(6, _omitFieldNames ? '' : 'ownerPublicKey')
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

  /// Expiry for this message, in unix time. Can be 0, then it is taken from current time with default expiry
  @$pb.TagNumber(1)
  $core.int get expiry => $_getIZ(0);
  @$pb.TagNumber(1)
  set expiry($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasExpiry() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpiry() => $_clearField(1);

  /// Current parameters of the FIO blockchain
  @$pb.TagNumber(2)
  ChainParams get chainParams => $_getN(1);
  @$pb.TagNumber(2)
  set chainParams(ChainParams value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasChainParams() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainParams() => $_clearField(2);
  @$pb.TagNumber(2)
  ChainParams ensureChainParams() => $_ensure(1);

  /// The secret private key matching the address, used for signing (32 bytes).
  @$pb.TagNumber(3)
  $core.List<$core.int> get privateKey => $_getN(2);
  @$pb.TagNumber(3)
  set privateKey($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrivateKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrivateKey() => $_clearField(3);

  /// The FIO name of the originating wallet (project-wide constant)
  @$pb.TagNumber(4)
  $core.String get tpid => $_getSZ(3);
  @$pb.TagNumber(4)
  set tpid($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTpid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTpid() => $_clearField(4);

  /// Context-specific action data
  @$pb.TagNumber(5)
  Action get action => $_getN(4);
  @$pb.TagNumber(5)
  set action(Action value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAction() => $_has(4);
  @$pb.TagNumber(5)
  void clearAction() => $_clearField(5);
  @$pb.TagNumber(5)
  Action ensureAction() => $_ensure(4);

  /// FIO address of the owner. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
  @$pb.TagNumber(6)
  $core.String get ownerPublicKey => $_getSZ(5);
  @$pb.TagNumber(6)
  set ownerPublicKey($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOwnerPublicKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwnerPublicKey() => $_clearField(6);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? json,
    $0.SigningError? error,
    $core.String? errorMessage,
    $core.String? actionName,
  }) {
    final result = create();
    if (json != null) result.json = json;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (actionName != null) result.actionName = actionName;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.FIO.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'json')
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(4, _omitFieldNames ? '' : 'actionName')
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

  /// Signed transaction in JSON
  @$pb.TagNumber(1)
  $core.String get json => $_getSZ(0);
  @$pb.TagNumber(1)
  set json($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearJson() => $_clearField(1);

  /// Optional error
  @$pb.TagNumber(2)
  $0.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.SigningError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  /// error code description
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  /// Performed action name, ex. "addaddress", "remaddress", "trnsfiopubky" etc.
  @$pb.TagNumber(4)
  $core.String get actionName => $_getSZ(3);
  @$pb.TagNumber(4)
  set actionName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasActionName() => $_has(3);
  @$pb.TagNumber(4)
  void clearActionName() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
