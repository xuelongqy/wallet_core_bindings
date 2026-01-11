// This is a generated file - do not edit.
//
// Generated from TheOpenNetwork.proto.

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
import 'TheOpenNetwork.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'TheOpenNetwork.pbenum.dart';

enum Transfer_Payload { jettonTransfer, customPayload, notSet }

class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.String? dest,
    $core.List<$core.int>? amount,
    $core.int? mode,
    $core.String? comment,
    $core.bool? bounceable,
    $core.String? stateInit,
    JettonTransfer? jettonTransfer,
    $core.String? customPayload,
  }) {
    final result = create();
    if (dest != null) result.dest = dest;
    if (amount != null) result.amount = amount;
    if (mode != null) result.mode = mode;
    if (comment != null) result.comment = comment;
    if (bounceable != null) result.bounceable = bounceable;
    if (stateInit != null) result.stateInit = stateInit;
    if (jettonTransfer != null) result.jettonTransfer = jettonTransfer;
    if (customPayload != null) result.customPayload = customPayload;
    return result;
  }

  Transfer._();

  factory Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Transfer_Payload> _Transfer_PayloadByTag = {
    7: Transfer_Payload.jettonTransfer,
    8: Transfer_Payload.customPayload,
    0: Transfer_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transfer',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'dest')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'mode', fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..aOB(5, _omitFieldNames ? '' : 'bounceable')
    ..aOS(6, _omitFieldNames ? '' : 'stateInit')
    ..aOM<JettonTransfer>(7, _omitFieldNames ? '' : 'jettonTransfer',
        subBuilder: JettonTransfer.create)
    ..aOS(8, _omitFieldNames ? '' : 'customPayload')
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

  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  Transfer_Payload whichPayload() => _Transfer_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearPayload() => $_clearField($_whichOneof(0));

  /// Recipient address
  @$pb.TagNumber(1)
  $core.String get dest => $_getSZ(0);
  @$pb.TagNumber(1)
  set dest($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDest() => $_has(0);
  @$pb.TagNumber(1)
  void clearDest() => $_clearField(1);

  /// Amount to send in nanotons
  /// uint128 / big endian byte order
  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Send mode (optional, 0 by default)
  /// Learn more: https://ton.org/docs/develop/func/stdlib#send_raw_message
  @$pb.TagNumber(3)
  $core.int get mode => $_getIZ(2);
  @$pb.TagNumber(3)
  set mode($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearMode() => $_clearField(3);

  /// Transfer comment message (optional, empty by default)
  /// Ignored if `custom_payload` is specified
  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => $_clearField(4);

  /// If the address is bounceable
  @$pb.TagNumber(5)
  $core.bool get bounceable => $_getBF(4);
  @$pb.TagNumber(5)
  set bounceable($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBounceable() => $_has(4);
  @$pb.TagNumber(5)
  void clearBounceable() => $_clearField(5);

  /// Optional raw one-cell BoC encoded in Base64.
  /// Can be used to deploy a smart contract.
  @$pb.TagNumber(6)
  $core.String get stateInit => $_getSZ(5);
  @$pb.TagNumber(6)
  set stateInit($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStateInit() => $_has(5);
  @$pb.TagNumber(6)
  void clearStateInit() => $_clearField(6);

  /// Jetton transfer payload.
  @$pb.TagNumber(7)
  JettonTransfer get jettonTransfer => $_getN(6);
  @$pb.TagNumber(7)
  set jettonTransfer(JettonTransfer value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasJettonTransfer() => $_has(6);
  @$pb.TagNumber(7)
  void clearJettonTransfer() => $_clearField(7);
  @$pb.TagNumber(7)
  JettonTransfer ensureJettonTransfer() => $_ensure(6);

  /// TON transfer with custom payload (contract call). Raw one-cell BoC encoded in Base64.
  @$pb.TagNumber(8)
  $core.String get customPayload => $_getSZ(7);
  @$pb.TagNumber(8)
  set customPayload($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCustomPayload() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustomPayload() => $_clearField(8);
}

class JettonTransfer extends $pb.GeneratedMessage {
  factory JettonTransfer({
    $fixnum.Int64? queryId,
    $core.List<$core.int>? jettonAmount,
    $core.String? toOwner,
    $core.String? responseAddress,
    $core.List<$core.int>? forwardAmount,
    $core.String? customPayload,
  }) {
    final result = create();
    if (queryId != null) result.queryId = queryId;
    if (jettonAmount != null) result.jettonAmount = jettonAmount;
    if (toOwner != null) result.toOwner = toOwner;
    if (responseAddress != null) result.responseAddress = responseAddress;
    if (forwardAmount != null) result.forwardAmount = forwardAmount;
    if (customPayload != null) result.customPayload = customPayload;
    return result;
  }

  JettonTransfer._();

  factory JettonTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JettonTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JettonTransfer',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'queryId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'jettonAmount', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'toOwner')
    ..aOS(4, _omitFieldNames ? '' : 'responseAddress')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'forwardAmount', $pb.PbFieldType.OY)
    ..aOS(6, _omitFieldNames ? '' : 'customPayload')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JettonTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JettonTransfer copyWith(void Function(JettonTransfer) updates) =>
      super.copyWith((message) => updates(message as JettonTransfer))
          as JettonTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JettonTransfer create() => JettonTransfer._();
  @$core.override
  JettonTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JettonTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JettonTransfer>(create);
  static JettonTransfer? _defaultInstance;

  /// Arbitrary request number. Default is 0. Optional field.
  @$pb.TagNumber(1)
  $fixnum.Int64 get queryId => $_getI64(0);
  @$pb.TagNumber(1)
  set queryId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQueryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQueryId() => $_clearField(1);

  /// Amount of transferred jettons in elementary integer units. The real value transferred is jetton_amount multiplied by ten to the power of token decimal precision
  /// uint128 / big endian byte order
  @$pb.TagNumber(2)
  $core.List<$core.int> get jettonAmount => $_getN(1);
  @$pb.TagNumber(2)
  set jettonAmount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJettonAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearJettonAmount() => $_clearField(2);

  /// Address of the new owner of the jettons.
  @$pb.TagNumber(3)
  $core.String get toOwner => $_getSZ(2);
  @$pb.TagNumber(3)
  set toOwner($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearToOwner() => $_clearField(3);

  /// Address where to send a response with confirmation of a successful transfer and the rest of the incoming message Toncoins. Usually the sender should get back their toncoins.
  @$pb.TagNumber(4)
  $core.String get responseAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set responseAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasResponseAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearResponseAddress() => $_clearField(4);

  /// Amount in nanotons to forward to recipient. Basically minimum amount - 1 nanoton should be used
  /// uint128 / big endian byte order
  @$pb.TagNumber(5)
  $core.List<$core.int> get forwardAmount => $_getN(4);
  @$pb.TagNumber(5)
  set forwardAmount($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasForwardAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearForwardAmount() => $_clearField(5);

  /// Optional raw one-cell BoC encoded in Base64.
  /// Can be used in the case of mintless jetton transfers.
  @$pb.TagNumber(6)
  $core.String get customPayload => $_getSZ(5);
  @$pb.TagNumber(6)
  set customPayload($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCustomPayload() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomPayload() => $_clearField(6);
}

class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    $core.List<$core.int>? publicKey,
    $core.Iterable<Transfer>? messages,
    $core.int? sequenceNumber,
    $core.int? expireAt,
    WalletVersion? walletVersion,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (publicKey != null) result.publicKey = publicKey;
    if (messages != null) result.messages.addAll(messages);
    if (sequenceNumber != null) result.sequenceNumber = sequenceNumber;
    if (expireAt != null) result.expireAt = expireAt;
    if (walletVersion != null) result.walletVersion = walletVersion;
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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..pPM<Transfer>(3, _omitFieldNames ? '' : 'messages',
        subBuilder: Transfer.create)
    ..aI(4, _omitFieldNames ? '' : 'sequenceNumber',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'expireAt', fieldType: $pb.PbFieldType.OU3)
    ..aE<WalletVersion>(6, _omitFieldNames ? '' : 'walletVersion',
        enumValues: WalletVersion.values)
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

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// Public key of the signer (32 bytes). Used when transaction is going to be signed externally.
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  /// Up to 4 internal messages.
  @$pb.TagNumber(3)
  $pb.PbList<Transfer> get messages => $_getList(2);

  /// Message counter (optional, 0 by default used for the first deploy)
  /// This field is required, because we need to protect the smart contract against "replay attacks"
  /// Learn more: https://ton.org/docs/develop/smart-contracts/guidelines/external-messages
  @$pb.TagNumber(4)
  $core.int get sequenceNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set sequenceNumber($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSequenceNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequenceNumber() => $_clearField(4);

  /// Expiration UNIX timestamp (optional, now() + 60 by default)
  @$pb.TagNumber(5)
  $core.int get expireAt => $_getIZ(4);
  @$pb.TagNumber(5)
  set expireAt($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpireAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireAt() => $_clearField(5);

  /// Wallet version
  @$pb.TagNumber(6)
  WalletVersion get walletVersion => $_getN(5);
  @$pb.TagNumber(6)
  set walletVersion(WalletVersion value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasWalletVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearWalletVersion() => $_clearField(6);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? encoded,
    $core.List<$core.int>? hash,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (hash != null) result.hash = hash;
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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'encoded')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
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

  /// Signed and base64 encoded BOC message
  @$pb.TagNumber(1)
  $core.String get encoded => $_getSZ(0);
  @$pb.TagNumber(1)
  set encoded($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// Transaction Cell hash
  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);

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
