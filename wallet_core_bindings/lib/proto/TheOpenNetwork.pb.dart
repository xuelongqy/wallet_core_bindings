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

enum Transfer_Payload { jettonTransfer, customPayload, notSet }

class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.String? dest,
    $fixnum.Int64? amount,
    $core.int? mode,
    $core.String? comment,
    $core.bool? bounceable,
    $core.String? stateInit,
    JettonTransfer? jettonTransfer,
    $core.String? customPayload,
  }) {
    final $result = create();
    if (dest != null) {
      $result.dest = dest;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (mode != null) {
      $result.mode = mode;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (bounceable != null) {
      $result.bounceable = bounceable;
    }
    if (stateInit != null) {
      $result.stateInit = stateInit;
    }
    if (jettonTransfer != null) {
      $result.jettonTransfer = jettonTransfer;
    }
    if (customPayload != null) {
      $result.customPayload = customPayload;
    }
    return $result;
  }
  Transfer._() : super();
  factory Transfer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Transfer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

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
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'mode', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..aOB(5, _omitFieldNames ? '' : 'bounceable')
    ..aOS(6, _omitFieldNames ? '' : 'stateInit')
    ..aOM<JettonTransfer>(7, _omitFieldNames ? '' : 'jettonTransfer',
        subBuilder: JettonTransfer.create)
    ..aOS(8, _omitFieldNames ? '' : 'customPayload')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Transfer clone() => Transfer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Transfer copyWith(void Function(Transfer) updates) =>
      super.copyWith((message) => updates(message as Transfer)) as Transfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  Transfer createEmptyInstance() => create();
  static $pb.PbList<Transfer> createRepeated() => $pb.PbList<Transfer>();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  Transfer_Payload whichPayload() => _Transfer_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  /// Recipient address
  @$pb.TagNumber(1)
  $core.String get dest => $_getSZ(0);
  @$pb.TagNumber(1)
  set dest($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDest() => $_has(0);
  @$pb.TagNumber(1)
  void clearDest() => clearField(1);

  /// Amount to send in nanotons
  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  /// Send mode (optional, 0 by default)
  /// Learn more: https://ton.org/docs/develop/func/stdlib#send_raw_message
  @$pb.TagNumber(3)
  $core.int get mode => $_getIZ(2);
  @$pb.TagNumber(3)
  set mode($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearMode() => clearField(3);

  /// Transfer comment message (optional, empty by default)
  /// Ignored if `custom_payload` is specified
  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  /// If the address is bounceable
  @$pb.TagNumber(5)
  $core.bool get bounceable => $_getBF(4);
  @$pb.TagNumber(5)
  set bounceable($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBounceable() => $_has(4);
  @$pb.TagNumber(5)
  void clearBounceable() => clearField(5);

  /// Optional raw one-cell BoC encoded in Base64.
  /// Can be used to deploy a smart contract.
  @$pb.TagNumber(6)
  $core.String get stateInit => $_getSZ(5);
  @$pb.TagNumber(6)
  set stateInit($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStateInit() => $_has(5);
  @$pb.TagNumber(6)
  void clearStateInit() => clearField(6);

  /// Jetton transfer payload.
  @$pb.TagNumber(7)
  JettonTransfer get jettonTransfer => $_getN(6);
  @$pb.TagNumber(7)
  set jettonTransfer(JettonTransfer v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasJettonTransfer() => $_has(6);
  @$pb.TagNumber(7)
  void clearJettonTransfer() => clearField(7);
  @$pb.TagNumber(7)
  JettonTransfer ensureJettonTransfer() => $_ensure(6);

  /// TON transfer with custom payload (contract call). Raw one-cell BoC encoded in Base64.
  @$pb.TagNumber(8)
  $core.String get customPayload => $_getSZ(7);
  @$pb.TagNumber(8)
  set customPayload($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCustomPayload() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustomPayload() => clearField(8);
}

class JettonTransfer extends $pb.GeneratedMessage {
  factory JettonTransfer({
    $fixnum.Int64? queryId,
    $fixnum.Int64? jettonAmount,
    $core.String? toOwner,
    $core.String? responseAddress,
    $fixnum.Int64? forwardAmount,
    $core.String? customPayload,
  }) {
    final $result = create();
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
    if (customPayload != null) {
      $result.customPayload = customPayload;
    }
    return $result;
  }
  JettonTransfer._() : super();
  factory JettonTransfer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JettonTransfer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JettonTransfer',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'queryId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'jettonAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'toOwner')
    ..aOS(4, _omitFieldNames ? '' : 'responseAddress')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'forwardAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'customPayload')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JettonTransfer clone() => JettonTransfer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JettonTransfer copyWith(void Function(JettonTransfer) updates) =>
      super.copyWith((message) => updates(message as JettonTransfer))
          as JettonTransfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JettonTransfer create() => JettonTransfer._();
  JettonTransfer createEmptyInstance() => create();
  static $pb.PbList<JettonTransfer> createRepeated() =>
      $pb.PbList<JettonTransfer>();
  @$core.pragma('dart2js:noInline')
  static JettonTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JettonTransfer>(create);
  static JettonTransfer? _defaultInstance;

  /// Arbitrary request number. Default is 0. Optional field.
  @$pb.TagNumber(1)
  $fixnum.Int64 get queryId => $_getI64(0);
  @$pb.TagNumber(1)
  set queryId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQueryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQueryId() => clearField(1);

  /// Amount of transferred jettons in elementary integer units. The real value transferred is jetton_amount multiplied by ten to the power of token decimal precision
  @$pb.TagNumber(2)
  $fixnum.Int64 get jettonAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set jettonAmount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJettonAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearJettonAmount() => clearField(2);

  /// Address of the new owner of the jettons.
  @$pb.TagNumber(3)
  $core.String get toOwner => $_getSZ(2);
  @$pb.TagNumber(3)
  set toOwner($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasToOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearToOwner() => clearField(3);

  /// Address where to send a response with confirmation of a successful transfer and the rest of the incoming message Toncoins. Usually the sender should get back their toncoins.
  @$pb.TagNumber(4)
  $core.String get responseAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set responseAddress($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResponseAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearResponseAddress() => clearField(4);

  /// Amount in nanotons to forward to recipient. Basically minimum amount - 1 nanoton should be used
  @$pb.TagNumber(5)
  $fixnum.Int64 get forwardAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set forwardAmount($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasForwardAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearForwardAmount() => clearField(5);

  /// Optional raw one-cell BoC encoded in Base64.
  /// Can be used in the case of mintless jetton transfers.
  @$pb.TagNumber(6)
  $core.String get customPayload => $_getSZ(5);
  @$pb.TagNumber(6)
  set customPayload($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCustomPayload() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomPayload() => clearField(6);
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
    final $result = create();
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (sequenceNumber != null) {
      $result.sequenceNumber = sequenceNumber;
    }
    if (expireAt != null) {
      $result.expireAt = expireAt;
    }
    if (walletVersion != null) {
      $result.walletVersion = walletVersion;
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
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..pc<Transfer>(3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM,
        subBuilder: Transfer.create)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'sequenceNumber', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'expireAt', $pb.PbFieldType.OU3)
    ..e<WalletVersion>(
        6, _omitFieldNames ? '' : 'walletVersion', $pb.PbFieldType.OE,
        defaultOrMaker: WalletVersion.WALLET_V3_R1,
        valueOf: WalletVersion.valueOf,
        enumValues: WalletVersion.values)
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

  /// The secret private key used for signing (32 bytes).
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

  /// Public key of the signer (32 bytes). Used when transaction is going to be signed externally.
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

  /// Up to 4 internal messages.
  @$pb.TagNumber(3)
  $core.List<Transfer> get messages => $_getList(2);

  /// Message counter (optional, 0 by default used for the first deploy)
  /// This field is required, because we need to protect the smart contract against "replay attacks"
  /// Learn more: https://ton.org/docs/develop/smart-contracts/guidelines/external-messages
  @$pb.TagNumber(4)
  $core.int get sequenceNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set sequenceNumber($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSequenceNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequenceNumber() => clearField(4);

  /// Expiration UNIX timestamp (optional, now() + 60 by default)
  @$pb.TagNumber(5)
  $core.int get expireAt => $_getIZ(4);
  @$pb.TagNumber(5)
  set expireAt($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExpireAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireAt() => clearField(5);

  /// Wallet version
  @$pb.TagNumber(6)
  WalletVersion get walletVersion => $_getN(5);
  @$pb.TagNumber(6)
  set walletVersion(WalletVersion v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWalletVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearWalletVersion() => clearField(6);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? encoded,
    $core.List<$core.int>? hash,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (encoded != null) {
      $result.encoded = encoded;
    }
    if (hash != null) {
      $result.hash = hash;
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
  factory SigningOutput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SigningOutput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.TheOpenNetwork.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'encoded')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..e<$0.SigningError>(3, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: $0.SigningError.OK,
        valueOf: $0.SigningError.valueOf,
        enumValues: $0.SigningError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
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

  /// Signed and base64 encoded BOC message
  @$pb.TagNumber(1)
  $core.String get encoded => $_getSZ(0);
  @$pb.TagNumber(1)
  set encoded($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => clearField(1);

  /// Transaction Cell hash
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

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);

  /// error code description
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
