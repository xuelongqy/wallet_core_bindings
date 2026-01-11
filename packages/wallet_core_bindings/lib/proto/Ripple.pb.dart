// This is a generated file - do not edit.
//
// Generated from Ripple.proto.

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

/// https://xrpl.org/currency-formats.html#token-amounts
class CurrencyAmount extends $pb.GeneratedMessage {
  factory CurrencyAmount({
    $core.String? currency,
    $core.String? value,
    $core.String? issuer,
  }) {
    final result = create();
    if (currency != null) result.currency = currency;
    if (value != null) result.value = value;
    if (issuer != null) result.issuer = issuer;
    return result;
  }

  CurrencyAmount._();

  factory CurrencyAmount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CurrencyAmount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CurrencyAmount',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currency')
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..aOS(3, _omitFieldNames ? '' : 'issuer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CurrencyAmount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CurrencyAmount copyWith(void Function(CurrencyAmount) updates) =>
      super.copyWith((message) => updates(message as CurrencyAmount))
          as CurrencyAmount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CurrencyAmount create() => CurrencyAmount._();
  @$core.override
  CurrencyAmount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CurrencyAmount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CurrencyAmount>(create);
  static CurrencyAmount? _defaultInstance;

  /// Currency code
  /// https://xrpl.org/currency-formats.html#currency-codes
  @$pb.TagNumber(1)
  $core.String get currency => $_getSZ(0);
  @$pb.TagNumber(1)
  set currency($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrency() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrency() => $_clearField(1);

  /// String number
  /// https://xrpl.org/currency-formats.html#string-numbers
  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  /// Account
  /// https://xrpl.org/accounts.html
  @$pb.TagNumber(3)
  $core.String get issuer => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuer($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssuer() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuer() => $_clearField(3);
}

/// https://xrpl.org/trustset.html
class OperationTrustSet extends $pb.GeneratedMessage {
  factory OperationTrustSet({
    CurrencyAmount? limitAmount,
  }) {
    final result = create();
    if (limitAmount != null) result.limitAmount = limitAmount;
    return result;
  }

  OperationTrustSet._();

  factory OperationTrustSet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationTrustSet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationTrustSet',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOM<CurrencyAmount>(1, _omitFieldNames ? '' : 'limitAmount',
        subBuilder: CurrencyAmount.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationTrustSet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationTrustSet copyWith(void Function(OperationTrustSet) updates) =>
      super.copyWith((message) => updates(message as OperationTrustSet))
          as OperationTrustSet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationTrustSet create() => OperationTrustSet._();
  @$core.override
  OperationTrustSet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationTrustSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationTrustSet>(create);
  static OperationTrustSet? _defaultInstance;

  @$pb.TagNumber(1)
  CurrencyAmount get limitAmount => $_getN(0);
  @$pb.TagNumber(1)
  set limitAmount(CurrencyAmount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLimitAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimitAmount() => $_clearField(1);
  @$pb.TagNumber(1)
  CurrencyAmount ensureLimitAmount() => $_ensure(0);
}

enum OperationPayment_AmountOneof { amount, currencyAmount, notSet }

/// https://xrpl.org/payment.html
class OperationPayment extends $pb.GeneratedMessage {
  factory OperationPayment({
    $fixnum.Int64? amount,
    CurrencyAmount? currencyAmount,
    $core.String? destination,
    $fixnum.Int64? destinationTag,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (currencyAmount != null) result.currencyAmount = currencyAmount;
    if (destination != null) result.destination = destination;
    if (destinationTag != null) result.destinationTag = destinationTag;
    return result;
  }

  OperationPayment._();

  factory OperationPayment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationPayment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, OperationPayment_AmountOneof>
      _OperationPayment_AmountOneofByTag = {
    1: OperationPayment_AmountOneof.amount,
    2: OperationPayment_AmountOneof.currencyAmount,
    0: OperationPayment_AmountOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationPayment',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..aOM<CurrencyAmount>(2, _omitFieldNames ? '' : 'currencyAmount',
        subBuilder: CurrencyAmount.create)
    ..aOS(3, _omitFieldNames ? '' : 'destination')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'destinationTag', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationPayment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationPayment copyWith(void Function(OperationPayment) updates) =>
      super.copyWith((message) => updates(message as OperationPayment))
          as OperationPayment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationPayment create() => OperationPayment._();
  @$core.override
  OperationPayment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationPayment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationPayment>(create);
  static OperationPayment? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  OperationPayment_AmountOneof whichAmountOneof() =>
      _OperationPayment_AmountOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearAmountOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  @$pb.TagNumber(2)
  CurrencyAmount get currencyAmount => $_getN(1);
  @$pb.TagNumber(2)
  set currencyAmount(CurrencyAmount value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrencyAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrencyAmount() => $_clearField(2);
  @$pb.TagNumber(2)
  CurrencyAmount ensureCurrencyAmount() => $_ensure(1);

  /// Target account
  @$pb.TagNumber(3)
  $core.String get destination => $_getSZ(2);
  @$pb.TagNumber(3)
  set destination($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestination() => $_clearField(3);

  /// A Destination Tag
  /// It must fit uint32
  @$pb.TagNumber(4)
  $fixnum.Int64 get destinationTag => $_getI64(3);
  @$pb.TagNumber(4)
  set destinationTag($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDestinationTag() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestinationTag() => $_clearField(4);
}

/// https://xrpl.org/escrowcreate.html
class OperationEscrowCreate extends $pb.GeneratedMessage {
  factory OperationEscrowCreate({
    $fixnum.Int64? amount,
    $core.String? destination,
    $fixnum.Int64? destinationTag,
    $fixnum.Int64? cancelAfter,
    $fixnum.Int64? finishAfter,
    $core.String? condition,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (destination != null) result.destination = destination;
    if (destinationTag != null) result.destinationTag = destinationTag;
    if (cancelAfter != null) result.cancelAfter = cancelAfter;
    if (finishAfter != null) result.finishAfter = finishAfter;
    if (condition != null) result.condition = condition;
    return result;
  }

  OperationEscrowCreate._();

  factory OperationEscrowCreate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationEscrowCreate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationEscrowCreate',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..aOS(2, _omitFieldNames ? '' : 'destination')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'destinationTag', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'cancelAfter', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'finishAfter', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'condition')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationEscrowCreate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationEscrowCreate copyWith(
          void Function(OperationEscrowCreate) updates) =>
      super.copyWith((message) => updates(message as OperationEscrowCreate))
          as OperationEscrowCreate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationEscrowCreate create() => OperationEscrowCreate._();
  @$core.override
  OperationEscrowCreate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationEscrowCreate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationEscrowCreate>(create);
  static OperationEscrowCreate? _defaultInstance;

  /// Escrow amount
  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  /// Beneficiary account
  @$pb.TagNumber(2)
  $core.String get destination => $_getSZ(1);
  @$pb.TagNumber(2)
  set destination($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDestination() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestination() => $_clearField(2);

  /// Destination Tag
  /// It must fit uint32
  @$pb.TagNumber(3)
  $fixnum.Int64 get destinationTag => $_getI64(2);
  @$pb.TagNumber(3)
  set destinationTag($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDestinationTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestinationTag() => $_clearField(3);

  /// Escrow expire time
  /// It must fit uint32
  @$pb.TagNumber(4)
  $fixnum.Int64 get cancelAfter => $_getI64(3);
  @$pb.TagNumber(4)
  set cancelAfter($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCancelAfter() => $_has(3);
  @$pb.TagNumber(4)
  void clearCancelAfter() => $_clearField(4);

  /// Escrow release time
  /// It must fit uint32
  @$pb.TagNumber(5)
  $fixnum.Int64 get finishAfter => $_getI64(4);
  @$pb.TagNumber(5)
  set finishAfter($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFinishAfter() => $_has(4);
  @$pb.TagNumber(5)
  void clearFinishAfter() => $_clearField(5);

  /// Hex-encoded crypto condition
  /// https://datatracker.ietf.org/doc/html/draft-thomas-crypto-conditions-02#section-8.1
  @$pb.TagNumber(6)
  $core.String get condition => $_getSZ(5);
  @$pb.TagNumber(6)
  set condition($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCondition() => $_has(5);
  @$pb.TagNumber(6)
  void clearCondition() => $_clearField(6);
}

/// https://xrpl.org/escrowcancel.html
class OperationEscrowCancel extends $pb.GeneratedMessage {
  factory OperationEscrowCancel({
    $core.String? owner,
    $core.int? offerSequence,
  }) {
    final result = create();
    if (owner != null) result.owner = owner;
    if (offerSequence != null) result.offerSequence = offerSequence;
    return result;
  }

  OperationEscrowCancel._();

  factory OperationEscrowCancel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationEscrowCancel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationEscrowCancel',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'owner')
    ..aI(2, _omitFieldNames ? '' : 'offerSequence',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationEscrowCancel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationEscrowCancel copyWith(
          void Function(OperationEscrowCancel) updates) =>
      super.copyWith((message) => updates(message as OperationEscrowCancel))
          as OperationEscrowCancel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationEscrowCancel create() => OperationEscrowCancel._();
  @$core.override
  OperationEscrowCancel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationEscrowCancel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationEscrowCancel>(create);
  static OperationEscrowCancel? _defaultInstance;

  /// Funding account
  @$pb.TagNumber(1)
  $core.String get owner => $_getSZ(0);
  @$pb.TagNumber(1)
  set owner($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => $_clearField(1);

  /// Escrow transaction sequence
  @$pb.TagNumber(2)
  $core.int get offerSequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set offerSequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOfferSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearOfferSequence() => $_clearField(2);
}

/// https://xrpl.org/escrowfinish.html
class OperationEscrowFinish extends $pb.GeneratedMessage {
  factory OperationEscrowFinish({
    $core.String? owner,
    $core.int? offerSequence,
    $core.String? condition,
    $core.String? fulfillment,
  }) {
    final result = create();
    if (owner != null) result.owner = owner;
    if (offerSequence != null) result.offerSequence = offerSequence;
    if (condition != null) result.condition = condition;
    if (fulfillment != null) result.fulfillment = fulfillment;
    return result;
  }

  OperationEscrowFinish._();

  factory OperationEscrowFinish.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationEscrowFinish.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationEscrowFinish',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'owner')
    ..aI(2, _omitFieldNames ? '' : 'offerSequence',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'condition')
    ..aOS(4, _omitFieldNames ? '' : 'fulfillment')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationEscrowFinish clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationEscrowFinish copyWith(
          void Function(OperationEscrowFinish) updates) =>
      super.copyWith((message) => updates(message as OperationEscrowFinish))
          as OperationEscrowFinish;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationEscrowFinish create() => OperationEscrowFinish._();
  @$core.override
  OperationEscrowFinish createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationEscrowFinish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationEscrowFinish>(create);
  static OperationEscrowFinish? _defaultInstance;

  /// Funding account
  @$pb.TagNumber(1)
  $core.String get owner => $_getSZ(0);
  @$pb.TagNumber(1)
  set owner($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => $_clearField(1);

  /// Escrow transaction sequence
  @$pb.TagNumber(2)
  $core.int get offerSequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set offerSequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOfferSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearOfferSequence() => $_clearField(2);

  /// Hex-encoded crypto condition
  @$pb.TagNumber(3)
  $core.String get condition => $_getSZ(2);
  @$pb.TagNumber(3)
  set condition($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCondition() => $_has(2);
  @$pb.TagNumber(3)
  void clearCondition() => $_clearField(3);

  /// Hex-encoded fulfillment matching condition
  @$pb.TagNumber(4)
  $core.String get fulfillment => $_getSZ(3);
  @$pb.TagNumber(4)
  set fulfillment($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFulfillment() => $_has(3);
  @$pb.TagNumber(4)
  void clearFulfillment() => $_clearField(4);
}

/// https://xrpl.org/nftokenburn.html
class OperationNFTokenBurn extends $pb.GeneratedMessage {
  factory OperationNFTokenBurn({
    $core.String? nftokenId,
  }) {
    final result = create();
    if (nftokenId != null) result.nftokenId = nftokenId;
    return result;
  }

  OperationNFTokenBurn._();

  factory OperationNFTokenBurn.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationNFTokenBurn.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationNFTokenBurn',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nftokenId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenBurn clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenBurn copyWith(void Function(OperationNFTokenBurn) updates) =>
      super.copyWith((message) => updates(message as OperationNFTokenBurn))
          as OperationNFTokenBurn;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationNFTokenBurn create() => OperationNFTokenBurn._();
  @$core.override
  OperationNFTokenBurn createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationNFTokenBurn getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationNFTokenBurn>(create);
  static OperationNFTokenBurn? _defaultInstance;

  /// Hex-encoded H256 NFTokenId
  @$pb.TagNumber(1)
  $core.String get nftokenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nftokenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNftokenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftokenId() => $_clearField(1);
}

/// https://xrpl.org/nftokencreateoffer.html
class OperationNFTokenCreateOffer extends $pb.GeneratedMessage {
  factory OperationNFTokenCreateOffer({
    $core.String? nftokenId,
    $core.String? destination,
  }) {
    final result = create();
    if (nftokenId != null) result.nftokenId = nftokenId;
    if (destination != null) result.destination = destination;
    return result;
  }

  OperationNFTokenCreateOffer._();

  factory OperationNFTokenCreateOffer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationNFTokenCreateOffer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationNFTokenCreateOffer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nftokenId')
    ..aOS(2, _omitFieldNames ? '' : 'destination')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenCreateOffer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenCreateOffer copyWith(
          void Function(OperationNFTokenCreateOffer) updates) =>
      super.copyWith(
              (message) => updates(message as OperationNFTokenCreateOffer))
          as OperationNFTokenCreateOffer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationNFTokenCreateOffer create() =>
      OperationNFTokenCreateOffer._();
  @$core.override
  OperationNFTokenCreateOffer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationNFTokenCreateOffer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationNFTokenCreateOffer>(create);
  static OperationNFTokenCreateOffer? _defaultInstance;

  /// Hex-encoded Hash256 NFTokenId
  @$pb.TagNumber(1)
  $core.String get nftokenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set nftokenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNftokenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNftokenId() => $_clearField(1);

  /// Destination account
  @$pb.TagNumber(2)
  $core.String get destination => $_getSZ(1);
  @$pb.TagNumber(2)
  set destination($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDestination() => $_has(1);
  @$pb.TagNumber(2)
  void clearDestination() => $_clearField(2);
}

/// https://xrpl.org/nftokenacceptoffer.html
class OperationNFTokenAcceptOffer extends $pb.GeneratedMessage {
  factory OperationNFTokenAcceptOffer({
    $core.String? sellOffer,
  }) {
    final result = create();
    if (sellOffer != null) result.sellOffer = sellOffer;
    return result;
  }

  OperationNFTokenAcceptOffer._();

  factory OperationNFTokenAcceptOffer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationNFTokenAcceptOffer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationNFTokenAcceptOffer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sellOffer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenAcceptOffer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenAcceptOffer copyWith(
          void Function(OperationNFTokenAcceptOffer) updates) =>
      super.copyWith(
              (message) => updates(message as OperationNFTokenAcceptOffer))
          as OperationNFTokenAcceptOffer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationNFTokenAcceptOffer create() =>
      OperationNFTokenAcceptOffer._();
  @$core.override
  OperationNFTokenAcceptOffer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationNFTokenAcceptOffer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationNFTokenAcceptOffer>(create);
  static OperationNFTokenAcceptOffer? _defaultInstance;

  /// Hex-encoded Hash256 NFTokenOffer
  @$pb.TagNumber(1)
  $core.String get sellOffer => $_getSZ(0);
  @$pb.TagNumber(1)
  set sellOffer($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSellOffer() => $_has(0);
  @$pb.TagNumber(1)
  void clearSellOffer() => $_clearField(1);
}

/// https://xrpl.org/nftokencanceloffer.html
class OperationNFTokenCancelOffer extends $pb.GeneratedMessage {
  factory OperationNFTokenCancelOffer({
    $core.Iterable<$core.String>? tokenOffers,
  }) {
    final result = create();
    if (tokenOffers != null) result.tokenOffers.addAll(tokenOffers);
    return result;
  }

  OperationNFTokenCancelOffer._();

  factory OperationNFTokenCancelOffer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OperationNFTokenCancelOffer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OperationNFTokenCancelOffer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'tokenOffers')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenCancelOffer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OperationNFTokenCancelOffer copyWith(
          void Function(OperationNFTokenCancelOffer) updates) =>
      super.copyWith(
              (message) => updates(message as OperationNFTokenCancelOffer))
          as OperationNFTokenCancelOffer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationNFTokenCancelOffer create() =>
      OperationNFTokenCancelOffer._();
  @$core.override
  OperationNFTokenCancelOffer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OperationNFTokenCancelOffer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OperationNFTokenCancelOffer>(create);
  static OperationNFTokenCancelOffer? _defaultInstance;

  /// Hex-encoded Vector256 NFTokenOffers
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get tokenOffers => $_getList(0);
}

enum SigningInput_OperationOneof {
  opTrustSet,
  opPayment,
  opNftokenBurn,
  opNftokenCreateOffer,
  opNftokenAcceptOffer,
  opNftokenCancelOffer,
  opEscrowCreate,
  opEscrowCancel,
  opEscrowFinish,
  notSet
}

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $fixnum.Int64? fee,
    $core.int? sequence,
    $core.int? lastLedgerSequence,
    $core.String? account,
    $fixnum.Int64? flags,
    $core.List<$core.int>? privateKey,
    OperationTrustSet? opTrustSet,
    OperationPayment? opPayment,
    OperationNFTokenBurn? opNftokenBurn,
    OperationNFTokenCreateOffer? opNftokenCreateOffer,
    OperationNFTokenAcceptOffer? opNftokenAcceptOffer,
    OperationNFTokenCancelOffer? opNftokenCancelOffer,
    $core.List<$core.int>? publicKey,
    OperationEscrowCreate? opEscrowCreate,
    OperationEscrowCancel? opEscrowCancel,
    OperationEscrowFinish? opEscrowFinish,
    $core.String? rawJson,
    $fixnum.Int64? sourceTag,
  }) {
    final result = create();
    if (fee != null) result.fee = fee;
    if (sequence != null) result.sequence = sequence;
    if (lastLedgerSequence != null)
      result.lastLedgerSequence = lastLedgerSequence;
    if (account != null) result.account = account;
    if (flags != null) result.flags = flags;
    if (privateKey != null) result.privateKey = privateKey;
    if (opTrustSet != null) result.opTrustSet = opTrustSet;
    if (opPayment != null) result.opPayment = opPayment;
    if (opNftokenBurn != null) result.opNftokenBurn = opNftokenBurn;
    if (opNftokenCreateOffer != null)
      result.opNftokenCreateOffer = opNftokenCreateOffer;
    if (opNftokenAcceptOffer != null)
      result.opNftokenAcceptOffer = opNftokenAcceptOffer;
    if (opNftokenCancelOffer != null)
      result.opNftokenCancelOffer = opNftokenCancelOffer;
    if (publicKey != null) result.publicKey = publicKey;
    if (opEscrowCreate != null) result.opEscrowCreate = opEscrowCreate;
    if (opEscrowCancel != null) result.opEscrowCancel = opEscrowCancel;
    if (opEscrowFinish != null) result.opEscrowFinish = opEscrowFinish;
    if (rawJson != null) result.rawJson = rawJson;
    if (sourceTag != null) result.sourceTag = sourceTag;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_OperationOneof>
      _SigningInput_OperationOneofByTag = {
    7: SigningInput_OperationOneof.opTrustSet,
    8: SigningInput_OperationOneof.opPayment,
    9: SigningInput_OperationOneof.opNftokenBurn,
    10: SigningInput_OperationOneof.opNftokenCreateOffer,
    11: SigningInput_OperationOneof.opNftokenAcceptOffer,
    12: SigningInput_OperationOneof.opNftokenCancelOffer,
    16: SigningInput_OperationOneof.opEscrowCreate,
    17: SigningInput_OperationOneof.opEscrowCancel,
    18: SigningInput_OperationOneof.opEscrowFinish,
    0: SigningInput_OperationOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
      createEmptyInstance: create)
    ..oo(0, [7, 8, 9, 10, 11, 12, 16, 17, 18])
    ..aInt64(1, _omitFieldNames ? '' : 'fee')
    ..aI(2, _omitFieldNames ? '' : 'sequence', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'lastLedgerSequence',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'account')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'flags', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<OperationTrustSet>(7, _omitFieldNames ? '' : 'opTrustSet',
        subBuilder: OperationTrustSet.create)
    ..aOM<OperationPayment>(8, _omitFieldNames ? '' : 'opPayment',
        subBuilder: OperationPayment.create)
    ..aOM<OperationNFTokenBurn>(9, _omitFieldNames ? '' : 'opNftokenBurn',
        subBuilder: OperationNFTokenBurn.create)
    ..aOM<OperationNFTokenCreateOffer>(
        10, _omitFieldNames ? '' : 'opNftokenCreateOffer',
        subBuilder: OperationNFTokenCreateOffer.create)
    ..aOM<OperationNFTokenAcceptOffer>(
        11, _omitFieldNames ? '' : 'opNftokenAcceptOffer',
        subBuilder: OperationNFTokenAcceptOffer.create)
    ..aOM<OperationNFTokenCancelOffer>(
        12, _omitFieldNames ? '' : 'opNftokenCancelOffer',
        subBuilder: OperationNFTokenCancelOffer.create)
    ..a<$core.List<$core.int>>(
        15, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aOM<OperationEscrowCreate>(16, _omitFieldNames ? '' : 'opEscrowCreate',
        subBuilder: OperationEscrowCreate.create)
    ..aOM<OperationEscrowCancel>(17, _omitFieldNames ? '' : 'opEscrowCancel',
        subBuilder: OperationEscrowCancel.create)
    ..aOM<OperationEscrowFinish>(18, _omitFieldNames ? '' : 'opEscrowFinish',
        subBuilder: OperationEscrowFinish.create)
    ..aOS(20, _omitFieldNames ? '' : 'rawJson')
    ..a<$fixnum.Int64>(
        25, _omitFieldNames ? '' : 'sourceTag', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
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

  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  SigningInput_OperationOneof whichOperationOneof() =>
      _SigningInput_OperationOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(16)
  @$pb.TagNumber(17)
  @$pb.TagNumber(18)
  void clearOperationOneof() => $_clearField($_whichOneof(0));

  /// Transfer fee
  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => $_clearField(1);

  /// Account sequence number
  @$pb.TagNumber(2)
  $core.int get sequence => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequence($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSequence() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequence() => $_clearField(2);

  /// Ledger sequence number
  @$pb.TagNumber(3)
  $core.int get lastLedgerSequence => $_getIZ(2);
  @$pb.TagNumber(3)
  set lastLedgerSequence($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastLedgerSequence() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastLedgerSequence() => $_clearField(3);

  /// Source account
  @$pb.TagNumber(4)
  $core.String get account => $_getSZ(3);
  @$pb.TagNumber(4)
  set account($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAccount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccount() => $_clearField(4);

  /// Transaction flags, optional
  /// It must fit uint32
  @$pb.TagNumber(5)
  $fixnum.Int64 get flags => $_getI64(4);
  @$pb.TagNumber(5)
  set flags($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFlags() => $_has(4);
  @$pb.TagNumber(5)
  void clearFlags() => $_clearField(5);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(6)
  $core.List<$core.int> get privateKey => $_getN(5);
  @$pb.TagNumber(6)
  set privateKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrivateKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrivateKey() => $_clearField(6);

  @$pb.TagNumber(7)
  OperationTrustSet get opTrustSet => $_getN(6);
  @$pb.TagNumber(7)
  set opTrustSet(OperationTrustSet value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasOpTrustSet() => $_has(6);
  @$pb.TagNumber(7)
  void clearOpTrustSet() => $_clearField(7);
  @$pb.TagNumber(7)
  OperationTrustSet ensureOpTrustSet() => $_ensure(6);

  @$pb.TagNumber(8)
  OperationPayment get opPayment => $_getN(7);
  @$pb.TagNumber(8)
  set opPayment(OperationPayment value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasOpPayment() => $_has(7);
  @$pb.TagNumber(8)
  void clearOpPayment() => $_clearField(8);
  @$pb.TagNumber(8)
  OperationPayment ensureOpPayment() => $_ensure(7);

  @$pb.TagNumber(9)
  OperationNFTokenBurn get opNftokenBurn => $_getN(8);
  @$pb.TagNumber(9)
  set opNftokenBurn(OperationNFTokenBurn value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasOpNftokenBurn() => $_has(8);
  @$pb.TagNumber(9)
  void clearOpNftokenBurn() => $_clearField(9);
  @$pb.TagNumber(9)
  OperationNFTokenBurn ensureOpNftokenBurn() => $_ensure(8);

  @$pb.TagNumber(10)
  OperationNFTokenCreateOffer get opNftokenCreateOffer => $_getN(9);
  @$pb.TagNumber(10)
  set opNftokenCreateOffer(OperationNFTokenCreateOffer value) =>
      $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasOpNftokenCreateOffer() => $_has(9);
  @$pb.TagNumber(10)
  void clearOpNftokenCreateOffer() => $_clearField(10);
  @$pb.TagNumber(10)
  OperationNFTokenCreateOffer ensureOpNftokenCreateOffer() => $_ensure(9);

  @$pb.TagNumber(11)
  OperationNFTokenAcceptOffer get opNftokenAcceptOffer => $_getN(10);
  @$pb.TagNumber(11)
  set opNftokenAcceptOffer(OperationNFTokenAcceptOffer value) =>
      $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasOpNftokenAcceptOffer() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpNftokenAcceptOffer() => $_clearField(11);
  @$pb.TagNumber(11)
  OperationNFTokenAcceptOffer ensureOpNftokenAcceptOffer() => $_ensure(10);

  @$pb.TagNumber(12)
  OperationNFTokenCancelOffer get opNftokenCancelOffer => $_getN(11);
  @$pb.TagNumber(12)
  set opNftokenCancelOffer(OperationNFTokenCancelOffer value) =>
      $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasOpNftokenCancelOffer() => $_has(11);
  @$pb.TagNumber(12)
  void clearOpNftokenCancelOffer() => $_clearField(12);
  @$pb.TagNumber(12)
  OperationNFTokenCancelOffer ensureOpNftokenCancelOffer() => $_ensure(11);

  /// Only used by tss chain-integration.
  @$pb.TagNumber(15)
  $core.List<$core.int> get publicKey => $_getN(12);
  @$pb.TagNumber(15)
  set publicKey($core.List<$core.int> value) => $_setBytes(12, value);
  @$pb.TagNumber(15)
  $core.bool hasPublicKey() => $_has(12);
  @$pb.TagNumber(15)
  void clearPublicKey() => $_clearField(15);

  @$pb.TagNumber(16)
  OperationEscrowCreate get opEscrowCreate => $_getN(13);
  @$pb.TagNumber(16)
  set opEscrowCreate(OperationEscrowCreate value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasOpEscrowCreate() => $_has(13);
  @$pb.TagNumber(16)
  void clearOpEscrowCreate() => $_clearField(16);
  @$pb.TagNumber(16)
  OperationEscrowCreate ensureOpEscrowCreate() => $_ensure(13);

  @$pb.TagNumber(17)
  OperationEscrowCancel get opEscrowCancel => $_getN(14);
  @$pb.TagNumber(17)
  set opEscrowCancel(OperationEscrowCancel value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasOpEscrowCancel() => $_has(14);
  @$pb.TagNumber(17)
  void clearOpEscrowCancel() => $_clearField(17);
  @$pb.TagNumber(17)
  OperationEscrowCancel ensureOpEscrowCancel() => $_ensure(14);

  @$pb.TagNumber(18)
  OperationEscrowFinish get opEscrowFinish => $_getN(15);
  @$pb.TagNumber(18)
  set opEscrowFinish(OperationEscrowFinish value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasOpEscrowFinish() => $_has(15);
  @$pb.TagNumber(18)
  void clearOpEscrowFinish() => $_clearField(18);
  @$pb.TagNumber(18)
  OperationEscrowFinish ensureOpEscrowFinish() => $_ensure(15);

  /// Generate a transaction from its JSON representation.
  /// The following parameters can be replaced from the `SigningInput` Protobuf:
  /// * Account
  /// * SigningPubKey
  /// * Fee
  /// * Sequence
  /// * LastLedgerSequence
  @$pb.TagNumber(20)
  $core.String get rawJson => $_getSZ(16);
  @$pb.TagNumber(20)
  set rawJson($core.String value) => $_setString(16, value);
  @$pb.TagNumber(20)
  $core.bool hasRawJson() => $_has(16);
  @$pb.TagNumber(20)
  void clearRawJson() => $_clearField(20);

  /// Arbitrary integer used to identify the reason for this payment, or a sender on whose behalf this transaction is made.
  /// Conventionally, a refund should specify the initial payment's SourceTag as the refund payment's DestinationTag.
  /// It must fit uint32.
  @$pb.TagNumber(25)
  $fixnum.Int64 get sourceTag => $_getI64(17);
  @$pb.TagNumber(25)
  set sourceTag($fixnum.Int64 value) => $_setInt64(17, value);
  @$pb.TagNumber(25)
  $core.bool hasSourceTag() => $_has(17);
  @$pb.TagNumber(25)
  void clearSourceTag() => $_clearField(25);
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
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ripple.Proto'),
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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
