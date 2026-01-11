// This is a generated file - do not edit.
//
// Generated from Greenfield.proto.

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
import 'Greenfield.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Greenfield.pbenum.dart';

/// A denomination and an amount
class Amount extends $pb.GeneratedMessage {
  factory Amount({
    $core.String? denom,
    $core.String? amount,
  }) {
    final result = create();
    if (denom != null) result.denom = denom;
    if (amount != null) result.amount = amount;
    return result;
  }

  Amount._();

  factory Amount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Amount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Amount',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'denom')
    ..aOS(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Amount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Amount copyWith(void Function(Amount) updates) =>
      super.copyWith((message) => updates(message as Amount)) as Amount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Amount create() => Amount._();
  @$core.override
  Amount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Amount getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Amount>(create);
  static Amount? _defaultInstance;

  /// name of the denomination
  @$pb.TagNumber(1)
  $core.String get denom => $_getSZ(0);
  @$pb.TagNumber(1)
  set denom($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearDenom() => $_clearField(1);

  /// amount, number as string
  @$pb.TagNumber(2)
  $core.String get amount => $_getSZ(1);
  @$pb.TagNumber(2)
  set amount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// Fee incl. gas
class Fee extends $pb.GeneratedMessage {
  factory Fee({
    $core.Iterable<Amount>? amounts,
    $fixnum.Int64? gas,
  }) {
    final result = create();
    if (amounts != null) result.amounts.addAll(amounts);
    if (gas != null) result.gas = gas;
    return result;
  }

  Fee._();

  factory Fee.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Fee.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Fee',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..pPM<Amount>(1, _omitFieldNames ? '' : 'amounts',
        subBuilder: Amount.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gas', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Fee clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Fee copyWith(void Function(Fee) updates) =>
      super.copyWith((message) => updates(message as Fee)) as Fee;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fee create() => Fee._();
  @$core.override
  Fee createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Fee getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Fee>(create);
  static Fee? _defaultInstance;

  /// Fee amount(s)
  @$pb.TagNumber(1)
  $pb.PbList<Amount> get amounts => $_getList(0);

  /// Gas price
  @$pb.TagNumber(2)
  $fixnum.Int64 get gas => $_getI64(1);
  @$pb.TagNumber(2)
  set gas($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGas() => $_has(1);
  @$pb.TagNumber(2)
  void clearGas() => $_clearField(2);
}

/// cosmos-sdk/MsgSend
class Message_Send extends $pb.GeneratedMessage {
  factory Message_Send({
    $core.String? fromAddress,
    $core.String? toAddress,
    $core.Iterable<Amount>? amounts,
    $core.String? typePrefix,
  }) {
    final result = create();
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (toAddress != null) result.toAddress = toAddress;
    if (amounts != null) result.amounts.addAll(amounts);
    if (typePrefix != null) result.typePrefix = typePrefix;
    return result;
  }

  Message_Send._();

  factory Message_Send.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message_Send.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message.Send',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromAddress')
    ..aOS(2, _omitFieldNames ? '' : 'toAddress')
    ..pPM<Amount>(3, _omitFieldNames ? '' : 'amounts',
        subBuilder: Amount.create)
    ..aOS(4, _omitFieldNames ? '' : 'typePrefix')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message_Send clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message_Send copyWith(void Function(Message_Send) updates) =>
      super.copyWith((message) => updates(message as Message_Send))
          as Message_Send;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message_Send create() => Message_Send._();
  @$core.override
  Message_Send createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Message_Send getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Message_Send>(create);
  static Message_Send? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Amount> get amounts => $_getList(2);

  /// Optional. Default `cosmos.bank.v1beta1.MsgSend`.
  @$pb.TagNumber(4)
  $core.String get typePrefix => $_getSZ(3);
  @$pb.TagNumber(4)
  set typePrefix($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTypePrefix() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypePrefix() => $_clearField(4);
}

/// greenfield/MsgTransferOut
/// Used to transfer BNB Greenfield to BSC blockchain.
class Message_BridgeTransferOut extends $pb.GeneratedMessage {
  factory Message_BridgeTransferOut({
    $core.String? fromAddress,
    $core.String? toAddress,
    Amount? amount,
    $core.String? typePrefix,
  }) {
    final result = create();
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (toAddress != null) result.toAddress = toAddress;
    if (amount != null) result.amount = amount;
    if (typePrefix != null) result.typePrefix = typePrefix;
    return result;
  }

  Message_BridgeTransferOut._();

  factory Message_BridgeTransferOut.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message_BridgeTransferOut.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message.BridgeTransferOut',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromAddress')
    ..aOS(2, _omitFieldNames ? '' : 'toAddress')
    ..aOM<Amount>(3, _omitFieldNames ? '' : 'amount', subBuilder: Amount.create)
    ..aOS(4, _omitFieldNames ? '' : 'typePrefix')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message_BridgeTransferOut clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message_BridgeTransferOut copyWith(
          void Function(Message_BridgeTransferOut) updates) =>
      super.copyWith((message) => updates(message as Message_BridgeTransferOut))
          as Message_BridgeTransferOut;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message_BridgeTransferOut create() => Message_BridgeTransferOut._();
  @$core.override
  Message_BridgeTransferOut createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Message_BridgeTransferOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Message_BridgeTransferOut>(create);
  static Message_BridgeTransferOut? _defaultInstance;

  /// In most cases, `from_address` and `to_address` are equal.
  @$pb.TagNumber(1)
  $core.String get fromAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  Amount get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount(Amount value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
  @$pb.TagNumber(3)
  Amount ensureAmount() => $_ensure(2);

  /// Optional. Default `greenfield.bridge.MsgTransferOut`.
  @$pb.TagNumber(4)
  $core.String get typePrefix => $_getSZ(3);
  @$pb.TagNumber(4)
  set typePrefix($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTypePrefix() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypePrefix() => $_clearField(4);
}

enum Message_MessageOneof { sendCoinsMessage, bridgeTransferOut, notSet }

/// A transaction payload message
class Message extends $pb.GeneratedMessage {
  factory Message({
    Message_Send? sendCoinsMessage,
    Message_BridgeTransferOut? bridgeTransferOut,
  }) {
    final result = create();
    if (sendCoinsMessage != null) result.sendCoinsMessage = sendCoinsMessage;
    if (bridgeTransferOut != null) result.bridgeTransferOut = bridgeTransferOut;
    return result;
  }

  Message._();

  factory Message.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Message_MessageOneof>
      _Message_MessageOneofByTag = {
    1: Message_MessageOneof.sendCoinsMessage,
    2: Message_MessageOneof.bridgeTransferOut,
    0: Message_MessageOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Message_Send>(1, _omitFieldNames ? '' : 'sendCoinsMessage',
        subBuilder: Message_Send.create)
    ..aOM<Message_BridgeTransferOut>(
        2, _omitFieldNames ? '' : 'bridgeTransferOut',
        subBuilder: Message_BridgeTransferOut.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message copyWith(void Function(Message) updates) =>
      super.copyWith((message) => updates(message as Message)) as Message;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  @$core.override
  Message createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  Message_MessageOneof whichMessageOneof() =>
      _Message_MessageOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearMessageOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Message_Send get sendCoinsMessage => $_getN(0);
  @$pb.TagNumber(1)
  set sendCoinsMessage(Message_Send value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSendCoinsMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendCoinsMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  Message_Send ensureSendCoinsMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  Message_BridgeTransferOut get bridgeTransferOut => $_getN(1);
  @$pb.TagNumber(2)
  set bridgeTransferOut(Message_BridgeTransferOut value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBridgeTransferOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearBridgeTransferOut() => $_clearField(2);
  @$pb.TagNumber(2)
  Message_BridgeTransferOut ensureBridgeTransferOut() => $_ensure(1);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    EncodingMode? encodingMode,
    SigningMode? signingMode,
    $fixnum.Int64? accountNumber,
    $core.String? ethChainId,
    $core.String? cosmosChainId,
    Fee? fee,
    $core.String? memo,
    $fixnum.Int64? sequence,
    $core.List<$core.int>? privateKey,
    $core.Iterable<Message>? messages,
    BroadcastMode? mode,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (encodingMode != null) result.encodingMode = encodingMode;
    if (signingMode != null) result.signingMode = signingMode;
    if (accountNumber != null) result.accountNumber = accountNumber;
    if (ethChainId != null) result.ethChainId = ethChainId;
    if (cosmosChainId != null) result.cosmosChainId = cosmosChainId;
    if (fee != null) result.fee = fee;
    if (memo != null) result.memo = memo;
    if (sequence != null) result.sequence = sequence;
    if (privateKey != null) result.privateKey = privateKey;
    if (messages != null) result.messages.addAll(messages);
    if (mode != null) result.mode = mode;
    if (publicKey != null) result.publicKey = publicKey;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..aE<EncodingMode>(1, _omitFieldNames ? '' : 'encodingMode',
        enumValues: EncodingMode.values)
    ..aE<SigningMode>(2, _omitFieldNames ? '' : 'signingMode',
        enumValues: SigningMode.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'accountNumber', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'ethChainId')
    ..aOS(5, _omitFieldNames ? '' : 'cosmosChainId')
    ..aOM<Fee>(6, _omitFieldNames ? '' : 'fee', subBuilder: Fee.create)
    ..aOS(7, _omitFieldNames ? '' : 'memo')
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'sequence', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..pPM<Message>(10, _omitFieldNames ? '' : 'messages',
        subBuilder: Message.create)
    ..aE<BroadcastMode>(11, _omitFieldNames ? '' : 'mode',
        enumValues: BroadcastMode.values)
    ..a<$core.List<$core.int>>(
        12, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
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

  /// An encoding mode.
  @$pb.TagNumber(1)
  EncodingMode get encodingMode => $_getN(0);
  @$pb.TagNumber(1)
  set encodingMode(EncodingMode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEncodingMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncodingMode() => $_clearField(1);

  /// A signing mode.
  @$pb.TagNumber(2)
  SigningMode get signingMode => $_getN(1);
  @$pb.TagNumber(2)
  set signingMode(SigningMode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSigningMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearSigningMode() => $_clearField(2);

  /// Source account number
  @$pb.TagNumber(3)
  $fixnum.Int64 get accountNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set accountNumber($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccountNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountNumber() => $_clearField(3);

  /// ETH Chain ID (string).
  /// Must be set if `signing_mode` is Eip712.
  @$pb.TagNumber(4)
  $core.String get ethChainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set ethChainId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEthChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEthChainId() => $_clearField(4);

  /// Cosmos Chain ID (string)
  @$pb.TagNumber(5)
  $core.String get cosmosChainId => $_getSZ(4);
  @$pb.TagNumber(5)
  set cosmosChainId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCosmosChainId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCosmosChainId() => $_clearField(5);

  /// Transaction fee
  @$pb.TagNumber(6)
  Fee get fee => $_getN(5);
  @$pb.TagNumber(6)
  set fee(Fee value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearFee() => $_clearField(6);
  @$pb.TagNumber(6)
  Fee ensureFee() => $_ensure(5);

  /// Optional memo
  @$pb.TagNumber(7)
  $core.String get memo => $_getSZ(6);
  @$pb.TagNumber(7)
  set memo($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMemo() => $_has(6);
  @$pb.TagNumber(7)
  void clearMemo() => $_clearField(7);

  /// Sequence number (account specific)
  @$pb.TagNumber(8)
  $fixnum.Int64 get sequence => $_getI64(7);
  @$pb.TagNumber(8)
  set sequence($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSequence() => $_has(7);
  @$pb.TagNumber(8)
  void clearSequence() => $_clearField(8);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(9)
  $core.List<$core.int> get privateKey => $_getN(8);
  @$pb.TagNumber(9)
  set privateKey($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPrivateKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrivateKey() => $_clearField(9);

  /// Message payloads.
  @$pb.TagNumber(10)
  $pb.PbList<Message> get messages => $_getList(9);

  /// Broadcast mode (included in output, relevant when broadcasting)
  @$pb.TagNumber(11)
  BroadcastMode get mode => $_getN(10);
  @$pb.TagNumber(11)
  set mode(BroadcastMode value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasMode() => $_has(10);
  @$pb.TagNumber(11)
  void clearMode() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get publicKey => $_getN(11);
  @$pb.TagNumber(12)
  set publicKey($core.List<$core.int> value) => $_setBytes(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPublicKey() => $_has(11);
  @$pb.TagNumber(12)
  void clearPublicKey() => $_clearField(12);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? signature,
    $core.String? serialized,
    $core.String? signatureJson,
    $core.String? errorMessage,
    $0.SigningError? error,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (serialized != null) result.serialized = serialized;
    if (signatureJson != null) result.signatureJson = signatureJson;
    if (errorMessage != null) result.errorMessage = errorMessage;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Greenfield.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'serialized')
    ..aOS(3, _omitFieldNames ? '' : 'signatureJson')
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..aE<$0.SigningError>(5, _omitFieldNames ? '' : 'error',
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

  /// Signature
  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

  /// Signed transaction containing protobuf encoded, Base64-encoded form (Stargate case),
  /// wrapped in a ready-to-broadcast json.
  @$pb.TagNumber(2)
  $core.String get serialized => $_getSZ(1);
  @$pb.TagNumber(2)
  set serialized($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSerialized() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerialized() => $_clearField(2);

  /// signatures array json string
  @$pb.TagNumber(3)
  $core.String get signatureJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set signatureJson($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignatureJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignatureJson() => $_clearField(3);

  /// error description
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.SigningError get error => $_getN(4);
  @$pb.TagNumber(5)
  set error($0.SigningError value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
