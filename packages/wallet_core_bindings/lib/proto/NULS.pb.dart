// This is a generated file - do not edit.
//
// Generated from NULS.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Transaction from address
class TransactionCoinFrom extends $pb.GeneratedMessage {
  factory TransactionCoinFrom({
    $core.String? fromAddress,
    $core.int? assetsChainid,
    $core.int? assetsId,
    $core.List<$core.int>? idAmount,
    $core.List<$core.int>? nonce,
    $core.int? locked,
  }) {
    final result = create();
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (assetsChainid != null) result.assetsChainid = assetsChainid;
    if (assetsId != null) result.assetsId = assetsId;
    if (idAmount != null) result.idAmount = idAmount;
    if (nonce != null) result.nonce = nonce;
    if (locked != null) result.locked = locked;
    return result;
  }

  TransactionCoinFrom._();

  factory TransactionCoinFrom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionCoinFrom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionCoinFrom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NULS.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromAddress')
    ..aI(2, _omitFieldNames ? '' : 'assetsChainid',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'assetsId', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'idAmount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..aI(6, _omitFieldNames ? '' : 'locked', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionCoinFrom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionCoinFrom copyWith(void Function(TransactionCoinFrom) updates) =>
      super.copyWith((message) => updates(message as TransactionCoinFrom))
          as TransactionCoinFrom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionCoinFrom create() => TransactionCoinFrom._();
  @$core.override
  TransactionCoinFrom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionCoinFrom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionCoinFrom>(create);
  static TransactionCoinFrom? _defaultInstance;

  /// Source address
  @$pb.TagNumber(1)
  $core.String get fromAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => $_clearField(1);

  /// Chain ID
  @$pb.TagNumber(2)
  $core.int get assetsChainid => $_getIZ(1);
  @$pb.TagNumber(2)
  set assetsChainid($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAssetsChainid() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetsChainid() => $_clearField(2);

  /// ID of the asset
  @$pb.TagNumber(3)
  $core.int get assetsId => $_getIZ(2);
  @$pb.TagNumber(3)
  set assetsId($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAssetsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetsId() => $_clearField(3);

  /// transaction out amount (256-bit number)
  @$pb.TagNumber(4)
  $core.List<$core.int> get idAmount => $_getN(3);
  @$pb.TagNumber(4)
  set idAmount($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIdAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdAmount() => $_clearField(4);

  /// Nonce, 8 bytes
  @$pb.TagNumber(5)
  $core.List<$core.int> get nonce => $_getN(4);
  @$pb.TagNumber(5)
  set nonce($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonce() => $_clearField(5);

  /// lock status: 1 locked; 0 unlocked
  @$pb.TagNumber(6)
  $core.int get locked => $_getIZ(5);
  @$pb.TagNumber(6)
  set locked($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLocked() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocked() => $_clearField(6);
}

/// Transaction to a destination
class TransactionCoinTo extends $pb.GeneratedMessage {
  factory TransactionCoinTo({
    $core.String? toAddress,
    $core.int? assetsChainid,
    $core.int? assetsId,
    $core.List<$core.int>? idAmount,
    $core.int? lockTime,
  }) {
    final result = create();
    if (toAddress != null) result.toAddress = toAddress;
    if (assetsChainid != null) result.assetsChainid = assetsChainid;
    if (assetsId != null) result.assetsId = assetsId;
    if (idAmount != null) result.idAmount = idAmount;
    if (lockTime != null) result.lockTime = lockTime;
    return result;
  }

  TransactionCoinTo._();

  factory TransactionCoinTo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransactionCoinTo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransactionCoinTo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NULS.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toAddress')
    ..aI(2, _omitFieldNames ? '' : 'assetsChainid',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'assetsId', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'idAmount', $pb.PbFieldType.OY)
    ..aI(5, _omitFieldNames ? '' : 'lockTime', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionCoinTo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransactionCoinTo copyWith(void Function(TransactionCoinTo) updates) =>
      super.copyWith((message) => updates(message as TransactionCoinTo))
          as TransactionCoinTo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionCoinTo create() => TransactionCoinTo._();
  @$core.override
  TransactionCoinTo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransactionCoinTo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransactionCoinTo>(create);
  static TransactionCoinTo? _defaultInstance;

  /// destination address
  @$pb.TagNumber(1)
  $core.String get toAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set toAddress($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearToAddress() => $_clearField(1);

  /// Chain ID
  @$pb.TagNumber(2)
  $core.int get assetsChainid => $_getIZ(1);
  @$pb.TagNumber(2)
  set assetsChainid($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAssetsChainid() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetsChainid() => $_clearField(2);

  /// ID of the asset
  @$pb.TagNumber(3)
  $core.int get assetsId => $_getIZ(2);
  @$pb.TagNumber(3)
  set assetsId($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAssetsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetsId() => $_clearField(3);

  /// transaction amount (uint256, serialized big endian)
  @$pb.TagNumber(4)
  $core.List<$core.int> get idAmount => $_getN(3);
  @$pb.TagNumber(4)
  set idAmount($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIdAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdAmount() => $_clearField(4);

  /// lock time
  @$pb.TagNumber(5)
  $core.int get lockTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set lockTime($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLockTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLockTime() => $_clearField(5);
}

/// A signature
class Signature extends $pb.GeneratedMessage {
  factory Signature({
    $core.int? pkeyLen,
    $core.List<$core.int>? publicKey,
    $core.int? sigLen,
    $core.List<$core.int>? signature,
  }) {
    final result = create();
    if (pkeyLen != null) result.pkeyLen = pkeyLen;
    if (publicKey != null) result.publicKey = publicKey;
    if (sigLen != null) result.sigLen = sigLen;
    if (signature != null) result.signature = signature;
    return result;
  }

  Signature._();

  factory Signature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Signature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Signature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NULS.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pkeyLen', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aI(3, _omitFieldNames ? '' : 'sigLen', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Signature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Signature copyWith(void Function(Signature) updates) =>
      super.copyWith((message) => updates(message as Signature)) as Signature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Signature create() => Signature._();
  @$core.override
  Signature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Signature getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Signature>(create);
  static Signature? _defaultInstance;

  /// Length of public key data
  @$pb.TagNumber(1)
  $core.int get pkeyLen => $_getIZ(0);
  @$pb.TagNumber(1)
  set pkeyLen($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPkeyLen() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkeyLen() => $_clearField(1);

  /// The public key
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  /// The length of the signature
  @$pb.TagNumber(3)
  $core.int get sigLen => $_getIZ(2);
  @$pb.TagNumber(3)
  set sigLen($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSigLen() => $_has(2);
  @$pb.TagNumber(3)
  void clearSigLen() => $_clearField(3);

  /// The signature data
  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(3);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignature() => $_clearField(4);
}

/// A transaction
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.int? type,
    $core.int? timestamp,
    $core.String? remark,
    $core.List<$core.int>? txData,
    $core.Iterable<TransactionCoinFrom>? input,
    $core.Iterable<TransactionCoinTo>? output,
    Signature? txSigs,
    $core.int? hash,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (timestamp != null) result.timestamp = timestamp;
    if (remark != null) result.remark = remark;
    if (txData != null) result.txData = txData;
    if (input != null) result.input.addAll(input);
    if (output != null) result.output.addAll(output);
    if (txSigs != null) result.txSigs = txSigs;
    if (hash != null) result.hash = hash;
    return result;
  }

  Transaction._();

  factory Transaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NULS.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'timestamp', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'remark')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'txData', $pb.PbFieldType.OY)
    ..pPM<TransactionCoinFrom>(5, _omitFieldNames ? '' : 'input',
        subBuilder: TransactionCoinFrom.create)
    ..pPM<TransactionCoinTo>(6, _omitFieldNames ? '' : 'output',
        subBuilder: TransactionCoinTo.create)
    ..aOM<Signature>(7, _omitFieldNames ? '' : 'txSigs',
        subBuilder: Signature.create)
    ..aI(8, _omitFieldNames ? '' : 'hash', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction copyWith(void Function(Transaction) updates) =>
      super.copyWith((message) => updates(message as Transaction))
          as Transaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  @$core.override
  Transaction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  /// transaction type
  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// Timestamp of the transaction
  @$pb.TagNumber(2)
  $core.int get timestamp => $_getIZ(1);
  @$pb.TagNumber(2)
  set timestamp($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);

  /// Optional string remark
  @$pb.TagNumber(3)
  $core.String get remark => $_getSZ(2);
  @$pb.TagNumber(3)
  set remark($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemark() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemark() => $_clearField(3);

  /// The raw data
  @$pb.TagNumber(4)
  $core.List<$core.int> get txData => $_getN(3);
  @$pb.TagNumber(4)
  set txData($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTxData() => $_has(3);
  @$pb.TagNumber(4)
  void clearTxData() => $_clearField(4);

  /// CoinFrom
  @$pb.TagNumber(5)
  $pb.PbList<TransactionCoinFrom> get input => $_getList(4);

  /// CoinTo
  @$pb.TagNumber(6)
  $pb.PbList<TransactionCoinTo> get output => $_getList(5);

  /// Signature
  @$pb.TagNumber(7)
  Signature get txSigs => $_getN(6);
  @$pb.TagNumber(7)
  set txSigs(Signature value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTxSigs() => $_has(6);
  @$pb.TagNumber(7)
  void clearTxSigs() => $_clearField(7);
  @$pb.TagNumber(7)
  Signature ensureTxSigs() => $_ensure(6);

  /// Tx hash
  @$pb.TagNumber(8)
  $core.int get hash => $_getIZ(7);
  @$pb.TagNumber(8)
  set hash($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearHash() => $_clearField(8);
}

/// Input data necessary to create a signed order.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    $core.String? from,
    $core.String? to,
    $core.List<$core.int>? amount,
    $core.int? chainId,
    $core.int? idassetsId,
    $core.List<$core.int>? nonce,
    $core.String? remark,
    $core.List<$core.int>? balance,
    $core.int? timestamp,
    $core.String? feePayer,
    $core.List<$core.int>? feePayerNonce,
    $core.List<$core.int>? feePayerPrivateKey,
    $core.List<$core.int>? feePayerBalance,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    if (chainId != null) result.chainId = chainId;
    if (idassetsId != null) result.idassetsId = idassetsId;
    if (nonce != null) result.nonce = nonce;
    if (remark != null) result.remark = remark;
    if (balance != null) result.balance = balance;
    if (timestamp != null) result.timestamp = timestamp;
    if (feePayer != null) result.feePayer = feePayer;
    if (feePayerNonce != null) result.feePayerNonce = feePayerNonce;
    if (feePayerPrivateKey != null)
      result.feePayerPrivateKey = feePayerPrivateKey;
    if (feePayerBalance != null) result.feePayerBalance = feePayerBalance;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NULS.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'from')
    ..aOS(3, _omitFieldNames ? '' : 'to')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..aI(5, _omitFieldNames ? '' : 'chainId', fieldType: $pb.PbFieldType.OU3)
    ..aI(6, _omitFieldNames ? '' : 'idassetsId', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'remark')
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OY)
    ..aI(10, _omitFieldNames ? '' : 'timestamp', fieldType: $pb.PbFieldType.OU3)
    ..aOS(11, _omitFieldNames ? '' : 'feePayer')
    ..a<$core.List<$core.int>>(
        12, _omitFieldNames ? '' : 'feePayerNonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        13, _omitFieldNames ? '' : 'feePayerPrivateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        14, _omitFieldNames ? '' : 'feePayerBalance', $pb.PbFieldType.OY)
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

  /// Source address
  @$pb.TagNumber(2)
  $core.String get from => $_getSZ(1);
  @$pb.TagNumber(2)
  set from($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);

  /// Destination address
  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(3)
  set to($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => $_clearField(3);

  /// Transfer amount (uint256, serialized big endian)
  @$pb.TagNumber(4)
  $core.List<$core.int> get amount => $_getN(3);
  @$pb.TagNumber(4)
  set amount($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  /// Chain ID
  @$pb.TagNumber(5)
  $core.int get chainId => $_getIZ(4);
  @$pb.TagNumber(5)
  set chainId($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChainId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChainId() => $_clearField(5);

  /// Asset ID
  @$pb.TagNumber(6)
  $core.int get idassetsId => $_getIZ(5);
  @$pb.TagNumber(6)
  set idassetsId($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIdassetsId() => $_has(5);
  @$pb.TagNumber(6)
  void clearIdassetsId() => $_clearField(6);

  /// The last 8 bytes of latest transaction hash
  @$pb.TagNumber(7)
  $core.List<$core.int> get nonce => $_getN(6);
  @$pb.TagNumber(7)
  set nonce($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNonce() => $_has(6);
  @$pb.TagNumber(7)
  void clearNonce() => $_clearField(7);

  /// Optional memo remark
  @$pb.TagNumber(8)
  $core.String get remark => $_getSZ(7);
  @$pb.TagNumber(8)
  set remark($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRemark() => $_has(7);
  @$pb.TagNumber(8)
  void clearRemark() => $_clearField(8);

  /// Account balance
  @$pb.TagNumber(9)
  $core.List<$core.int> get balance => $_getN(8);
  @$pb.TagNumber(9)
  set balance($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasBalance() => $_has(8);
  @$pb.TagNumber(9)
  void clearBalance() => $_clearField(9);

  /// time, accurate to the second
  @$pb.TagNumber(10)
  $core.int get timestamp => $_getIZ(9);
  @$pb.TagNumber(10)
  set timestamp($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTimestamp() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimestamp() => $_clearField(10);

  /// external address paying fee, required for token transfer, optional for NULS transfer, depending on if an external fee payer is provided. If provided, it will be the fee paying address.
  @$pb.TagNumber(11)
  $core.String get feePayer => $_getSZ(10);
  @$pb.TagNumber(11)
  set feePayer($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasFeePayer() => $_has(10);
  @$pb.TagNumber(11)
  void clearFeePayer() => $_clearField(11);

  /// fee payer address nonce, required for token transfer, optional for NULS transfer, depending on if fee_payer is provided.
  @$pb.TagNumber(12)
  $core.List<$core.int> get feePayerNonce => $_getN(11);
  @$pb.TagNumber(12)
  set feePayerNonce($core.List<$core.int> value) => $_setBytes(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFeePayerNonce() => $_has(11);
  @$pb.TagNumber(12)
  void clearFeePayerNonce() => $_clearField(12);

  /// fee payer address private key, required for token transfer, optional for NULS transfer, depending on if fee_payer is provided.
  @$pb.TagNumber(13)
  $core.List<$core.int> get feePayerPrivateKey => $_getN(12);
  @$pb.TagNumber(13)
  set feePayerPrivateKey($core.List<$core.int> value) => $_setBytes(12, value);
  @$pb.TagNumber(13)
  $core.bool hasFeePayerPrivateKey() => $_has(12);
  @$pb.TagNumber(13)
  void clearFeePayerPrivateKey() => $_clearField(13);

  /// fee payer NULS balance, it is required for token transfer. optional for NULS transfer, depending on if fee_payer is provided.
  @$pb.TagNumber(14)
  $core.List<$core.int> get feePayerBalance => $_getN(13);
  @$pb.TagNumber(14)
  set feePayerBalance($core.List<$core.int> value) => $_setBytes(13, value);
  @$pb.TagNumber(14)
  $core.bool hasFeePayerBalance() => $_has(13);
  @$pb.TagNumber(14)
  void clearFeePayerBalance() => $_clearField(14);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NULS.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
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

  /// Encoded transaction
  @$pb.TagNumber(1)
  $core.List<$core.int> get encoded => $_getN(0);
  @$pb.TagNumber(1)
  set encoded($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);

  /// error code, 0 is ok, other codes will be treated as errors
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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
