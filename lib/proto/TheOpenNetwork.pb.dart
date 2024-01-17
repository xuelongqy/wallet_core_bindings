//
//  Generated code. Do not modify.
//  source: TheOpenNetwork.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $0;
import 'TheOpenNetwork.pbenum.dart';

export 'TheOpenNetwork.pbenum.dart';

class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    WalletVersion? walletVersion,
    $core.String? dest,
    $fixnum.Int64? amount,
    $core.int? sequenceNumber,
    $core.int? mode,
    $core.int? expireAt,
    $core.String? comment,
    $core.bool? bounceable,
  }) {
    final $result = create();
    if (walletVersion != null) {
      $result.walletVersion = walletVersion;
    }
    if (dest != null) {
      $result.dest = dest;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (sequenceNumber != null) {
      $result.sequenceNumber = sequenceNumber;
    }
    if (mode != null) {
      $result.mode = mode;
    }
    if (expireAt != null) {
      $result.expireAt = expireAt;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (bounceable != null) {
      $result.bounceable = bounceable;
    }
    return $result;
  }
  Transfer._() : super();
  factory Transfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transfer', package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'), createEmptyInstance: create)
    ..e<WalletVersion>(1, _omitFieldNames ? '' : 'walletVersion', $pb.PbFieldType.OE, defaultOrMaker: WalletVersion.WALLET_V3_R1, valueOf: WalletVersion.valueOf, enumValues: WalletVersion.values)
    ..aOS(2, _omitFieldNames ? '' : 'dest')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'sequenceNumber', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'mode', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'expireAt', $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : 'comment')
    ..aOB(8, _omitFieldNames ? '' : 'bounceable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transfer clone() => Transfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transfer copyWith(void Function(Transfer) updates) => super.copyWith((message) => updates(message as Transfer)) as Transfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  Transfer createEmptyInstance() => create();
  static $pb.PbList<Transfer> createRepeated() => $pb.PbList<Transfer>();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  /// Wallet version
  @$pb.TagNumber(1)
  WalletVersion get walletVersion => $_getN(0);
  @$pb.TagNumber(1)
  set walletVersion(WalletVersion v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWalletVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearWalletVersion() => clearField(1);

  /// Recipient address
  @$pb.TagNumber(2)
  $core.String get dest => $_getSZ(1);
  @$pb.TagNumber(2)
  set dest($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDest() => $_has(1);
  @$pb.TagNumber(2)
  void clearDest() => clearField(2);

  /// Amount to send in nanotons
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  /// Message counter (optional, 0 by default used for the first deploy)
  /// This field is required, because we need to protect the smart contract against "replay attacks"
  /// Learn more: https://ton.org/docs/develop/smart-contracts/guidelines/external-messages
  @$pb.TagNumber(4)
  $core.int get sequenceNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set sequenceNumber($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSequenceNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequenceNumber() => clearField(4);

  /// Send mode (optional, 0 by default)
  /// Learn more: https://ton.org/docs/develop/func/stdlib#send_raw_message
  @$pb.TagNumber(5)
  $core.int get mode => $_getIZ(4);
  @$pb.TagNumber(5)
  set mode($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearMode() => clearField(5);

  /// Expiration UNIX timestamp (optional, now() + 60 by default)
  @$pb.TagNumber(6)
  $core.int get expireAt => $_getIZ(5);
  @$pb.TagNumber(6)
  set expireAt($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpireAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpireAt() => clearField(6);

  /// Transfer comment message (optional, empty by default)
  @$pb.TagNumber(7)
  $core.String get comment => $_getSZ(6);
  @$pb.TagNumber(7)
  set comment($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasComment() => $_has(6);
  @$pb.TagNumber(7)
  void clearComment() => clearField(7);

  /// If the address is bounceable
  @$pb.TagNumber(8)
  $core.bool get bounceable => $_getBF(7);
  @$pb.TagNumber(8)
  set bounceable($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBounceable() => $_has(7);
  @$pb.TagNumber(8)
  void clearBounceable() => clearField(8);
}

class JettonTransfer extends $pb.GeneratedMessage {
  factory JettonTransfer({
    Transfer? transfer,
    $fixnum.Int64? queryId,
    $fixnum.Int64? jettonAmount,
    $core.String? toOwner,
    $core.String? responseAddress,
    $fixnum.Int64? forwardAmount,
  }) {
    final $result = create();
    if (transfer != null) {
      $result.transfer = transfer;
    }
    if (queryId != null) {
      $result.queryId = queryId;
    }
    if (jettonAmount != null) {
      $result.jettonAmount = jettonAmount;
    }
    if (toOwner != null) {
      $result.toOwner = toOwner;
    }
    if (responseAddress != null) {
      $result.responseAddress = responseAddress;
    }
    if (forwardAmount != null) {
      $result.forwardAmount = forwardAmount;
    }
    return $result;
  }
  JettonTransfer._() : super();
  factory JettonTransfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JettonTransfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JettonTransfer', package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'), createEmptyInstance: create)
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer', subBuilder: Transfer.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'queryId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'jettonAmount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'toOwner')
    ..aOS(5, _omitFieldNames ? '' : 'responseAddress')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'forwardAmount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JettonTransfer clone() => JettonTransfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JettonTransfer copyWith(void Function(JettonTransfer) updates) => super.copyWith((message) => updates(message as JettonTransfer)) as JettonTransfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JettonTransfer create() => JettonTransfer._();
  JettonTransfer createEmptyInstance() => create();
  static $pb.PbList<JettonTransfer> createRepeated() => $pb.PbList<JettonTransfer>();
  @$core.pragma('dart2js:noInline')
  static JettonTransfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JettonTransfer>(create);
  static JettonTransfer? _defaultInstance;

  /// Dest in Transfer means contract address of sender's jetton wallet.
  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);

  /// Arbitrary request number. Deafult is 0. Optional field.
  @$pb.TagNumber(2)
  $fixnum.Int64 get queryId => $_getI64(1);
  @$pb.TagNumber(2)
  set queryId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQueryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQueryId() => clearField(2);

  /// Amount of transferred jettons in elementary integer units. The real value transferred is jetton_amount multiplied by ten to the power of token decimal precision
  @$pb.TagNumber(3)
  $fixnum.Int64 get jettonAmount => $_getI64(2);
  @$pb.TagNumber(3)
  set jettonAmount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasJettonAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearJettonAmount() => clearField(3);

  /// Address of the new owner of the jettons.
  @$pb.TagNumber(4)
  $core.String get toOwner => $_getSZ(3);
  @$pb.TagNumber(4)
  set toOwner($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToOwner() => $_has(3);
  @$pb.TagNumber(4)
  void clearToOwner() => clearField(4);

  /// Address where to send a response with confirmation of a successful transfer and the rest of the incoming message Toncoins. Usually the sender should get back their toncoins.
  @$pb.TagNumber(5)
  $core.String get responseAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set responseAddress($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasResponseAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseAddress() => clearField(5);

  /// Amount in nanotons to forward to recipient. Basically minimum amount - 1 nanoton should be used
  @$pb.TagNumber(6)
  $fixnum.Int64 get forwardAmount => $_getI64(5);
  @$pb.TagNumber(6)
  set forwardAmount($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasForwardAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearForwardAmount() => clearField(6);
}

enum SigningInput_ActionOneof {
  transfer, 
  jettonTransfer, 
  notSet
}

class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    Transfer? transfer,
    JettonTransfer? jettonTransfer,
  }) {
    final $result = create();
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    if (transfer != null) {
      $result.transfer = transfer;
    }
    if (jettonTransfer != null) {
      $result.jettonTransfer = jettonTransfer;
    }
    return $result;
  }
  SigningInput._() : super();
  factory SigningInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SigningInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SigningInput_ActionOneof> _SigningInput_ActionOneofByTag = {
    2 : SigningInput_ActionOneof.transfer,
    3 : SigningInput_ActionOneof.jettonTransfer,
    0 : SigningInput_ActionOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SigningInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<Transfer>(2, _omitFieldNames ? '' : 'transfer', subBuilder: Transfer.create)
    ..aOM<JettonTransfer>(3, _omitFieldNames ? '' : 'jettonTransfer', subBuilder: JettonTransfer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SigningInput clone() => SigningInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SigningInput copyWith(void Function(SigningInput) updates) => super.copyWith((message) => updates(message as SigningInput)) as SigningInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningInput create() => SigningInput._();
  SigningInput createEmptyInstance() => create();
  static $pb.PbList<SigningInput> createRepeated() => $pb.PbList<SigningInput>();
  @$core.pragma('dart2js:noInline')
  static SigningInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SigningInput>(create);
  static SigningInput? _defaultInstance;

  SigningInput_ActionOneof whichActionOneof() => _SigningInput_ActionOneofByTag[$_whichOneof(0)]!;
  void clearActionOneof() => clearField($_whichOneof(0));

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(2)
  Transfer get transfer => $_getN(1);
  @$pb.TagNumber(2)
  set transfer(Transfer v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransfer() => clearField(2);
  @$pb.TagNumber(2)
  Transfer ensureTransfer() => $_ensure(1);

  @$pb.TagNumber(3)
  JettonTransfer get jettonTransfer => $_getN(2);
  @$pb.TagNumber(3)
  set jettonTransfer(JettonTransfer v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasJettonTransfer() => $_has(2);
  @$pb.TagNumber(3)
  void clearJettonTransfer() => clearField(3);
  @$pb.TagNumber(3)
  JettonTransfer ensureJettonTransfer() => $_ensure(2);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? encoded,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (encoded != null) {
      $result.encoded = encoded;
    }
    if (error != null) {
      $result.error = error;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    return $result;
  }
  SigningOutput._() : super();
  factory SigningOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SigningOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SigningOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'encoded')
    ..e<$0.SigningError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: $0.SigningError.OK, valueOf: $0.SigningError.valueOf, enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SigningOutput clone() => SigningOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SigningOutput copyWith(void Function(SigningOutput) updates) => super.copyWith((message) => updates(message as SigningOutput)) as SigningOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningOutput create() => SigningOutput._();
  SigningOutput createEmptyInstance() => create();
  static $pb.PbList<SigningOutput> createRepeated() => $pb.PbList<SigningOutput>();
  @$core.pragma('dart2js:noInline')
  static SigningOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SigningOutput>(create);
  static SigningOutput? _defaultInstance;

  /// Signed and base64 encoded BOC message
  @$pb.TagNumber(1)
  $core.String get encoded => $_getSZ(0);
  @$pb.TagNumber(1)
  set encoded($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => clearField(1);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(2)
  $0.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.SigningError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  /// error code description
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
