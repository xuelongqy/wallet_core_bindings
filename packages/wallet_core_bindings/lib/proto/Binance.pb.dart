// This is a generated file - do not edit.
//
// Generated from Binance.proto.

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

/// Transaction structure, used internally
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.Iterable<$core.List<$core.int>>? msgs,
    $core.Iterable<$core.List<$core.int>>? signatures,
    $core.String? memo,
    $fixnum.Int64? source,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (msgs != null) result.msgs.addAll(msgs);
    if (signatures != null) result.signatures.addAll(signatures);
    if (memo != null) result.memo = memo;
    if (source != null) result.source = source;
    if (data != null) result.data = data;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'msgs', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signatures', $pb.PbFieldType.PY)
    ..aOS(3, _omitFieldNames ? '' : 'memo')
    ..aInt64(4, _omitFieldNames ? '' : 'source')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
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

  /// array of size 1, containing the transaction message, which are one of the transaction type below
  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get msgs => $_getList(0);

  /// array of size 1, containing the standard signature structure of the transaction sender
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get signatures => $_getList(1);

  /// a short sentence of remark for the transaction, only for `Transfer` transactions.
  @$pb.TagNumber(3)
  $core.String get memo => $_getSZ(2);
  @$pb.TagNumber(3)
  set memo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemo() => $_clearField(3);

  /// an identifier for tools triggering this transaction, set to zero if unwilling to disclose.
  @$pb.TagNumber(4)
  $fixnum.Int64 get source => $_getI64(3);
  @$pb.TagNumber(4)
  set source($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => $_clearField(4);

  /// reserved for future use
  @$pb.TagNumber(5)
  $core.List<$core.int> get data => $_getN(4);
  @$pb.TagNumber(5)
  set data($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => $_clearField(5);
}

/// Signature structure, used internally
class Signature extends $pb.GeneratedMessage {
  factory Signature({
    $core.List<$core.int>? pubKey,
    $core.List<$core.int>? signature,
    $fixnum.Int64? accountNumber,
    $fixnum.Int64? sequence,
  }) {
    final result = create();
    if (pubKey != null) result.pubKey = pubKey;
    if (signature != null) result.signature = signature;
    if (accountNumber != null) result.accountNumber = accountNumber;
    if (sequence != null) result.sequence = sequence;
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'pubKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aInt64(3, _omitFieldNames ? '' : 'accountNumber')
    ..aInt64(4, _omitFieldNames ? '' : 'sequence')
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

  /// public key bytes of the signer address
  @$pb.TagNumber(1)
  $core.List<$core.int> get pubKey => $_getN(0);
  @$pb.TagNumber(1)
  set pubKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPubKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPubKey() => $_clearField(1);

  /// signature bytes, please check chain access section for signature generation
  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => $_clearField(2);

  /// another identifier of signer, which can be read from chain by account REST API or RPC
  @$pb.TagNumber(3)
  $fixnum.Int64 get accountNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set accountNumber($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccountNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountNumber() => $_clearField(3);

  /// sequence number for the next transaction
  @$pb.TagNumber(4)
  $fixnum.Int64 get sequence => $_getI64(3);
  @$pb.TagNumber(4)
  set sequence($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequence() => $_clearField(4);
}

/// Message for Trade order
class TradeOrder extends $pb.GeneratedMessage {
  factory TradeOrder({
    $core.List<$core.int>? sender,
    $core.String? id,
    $core.String? symbol,
    $fixnum.Int64? ordertype,
    $fixnum.Int64? side,
    $fixnum.Int64? price,
    $fixnum.Int64? quantity,
    $fixnum.Int64? timeinforce,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (id != null) result.id = id;
    if (symbol != null) result.symbol = symbol;
    if (ordertype != null) result.ordertype = ordertype;
    if (side != null) result.side = side;
    if (price != null) result.price = price;
    if (quantity != null) result.quantity = quantity;
    if (timeinforce != null) result.timeinforce = timeinforce;
    return result;
  }

  TradeOrder._();

  factory TradeOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TradeOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TradeOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'sender', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'symbol')
    ..aInt64(4, _omitFieldNames ? '' : 'ordertype')
    ..aInt64(5, _omitFieldNames ? '' : 'side')
    ..aInt64(6, _omitFieldNames ? '' : 'price')
    ..aInt64(7, _omitFieldNames ? '' : 'quantity')
    ..aInt64(8, _omitFieldNames ? '' : 'timeinforce')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TradeOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TradeOrder copyWith(void Function(TradeOrder) updates) =>
      super.copyWith((message) => updates(message as TradeOrder)) as TradeOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TradeOrder create() => TradeOrder._();
  @$core.override
  TradeOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TradeOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TradeOrder>(create);
  static TradeOrder? _defaultInstance;

  /// originating address
  @$pb.TagNumber(1)
  $core.List<$core.int> get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);

  /// order id, optional
  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  /// symbol for trading pair in full name of the tokens
  @$pb.TagNumber(3)
  $core.String get symbol => $_getSZ(2);
  @$pb.TagNumber(3)
  set symbol($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSymbol() => $_has(2);
  @$pb.TagNumber(3)
  void clearSymbol() => $_clearField(3);

  /// only accept 2 for now, meaning limit order
  @$pb.TagNumber(4)
  $fixnum.Int64 get ordertype => $_getI64(3);
  @$pb.TagNumber(4)
  set ordertype($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOrdertype() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrdertype() => $_clearField(4);

  /// 1 for buy and 2 for sell
  @$pb.TagNumber(5)
  $fixnum.Int64 get side => $_getI64(4);
  @$pb.TagNumber(5)
  set side($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSide() => $_has(4);
  @$pb.TagNumber(5)
  void clearSide() => $_clearField(5);

  /// price of the order, which is the real price multiplied by 1e8 (10^8) and rounded to integer
  @$pb.TagNumber(6)
  $fixnum.Int64 get price => $_getI64(5);
  @$pb.TagNumber(6)
  set price($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => $_clearField(6);

  /// quantity of the order, which is the real price multiplied by 1e8 (10^8) and rounded to integer
  @$pb.TagNumber(7)
  $fixnum.Int64 get quantity => $_getI64(6);
  @$pb.TagNumber(7)
  set quantity($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasQuantity() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuantity() => $_clearField(7);

  /// 1 for Good Till Expire(GTE) order and 3 for Immediate Or Cancel (IOC)
  @$pb.TagNumber(8)
  $fixnum.Int64 get timeinforce => $_getI64(7);
  @$pb.TagNumber(8)
  set timeinforce($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTimeinforce() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimeinforce() => $_clearField(8);
}

/// Message for CancelTrade order
class CancelTradeOrder extends $pb.GeneratedMessage {
  factory CancelTradeOrder({
    $core.List<$core.int>? sender,
    $core.String? symbol,
    $core.String? refid,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (symbol != null) result.symbol = symbol;
    if (refid != null) result.refid = refid;
    return result;
  }

  CancelTradeOrder._();

  factory CancelTradeOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelTradeOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelTradeOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'sender', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aOS(3, _omitFieldNames ? '' : 'refid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTradeOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelTradeOrder copyWith(void Function(CancelTradeOrder) updates) =>
      super.copyWith((message) => updates(message as CancelTradeOrder))
          as CancelTradeOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelTradeOrder create() => CancelTradeOrder._();
  @$core.override
  CancelTradeOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelTradeOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelTradeOrder>(create);
  static CancelTradeOrder? _defaultInstance;

  /// originating address
  @$pb.TagNumber(1)
  $core.List<$core.int> get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);

  /// symbol for trading pair in full name of the tokens
  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  /// order id to cancel
  @$pb.TagNumber(3)
  $core.String get refid => $_getSZ(2);
  @$pb.TagNumber(3)
  set refid($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRefid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefid() => $_clearField(3);
}

/// A token amount, symbol-amount pair.  Could be moved out of SendOrder; kept here for backward compatibility.
class SendOrder_Token extends $pb.GeneratedMessage {
  factory SendOrder_Token({
    $core.String? denom,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (denom != null) result.denom = denom;
    if (amount != null) result.amount = amount;
    return result;
  }

  SendOrder_Token._();

  factory SendOrder_Token.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendOrder_Token.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendOrder.Token',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'denom')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder_Token clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder_Token copyWith(void Function(SendOrder_Token) updates) =>
      super.copyWith((message) => updates(message as SendOrder_Token))
          as SendOrder_Token;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendOrder_Token create() => SendOrder_Token._();
  @$core.override
  SendOrder_Token createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendOrder_Token getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendOrder_Token>(create);
  static SendOrder_Token? _defaultInstance;

  /// Token ID
  @$pb.TagNumber(1)
  $core.String get denom => $_getSZ(0);
  @$pb.TagNumber(1)
  set denom($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearDenom() => $_clearField(1);

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

/// Transaction input
class SendOrder_Input extends $pb.GeneratedMessage {
  factory SendOrder_Input({
    $core.List<$core.int>? address,
    $core.Iterable<SendOrder_Token>? coins,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (coins != null) result.coins.addAll(coins);
    return result;
  }

  SendOrder_Input._();

  factory SendOrder_Input.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendOrder_Input.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendOrder.Input',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..pPM<SendOrder_Token>(2, _omitFieldNames ? '' : 'coins',
        subBuilder: SendOrder_Token.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder_Input clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder_Input copyWith(void Function(SendOrder_Input) updates) =>
      super.copyWith((message) => updates(message as SendOrder_Input))
          as SendOrder_Input;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendOrder_Input create() => SendOrder_Input._();
  @$core.override
  SendOrder_Input createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendOrder_Input getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendOrder_Input>(create);
  static SendOrder_Input? _defaultInstance;

  /// source address
  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// input coin amounts
  @$pb.TagNumber(2)
  $pb.PbList<SendOrder_Token> get coins => $_getList(1);
}

/// Transaction output
class SendOrder_Output extends $pb.GeneratedMessage {
  factory SendOrder_Output({
    $core.List<$core.int>? address,
    $core.Iterable<SendOrder_Token>? coins,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (coins != null) result.coins.addAll(coins);
    return result;
  }

  SendOrder_Output._();

  factory SendOrder_Output.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendOrder_Output.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendOrder.Output',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'address', $pb.PbFieldType.OY)
    ..pPM<SendOrder_Token>(2, _omitFieldNames ? '' : 'coins',
        subBuilder: SendOrder_Token.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder_Output clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder_Output copyWith(void Function(SendOrder_Output) updates) =>
      super.copyWith((message) => updates(message as SendOrder_Output))
          as SendOrder_Output;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendOrder_Output create() => SendOrder_Output._();
  @$core.override
  SendOrder_Output createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendOrder_Output getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendOrder_Output>(create);
  static SendOrder_Output? _defaultInstance;

  /// destination address
  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// output coin amounts
  @$pb.TagNumber(2)
  $pb.PbList<SendOrder_Token> get coins => $_getList(1);
}

/// Message for Send order
class SendOrder extends $pb.GeneratedMessage {
  factory SendOrder({
    $core.Iterable<SendOrder_Input>? inputs,
    $core.Iterable<SendOrder_Output>? outputs,
  }) {
    final result = create();
    if (inputs != null) result.inputs.addAll(inputs);
    if (outputs != null) result.outputs.addAll(outputs);
    return result;
  }

  SendOrder._();

  factory SendOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..pPM<SendOrder_Input>(1, _omitFieldNames ? '' : 'inputs',
        subBuilder: SendOrder_Input.create)
    ..pPM<SendOrder_Output>(2, _omitFieldNames ? '' : 'outputs',
        subBuilder: SendOrder_Output.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendOrder copyWith(void Function(SendOrder) updates) =>
      super.copyWith((message) => updates(message as SendOrder)) as SendOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendOrder create() => SendOrder._();
  @$core.override
  SendOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendOrder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendOrder>(create);
  static SendOrder? _defaultInstance;

  /// Send inputs
  @$pb.TagNumber(1)
  $pb.PbList<SendOrder_Input> get inputs => $_getList(0);

  /// Send outputs
  @$pb.TagNumber(2)
  $pb.PbList<SendOrder_Output> get outputs => $_getList(1);
}

/// Message for TokenIssue order
class TokenIssueOrder extends $pb.GeneratedMessage {
  factory TokenIssueOrder({
    $core.List<$core.int>? from,
    $core.String? name,
    $core.String? symbol,
    $fixnum.Int64? totalSupply,
    $core.bool? mintable,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (name != null) result.name = name;
    if (symbol != null) result.symbol = symbol;
    if (totalSupply != null) result.totalSupply = totalSupply;
    if (mintable != null) result.mintable = mintable;
    return result;
  }

  TokenIssueOrder._();

  factory TokenIssueOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenIssueOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenIssueOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'symbol')
    ..aInt64(4, _omitFieldNames ? '' : 'totalSupply')
    ..aOB(5, _omitFieldNames ? '' : 'mintable')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenIssueOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenIssueOrder copyWith(void Function(TokenIssueOrder) updates) =>
      super.copyWith((message) => updates(message as TokenIssueOrder))
          as TokenIssueOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenIssueOrder create() => TokenIssueOrder._();
  @$core.override
  TokenIssueOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenIssueOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenIssueOrder>(create);
  static TokenIssueOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// token name
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// token symbol, in full name with "-" suffix
  @$pb.TagNumber(3)
  $core.String get symbol => $_getSZ(2);
  @$pb.TagNumber(3)
  set symbol($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSymbol() => $_has(2);
  @$pb.TagNumber(3)
  void clearSymbol() => $_clearField(3);

  /// total supply
  @$pb.TagNumber(4)
  $fixnum.Int64 get totalSupply => $_getI64(3);
  @$pb.TagNumber(4)
  set totalSupply($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalSupply() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalSupply() => $_clearField(4);

  /// mintable
  @$pb.TagNumber(5)
  $core.bool get mintable => $_getBF(4);
  @$pb.TagNumber(5)
  set mintable($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMintable() => $_has(4);
  @$pb.TagNumber(5)
  void clearMintable() => $_clearField(5);
}

/// Message for TokenMint order
class TokenMintOrder extends $pb.GeneratedMessage {
  factory TokenMintOrder({
    $core.List<$core.int>? from,
    $core.String? symbol,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (symbol != null) result.symbol = symbol;
    if (amount != null) result.amount = amount;
    return result;
  }

  TokenMintOrder._();

  factory TokenMintOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenMintOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenMintOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenMintOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenMintOrder copyWith(void Function(TokenMintOrder) updates) =>
      super.copyWith((message) => updates(message as TokenMintOrder))
          as TokenMintOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenMintOrder create() => TokenMintOrder._();
  @$core.override
  TokenMintOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenMintOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenMintOrder>(create);
  static TokenMintOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// token symbol, in full name with "-" suffix
  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  /// amount to mint
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Message for TokenBurn order
class TokenBurnOrder extends $pb.GeneratedMessage {
  factory TokenBurnOrder({
    $core.List<$core.int>? from,
    $core.String? symbol,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (symbol != null) result.symbol = symbol;
    if (amount != null) result.amount = amount;
    return result;
  }

  TokenBurnOrder._();

  factory TokenBurnOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenBurnOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenBurnOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenBurnOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenBurnOrder copyWith(void Function(TokenBurnOrder) updates) =>
      super.copyWith((message) => updates(message as TokenBurnOrder))
          as TokenBurnOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenBurnOrder create() => TokenBurnOrder._();
  @$core.override
  TokenBurnOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenBurnOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenBurnOrder>(create);
  static TokenBurnOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// token symbol, in full name with "-" suffix
  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  /// amount to burn
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Message for TokenFreeze order
class TokenFreezeOrder extends $pb.GeneratedMessage {
  factory TokenFreezeOrder({
    $core.List<$core.int>? from,
    $core.String? symbol,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (symbol != null) result.symbol = symbol;
    if (amount != null) result.amount = amount;
    return result;
  }

  TokenFreezeOrder._();

  factory TokenFreezeOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenFreezeOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenFreezeOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenFreezeOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenFreezeOrder copyWith(void Function(TokenFreezeOrder) updates) =>
      super.copyWith((message) => updates(message as TokenFreezeOrder))
          as TokenFreezeOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenFreezeOrder create() => TokenFreezeOrder._();
  @$core.override
  TokenFreezeOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenFreezeOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenFreezeOrder>(create);
  static TokenFreezeOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// token symbol, in full name with "-" suffix
  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  /// amount of token to freeze
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Message for TokenUnfreeze order
class TokenUnfreezeOrder extends $pb.GeneratedMessage {
  factory TokenUnfreezeOrder({
    $core.List<$core.int>? from,
    $core.String? symbol,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (symbol != null) result.symbol = symbol;
    if (amount != null) result.amount = amount;
    return result;
  }

  TokenUnfreezeOrder._();

  factory TokenUnfreezeOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenUnfreezeOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenUnfreezeOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenUnfreezeOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenUnfreezeOrder copyWith(void Function(TokenUnfreezeOrder) updates) =>
      super.copyWith((message) => updates(message as TokenUnfreezeOrder))
          as TokenUnfreezeOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenUnfreezeOrder create() => TokenUnfreezeOrder._();
  @$core.override
  TokenUnfreezeOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenUnfreezeOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenUnfreezeOrder>(create);
  static TokenUnfreezeOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// token symbol, in full name with "-" suffix
  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  /// amount of token to unfreeze
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
}

/// Message for HashTimeLock order
class HTLTOrder extends $pb.GeneratedMessage {
  factory HTLTOrder({
    $core.List<$core.int>? from,
    $core.List<$core.int>? to,
    $core.String? recipientOtherChain,
    $core.String? senderOtherChain,
    $core.List<$core.int>? randomNumberHash,
    $fixnum.Int64? timestamp,
    $core.Iterable<SendOrder_Token>? amount,
    $core.String? expectedIncome,
    $fixnum.Int64? heightSpan,
    $core.bool? crossChain,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (recipientOtherChain != null)
      result.recipientOtherChain = recipientOtherChain;
    if (senderOtherChain != null) result.senderOtherChain = senderOtherChain;
    if (randomNumberHash != null) result.randomNumberHash = randomNumberHash;
    if (timestamp != null) result.timestamp = timestamp;
    if (amount != null) result.amount.addAll(amount);
    if (expectedIncome != null) result.expectedIncome = expectedIncome;
    if (heightSpan != null) result.heightSpan = heightSpan;
    if (crossChain != null) result.crossChain = crossChain;
    return result;
  }

  HTLTOrder._();

  factory HTLTOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HTLTOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HTLTOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'to', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'recipientOtherChain')
    ..aOS(4, _omitFieldNames ? '' : 'senderOtherChain')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'randomNumberHash', $pb.PbFieldType.OY)
    ..aInt64(6, _omitFieldNames ? '' : 'timestamp')
    ..pPM<SendOrder_Token>(7, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..aOS(8, _omitFieldNames ? '' : 'expectedIncome')
    ..aInt64(9, _omitFieldNames ? '' : 'heightSpan')
    ..aOB(10, _omitFieldNames ? '' : 'crossChain')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HTLTOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HTLTOrder copyWith(void Function(HTLTOrder) updates) =>
      super.copyWith((message) => updates(message as HTLTOrder)) as HTLTOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HTLTOrder create() => HTLTOrder._();
  @$core.override
  HTLTOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HTLTOrder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HTLTOrder>(create);
  static HTLTOrder? _defaultInstance;

  /// signer address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// recipient address
  @$pb.TagNumber(2)
  $core.List<$core.int> get to => $_getN(1);
  @$pb.TagNumber(2)
  set to($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// source on other chain, optional
  @$pb.TagNumber(3)
  $core.String get recipientOtherChain => $_getSZ(2);
  @$pb.TagNumber(3)
  set recipientOtherChain($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRecipientOtherChain() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecipientOtherChain() => $_clearField(3);

  /// recipient on other chain, optional
  @$pb.TagNumber(4)
  $core.String get senderOtherChain => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderOtherChain($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderOtherChain() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderOtherChain() => $_clearField(4);

  /// hash of a random number and timestamp, based on SHA256
  @$pb.TagNumber(5)
  $core.List<$core.int> get randomNumberHash => $_getN(4);
  @$pb.TagNumber(5)
  set randomNumberHash($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRandomNumberHash() => $_has(4);
  @$pb.TagNumber(5)
  void clearRandomNumberHash() => $_clearField(5);

  /// timestamp
  @$pb.TagNumber(6)
  $fixnum.Int64 get timestamp => $_getI64(5);
  @$pb.TagNumber(6)
  set timestamp($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => $_clearField(6);

  /// amounts
  @$pb.TagNumber(7)
  $pb.PbList<SendOrder_Token> get amount => $_getList(6);

  /// expected gained token on the other chain
  @$pb.TagNumber(8)
  $core.String get expectedIncome => $_getSZ(7);
  @$pb.TagNumber(8)
  set expectedIncome($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasExpectedIncome() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpectedIncome() => $_clearField(8);

  /// period expressed in block heights
  @$pb.TagNumber(9)
  $fixnum.Int64 get heightSpan => $_getI64(8);
  @$pb.TagNumber(9)
  set heightSpan($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasHeightSpan() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeightSpan() => $_clearField(9);

  /// set for cross-chain send
  @$pb.TagNumber(10)
  $core.bool get crossChain => $_getBF(9);
  @$pb.TagNumber(10)
  set crossChain($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCrossChain() => $_has(9);
  @$pb.TagNumber(10)
  void clearCrossChain() => $_clearField(10);
}

/// Message for Deposit HTLT order
class DepositHTLTOrder extends $pb.GeneratedMessage {
  factory DepositHTLTOrder({
    $core.List<$core.int>? from,
    $core.Iterable<SendOrder_Token>? amount,
    $core.List<$core.int>? swapId,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (amount != null) result.amount.addAll(amount);
    if (swapId != null) result.swapId = swapId;
    return result;
  }

  DepositHTLTOrder._();

  factory DepositHTLTOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DepositHTLTOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DepositHTLTOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..pPM<SendOrder_Token>(2, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'swapId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositHTLTOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DepositHTLTOrder copyWith(void Function(DepositHTLTOrder) updates) =>
      super.copyWith((message) => updates(message as DepositHTLTOrder))
          as DepositHTLTOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DepositHTLTOrder create() => DepositHTLTOrder._();
  @$core.override
  DepositHTLTOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DepositHTLTOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DepositHTLTOrder>(create);
  static DepositHTLTOrder? _defaultInstance;

  /// signer address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// amounts
  @$pb.TagNumber(2)
  $pb.PbList<SendOrder_Token> get amount => $_getList(1);

  /// swap ID
  @$pb.TagNumber(3)
  $core.List<$core.int> get swapId => $_getN(2);
  @$pb.TagNumber(3)
  set swapId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSwapId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSwapId() => $_clearField(3);
}

/// Message for Claim HTLT order
class ClaimHTLOrder extends $pb.GeneratedMessage {
  factory ClaimHTLOrder({
    $core.List<$core.int>? from,
    $core.List<$core.int>? swapId,
    $core.List<$core.int>? randomNumber,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (swapId != null) result.swapId = swapId;
    if (randomNumber != null) result.randomNumber = randomNumber;
    return result;
  }

  ClaimHTLOrder._();

  factory ClaimHTLOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimHTLOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimHTLOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'swapId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'randomNumber', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimHTLOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimHTLOrder copyWith(void Function(ClaimHTLOrder) updates) =>
      super.copyWith((message) => updates(message as ClaimHTLOrder))
          as ClaimHTLOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimHTLOrder create() => ClaimHTLOrder._();
  @$core.override
  ClaimHTLOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimHTLOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimHTLOrder>(create);
  static ClaimHTLOrder? _defaultInstance;

  /// signer address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// swap ID
  @$pb.TagNumber(2)
  $core.List<$core.int> get swapId => $_getN(1);
  @$pb.TagNumber(2)
  set swapId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSwapId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwapId() => $_clearField(2);

  /// random number input
  @$pb.TagNumber(3)
  $core.List<$core.int> get randomNumber => $_getN(2);
  @$pb.TagNumber(3)
  set randomNumber($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRandomNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearRandomNumber() => $_clearField(3);
}

/// Message for Refund HTLT order
class RefundHTLTOrder extends $pb.GeneratedMessage {
  factory RefundHTLTOrder({
    $core.List<$core.int>? from,
    $core.List<$core.int>? swapId,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (swapId != null) result.swapId = swapId;
    return result;
  }

  RefundHTLTOrder._();

  factory RefundHTLTOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefundHTLTOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefundHTLTOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'swapId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefundHTLTOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefundHTLTOrder copyWith(void Function(RefundHTLTOrder) updates) =>
      super.copyWith((message) => updates(message as RefundHTLTOrder))
          as RefundHTLTOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefundHTLTOrder create() => RefundHTLTOrder._();
  @$core.override
  RefundHTLTOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefundHTLTOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefundHTLTOrder>(create);
  static RefundHTLTOrder? _defaultInstance;

  /// signer address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// swap ID
  @$pb.TagNumber(2)
  $core.List<$core.int> get swapId => $_getN(1);
  @$pb.TagNumber(2)
  set swapId($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSwapId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwapId() => $_clearField(2);
}

/// Transfer
class TransferOut extends $pb.GeneratedMessage {
  factory TransferOut({
    $core.List<$core.int>? from,
    $core.List<$core.int>? to,
    SendOrder_Token? amount,
    $fixnum.Int64? expireTime,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    if (expireTime != null) result.expireTime = expireTime;
    return result;
  }

  TransferOut._();

  factory TransferOut.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferOut.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferOut',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'to', $pb.PbFieldType.OY)
    ..aOM<SendOrder_Token>(3, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..aInt64(4, _omitFieldNames ? '' : 'expireTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferOut clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferOut copyWith(void Function(TransferOut) updates) =>
      super.copyWith((message) => updates(message as TransferOut))
          as TransferOut;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferOut create() => TransferOut._();
  @$core.override
  TransferOut createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferOut>(create);
  static TransferOut? _defaultInstance;

  /// source address
  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// recipient address
  @$pb.TagNumber(2)
  $core.List<$core.int> get to => $_getN(1);
  @$pb.TagNumber(2)
  set to($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// transfer amount
  @$pb.TagNumber(3)
  SendOrder_Token get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount(SendOrder_Token value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
  @$pb.TagNumber(3)
  SendOrder_Token ensureAmount() => $_ensure(2);

  /// expiration time
  @$pb.TagNumber(4)
  $fixnum.Int64 get expireTime => $_getI64(3);
  @$pb.TagNumber(4)
  set expireTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpireTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireTime() => $_clearField(4);
}

class SideChainDelegate extends $pb.GeneratedMessage {
  factory SideChainDelegate({
    $core.List<$core.int>? delegatorAddr,
    $core.List<$core.int>? validatorAddr,
    SendOrder_Token? delegation,
    $core.String? chainId,
  }) {
    final result = create();
    if (delegatorAddr != null) result.delegatorAddr = delegatorAddr;
    if (validatorAddr != null) result.validatorAddr = validatorAddr;
    if (delegation != null) result.delegation = delegation;
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  SideChainDelegate._();

  factory SideChainDelegate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SideChainDelegate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SideChainDelegate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'delegatorAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'validatorAddr', $pb.PbFieldType.OY)
    ..aOM<SendOrder_Token>(3, _omitFieldNames ? '' : 'delegation',
        subBuilder: SendOrder_Token.create)
    ..aOS(4, _omitFieldNames ? '' : 'chainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainDelegate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainDelegate copyWith(void Function(SideChainDelegate) updates) =>
      super.copyWith((message) => updates(message as SideChainDelegate))
          as SideChainDelegate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SideChainDelegate create() => SideChainDelegate._();
  @$core.override
  SideChainDelegate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SideChainDelegate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SideChainDelegate>(create);
  static SideChainDelegate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get delegatorAddr => $_getN(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get validatorAddr => $_getN(1);
  @$pb.TagNumber(2)
  set validatorAddr($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddr() => $_clearField(2);

  @$pb.TagNumber(3)
  SendOrder_Token get delegation => $_getN(2);
  @$pb.TagNumber(3)
  set delegation(SendOrder_Token value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDelegation() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelegation() => $_clearField(3);
  @$pb.TagNumber(3)
  SendOrder_Token ensureDelegation() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get chainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainId() => $_clearField(4);
}

class SideChainRedelegate extends $pb.GeneratedMessage {
  factory SideChainRedelegate({
    $core.List<$core.int>? delegatorAddr,
    $core.List<$core.int>? validatorSrcAddr,
    $core.List<$core.int>? validatorDstAddr,
    SendOrder_Token? amount,
    $core.String? chainId,
  }) {
    final result = create();
    if (delegatorAddr != null) result.delegatorAddr = delegatorAddr;
    if (validatorSrcAddr != null) result.validatorSrcAddr = validatorSrcAddr;
    if (validatorDstAddr != null) result.validatorDstAddr = validatorDstAddr;
    if (amount != null) result.amount = amount;
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  SideChainRedelegate._();

  factory SideChainRedelegate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SideChainRedelegate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SideChainRedelegate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'delegatorAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'validatorSrcAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'validatorDstAddr', $pb.PbFieldType.OY)
    ..aOM<SendOrder_Token>(4, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..aOS(5, _omitFieldNames ? '' : 'chainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainRedelegate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainRedelegate copyWith(void Function(SideChainRedelegate) updates) =>
      super.copyWith((message) => updates(message as SideChainRedelegate))
          as SideChainRedelegate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SideChainRedelegate create() => SideChainRedelegate._();
  @$core.override
  SideChainRedelegate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SideChainRedelegate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SideChainRedelegate>(create);
  static SideChainRedelegate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get delegatorAddr => $_getN(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get validatorSrcAddr => $_getN(1);
  @$pb.TagNumber(2)
  set validatorSrcAddr($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidatorSrcAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorSrcAddr() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get validatorDstAddr => $_getN(2);
  @$pb.TagNumber(3)
  set validatorDstAddr($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValidatorDstAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidatorDstAddr() => $_clearField(3);

  @$pb.TagNumber(4)
  SendOrder_Token get amount => $_getN(3);
  @$pb.TagNumber(4)
  set amount(SendOrder_Token value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);
  @$pb.TagNumber(4)
  SendOrder_Token ensureAmount() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get chainId => $_getSZ(4);
  @$pb.TagNumber(5)
  set chainId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChainId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChainId() => $_clearField(5);
}

class SideChainUndelegate extends $pb.GeneratedMessage {
  factory SideChainUndelegate({
    $core.List<$core.int>? delegatorAddr,
    $core.List<$core.int>? validatorAddr,
    SendOrder_Token? amount,
    $core.String? chainId,
  }) {
    final result = create();
    if (delegatorAddr != null) result.delegatorAddr = delegatorAddr;
    if (validatorAddr != null) result.validatorAddr = validatorAddr;
    if (amount != null) result.amount = amount;
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  SideChainUndelegate._();

  factory SideChainUndelegate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SideChainUndelegate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SideChainUndelegate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'delegatorAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'validatorAddr', $pb.PbFieldType.OY)
    ..aOM<SendOrder_Token>(3, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..aOS(4, _omitFieldNames ? '' : 'chainId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainUndelegate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainUndelegate copyWith(void Function(SideChainUndelegate) updates) =>
      super.copyWith((message) => updates(message as SideChainUndelegate))
          as SideChainUndelegate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SideChainUndelegate create() => SideChainUndelegate._();
  @$core.override
  SideChainUndelegate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SideChainUndelegate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SideChainUndelegate>(create);
  static SideChainUndelegate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get delegatorAddr => $_getN(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get validatorAddr => $_getN(1);
  @$pb.TagNumber(2)
  set validatorAddr($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddr() => $_clearField(2);

  @$pb.TagNumber(3)
  SendOrder_Token get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount(SendOrder_Token value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
  @$pb.TagNumber(3)
  SendOrder_Token ensureAmount() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get chainId => $_getSZ(3);
  @$pb.TagNumber(4)
  set chainId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChainId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChainId() => $_clearField(4);
}

/// Message for BNB Beacon Chain -> BSC Stake Migration.
/// https://github.com/bnb-chain/javascript-sdk/blob/26f6db8b67326e6214e74203ff90c89777b592a1/src/types/msg/stake/stakeMigrationMsg.ts#L13-L18
class SideChainStakeMigration extends $pb.GeneratedMessage {
  factory SideChainStakeMigration({
    $core.List<$core.int>? validatorSrcAddr,
    $core.List<$core.int>? validatorDstAddr,
    $core.List<$core.int>? delegatorAddr,
    $core.List<$core.int>? refundAddr,
    SendOrder_Token? amount,
  }) {
    final result = create();
    if (validatorSrcAddr != null) result.validatorSrcAddr = validatorSrcAddr;
    if (validatorDstAddr != null) result.validatorDstAddr = validatorDstAddr;
    if (delegatorAddr != null) result.delegatorAddr = delegatorAddr;
    if (refundAddr != null) result.refundAddr = refundAddr;
    if (amount != null) result.amount = amount;
    return result;
  }

  SideChainStakeMigration._();

  factory SideChainStakeMigration.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SideChainStakeMigration.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SideChainStakeMigration',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'validatorSrcAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'validatorDstAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'delegatorAddr', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'refundAddr', $pb.PbFieldType.OY)
    ..aOM<SendOrder_Token>(5, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainStakeMigration clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideChainStakeMigration copyWith(
          void Function(SideChainStakeMigration) updates) =>
      super.copyWith((message) => updates(message as SideChainStakeMigration))
          as SideChainStakeMigration;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SideChainStakeMigration create() => SideChainStakeMigration._();
  @$core.override
  SideChainStakeMigration createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SideChainStakeMigration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SideChainStakeMigration>(create);
  static SideChainStakeMigration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get validatorSrcAddr => $_getN(0);
  @$pb.TagNumber(1)
  set validatorSrcAddr($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValidatorSrcAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorSrcAddr() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get validatorDstAddr => $_getN(1);
  @$pb.TagNumber(2)
  set validatorDstAddr($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValidatorDstAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorDstAddr() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get delegatorAddr => $_getN(2);
  @$pb.TagNumber(3)
  set delegatorAddr($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDelegatorAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelegatorAddr() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get refundAddr => $_getN(3);
  @$pb.TagNumber(4)
  set refundAddr($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundAddr() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundAddr() => $_clearField(4);

  @$pb.TagNumber(5)
  SendOrder_Token get amount => $_getN(4);
  @$pb.TagNumber(5)
  set amount(SendOrder_Token value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => $_clearField(5);
  @$pb.TagNumber(5)
  SendOrder_Token ensureAmount() => $_ensure(4);
}

/// Message for TimeLock order
class TimeLockOrder extends $pb.GeneratedMessage {
  factory TimeLockOrder({
    $core.List<$core.int>? fromAddress,
    $core.String? description,
    $core.Iterable<SendOrder_Token>? amount,
    $fixnum.Int64? lockTime,
  }) {
    final result = create();
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (description != null) result.description = description;
    if (amount != null) result.amount.addAll(amount);
    if (lockTime != null) result.lockTime = lockTime;
    return result;
  }

  TimeLockOrder._();

  factory TimeLockOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TimeLockOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimeLockOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'fromAddress', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..pPM<SendOrder_Token>(3, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..aInt64(4, _omitFieldNames ? '' : 'lockTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeLockOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeLockOrder copyWith(void Function(TimeLockOrder) updates) =>
      super.copyWith((message) => updates(message as TimeLockOrder))
          as TimeLockOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeLockOrder create() => TimeLockOrder._();
  @$core.override
  TimeLockOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TimeLockOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TimeLockOrder>(create);
  static TimeLockOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get fromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set fromAddress($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => $_clearField(1);

  /// Description (optional)
  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  /// Array of symbol/amount pairs. see SDK https://github.com/binance-chain/javascript-sdk/blob/master/docs/api-docs/classes/tokenmanagement.md#timelock
  @$pb.TagNumber(3)
  $pb.PbList<SendOrder_Token> get amount => $_getList(2);

  /// lock time
  @$pb.TagNumber(4)
  $fixnum.Int64 get lockTime => $_getI64(3);
  @$pb.TagNumber(4)
  set lockTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLockTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearLockTime() => $_clearField(4);
}

/// Message for TimeRelock order
class TimeRelockOrder extends $pb.GeneratedMessage {
  factory TimeRelockOrder({
    $core.List<$core.int>? fromAddress,
    $fixnum.Int64? id,
    $core.String? description,
    $core.Iterable<SendOrder_Token>? amount,
    $fixnum.Int64? lockTime,
  }) {
    final result = create();
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (id != null) result.id = id;
    if (description != null) result.description = description;
    if (amount != null) result.amount.addAll(amount);
    if (lockTime != null) result.lockTime = lockTime;
    return result;
  }

  TimeRelockOrder._();

  factory TimeRelockOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TimeRelockOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimeRelockOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'fromAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pPM<SendOrder_Token>(4, _omitFieldNames ? '' : 'amount',
        subBuilder: SendOrder_Token.create)
    ..aInt64(5, _omitFieldNames ? '' : 'lockTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeRelockOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeRelockOrder copyWith(void Function(TimeRelockOrder) updates) =>
      super.copyWith((message) => updates(message as TimeRelockOrder))
          as TimeRelockOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeRelockOrder create() => TimeRelockOrder._();
  @$core.override
  TimeRelockOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TimeRelockOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TimeRelockOrder>(create);
  static TimeRelockOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get fromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set fromAddress($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => $_clearField(1);

  /// order ID
  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  /// Description (optional)
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// Array of symbol/amount pairs.
  @$pb.TagNumber(4)
  $pb.PbList<SendOrder_Token> get amount => $_getList(3);

  /// lock time
  @$pb.TagNumber(5)
  $fixnum.Int64 get lockTime => $_getI64(4);
  @$pb.TagNumber(5)
  set lockTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLockTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLockTime() => $_clearField(5);
}

/// Message for TimeUnlock order
class TimeUnlockOrder extends $pb.GeneratedMessage {
  factory TimeUnlockOrder({
    $core.List<$core.int>? fromAddress,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (id != null) result.id = id;
    return result;
  }

  TimeUnlockOrder._();

  factory TimeUnlockOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TimeUnlockOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimeUnlockOrder',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'fromAddress', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeUnlockOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimeUnlockOrder copyWith(void Function(TimeUnlockOrder) updates) =>
      super.copyWith((message) => updates(message as TimeUnlockOrder))
          as TimeUnlockOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeUnlockOrder create() => TimeUnlockOrder._();
  @$core.override
  TimeUnlockOrder createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TimeUnlockOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TimeUnlockOrder>(create);
  static TimeUnlockOrder? _defaultInstance;

  /// owner address
  @$pb.TagNumber(1)
  $core.List<$core.int> get fromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set fromAddress($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => $_clearField(1);

  /// order ID
  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
}

enum SigningInput_OrderOneof {
  tradeOrder,
  cancelTradeOrder,
  sendOrder,
  freezeOrder,
  unfreezeOrder,
  htltOrder,
  depositHTLTOrder,
  claimHTLTOrder,
  refundHTLTOrder,
  issueOrder,
  mintOrder,
  burnOrder,
  transferOutOrder,
  sideDelegateOrder,
  sideRedelegateOrder,
  sideUndelegateOrder,
  timeLockOrder,
  timeRelockOrder,
  timeUnlockOrder,
  sideStakeMigrationOrder,
  notSet
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.String? chainId,
    $fixnum.Int64? accountNumber,
    $fixnum.Int64? sequence,
    $fixnum.Int64? source,
    $core.String? memo,
    $core.List<$core.int>? privateKey,
    TradeOrder? tradeOrder,
    CancelTradeOrder? cancelTradeOrder,
    SendOrder? sendOrder,
    TokenFreezeOrder? freezeOrder,
    TokenUnfreezeOrder? unfreezeOrder,
    HTLTOrder? htltOrder,
    DepositHTLTOrder? depositHTLTOrder,
    ClaimHTLOrder? claimHTLTOrder,
    RefundHTLTOrder? refundHTLTOrder,
    TokenIssueOrder? issueOrder,
    TokenMintOrder? mintOrder,
    TokenBurnOrder? burnOrder,
    TransferOut? transferOutOrder,
    SideChainDelegate? sideDelegateOrder,
    SideChainRedelegate? sideRedelegateOrder,
    SideChainUndelegate? sideUndelegateOrder,
    TimeLockOrder? timeLockOrder,
    TimeRelockOrder? timeRelockOrder,
    TimeUnlockOrder? timeUnlockOrder,
    SideChainStakeMigration? sideStakeMigrationOrder,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (accountNumber != null) result.accountNumber = accountNumber;
    if (sequence != null) result.sequence = sequence;
    if (source != null) result.source = source;
    if (memo != null) result.memo = memo;
    if (privateKey != null) result.privateKey = privateKey;
    if (tradeOrder != null) result.tradeOrder = tradeOrder;
    if (cancelTradeOrder != null) result.cancelTradeOrder = cancelTradeOrder;
    if (sendOrder != null) result.sendOrder = sendOrder;
    if (freezeOrder != null) result.freezeOrder = freezeOrder;
    if (unfreezeOrder != null) result.unfreezeOrder = unfreezeOrder;
    if (htltOrder != null) result.htltOrder = htltOrder;
    if (depositHTLTOrder != null) result.depositHTLTOrder = depositHTLTOrder;
    if (claimHTLTOrder != null) result.claimHTLTOrder = claimHTLTOrder;
    if (refundHTLTOrder != null) result.refundHTLTOrder = refundHTLTOrder;
    if (issueOrder != null) result.issueOrder = issueOrder;
    if (mintOrder != null) result.mintOrder = mintOrder;
    if (burnOrder != null) result.burnOrder = burnOrder;
    if (transferOutOrder != null) result.transferOutOrder = transferOutOrder;
    if (sideDelegateOrder != null) result.sideDelegateOrder = sideDelegateOrder;
    if (sideRedelegateOrder != null)
      result.sideRedelegateOrder = sideRedelegateOrder;
    if (sideUndelegateOrder != null)
      result.sideUndelegateOrder = sideUndelegateOrder;
    if (timeLockOrder != null) result.timeLockOrder = timeLockOrder;
    if (timeRelockOrder != null) result.timeRelockOrder = timeRelockOrder;
    if (timeUnlockOrder != null) result.timeUnlockOrder = timeUnlockOrder;
    if (sideStakeMigrationOrder != null)
      result.sideStakeMigrationOrder = sideStakeMigrationOrder;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_OrderOneof>
      _SigningInput_OrderOneofByTag = {
    8: SigningInput_OrderOneof.tradeOrder,
    9: SigningInput_OrderOneof.cancelTradeOrder,
    10: SigningInput_OrderOneof.sendOrder,
    11: SigningInput_OrderOneof.freezeOrder,
    12: SigningInput_OrderOneof.unfreezeOrder,
    13: SigningInput_OrderOneof.htltOrder,
    14: SigningInput_OrderOneof.depositHTLTOrder,
    15: SigningInput_OrderOneof.claimHTLTOrder,
    16: SigningInput_OrderOneof.refundHTLTOrder,
    17: SigningInput_OrderOneof.issueOrder,
    18: SigningInput_OrderOneof.mintOrder,
    19: SigningInput_OrderOneof.burnOrder,
    20: SigningInput_OrderOneof.transferOutOrder,
    21: SigningInput_OrderOneof.sideDelegateOrder,
    22: SigningInput_OrderOneof.sideRedelegateOrder,
    23: SigningInput_OrderOneof.sideUndelegateOrder,
    24: SigningInput_OrderOneof.timeLockOrder,
    25: SigningInput_OrderOneof.timeRelockOrder,
    26: SigningInput_OrderOneof.timeUnlockOrder,
    27: SigningInput_OrderOneof.sideStakeMigrationOrder,
    0: SigningInput_OrderOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..oo(0, [
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27
    ])
    ..aOS(1, _omitFieldNames ? '' : 'chainId')
    ..aInt64(2, _omitFieldNames ? '' : 'accountNumber')
    ..aInt64(3, _omitFieldNames ? '' : 'sequence')
    ..aInt64(4, _omitFieldNames ? '' : 'source')
    ..aOS(5, _omitFieldNames ? '' : 'memo')
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<TradeOrder>(8, _omitFieldNames ? '' : 'tradeOrder',
        subBuilder: TradeOrder.create)
    ..aOM<CancelTradeOrder>(9, _omitFieldNames ? '' : 'cancelTradeOrder',
        subBuilder: CancelTradeOrder.create)
    ..aOM<SendOrder>(10, _omitFieldNames ? '' : 'sendOrder',
        subBuilder: SendOrder.create)
    ..aOM<TokenFreezeOrder>(11, _omitFieldNames ? '' : 'freezeOrder',
        subBuilder: TokenFreezeOrder.create)
    ..aOM<TokenUnfreezeOrder>(12, _omitFieldNames ? '' : 'unfreezeOrder',
        subBuilder: TokenUnfreezeOrder.create)
    ..aOM<HTLTOrder>(13, _omitFieldNames ? '' : 'htltOrder',
        subBuilder: HTLTOrder.create)
    ..aOM<DepositHTLTOrder>(14, _omitFieldNames ? '' : 'depositHTLTOrder',
        protoName: 'depositHTLT_order', subBuilder: DepositHTLTOrder.create)
    ..aOM<ClaimHTLOrder>(15, _omitFieldNames ? '' : 'claimHTLTOrder',
        protoName: 'claimHTLT_order', subBuilder: ClaimHTLOrder.create)
    ..aOM<RefundHTLTOrder>(16, _omitFieldNames ? '' : 'refundHTLTOrder',
        protoName: 'refundHTLT_order', subBuilder: RefundHTLTOrder.create)
    ..aOM<TokenIssueOrder>(17, _omitFieldNames ? '' : 'issueOrder',
        subBuilder: TokenIssueOrder.create)
    ..aOM<TokenMintOrder>(18, _omitFieldNames ? '' : 'mintOrder',
        subBuilder: TokenMintOrder.create)
    ..aOM<TokenBurnOrder>(19, _omitFieldNames ? '' : 'burnOrder',
        subBuilder: TokenBurnOrder.create)
    ..aOM<TransferOut>(20, _omitFieldNames ? '' : 'transferOutOrder',
        subBuilder: TransferOut.create)
    ..aOM<SideChainDelegate>(21, _omitFieldNames ? '' : 'sideDelegateOrder',
        subBuilder: SideChainDelegate.create)
    ..aOM<SideChainRedelegate>(22, _omitFieldNames ? '' : 'sideRedelegateOrder',
        subBuilder: SideChainRedelegate.create)
    ..aOM<SideChainUndelegate>(23, _omitFieldNames ? '' : 'sideUndelegateOrder',
        subBuilder: SideChainUndelegate.create)
    ..aOM<TimeLockOrder>(24, _omitFieldNames ? '' : 'timeLockOrder',
        subBuilder: TimeLockOrder.create)
    ..aOM<TimeRelockOrder>(25, _omitFieldNames ? '' : 'timeRelockOrder',
        subBuilder: TimeRelockOrder.create)
    ..aOM<TimeUnlockOrder>(26, _omitFieldNames ? '' : 'timeUnlockOrder',
        subBuilder: TimeUnlockOrder.create)
    ..aOM<SideChainStakeMigration>(
        27, _omitFieldNames ? '' : 'sideStakeMigrationOrder',
        subBuilder: SideChainStakeMigration.create)
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

  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  SigningInput_OrderOneof whichOrderOneof() =>
      _SigningInput_OrderOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  @$pb.TagNumber(19)
  @$pb.TagNumber(20)
  @$pb.TagNumber(21)
  @$pb.TagNumber(22)
  @$pb.TagNumber(23)
  @$pb.TagNumber(24)
  @$pb.TagNumber(25)
  @$pb.TagNumber(26)
  @$pb.TagNumber(27)
  void clearOrderOneof() => $_clearField($_whichOneof(0));

  /// Chain ID
  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// Source account number
  @$pb.TagNumber(2)
  $fixnum.Int64 get accountNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set accountNumber($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccountNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountNumber() => $_clearField(2);

  /// Sequence number (account specific)
  @$pb.TagNumber(3)
  $fixnum.Int64 get sequence => $_getI64(2);
  @$pb.TagNumber(3)
  set sequence($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSequence() => $_has(2);
  @$pb.TagNumber(3)
  void clearSequence() => $_clearField(3);

  /// Transaction source, see https://github.com/bnb-chain/BEPs/blob/master/BEP10.md
  /// Some important values:
  ///  0: Default source value (e.g. for Binance Chain Command Line, or SDKs)
  ///  1: Binance DEX Web Wallet
  ///  2: Trust Wallet
  @$pb.TagNumber(4)
  $fixnum.Int64 get source => $_getI64(3);
  @$pb.TagNumber(4)
  set source($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => $_clearField(4);

  /// Optional memo
  @$pb.TagNumber(5)
  $core.String get memo => $_getSZ(4);
  @$pb.TagNumber(5)
  set memo($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMemo() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemo() => $_clearField(5);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(6)
  $core.List<$core.int> get privateKey => $_getN(5);
  @$pb.TagNumber(6)
  set privateKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrivateKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrivateKey() => $_clearField(6);

  @$pb.TagNumber(8)
  TradeOrder get tradeOrder => $_getN(6);
  @$pb.TagNumber(8)
  set tradeOrder(TradeOrder value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTradeOrder() => $_has(6);
  @$pb.TagNumber(8)
  void clearTradeOrder() => $_clearField(8);
  @$pb.TagNumber(8)
  TradeOrder ensureTradeOrder() => $_ensure(6);

  @$pb.TagNumber(9)
  CancelTradeOrder get cancelTradeOrder => $_getN(7);
  @$pb.TagNumber(9)
  set cancelTradeOrder(CancelTradeOrder value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCancelTradeOrder() => $_has(7);
  @$pb.TagNumber(9)
  void clearCancelTradeOrder() => $_clearField(9);
  @$pb.TagNumber(9)
  CancelTradeOrder ensureCancelTradeOrder() => $_ensure(7);

  @$pb.TagNumber(10)
  SendOrder get sendOrder => $_getN(8);
  @$pb.TagNumber(10)
  set sendOrder(SendOrder value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSendOrder() => $_has(8);
  @$pb.TagNumber(10)
  void clearSendOrder() => $_clearField(10);
  @$pb.TagNumber(10)
  SendOrder ensureSendOrder() => $_ensure(8);

  @$pb.TagNumber(11)
  TokenFreezeOrder get freezeOrder => $_getN(9);
  @$pb.TagNumber(11)
  set freezeOrder(TokenFreezeOrder value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasFreezeOrder() => $_has(9);
  @$pb.TagNumber(11)
  void clearFreezeOrder() => $_clearField(11);
  @$pb.TagNumber(11)
  TokenFreezeOrder ensureFreezeOrder() => $_ensure(9);

  @$pb.TagNumber(12)
  TokenUnfreezeOrder get unfreezeOrder => $_getN(10);
  @$pb.TagNumber(12)
  set unfreezeOrder(TokenUnfreezeOrder value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasUnfreezeOrder() => $_has(10);
  @$pb.TagNumber(12)
  void clearUnfreezeOrder() => $_clearField(12);
  @$pb.TagNumber(12)
  TokenUnfreezeOrder ensureUnfreezeOrder() => $_ensure(10);

  @$pb.TagNumber(13)
  HTLTOrder get htltOrder => $_getN(11);
  @$pb.TagNumber(13)
  set htltOrder(HTLTOrder value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasHtltOrder() => $_has(11);
  @$pb.TagNumber(13)
  void clearHtltOrder() => $_clearField(13);
  @$pb.TagNumber(13)
  HTLTOrder ensureHtltOrder() => $_ensure(11);

  @$pb.TagNumber(14)
  DepositHTLTOrder get depositHTLTOrder => $_getN(12);
  @$pb.TagNumber(14)
  set depositHTLTOrder(DepositHTLTOrder value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasDepositHTLTOrder() => $_has(12);
  @$pb.TagNumber(14)
  void clearDepositHTLTOrder() => $_clearField(14);
  @$pb.TagNumber(14)
  DepositHTLTOrder ensureDepositHTLTOrder() => $_ensure(12);

  @$pb.TagNumber(15)
  ClaimHTLOrder get claimHTLTOrder => $_getN(13);
  @$pb.TagNumber(15)
  set claimHTLTOrder(ClaimHTLOrder value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasClaimHTLTOrder() => $_has(13);
  @$pb.TagNumber(15)
  void clearClaimHTLTOrder() => $_clearField(15);
  @$pb.TagNumber(15)
  ClaimHTLOrder ensureClaimHTLTOrder() => $_ensure(13);

  @$pb.TagNumber(16)
  RefundHTLTOrder get refundHTLTOrder => $_getN(14);
  @$pb.TagNumber(16)
  set refundHTLTOrder(RefundHTLTOrder value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasRefundHTLTOrder() => $_has(14);
  @$pb.TagNumber(16)
  void clearRefundHTLTOrder() => $_clearField(16);
  @$pb.TagNumber(16)
  RefundHTLTOrder ensureRefundHTLTOrder() => $_ensure(14);

  @$pb.TagNumber(17)
  TokenIssueOrder get issueOrder => $_getN(15);
  @$pb.TagNumber(17)
  set issueOrder(TokenIssueOrder value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasIssueOrder() => $_has(15);
  @$pb.TagNumber(17)
  void clearIssueOrder() => $_clearField(17);
  @$pb.TagNumber(17)
  TokenIssueOrder ensureIssueOrder() => $_ensure(15);

  @$pb.TagNumber(18)
  TokenMintOrder get mintOrder => $_getN(16);
  @$pb.TagNumber(18)
  set mintOrder(TokenMintOrder value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasMintOrder() => $_has(16);
  @$pb.TagNumber(18)
  void clearMintOrder() => $_clearField(18);
  @$pb.TagNumber(18)
  TokenMintOrder ensureMintOrder() => $_ensure(16);

  @$pb.TagNumber(19)
  TokenBurnOrder get burnOrder => $_getN(17);
  @$pb.TagNumber(19)
  set burnOrder(TokenBurnOrder value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasBurnOrder() => $_has(17);
  @$pb.TagNumber(19)
  void clearBurnOrder() => $_clearField(19);
  @$pb.TagNumber(19)
  TokenBurnOrder ensureBurnOrder() => $_ensure(17);

  @$pb.TagNumber(20)
  TransferOut get transferOutOrder => $_getN(18);
  @$pb.TagNumber(20)
  set transferOutOrder(TransferOut value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasTransferOutOrder() => $_has(18);
  @$pb.TagNumber(20)
  void clearTransferOutOrder() => $_clearField(20);
  @$pb.TagNumber(20)
  TransferOut ensureTransferOutOrder() => $_ensure(18);

  @$pb.TagNumber(21)
  SideChainDelegate get sideDelegateOrder => $_getN(19);
  @$pb.TagNumber(21)
  set sideDelegateOrder(SideChainDelegate value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasSideDelegateOrder() => $_has(19);
  @$pb.TagNumber(21)
  void clearSideDelegateOrder() => $_clearField(21);
  @$pb.TagNumber(21)
  SideChainDelegate ensureSideDelegateOrder() => $_ensure(19);

  @$pb.TagNumber(22)
  SideChainRedelegate get sideRedelegateOrder => $_getN(20);
  @$pb.TagNumber(22)
  set sideRedelegateOrder(SideChainRedelegate value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasSideRedelegateOrder() => $_has(20);
  @$pb.TagNumber(22)
  void clearSideRedelegateOrder() => $_clearField(22);
  @$pb.TagNumber(22)
  SideChainRedelegate ensureSideRedelegateOrder() => $_ensure(20);

  @$pb.TagNumber(23)
  SideChainUndelegate get sideUndelegateOrder => $_getN(21);
  @$pb.TagNumber(23)
  set sideUndelegateOrder(SideChainUndelegate value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasSideUndelegateOrder() => $_has(21);
  @$pb.TagNumber(23)
  void clearSideUndelegateOrder() => $_clearField(23);
  @$pb.TagNumber(23)
  SideChainUndelegate ensureSideUndelegateOrder() => $_ensure(21);

  @$pb.TagNumber(24)
  TimeLockOrder get timeLockOrder => $_getN(22);
  @$pb.TagNumber(24)
  set timeLockOrder(TimeLockOrder value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasTimeLockOrder() => $_has(22);
  @$pb.TagNumber(24)
  void clearTimeLockOrder() => $_clearField(24);
  @$pb.TagNumber(24)
  TimeLockOrder ensureTimeLockOrder() => $_ensure(22);

  @$pb.TagNumber(25)
  TimeRelockOrder get timeRelockOrder => $_getN(23);
  @$pb.TagNumber(25)
  set timeRelockOrder(TimeRelockOrder value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasTimeRelockOrder() => $_has(23);
  @$pb.TagNumber(25)
  void clearTimeRelockOrder() => $_clearField(25);
  @$pb.TagNumber(25)
  TimeRelockOrder ensureTimeRelockOrder() => $_ensure(23);

  @$pb.TagNumber(26)
  TimeUnlockOrder get timeUnlockOrder => $_getN(24);
  @$pb.TagNumber(26)
  set timeUnlockOrder(TimeUnlockOrder value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasTimeUnlockOrder() => $_has(24);
  @$pb.TagNumber(26)
  void clearTimeUnlockOrder() => $_clearField(26);
  @$pb.TagNumber(26)
  TimeUnlockOrder ensureTimeUnlockOrder() => $_ensure(24);

  @$pb.TagNumber(27)
  SideChainStakeMigration get sideStakeMigrationOrder => $_getN(25);
  @$pb.TagNumber(27)
  set sideStakeMigrationOrder(SideChainStakeMigration value) =>
      $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasSideStakeMigrationOrder() => $_has(25);
  @$pb.TagNumber(27)
  void clearSideStakeMigrationOrder() => $_clearField(27);
  @$pb.TagNumber(27)
  SideChainStakeMigration ensureSideStakeMigrationOrder() => $_ensure(25);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $0.SigningError? error,
    $core.String? errorMessage,
    $core.List<$core.int>? signature,
    $core.String? signatureJson,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (signature != null) result.signature = signature;
    if (signatureJson != null) result.signatureJson = signatureJson;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Binance.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..aOS(5, _omitFieldNames ? '' : 'signatureJson')
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

  /// OK (=0) or other codes in case of error
  @$pb.TagNumber(2)
  $0.SigningError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($0.SigningError value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);

  /// error description in case of error
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  /// Signature bytes.
  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(3);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignature() => $_clearField(4);

  /// Signature JSON string.
  @$pb.TagNumber(5)
  $core.String get signatureJson => $_getSZ(4);
  @$pb.TagNumber(5)
  set signatureJson($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSignatureJson() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignatureJson() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
