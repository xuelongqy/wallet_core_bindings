// This is a generated file - do not edit.
//
// Generated from THORChainSwap.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Binance.pb.dart' as $2;
import 'Bitcoin.pb.dart' as $0;
import 'Cosmos.pb.dart' as $3;
import 'Ethereum.pb.dart' as $1;
import 'THORChainSwap.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'THORChainSwap.pbenum.dart';

/// An error code + a free text
class Error extends $pb.GeneratedMessage {
  factory Error({
    ErrorCode? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  Error._();

  factory Error.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Error.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Error',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.THORChainSwap.Proto'),
      createEmptyInstance: create)
    ..aE<ErrorCode>(1, _omitFieldNames ? '' : 'code',
        enumValues: ErrorCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Error clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Error copyWith(void Function(Error) updates) =>
      super.copyWith((message) => updates(message as Error)) as Error;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  @$core.override
  Error createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  /// code of the error
  @$pb.TagNumber(1)
  ErrorCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(ErrorCode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// optional error message
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Represents an asset.  Examples: BNB.BNB, RUNE.RUNE, BNB.RUNE-67C
class Asset extends $pb.GeneratedMessage {
  factory Asset({
    Chain? chain,
    $core.String? symbol,
    $core.String? tokenId,
  }) {
    final result = create();
    if (chain != null) result.chain = chain;
    if (symbol != null) result.symbol = symbol;
    if (tokenId != null) result.tokenId = tokenId;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.THORChainSwap.Proto'),
      createEmptyInstance: create)
    ..aE<Chain>(1, _omitFieldNames ? '' : 'chain', enumValues: Chain.values)
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aOS(3, _omitFieldNames ? '' : 'tokenId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  /// Chain ID
  @$pb.TagNumber(1)
  Chain get chain => $_getN(0);
  @$pb.TagNumber(1)
  set chain(Chain value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChain() => $_has(0);
  @$pb.TagNumber(1)
  void clearChain() => $_clearField(1);

  /// Symbol
  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => $_clearField(2);

  /// The ID of the token (blockchain-specific format)
  @$pb.TagNumber(3)
  $core.String get tokenId => $_getSZ(2);
  @$pb.TagNumber(3)
  set tokenId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => $_clearField(3);
}

class StreamParams extends $pb.GeneratedMessage {
  factory StreamParams({
    $core.String? interval,
    $core.String? quantity,
  }) {
    final result = create();
    if (interval != null) result.interval = interval;
    if (quantity != null) result.quantity = quantity;
    return result;
  }

  StreamParams._();

  factory StreamParams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamParams.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamParams',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.THORChainSwap.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'interval')
    ..aOS(2, _omitFieldNames ? '' : 'quantity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamParams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamParams copyWith(void Function(StreamParams) updates) =>
      super.copyWith((message) => updates(message as StreamParams))
          as StreamParams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamParams create() => StreamParams._();
  @$core.override
  StreamParams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StreamParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamParams>(create);
  static StreamParams? _defaultInstance;

  /// Optional Swap Interval ncy in blocks.
  /// The default is 1 - time-optimised means getting the trade done quickly, regardless of the cost.
  @$pb.TagNumber(1)
  $core.String get interval => $_getSZ(0);
  @$pb.TagNumber(1)
  set interval($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearInterval() => $_clearField(1);

  /// Optional Swap Quantity. Swap interval times every Interval blocks.
  /// The default is 0 - network will determine the number of swaps.
  @$pb.TagNumber(2)
  $core.String get quantity => $_getSZ(1);
  @$pb.TagNumber(2)
  set quantity($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);
}

/// Input for a swap between source and destination chains; for creating a TX on the source chain.
class SwapInput extends $pb.GeneratedMessage {
  factory SwapInput({
    Asset? fromAsset,
    $core.String? fromAddress,
    Asset? toAsset,
    $core.String? toAddress,
    $core.String? vaultAddress,
    $core.String? routerAddress,
    $core.String? fromAmount,
    $core.String? toAmountLimit,
    $core.String? affiliateFeeAddress,
    $core.String? affiliateFeeRateBp,
    $core.String? extraMemo,
    $fixnum.Int64? expirationTime,
    StreamParams? streamParams,
  }) {
    final result = create();
    if (fromAsset != null) result.fromAsset = fromAsset;
    if (fromAddress != null) result.fromAddress = fromAddress;
    if (toAsset != null) result.toAsset = toAsset;
    if (toAddress != null) result.toAddress = toAddress;
    if (vaultAddress != null) result.vaultAddress = vaultAddress;
    if (routerAddress != null) result.routerAddress = routerAddress;
    if (fromAmount != null) result.fromAmount = fromAmount;
    if (toAmountLimit != null) result.toAmountLimit = toAmountLimit;
    if (affiliateFeeAddress != null)
      result.affiliateFeeAddress = affiliateFeeAddress;
    if (affiliateFeeRateBp != null)
      result.affiliateFeeRateBp = affiliateFeeRateBp;
    if (extraMemo != null) result.extraMemo = extraMemo;
    if (expirationTime != null) result.expirationTime = expirationTime;
    if (streamParams != null) result.streamParams = streamParams;
    return result;
  }

  SwapInput._();

  factory SwapInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SwapInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SwapInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.THORChainSwap.Proto'),
      createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'fromAsset',
        subBuilder: Asset.create)
    ..aOS(2, _omitFieldNames ? '' : 'fromAddress')
    ..aOM<Asset>(3, _omitFieldNames ? '' : 'toAsset', subBuilder: Asset.create)
    ..aOS(4, _omitFieldNames ? '' : 'toAddress')
    ..aOS(5, _omitFieldNames ? '' : 'vaultAddress')
    ..aOS(6, _omitFieldNames ? '' : 'routerAddress')
    ..aOS(7, _omitFieldNames ? '' : 'fromAmount')
    ..aOS(8, _omitFieldNames ? '' : 'toAmountLimit')
    ..aOS(9, _omitFieldNames ? '' : 'affiliateFeeAddress')
    ..aOS(10, _omitFieldNames ? '' : 'affiliateFeeRateBp')
    ..aOS(11, _omitFieldNames ? '' : 'extraMemo')
    ..a<$fixnum.Int64>(
        12, _omitFieldNames ? '' : 'expirationTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<StreamParams>(13, _omitFieldNames ? '' : 'streamParams',
        subBuilder: StreamParams.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwapInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwapInput copyWith(void Function(SwapInput) updates) =>
      super.copyWith((message) => updates(message as SwapInput)) as SwapInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SwapInput create() => SwapInput._();
  @$core.override
  SwapInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SwapInput getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SwapInput>(create);
  static SwapInput? _defaultInstance;

  /// Source chain
  @$pb.TagNumber(1)
  Asset get fromAsset => $_getN(0);
  @$pb.TagNumber(1)
  set fromAsset(Asset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFromAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  Asset ensureFromAsset() => $_ensure(0);

  /// Source address, on source chain
  @$pb.TagNumber(2)
  $core.String get fromAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFromAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromAddress() => $_clearField(2);

  /// Destination chain+asset, on destination chain
  @$pb.TagNumber(3)
  Asset get toAsset => $_getN(2);
  @$pb.TagNumber(3)
  set toAsset(Asset value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasToAsset() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAsset() => $_clearField(3);
  @$pb.TagNumber(3)
  Asset ensureToAsset() => $_ensure(2);

  /// Destination address, on destination chain
  @$pb.TagNumber(4)
  $core.String get toAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set toAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearToAddress() => $_clearField(4);

  /// ThorChainSwap vault, on the source chain. Should be queried afresh, as it may change
  @$pb.TagNumber(5)
  $core.String get vaultAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set vaultAddress($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVaultAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearVaultAddress() => $_clearField(5);

  /// ThorChain router, only in case of Ethereum source network
  @$pb.TagNumber(6)
  $core.String get routerAddress => $_getSZ(5);
  @$pb.TagNumber(6)
  set routerAddress($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRouterAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearRouterAddress() => $_clearField(6);

  /// The source amount, integer as string, in the smallest native unit of the chain
  @$pb.TagNumber(7)
  $core.String get fromAmount => $_getSZ(6);
  @$pb.TagNumber(7)
  set fromAmount($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFromAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearFromAmount() => $_clearField(7);

  /// Optional minimum accepted destination amount.  Actual destination amount will depend on current rates, limit amount can be used to prevent using very unfavorable rates.
  /// The default is 0 - no price limit.
  @$pb.TagNumber(8)
  $core.String get toAmountLimit => $_getSZ(7);
  @$pb.TagNumber(8)
  set toAmountLimit($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasToAmountLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearToAmountLimit() => $_clearField(8);

  /// Optional affiliate fee destination address.  A Rune address.
  @$pb.TagNumber(9)
  $core.String get affiliateFeeAddress => $_getSZ(8);
  @$pb.TagNumber(9)
  set affiliateFeeAddress($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAffiliateFeeAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearAffiliateFeeAddress() => $_clearField(9);

  /// Optional affiliate fee, percentage base points, e.g. 100 means 1%, 0 - 1000, as string. Empty means to ignore it.
  @$pb.TagNumber(10)
  $core.String get affiliateFeeRateBp => $_getSZ(9);
  @$pb.TagNumber(10)
  set affiliateFeeRateBp($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasAffiliateFeeRateBp() => $_has(9);
  @$pb.TagNumber(10)
  void clearAffiliateFeeRateBp() => $_clearField(10);

  /// Optional extra custom memo, reserved for later use.
  @$pb.TagNumber(11)
  $core.String get extraMemo => $_getSZ(10);
  @$pb.TagNumber(11)
  set extraMemo($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasExtraMemo() => $_has(10);
  @$pb.TagNumber(11)
  void clearExtraMemo() => $_clearField(11);

  /// Optional expirationTime, will be now() + 15 min if not set
  @$pb.TagNumber(12)
  $fixnum.Int64 get expirationTime => $_getI64(11);
  @$pb.TagNumber(12)
  set expirationTime($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasExpirationTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearExpirationTime() => $_clearField(12);

  /// Optional streaming parameters. Use Streaming Swaps and Swap Optimisation strategy if set.
  /// https://docs.thorchain.org/thorchain-finance/continuous-liquidity-pools#streaming-swaps-and-swap-optimisation
  @$pb.TagNumber(13)
  StreamParams get streamParams => $_getN(12);
  @$pb.TagNumber(13)
  set streamParams(StreamParams value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasStreamParams() => $_has(12);
  @$pb.TagNumber(13)
  void clearStreamParams() => $_clearField(13);
  @$pb.TagNumber(13)
  StreamParams ensureStreamParams() => $_ensure(12);
}

enum SwapOutput_SigningInputOneof { bitcoin, ethereum, binance, cosmos, notSet }

/// Result of the swap, a SigningInput struct for the specific chain
class SwapOutput extends $pb.GeneratedMessage {
  factory SwapOutput({
    Chain? fromChain,
    Chain? toChain,
    Error? error,
    $0.SigningInput? bitcoin,
    $1.SigningInput? ethereum,
    $2.SigningInput? binance,
    $3.SigningInput? cosmos,
  }) {
    final result = create();
    if (fromChain != null) result.fromChain = fromChain;
    if (toChain != null) result.toChain = toChain;
    if (error != null) result.error = error;
    if (bitcoin != null) result.bitcoin = bitcoin;
    if (ethereum != null) result.ethereum = ethereum;
    if (binance != null) result.binance = binance;
    if (cosmos != null) result.cosmos = cosmos;
    return result;
  }

  SwapOutput._();

  factory SwapOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SwapOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SwapOutput_SigningInputOneof>
      _SwapOutput_SigningInputOneofByTag = {
    4: SwapOutput_SigningInputOneof.bitcoin,
    5: SwapOutput_SigningInputOneof.ethereum,
    6: SwapOutput_SigningInputOneof.binance,
    7: SwapOutput_SigningInputOneof.cosmos,
    0: SwapOutput_SigningInputOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SwapOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.THORChainSwap.Proto'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7])
    ..aE<Chain>(1, _omitFieldNames ? '' : 'fromChain', enumValues: Chain.values)
    ..aE<Chain>(2, _omitFieldNames ? '' : 'toChain', enumValues: Chain.values)
    ..aOM<Error>(3, _omitFieldNames ? '' : 'error', subBuilder: Error.create)
    ..aOM<$0.SigningInput>(4, _omitFieldNames ? '' : 'bitcoin',
        subBuilder: $0.SigningInput.create)
    ..aOM<$1.SigningInput>(5, _omitFieldNames ? '' : 'ethereum',
        subBuilder: $1.SigningInput.create)
    ..aOM<$2.SigningInput>(6, _omitFieldNames ? '' : 'binance',
        subBuilder: $2.SigningInput.create)
    ..aOM<$3.SigningInput>(7, _omitFieldNames ? '' : 'cosmos',
        subBuilder: $3.SigningInput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwapOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwapOutput copyWith(void Function(SwapOutput) updates) =>
      super.copyWith((message) => updates(message as SwapOutput)) as SwapOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SwapOutput create() => SwapOutput._();
  @$core.override
  SwapOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SwapOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SwapOutput>(create);
  static SwapOutput? _defaultInstance;

  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  SwapOutput_SigningInputOneof whichSigningInputOneof() =>
      _SwapOutput_SigningInputOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  void clearSigningInputOneof() => $_clearField($_whichOneof(0));

  /// Source chain
  @$pb.TagNumber(1)
  Chain get fromChain => $_getN(0);
  @$pb.TagNumber(1)
  set fromChain(Chain value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFromChain() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromChain() => $_clearField(1);

  /// Destination chain
  @$pb.TagNumber(2)
  Chain get toChain => $_getN(1);
  @$pb.TagNumber(2)
  set toChain(Chain value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasToChain() => $_has(1);
  @$pb.TagNumber(2)
  void clearToChain() => $_clearField(2);

  /// Error code, filled in case of error, OK/empty on success
  @$pb.TagNumber(3)
  Error get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(Error value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  Error ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.SigningInput get bitcoin => $_getN(3);
  @$pb.TagNumber(4)
  set bitcoin($0.SigningInput value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasBitcoin() => $_has(3);
  @$pb.TagNumber(4)
  void clearBitcoin() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.SigningInput ensureBitcoin() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.SigningInput get ethereum => $_getN(4);
  @$pb.TagNumber(5)
  set ethereum($1.SigningInput value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasEthereum() => $_has(4);
  @$pb.TagNumber(5)
  void clearEthereum() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.SigningInput ensureEthereum() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.SigningInput get binance => $_getN(5);
  @$pb.TagNumber(6)
  set binance($2.SigningInput value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasBinance() => $_has(5);
  @$pb.TagNumber(6)
  void clearBinance() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.SigningInput ensureBinance() => $_ensure(5);

  @$pb.TagNumber(7)
  $3.SigningInput get cosmos => $_getN(6);
  @$pb.TagNumber(7)
  set cosmos($3.SigningInput value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCosmos() => $_has(6);
  @$pb.TagNumber(7)
  void clearCosmos() => $_clearField(7);
  @$pb.TagNumber(7)
  $3.SigningInput ensureCosmos() => $_ensure(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
