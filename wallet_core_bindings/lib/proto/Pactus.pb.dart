//
//  Generated code. Do not modify.
//  source: Pactus.proto
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

enum TransactionMessage_Payload { transfer, bond, notSet }

class TransactionMessage extends $pb.GeneratedMessage {
  factory TransactionMessage({
    $core.int? lockTime,
    $fixnum.Int64? fee,
    $core.String? memo,
    TransferPayload? transfer,
    BondPayload? bond,
  }) {
    final $result = create();
    if (lockTime != null) {
      $result.lockTime = lockTime;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (memo != null) {
      $result.memo = memo;
    }
    if (transfer != null) {
      $result.transfer = transfer;
    }
    if (bond != null) {
      $result.bond = bond;
    }
    return $result;
  }
  TransactionMessage._() : super();
  factory TransactionMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransactionMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TransactionMessage_Payload>
      _TransactionMessage_PayloadByTag = {
    10: TransactionMessage_Payload.transfer,
    11: TransactionMessage_Payload.bond,
    0: TransactionMessage_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionMessage',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'lockTime', $pb.PbFieldType.OU3)
    ..aInt64(2, _omitFieldNames ? '' : 'fee')
    ..aOS(3, _omitFieldNames ? '' : 'memo')
    ..aOM<TransferPayload>(10, _omitFieldNames ? '' : 'transfer',
        subBuilder: TransferPayload.create)
    ..aOM<BondPayload>(11, _omitFieldNames ? '' : 'bond',
        subBuilder: BondPayload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransactionMessage clone() => TransactionMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransactionMessage copyWith(void Function(TransactionMessage) updates) =>
      super.copyWith((message) => updates(message as TransactionMessage))
          as TransactionMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionMessage create() => TransactionMessage._();
  TransactionMessage createEmptyInstance() => create();
  static $pb.PbList<TransactionMessage> createRepeated() =>
      $pb.PbList<TransactionMessage>();
  @$core.pragma('dart2js:noInline')
  static TransactionMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionMessage>(create);
  static TransactionMessage? _defaultInstance;

  TransactionMessage_Payload whichPayload() =>
      _TransactionMessage_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  /// The lock time for the transaction.
  @$pb.TagNumber(1)
  $core.int get lockTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set lockTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLockTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockTime() => clearField(1);

  /// The transaction fee in NanoPAC.
  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => clearField(2);

  /// A memo string for the transaction (optional).
  @$pb.TagNumber(3)
  $core.String get memo => $_getSZ(2);
  @$pb.TagNumber(3)
  set memo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemo() => clearField(3);

  @$pb.TagNumber(10)
  TransferPayload get transfer => $_getN(3);
  @$pb.TagNumber(10)
  set transfer(TransferPayload v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTransfer() => $_has(3);
  @$pb.TagNumber(10)
  void clearTransfer() => clearField(10);
  @$pb.TagNumber(10)
  TransferPayload ensureTransfer() => $_ensure(3);

  @$pb.TagNumber(11)
  BondPayload get bond => $_getN(4);
  @$pb.TagNumber(11)
  set bond(BondPayload v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBond() => $_has(4);
  @$pb.TagNumber(11)
  void clearBond() => clearField(11);
  @$pb.TagNumber(11)
  BondPayload ensureBond() => $_ensure(4);
}

/// Transfer payload for creating a Transfer transaction between two accounts.
class TransferPayload extends $pb.GeneratedMessage {
  factory TransferPayload({
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (sender != null) {
      $result.sender = sender;
    }
    if (receiver != null) {
      $result.receiver = receiver;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  TransferPayload._() : super();
  factory TransferPayload.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransferPayload.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferPayload',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransferPayload clone() => TransferPayload()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransferPayload copyWith(void Function(TransferPayload) updates) =>
      super.copyWith((message) => updates(message as TransferPayload))
          as TransferPayload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferPayload create() => TransferPayload._();
  TransferPayload createEmptyInstance() => create();
  static $pb.PbList<TransferPayload> createRepeated() =>
      $pb.PbList<TransferPayload>();
  @$core.pragma('dart2js:noInline')
  static TransferPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferPayload>(create);
  static TransferPayload? _defaultInstance;

  /// The sender's account address.
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  /// The receiver's account address.
  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  /// The amount to be transferred, specified in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

/// Bond payload for creating a Bond transaction from an account to a validator.
class BondPayload extends $pb.GeneratedMessage {
  factory BondPayload({
    $core.String? sender,
    $core.String? receiver,
    $fixnum.Int64? stake,
    $core.String? publicKey,
  }) {
    final $result = create();
    if (sender != null) {
      $result.sender = sender;
    }
    if (receiver != null) {
      $result.receiver = receiver;
    }
    if (stake != null) {
      $result.stake = stake;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    return $result;
  }
  BondPayload._() : super();
  factory BondPayload.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BondPayload.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BondPayload',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sender')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..aInt64(3, _omitFieldNames ? '' : 'stake')
    ..aOS(4, _omitFieldNames ? '' : 'publicKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BondPayload clone() => BondPayload()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BondPayload copyWith(void Function(BondPayload) updates) =>
      super.copyWith((message) => updates(message as BondPayload))
          as BondPayload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BondPayload create() => BondPayload._();
  BondPayload createEmptyInstance() => create();
  static $pb.PbList<BondPayload> createRepeated() => $pb.PbList<BondPayload>();
  @$core.pragma('dart2js:noInline')
  static BondPayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BondPayload>(create);
  static BondPayload? _defaultInstance;

  /// The sender's account address.
  @$pb.TagNumber(1)
  $core.String get sender => $_getSZ(0);
  @$pb.TagNumber(1)
  set sender($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  /// The receiver's validator address.
  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  /// The stake amount in NanoPAC.
  @$pb.TagNumber(3)
  $fixnum.Int64 get stake => $_getI64(2);
  @$pb.TagNumber(3)
  set stake($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStake() => $_has(2);
  @$pb.TagNumber(3)
  void clearStake() => clearField(3);

  /// The public key of the validator (only set when creating a new validator).
  @$pb.TagNumber(4)
  $core.String get publicKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicKey($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPublicKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicKey() => clearField(4);
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    TransactionMessage? transaction,
  }) {
    final $result = create();
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    if (transaction != null) {
      $result.transaction = transaction;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<TransactionMessage>(2, _omitFieldNames ? '' : 'transaction',
        subBuilder: TransactionMessage.create)
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

  @$pb.TagNumber(2)
  TransactionMessage get transaction => $_getN(1);
  @$pb.TagNumber(2)
  set transaction(TransactionMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransaction() => clearField(2);
  @$pb.TagNumber(2)
  TransactionMessage ensureTransaction() => $_ensure(1);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? transactionId,
    $core.List<$core.int>? signedTransactionData,
    $core.List<$core.int>? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    if (signedTransactionData != null) {
      $result.signedTransactionData = signedTransactionData;
    }
    if (signature != null) {
      $result.signature = signature;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Pactus.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'transactionId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signedTransactionData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..e<$0.SigningError>(4, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: $0.SigningError.OK,
        valueOf: $0.SigningError.valueOf,
        enumValues: $0.SigningError.values)
    ..aOS(5, _omitFieldNames ? '' : 'errorMessage')
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

  /// Transaction ID (Hash).
  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  /// Signed and encoded transaction bytes.
  @$pb.TagNumber(2)
  $core.List<$core.int> get signedTransactionData => $_getN(1);
  @$pb.TagNumber(2)
  set signedTransactionData($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSignedTransactionData() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignedTransactionData() => clearField(2);

  /// Signature the signed transaction.
  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => clearField(3);

  /// A possible error, `OK` if none.
  @$pb.TagNumber(4)
  $0.SigningError get error => $_getN(3);
  @$pb.TagNumber(4)
  set error($0.SigningError v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => clearField(4);

  /// Detailed error message, if any.
  @$pb.TagNumber(5)
  $core.String get errorMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set errorMessage($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasErrorMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearErrorMessage() => clearField(5);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
