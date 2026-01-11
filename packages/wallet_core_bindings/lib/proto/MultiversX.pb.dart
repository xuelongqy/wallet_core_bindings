// This is a generated file - do not edit.
//
// Generated from MultiversX.proto.

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

/// Generic action. Using one of the more specific actions (e.g. transfers, see below) is recommended.
class GenericAction extends $pb.GeneratedMessage {
  factory GenericAction({
    Accounts? accounts,
    $core.String? value,
    $core.String? data,
    $core.int? version,
    $core.int? options,
  }) {
    final result = create();
    if (accounts != null) result.accounts = accounts;
    if (value != null) result.value = value;
    if (data != null) result.data = data;
    if (version != null) result.version = version;
    if (options != null) result.options = options;
    return result;
  }

  GenericAction._();

  factory GenericAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenericAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenericAction',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..aOM<Accounts>(1, _omitFieldNames ? '' : 'accounts',
        subBuilder: Accounts.create)
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..aOS(3, _omitFieldNames ? '' : 'data')
    ..aI(4, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'options', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenericAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenericAction copyWith(void Function(GenericAction) updates) =>
      super.copyWith((message) => updates(message as GenericAction))
          as GenericAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenericAction create() => GenericAction._();
  @$core.override
  GenericAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenericAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenericAction>(create);
  static GenericAction? _defaultInstance;

  /// Accounts involved
  @$pb.TagNumber(1)
  Accounts get accounts => $_getN(0);
  @$pb.TagNumber(1)
  set accounts(Accounts value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccounts() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccounts() => $_clearField(1);
  @$pb.TagNumber(1)
  Accounts ensureAccounts() => $_ensure(0);

  /// amount
  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  /// additional data
  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);

  /// transaction version
  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);

  /// Generally speaking, the "options" field can be ignored (not set) by applications using TW Core.
  @$pb.TagNumber(5)
  $core.int get options => $_getIZ(4);
  @$pb.TagNumber(5)
  set options($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOptions() => $_has(4);
  @$pb.TagNumber(5)
  void clearOptions() => $_clearField(5);
}

/// EGLD transfer (move balance).
class EGLDTransfer extends $pb.GeneratedMessage {
  factory EGLDTransfer({
    Accounts? accounts,
    $core.String? amount,
    $core.String? data,
    $core.int? version,
  }) {
    final result = create();
    if (accounts != null) result.accounts = accounts;
    if (amount != null) result.amount = amount;
    if (data != null) result.data = data;
    if (version != null) result.version = version;
    return result;
  }

  EGLDTransfer._();

  factory EGLDTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EGLDTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EGLDTransfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..aOM<Accounts>(1, _omitFieldNames ? '' : 'accounts',
        subBuilder: Accounts.create)
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..aOS(3, _omitFieldNames ? '' : 'data')
    ..aI(4, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EGLDTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EGLDTransfer copyWith(void Function(EGLDTransfer) updates) =>
      super.copyWith((message) => updates(message as EGLDTransfer))
          as EGLDTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EGLDTransfer create() => EGLDTransfer._();
  @$core.override
  EGLDTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EGLDTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EGLDTransfer>(create);
  static EGLDTransfer? _defaultInstance;

  /// Accounts involved
  @$pb.TagNumber(1)
  Accounts get accounts => $_getN(0);
  @$pb.TagNumber(1)
  set accounts(Accounts value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccounts() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccounts() => $_clearField(1);
  @$pb.TagNumber(1)
  Accounts ensureAccounts() => $_ensure(0);

  /// Transfer amount (string)
  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);

  /// transaction version, if empty, the default value will be used
  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);
}

/// ESDT transfer (transfer regular ESDTs - fungible tokens).
class ESDTTransfer extends $pb.GeneratedMessage {
  factory ESDTTransfer({
    Accounts? accounts,
    $core.String? tokenIdentifier,
    $core.String? amount,
    $core.int? version,
  }) {
    final result = create();
    if (accounts != null) result.accounts = accounts;
    if (tokenIdentifier != null) result.tokenIdentifier = tokenIdentifier;
    if (amount != null) result.amount = amount;
    if (version != null) result.version = version;
    return result;
  }

  ESDTTransfer._();

  factory ESDTTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ESDTTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ESDTTransfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..aOM<Accounts>(1, _omitFieldNames ? '' : 'accounts',
        subBuilder: Accounts.create)
    ..aOS(2, _omitFieldNames ? '' : 'tokenIdentifier')
    ..aOS(3, _omitFieldNames ? '' : 'amount')
    ..aI(4, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ESDTTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ESDTTransfer copyWith(void Function(ESDTTransfer) updates) =>
      super.copyWith((message) => updates(message as ESDTTransfer))
          as ESDTTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ESDTTransfer create() => ESDTTransfer._();
  @$core.override
  ESDTTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ESDTTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ESDTTransfer>(create);
  static ESDTTransfer? _defaultInstance;

  /// Accounts involved
  @$pb.TagNumber(1)
  Accounts get accounts => $_getN(0);
  @$pb.TagNumber(1)
  set accounts(Accounts value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccounts() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccounts() => $_clearField(1);
  @$pb.TagNumber(1)
  Accounts ensureAccounts() => $_ensure(0);

  /// Token ID
  @$pb.TagNumber(2)
  $core.String get tokenIdentifier => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenIdentifier($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenIdentifier() => $_clearField(2);

  /// Transfer token amount (string)
  @$pb.TagNumber(3)
  $core.String get amount => $_getSZ(2);
  @$pb.TagNumber(3)
  set amount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// transaction version, if empty, the default value will be used
  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);
}

/// ESDTNFT transfer (transfer NFTs, SFTs and Meta ESDTs).
class ESDTNFTTransfer extends $pb.GeneratedMessage {
  factory ESDTNFTTransfer({
    Accounts? accounts,
    $core.String? tokenCollection,
    $fixnum.Int64? tokenNonce,
    $core.String? amount,
    $core.int? version,
  }) {
    final result = create();
    if (accounts != null) result.accounts = accounts;
    if (tokenCollection != null) result.tokenCollection = tokenCollection;
    if (tokenNonce != null) result.tokenNonce = tokenNonce;
    if (amount != null) result.amount = amount;
    if (version != null) result.version = version;
    return result;
  }

  ESDTNFTTransfer._();

  factory ESDTNFTTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ESDTNFTTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ESDTNFTTransfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..aOM<Accounts>(1, _omitFieldNames ? '' : 'accounts',
        subBuilder: Accounts.create)
    ..aOS(2, _omitFieldNames ? '' : 'tokenCollection')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'tokenNonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..aI(5, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ESDTNFTTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ESDTNFTTransfer copyWith(void Function(ESDTNFTTransfer) updates) =>
      super.copyWith((message) => updates(message as ESDTNFTTransfer))
          as ESDTNFTTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ESDTNFTTransfer create() => ESDTNFTTransfer._();
  @$core.override
  ESDTNFTTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ESDTNFTTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ESDTNFTTransfer>(create);
  static ESDTNFTTransfer? _defaultInstance;

  /// Accounts involved
  @$pb.TagNumber(1)
  Accounts get accounts => $_getN(0);
  @$pb.TagNumber(1)
  set accounts(Accounts value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccounts() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccounts() => $_clearField(1);
  @$pb.TagNumber(1)
  Accounts ensureAccounts() => $_ensure(0);

  /// tokens
  @$pb.TagNumber(2)
  $core.String get tokenCollection => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenCollection($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTokenCollection() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenCollection() => $_clearField(2);

  /// nonce of the token
  @$pb.TagNumber(3)
  $fixnum.Int64 get tokenNonce => $_getI64(2);
  @$pb.TagNumber(3)
  set tokenNonce($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenNonce() => $_clearField(3);

  /// transfer amount
  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  /// transaction version, if empty, the default value will be used
  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(4);
  @$pb.TagNumber(5)
  set version($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersion() => $_clearField(5);
}

/// Transaction sender & receiver etc.
class Accounts extends $pb.GeneratedMessage {
  factory Accounts({
    $fixnum.Int64? senderNonce,
    $core.String? sender,
    $core.String? senderUsername,
    $core.String? receiver,
    $core.String? receiverUsername,
    $core.String? guardian,
    $core.String? relayer,
  }) {
    final result = create();
    if (senderNonce != null) result.senderNonce = senderNonce;
    if (sender != null) result.sender = sender;
    if (senderUsername != null) result.senderUsername = senderUsername;
    if (receiver != null) result.receiver = receiver;
    if (receiverUsername != null) result.receiverUsername = receiverUsername;
    if (guardian != null) result.guardian = guardian;
    if (relayer != null) result.relayer = relayer;
    return result;
  }

  Accounts._();

  factory Accounts.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Accounts.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Accounts',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'senderNonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'sender')
    ..aOS(3, _omitFieldNames ? '' : 'senderUsername')
    ..aOS(4, _omitFieldNames ? '' : 'receiver')
    ..aOS(5, _omitFieldNames ? '' : 'receiverUsername')
    ..aOS(6, _omitFieldNames ? '' : 'guardian')
    ..aOS(7, _omitFieldNames ? '' : 'relayer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Accounts clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Accounts copyWith(void Function(Accounts) updates) =>
      super.copyWith((message) => updates(message as Accounts)) as Accounts;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Accounts create() => Accounts._();
  @$core.override
  Accounts createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Accounts getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Accounts>(create);
  static Accounts? _defaultInstance;

  /// Nonce of the sender
  @$pb.TagNumber(1)
  $fixnum.Int64 get senderNonce => $_getI64(0);
  @$pb.TagNumber(1)
  set senderNonce($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSenderNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderNonce() => $_clearField(1);

  /// Sender address
  @$pb.TagNumber(2)
  $core.String get sender => $_getSZ(1);
  @$pb.TagNumber(2)
  set sender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => $_clearField(2);

  /// Sender username
  @$pb.TagNumber(3)
  $core.String get senderUsername => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderUsername($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderUsername() => $_clearField(3);

  /// Receiver address
  @$pb.TagNumber(4)
  $core.String get receiver => $_getSZ(3);
  @$pb.TagNumber(4)
  set receiver($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReceiver() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiver() => $_clearField(4);

  /// Receiver username
  @$pb.TagNumber(5)
  $core.String get receiverUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set receiverUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReceiverUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceiverUsername() => $_clearField(5);

  /// Guardian address
  @$pb.TagNumber(6)
  $core.String get guardian => $_getSZ(5);
  @$pb.TagNumber(6)
  set guardian($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGuardian() => $_has(5);
  @$pb.TagNumber(6)
  void clearGuardian() => $_clearField(6);

  /// Relayer address
  @$pb.TagNumber(7)
  $core.String get relayer => $_getSZ(6);
  @$pb.TagNumber(7)
  set relayer($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRelayer() => $_has(6);
  @$pb.TagNumber(7)
  void clearRelayer() => $_clearField(7);
}

enum SigningInput_MessageOneof {
  genericAction,
  egldTransfer,
  esdtTransfer,
  esdtnftTransfer,
  notSet
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    $core.String? chainId,
    $fixnum.Int64? gasPrice,
    $fixnum.Int64? gasLimit,
    GenericAction? genericAction,
    EGLDTransfer? egldTransfer,
    ESDTTransfer? esdtTransfer,
    ESDTNFTTransfer? esdtnftTransfer,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (chainId != null) result.chainId = chainId;
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (genericAction != null) result.genericAction = genericAction;
    if (egldTransfer != null) result.egldTransfer = egldTransfer;
    if (esdtTransfer != null) result.esdtTransfer = esdtTransfer;
    if (esdtnftTransfer != null) result.esdtnftTransfer = esdtnftTransfer;
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
    5: SigningInput_MessageOneof.genericAction,
    6: SigningInput_MessageOneof.egldTransfer,
    7: SigningInput_MessageOneof.esdtTransfer,
    8: SigningInput_MessageOneof.esdtnftTransfer,
    0: SigningInput_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 7, 8])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'chainId')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'gasLimit', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<GenericAction>(5, _omitFieldNames ? '' : 'genericAction',
        subBuilder: GenericAction.create)
    ..aOM<EGLDTransfer>(6, _omitFieldNames ? '' : 'egldTransfer',
        subBuilder: EGLDTransfer.create)
    ..aOM<ESDTTransfer>(7, _omitFieldNames ? '' : 'esdtTransfer',
        subBuilder: ESDTTransfer.create)
    ..aOM<ESDTNFTTransfer>(8, _omitFieldNames ? '' : 'esdtnftTransfer',
        subBuilder: ESDTNFTTransfer.create)
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
  SigningInput_MessageOneof whichMessageOneof() =>
      _SigningInput_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// Chain identifier, string
  @$pb.TagNumber(2)
  $core.String get chainId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chainId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChainId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChainId() => $_clearField(2);

  /// Gas price
  @$pb.TagNumber(3)
  $fixnum.Int64 get gasPrice => $_getI64(2);
  @$pb.TagNumber(3)
  set gasPrice($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearGasPrice() => $_clearField(3);

  /// Limit for the gas used
  @$pb.TagNumber(4)
  $fixnum.Int64 get gasLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set gasLimit($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearGasLimit() => $_clearField(4);

  @$pb.TagNumber(5)
  GenericAction get genericAction => $_getN(4);
  @$pb.TagNumber(5)
  set genericAction(GenericAction value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGenericAction() => $_has(4);
  @$pb.TagNumber(5)
  void clearGenericAction() => $_clearField(5);
  @$pb.TagNumber(5)
  GenericAction ensureGenericAction() => $_ensure(4);

  @$pb.TagNumber(6)
  EGLDTransfer get egldTransfer => $_getN(5);
  @$pb.TagNumber(6)
  set egldTransfer(EGLDTransfer value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEgldTransfer() => $_has(5);
  @$pb.TagNumber(6)
  void clearEgldTransfer() => $_clearField(6);
  @$pb.TagNumber(6)
  EGLDTransfer ensureEgldTransfer() => $_ensure(5);

  @$pb.TagNumber(7)
  ESDTTransfer get esdtTransfer => $_getN(6);
  @$pb.TagNumber(7)
  set esdtTransfer(ESDTTransfer value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasEsdtTransfer() => $_has(6);
  @$pb.TagNumber(7)
  void clearEsdtTransfer() => $_clearField(7);
  @$pb.TagNumber(7)
  ESDTTransfer ensureEsdtTransfer() => $_ensure(6);

  @$pb.TagNumber(8)
  ESDTNFTTransfer get esdtnftTransfer => $_getN(7);
  @$pb.TagNumber(8)
  set esdtnftTransfer(ESDTNFTTransfer value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasEsdtnftTransfer() => $_has(7);
  @$pb.TagNumber(8)
  void clearEsdtnftTransfer() => $_clearField(8);
  @$pb.TagNumber(8)
  ESDTNFTTransfer ensureEsdtnftTransfer() => $_ensure(7);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? encoded,
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.MultiversX.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'encoded')
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

  @$pb.TagNumber(1)
  $core.String get encoded => $_getSZ(0);
  @$pb.TagNumber(1)
  set encoded($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  /// error code description
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
