// This is a generated file - do not edit.
//
// Generated from Ethereum.proto.

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
import 'Ethereum.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Ethereum.pbenum.dart';

/// Native coin transfer transaction
class Transaction_Transfer extends $pb.GeneratedMessage {
  factory Transaction_Transfer({
    $core.List<$core.int>? amount,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (data != null) result.data = data;
    return result;
  }

  Transaction_Transfer._();

  factory Transaction_Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_Transfer copyWith(void Function(Transaction_Transfer) updates) =>
      super.copyWith((message) => updates(message as Transaction_Transfer))
          as Transaction_Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_Transfer create() => Transaction_Transfer._();
  @$core.override
  Transaction_Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_Transfer>(create);
  static Transaction_Transfer? _defaultInstance;

  /// Amount to send in wei (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get amount => $_getN(0);
  @$pb.TagNumber(1)
  set amount($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  /// Optional payload data
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
}

/// ERC20 token transfer transaction
class Transaction_ERC20Transfer extends $pb.GeneratedMessage {
  factory Transaction_ERC20Transfer({
    $core.String? to,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (to != null) result.to = to;
    if (amount != null) result.amount = amount;
    return result;
  }

  Transaction_ERC20Transfer._();

  factory Transaction_ERC20Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_ERC20Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.ERC20Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC20Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC20Transfer copyWith(
          void Function(Transaction_ERC20Transfer) updates) =>
      super.copyWith((message) => updates(message as Transaction_ERC20Transfer))
          as Transaction_ERC20Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_ERC20Transfer create() => Transaction_ERC20Transfer._();
  @$core.override
  Transaction_ERC20Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_ERC20Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_ERC20Transfer>(create);
  static Transaction_ERC20Transfer? _defaultInstance;

  /// destination address (string)
  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => $_clearField(1);

  /// Amount to send (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// ERC20 approve transaction
class Transaction_ERC20Approve extends $pb.GeneratedMessage {
  factory Transaction_ERC20Approve({
    $core.String? spender,
    $core.List<$core.int>? amount,
  }) {
    final result = create();
    if (spender != null) result.spender = spender;
    if (amount != null) result.amount = amount;
    return result;
  }

  Transaction_ERC20Approve._();

  factory Transaction_ERC20Approve.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_ERC20Approve.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.ERC20Approve',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'spender')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC20Approve clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC20Approve copyWith(
          void Function(Transaction_ERC20Approve) updates) =>
      super.copyWith((message) => updates(message as Transaction_ERC20Approve))
          as Transaction_ERC20Approve;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_ERC20Approve create() => Transaction_ERC20Approve._();
  @$core.override
  Transaction_ERC20Approve createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_ERC20Approve getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_ERC20Approve>(create);
  static Transaction_ERC20Approve? _defaultInstance;

  /// Target of the approval
  @$pb.TagNumber(1)
  $core.String get spender => $_getSZ(0);
  @$pb.TagNumber(1)
  set spender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSpender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSpender() => $_clearField(1);

  /// Amount to send (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// ERC721 NFT transfer transaction
class Transaction_ERC721Transfer extends $pb.GeneratedMessage {
  factory Transaction_ERC721Transfer({
    $core.String? from,
    $core.String? to,
    $core.List<$core.int>? tokenId,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (tokenId != null) result.tokenId = tokenId;
    return result;
  }

  Transaction_ERC721Transfer._();

  factory Transaction_ERC721Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_ERC721Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.ERC721Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tokenId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC721Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC721Transfer copyWith(
          void Function(Transaction_ERC721Transfer) updates) =>
      super.copyWith(
              (message) => updates(message as Transaction_ERC721Transfer))
          as Transaction_ERC721Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_ERC721Transfer create() => Transaction_ERC721Transfer._();
  @$core.override
  Transaction_ERC721Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_ERC721Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_ERC721Transfer>(create);
  static Transaction_ERC721Transfer? _defaultInstance;

  /// Source address
  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// Destination address
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// ID of the token (uint256, serialized big endian)
  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => $_clearField(3);
}

/// ERC1155 NFT transfer transaction
class Transaction_ERC1155Transfer extends $pb.GeneratedMessage {
  factory Transaction_ERC1155Transfer({
    $core.String? from,
    $core.String? to,
    $core.List<$core.int>? tokenId,
    $core.List<$core.int>? value,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (tokenId != null) result.tokenId = tokenId;
    if (value != null) result.value = value;
    if (data != null) result.data = data;
    return result;
  }

  Transaction_ERC1155Transfer._();

  factory Transaction_ERC1155Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_ERC1155Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.ERC1155Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'from')
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'tokenId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC1155Transfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ERC1155Transfer copyWith(
          void Function(Transaction_ERC1155Transfer) updates) =>
      super.copyWith(
              (message) => updates(message as Transaction_ERC1155Transfer))
          as Transaction_ERC1155Transfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_ERC1155Transfer create() =>
      Transaction_ERC1155Transfer._();
  @$core.override
  Transaction_ERC1155Transfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_ERC1155Transfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_ERC1155Transfer>(create);
  static Transaction_ERC1155Transfer? _defaultInstance;

  /// Source address
  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  /// Destination address
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => $_clearField(2);

  /// ID of the token (uint256, serialized big endian)
  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => $_clearField(3);

  /// The amount of tokens being transferred (uint256, serialized big endian)
  @$pb.TagNumber(4)
  $core.List<$core.int> get value => $_getN(3);
  @$pb.TagNumber(4)
  set value($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get data => $_getN(4);
  @$pb.TagNumber(5)
  set data($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => $_clearField(5);
}

/// Generic smart contract transaction
class Transaction_ContractGeneric extends $pb.GeneratedMessage {
  factory Transaction_ContractGeneric({
    $core.List<$core.int>? amount,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (data != null) result.data = data;
    return result;
  }

  Transaction_ContractGeneric._();

  factory Transaction_ContractGeneric.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_ContractGeneric.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.ContractGeneric',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ContractGeneric clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_ContractGeneric copyWith(
          void Function(Transaction_ContractGeneric) updates) =>
      super.copyWith(
              (message) => updates(message as Transaction_ContractGeneric))
          as Transaction_ContractGeneric;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_ContractGeneric create() =>
      Transaction_ContractGeneric._();
  @$core.override
  Transaction_ContractGeneric createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_ContractGeneric getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_ContractGeneric>(create);
  static Transaction_ContractGeneric? _defaultInstance;

  /// Amount to send in wei (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get amount => $_getN(0);
  @$pb.TagNumber(1)
  set amount($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  /// Contract call payload data
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
}

class Transaction_SCWalletBatch_BatchedCall extends $pb.GeneratedMessage {
  factory Transaction_SCWalletBatch_BatchedCall({
    $core.String? address,
    $core.List<$core.int>? amount,
    $core.List<$core.int>? payload,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (amount != null) result.amount = amount;
    if (payload != null) result.payload = payload;
    return result;
  }

  Transaction_SCWalletBatch_BatchedCall._();

  factory Transaction_SCWalletBatch_BatchedCall.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_SCWalletBatch_BatchedCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.SCWalletBatch.BatchedCall',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_SCWalletBatch_BatchedCall clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_SCWalletBatch_BatchedCall copyWith(
          void Function(Transaction_SCWalletBatch_BatchedCall) updates) =>
      super.copyWith((message) =>
              updates(message as Transaction_SCWalletBatch_BatchedCall))
          as Transaction_SCWalletBatch_BatchedCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_SCWalletBatch_BatchedCall create() =>
      Transaction_SCWalletBatch_BatchedCall._();
  @$core.override
  Transaction_SCWalletBatch_BatchedCall createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_SCWalletBatch_BatchedCall getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          Transaction_SCWalletBatch_BatchedCall>(create);
  static Transaction_SCWalletBatch_BatchedCall? _defaultInstance;

  /// Recipient addresses.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// Amounts to send in wei (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  /// Contract call payloads data
  @$pb.TagNumber(3)
  $core.List<$core.int> get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => $_clearField(3);
}

/// Batch transaction to a Smart Contract Wallet (ERC-4337 and ERC-7702).
class Transaction_SCWalletBatch extends $pb.GeneratedMessage {
  factory Transaction_SCWalletBatch({
    $core.Iterable<Transaction_SCWalletBatch_BatchedCall>? calls,
    SCWalletType? walletType,
  }) {
    final result = create();
    if (calls != null) result.calls.addAll(calls);
    if (walletType != null) result.walletType = walletType;
    return result;
  }

  Transaction_SCWalletBatch._();

  factory Transaction_SCWalletBatch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_SCWalletBatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.SCWalletBatch',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..pPM<Transaction_SCWalletBatch_BatchedCall>(
        1, _omitFieldNames ? '' : 'calls',
        subBuilder: Transaction_SCWalletBatch_BatchedCall.create)
    ..aE<SCWalletType>(2, _omitFieldNames ? '' : 'walletType',
        enumValues: SCWalletType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_SCWalletBatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_SCWalletBatch copyWith(
          void Function(Transaction_SCWalletBatch) updates) =>
      super.copyWith((message) => updates(message as Transaction_SCWalletBatch))
          as Transaction_SCWalletBatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_SCWalletBatch create() => Transaction_SCWalletBatch._();
  @$core.override
  Transaction_SCWalletBatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_SCWalletBatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_SCWalletBatch>(create);
  static Transaction_SCWalletBatch? _defaultInstance;

  /// Batched calls to be executed on the smart contract wallet.
  @$pb.TagNumber(1)
  $pb.PbList<Transaction_SCWalletBatch_BatchedCall> get calls => $_getList(0);

  /// Smart contract wallet type.
  @$pb.TagNumber(2)
  SCWalletType get walletType => $_getN(1);
  @$pb.TagNumber(2)
  set walletType(SCWalletType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWalletType() => $_has(1);
  @$pb.TagNumber(2)
  void clearWalletType() => $_clearField(2);
}

/// Execute transaction to a Smart Contract Wallet (ERC-4337 and ERC-7702).
class Transaction_SCWalletExecute extends $pb.GeneratedMessage {
  factory Transaction_SCWalletExecute({
    Transaction? transaction,
    SCWalletType? walletType,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    if (walletType != null) result.walletType = walletType;
    return result;
  }

  Transaction_SCWalletExecute._();

  factory Transaction_SCWalletExecute.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction_SCWalletExecute.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction.SCWalletExecute',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..aE<SCWalletType>(2, _omitFieldNames ? '' : 'walletType',
        enumValues: SCWalletType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_SCWalletExecute clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction_SCWalletExecute copyWith(
          void Function(Transaction_SCWalletExecute) updates) =>
      super.copyWith(
              (message) => updates(message as Transaction_SCWalletExecute))
          as Transaction_SCWalletExecute;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction_SCWalletExecute create() =>
      Transaction_SCWalletExecute._();
  @$core.override
  Transaction_SCWalletExecute createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transaction_SCWalletExecute getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction_SCWalletExecute>(create);
  static Transaction_SCWalletExecute? _defaultInstance;

  /// Transaction to be executed on the smart contract wallet.
  /// TODO currently, smart contract wallet address is specified in `SigningInput.toAddress`, but it will be refactored soon.
  @$pb.TagNumber(1)
  Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(Transaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTransaction() => $_ensure(0);

  /// Smart contract wallet type.
  @$pb.TagNumber(2)
  SCWalletType get walletType => $_getN(1);
  @$pb.TagNumber(2)
  set walletType(SCWalletType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWalletType() => $_has(1);
  @$pb.TagNumber(2)
  void clearWalletType() => $_clearField(2);
}

enum Transaction_TransactionOneof {
  transfer,
  erc20Transfer,
  erc20Approve,
  erc721Transfer,
  erc1155Transfer,
  contractGeneric,
  scwBatch,
  scwExecute,
  notSet
}

/// Transaction (transfer, smart contract call, ...)
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    Transaction_Transfer? transfer,
    Transaction_ERC20Transfer? erc20Transfer,
    Transaction_ERC20Approve? erc20Approve,
    Transaction_ERC721Transfer? erc721Transfer,
    Transaction_ERC1155Transfer? erc1155Transfer,
    Transaction_ContractGeneric? contractGeneric,
    Transaction_SCWalletBatch? scwBatch,
    Transaction_SCWalletExecute? scwExecute,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (erc20Transfer != null) result.erc20Transfer = erc20Transfer;
    if (erc20Approve != null) result.erc20Approve = erc20Approve;
    if (erc721Transfer != null) result.erc721Transfer = erc721Transfer;
    if (erc1155Transfer != null) result.erc1155Transfer = erc1155Transfer;
    if (contractGeneric != null) result.contractGeneric = contractGeneric;
    if (scwBatch != null) result.scwBatch = scwBatch;
    if (scwExecute != null) result.scwExecute = scwExecute;
    return result;
  }

  Transaction._();

  factory Transaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Transaction_TransactionOneof>
      _Transaction_TransactionOneofByTag = {
    1: Transaction_TransactionOneof.transfer,
    2: Transaction_TransactionOneof.erc20Transfer,
    3: Transaction_TransactionOneof.erc20Approve,
    4: Transaction_TransactionOneof.erc721Transfer,
    5: Transaction_TransactionOneof.erc1155Transfer,
    6: Transaction_TransactionOneof.contractGeneric,
    7: Transaction_TransactionOneof.scwBatch,
    8: Transaction_TransactionOneof.scwExecute,
    0: Transaction_TransactionOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8])
    ..aOM<Transaction_Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transaction_Transfer.create)
    ..aOM<Transaction_ERC20Transfer>(2, _omitFieldNames ? '' : 'erc20Transfer',
        subBuilder: Transaction_ERC20Transfer.create)
    ..aOM<Transaction_ERC20Approve>(3, _omitFieldNames ? '' : 'erc20Approve',
        subBuilder: Transaction_ERC20Approve.create)
    ..aOM<Transaction_ERC721Transfer>(
        4, _omitFieldNames ? '' : 'erc721Transfer',
        subBuilder: Transaction_ERC721Transfer.create)
    ..aOM<Transaction_ERC1155Transfer>(
        5, _omitFieldNames ? '' : 'erc1155Transfer',
        subBuilder: Transaction_ERC1155Transfer.create)
    ..aOM<Transaction_ContractGeneric>(
        6, _omitFieldNames ? '' : 'contractGeneric',
        subBuilder: Transaction_ContractGeneric.create)
    ..aOM<Transaction_SCWalletBatch>(7, _omitFieldNames ? '' : 'scwBatch',
        subBuilder: Transaction_SCWalletBatch.create)
    ..aOM<Transaction_SCWalletExecute>(8, _omitFieldNames ? '' : 'scwExecute',
        subBuilder: Transaction_SCWalletExecute.create)
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

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  Transaction_TransactionOneof whichTransactionOneof() =>
      _Transaction_TransactionOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearTransactionOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Transaction_Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transaction_Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction_Transfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  Transaction_ERC20Transfer get erc20Transfer => $_getN(1);
  @$pb.TagNumber(2)
  set erc20Transfer(Transaction_ERC20Transfer value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasErc20Transfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearErc20Transfer() => $_clearField(2);
  @$pb.TagNumber(2)
  Transaction_ERC20Transfer ensureErc20Transfer() => $_ensure(1);

  @$pb.TagNumber(3)
  Transaction_ERC20Approve get erc20Approve => $_getN(2);
  @$pb.TagNumber(3)
  set erc20Approve(Transaction_ERC20Approve value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasErc20Approve() => $_has(2);
  @$pb.TagNumber(3)
  void clearErc20Approve() => $_clearField(3);
  @$pb.TagNumber(3)
  Transaction_ERC20Approve ensureErc20Approve() => $_ensure(2);

  @$pb.TagNumber(4)
  Transaction_ERC721Transfer get erc721Transfer => $_getN(3);
  @$pb.TagNumber(4)
  set erc721Transfer(Transaction_ERC721Transfer value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasErc721Transfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearErc721Transfer() => $_clearField(4);
  @$pb.TagNumber(4)
  Transaction_ERC721Transfer ensureErc721Transfer() => $_ensure(3);

  @$pb.TagNumber(5)
  Transaction_ERC1155Transfer get erc1155Transfer => $_getN(4);
  @$pb.TagNumber(5)
  set erc1155Transfer(Transaction_ERC1155Transfer value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasErc1155Transfer() => $_has(4);
  @$pb.TagNumber(5)
  void clearErc1155Transfer() => $_clearField(5);
  @$pb.TagNumber(5)
  Transaction_ERC1155Transfer ensureErc1155Transfer() => $_ensure(4);

  @$pb.TagNumber(6)
  Transaction_ContractGeneric get contractGeneric => $_getN(5);
  @$pb.TagNumber(6)
  set contractGeneric(Transaction_ContractGeneric value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasContractGeneric() => $_has(5);
  @$pb.TagNumber(6)
  void clearContractGeneric() => $_clearField(6);
  @$pb.TagNumber(6)
  Transaction_ContractGeneric ensureContractGeneric() => $_ensure(5);

  /// Batch transaction to a Smart Contract Wallet (ERC-4337 and ERC-7702).
  @$pb.TagNumber(7)
  Transaction_SCWalletBatch get scwBatch => $_getN(6);
  @$pb.TagNumber(7)
  set scwBatch(Transaction_SCWalletBatch value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasScwBatch() => $_has(6);
  @$pb.TagNumber(7)
  void clearScwBatch() => $_clearField(7);
  @$pb.TagNumber(7)
  Transaction_SCWalletBatch ensureScwBatch() => $_ensure(6);

  /// Execute transaction to a Smart Contract Wallet (ERC-4337 and ERC-7702).
  @$pb.TagNumber(8)
  Transaction_SCWalletExecute get scwExecute => $_getN(7);
  @$pb.TagNumber(8)
  set scwExecute(Transaction_SCWalletExecute value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasScwExecute() => $_has(7);
  @$pb.TagNumber(8)
  void clearScwExecute() => $_clearField(8);
  @$pb.TagNumber(8)
  Transaction_SCWalletExecute ensureScwExecute() => $_ensure(7);
}

/// ERC-4337 structure that describes a transaction to be sent on behalf of a user
class UserOperation extends $pb.GeneratedMessage {
  factory UserOperation({
    $core.String? entryPoint,
    $core.List<$core.int>? initCode,
    $core.String? sender,
    $core.List<$core.int>? preVerificationGas,
    $core.List<$core.int>? verificationGasLimit,
    $core.List<$core.int>? paymasterAndData,
  }) {
    final result = create();
    if (entryPoint != null) result.entryPoint = entryPoint;
    if (initCode != null) result.initCode = initCode;
    if (sender != null) result.sender = sender;
    if (preVerificationGas != null)
      result.preVerificationGas = preVerificationGas;
    if (verificationGasLimit != null)
      result.verificationGasLimit = verificationGasLimit;
    if (paymasterAndData != null) result.paymasterAndData = paymasterAndData;
    return result;
  }

  UserOperation._();

  factory UserOperation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserOperation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserOperation',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'entryPoint')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'initCode', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'sender')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'preVerificationGas', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'verificationGasLimit', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'paymasterAndData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOperation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOperation copyWith(void Function(UserOperation) updates) =>
      super.copyWith((message) => updates(message as UserOperation))
          as UserOperation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOperation create() => UserOperation._();
  @$core.override
  UserOperation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserOperation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserOperation>(create);
  static UserOperation? _defaultInstance;

  /// Entry point contract address
  @$pb.TagNumber(1)
  $core.String get entryPoint => $_getSZ(0);
  @$pb.TagNumber(1)
  set entryPoint($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEntryPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntryPoint() => $_clearField(1);

  /// Account factory contract address
  @$pb.TagNumber(2)
  $core.List<$core.int> get initCode => $_getN(1);
  @$pb.TagNumber(2)
  set initCode($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInitCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearInitCode() => $_clearField(2);

  /// Account logic contract address
  @$pb.TagNumber(3)
  $core.String get sender => $_getSZ(2);
  @$pb.TagNumber(3)
  set sender($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSender() => $_has(2);
  @$pb.TagNumber(3)
  void clearSender() => $_clearField(3);

  /// The amount of gas to pay for to compensate the bundler for pre-verification execution and calldata
  @$pb.TagNumber(4)
  $core.List<$core.int> get preVerificationGas => $_getN(3);
  @$pb.TagNumber(4)
  set preVerificationGas($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPreVerificationGas() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreVerificationGas() => $_clearField(4);

  /// The amount of gas to allocate for the verification step
  @$pb.TagNumber(5)
  $core.List<$core.int> get verificationGasLimit => $_getN(4);
  @$pb.TagNumber(5)
  set verificationGasLimit($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVerificationGasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerificationGasLimit() => $_clearField(5);

  /// Address of paymaster sponsoring the transaction, followed by extra data to send to the paymaster (empty for self-sponsored transaction)
  @$pb.TagNumber(6)
  $core.List<$core.int> get paymasterAndData => $_getN(5);
  @$pb.TagNumber(6)
  set paymasterAndData($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPaymasterAndData() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaymasterAndData() => $_clearField(6);
}

/// EIP-7702 compatible ERC-4337 structure that describes a transaction to be sent on behalf of a user
class UserOperationV0_7 extends $pb.GeneratedMessage {
  factory UserOperationV0_7({
    $core.String? entryPoint,
    $core.String? factory,
    $core.List<$core.int>? factoryData,
    $core.String? sender,
    $core.List<$core.int>? preVerificationGas,
    $core.List<$core.int>? verificationGasLimit,
    $core.String? paymaster,
    $core.List<$core.int>? paymasterVerificationGasLimit,
    $core.List<$core.int>? paymasterPostOpGasLimit,
    $core.List<$core.int>? paymasterData,
  }) {
    final result = create();
    if (entryPoint != null) result.entryPoint = entryPoint;
    if (factory != null) result.factory = factory;
    if (factoryData != null) result.factoryData = factoryData;
    if (sender != null) result.sender = sender;
    if (preVerificationGas != null)
      result.preVerificationGas = preVerificationGas;
    if (verificationGasLimit != null)
      result.verificationGasLimit = verificationGasLimit;
    if (paymaster != null) result.paymaster = paymaster;
    if (paymasterVerificationGasLimit != null)
      result.paymasterVerificationGasLimit = paymasterVerificationGasLimit;
    if (paymasterPostOpGasLimit != null)
      result.paymasterPostOpGasLimit = paymasterPostOpGasLimit;
    if (paymasterData != null) result.paymasterData = paymasterData;
    return result;
  }

  UserOperationV0_7._();

  factory UserOperationV0_7.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserOperationV0_7.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserOperationV0_7',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'entryPoint')
    ..aOS(2, _omitFieldNames ? '' : 'factory')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'factoryData', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'sender')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'preVerificationGas', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'verificationGasLimit', $pb.PbFieldType.OY)
    ..aOS(7, _omitFieldNames ? '' : 'paymaster')
    ..a<$core.List<$core.int>>(
        8,
        _omitFieldNames ? '' : 'paymasterVerificationGasLimit',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'paymasterPostOpGasLimit', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        10, _omitFieldNames ? '' : 'paymasterData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOperationV0_7 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOperationV0_7 copyWith(void Function(UserOperationV0_7) updates) =>
      super.copyWith((message) => updates(message as UserOperationV0_7))
          as UserOperationV0_7;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOperationV0_7 create() => UserOperationV0_7._();
  @$core.override
  UserOperationV0_7 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserOperationV0_7 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserOperationV0_7>(create);
  static UserOperationV0_7? _defaultInstance;

  /// Entry point contract address
  @$pb.TagNumber(1)
  $core.String get entryPoint => $_getSZ(0);
  @$pb.TagNumber(1)
  set entryPoint($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEntryPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntryPoint() => $_clearField(1);

  /// Account factory contract address
  @$pb.TagNumber(2)
  $core.String get factory => $_getSZ(1);
  @$pb.TagNumber(2)
  set factory($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFactory() => $_has(1);
  @$pb.TagNumber(2)
  void clearFactory() => $_clearField(2);

  /// Account factory data
  @$pb.TagNumber(3)
  $core.List<$core.int> get factoryData => $_getN(2);
  @$pb.TagNumber(3)
  set factoryData($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFactoryData() => $_has(2);
  @$pb.TagNumber(3)
  void clearFactoryData() => $_clearField(3);

  /// Account logic contract address
  @$pb.TagNumber(4)
  $core.String get sender => $_getSZ(3);
  @$pb.TagNumber(4)
  set sender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSender() => $_has(3);
  @$pb.TagNumber(4)
  void clearSender() => $_clearField(4);

  /// The amount of gas to pay for to compensate the bundler for pre-verification execution and calldata
  @$pb.TagNumber(5)
  $core.List<$core.int> get preVerificationGas => $_getN(4);
  @$pb.TagNumber(5)
  set preVerificationGas($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPreVerificationGas() => $_has(4);
  @$pb.TagNumber(5)
  void clearPreVerificationGas() => $_clearField(5);

  /// The amount of gas to allocate for the verification step
  @$pb.TagNumber(6)
  $core.List<$core.int> get verificationGasLimit => $_getN(5);
  @$pb.TagNumber(6)
  set verificationGasLimit($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVerificationGasLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearVerificationGasLimit() => $_clearField(6);

  /// Address of paymaster
  @$pb.TagNumber(7)
  $core.String get paymaster => $_getSZ(6);
  @$pb.TagNumber(7)
  set paymaster($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPaymaster() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaymaster() => $_clearField(7);

  /// The amount of gas to allocate for the paymaster verification step
  @$pb.TagNumber(8)
  $core.List<$core.int> get paymasterVerificationGasLimit => $_getN(7);
  @$pb.TagNumber(8)
  set paymasterVerificationGasLimit($core.List<$core.int> value) =>
      $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPaymasterVerificationGasLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearPaymasterVerificationGasLimit() => $_clearField(8);

  /// The amount of gas to allocate for paymaster post ops
  @$pb.TagNumber(9)
  $core.List<$core.int> get paymasterPostOpGasLimit => $_getN(8);
  @$pb.TagNumber(9)
  set paymasterPostOpGasLimit($core.List<$core.int> value) =>
      $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPaymasterPostOpGasLimit() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymasterPostOpGasLimit() => $_clearField(9);

  /// Paymaster data
  @$pb.TagNumber(10)
  $core.List<$core.int> get paymasterData => $_getN(9);
  @$pb.TagNumber(10)
  set paymasterData($core.List<$core.int> value) => $_setBytes(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPaymasterData() => $_has(9);
  @$pb.TagNumber(10)
  void clearPaymasterData() => $_clearField(10);
}

/// An item of the [EIP-2930](https://eips.ethereum.org/EIPS/eip-2930) access list.
class Access extends $pb.GeneratedMessage {
  factory Access({
    $core.String? address,
    $core.Iterable<$core.List<$core.int>>? storedKeys,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (storedKeys != null) result.storedKeys.addAll(storedKeys);
    return result;
  }

  Access._();

  factory Access.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Access.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Access',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'storedKeys', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Access clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Access copyWith(void Function(Access) updates) =>
      super.copyWith((message) => updates(message as Access)) as Access;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Access create() => Access._();
  @$core.override
  Access createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Access getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Access>(create);
  static Access? _defaultInstance;

  /// Address to be accessed by the transaction.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => $_clearField(1);

  /// Storage keys to be accessed by the transaction.
  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get storedKeys => $_getList(1);
}

/// [EIP-7702](https://eips.ethereum.org/EIPS/eip-7702) authorization.
class Authorization extends $pb.GeneratedMessage {
  factory Authorization({
    $core.String? address,
    AuthorizationCustomSignature? customSignature,
  }) {
    final result = create();
    if (address != null) result.address = address;
    if (customSignature != null) result.customSignature = customSignature;
    return result;
  }

  Authorization._();

  factory Authorization.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Authorization.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Authorization',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aOM<AuthorizationCustomSignature>(
        3, _omitFieldNames ? '' : 'customSignature',
        subBuilder: AuthorizationCustomSignature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Authorization clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Authorization copyWith(void Function(Authorization) updates) =>
      super.copyWith((message) => updates(message as Authorization))
          as Authorization;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Authorization create() => Authorization._();
  @$core.override
  Authorization createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Authorization getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Authorization>(create);
  static Authorization? _defaultInstance;

  /// Address to be authorized, a smart contract address.
  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  /// If custom_signature isn't provided, the authorization will be signed with the provided private key, nonce and chainId
  @$pb.TagNumber(3)
  AuthorizationCustomSignature get customSignature => $_getN(1);
  @$pb.TagNumber(3)
  set customSignature(AuthorizationCustomSignature value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomSignature() => $_has(1);
  @$pb.TagNumber(3)
  void clearCustomSignature() => $_clearField(3);
  @$pb.TagNumber(3)
  AuthorizationCustomSignature ensureCustomSignature() => $_ensure(1);
}

/// [EIP-7702](https://eips.ethereum.org/EIPS/eip-7702) authorization.
class AuthorizationCustomSignature extends $pb.GeneratedMessage {
  factory AuthorizationCustomSignature({
    $core.List<$core.int>? chainId,
    $core.List<$core.int>? nonce,
    $core.String? signature,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (nonce != null) result.nonce = nonce;
    if (signature != null) result.signature = signature;
    return result;
  }

  AuthorizationCustomSignature._();

  factory AuthorizationCustomSignature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthorizationCustomSignature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthorizationCustomSignature',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'chainId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'signature')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthorizationCustomSignature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthorizationCustomSignature copyWith(
          void Function(AuthorizationCustomSignature) updates) =>
      super.copyWith(
              (message) => updates(message as AuthorizationCustomSignature))
          as AuthorizationCustomSignature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthorizationCustomSignature create() =>
      AuthorizationCustomSignature._();
  @$core.override
  AuthorizationCustomSignature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthorizationCustomSignature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthorizationCustomSignature>(create);
  static AuthorizationCustomSignature? _defaultInstance;

  /// Chain id (uint256, serialized big endian).
  @$pb.TagNumber(1)
  $core.List<$core.int> get chainId => $_getN(0);
  @$pb.TagNumber(1)
  set chainId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// Nonce, the nonce of authority.
  @$pb.TagNumber(2)
  $core.List<$core.int> get nonce => $_getN(1);
  @$pb.TagNumber(2)
  set nonce($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => $_clearField(2);

  /// The signature, Hex-encoded.
  @$pb.TagNumber(3)
  $core.String get signature => $_getSZ(2);
  @$pb.TagNumber(3)
  set signature($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);
}

enum SigningInput_UserOperationOneof { userOperation, userOperationV07, notSet }

/// Input data necessary to create a signed transaction.
/// Legacy and EIP2718/EIP1559 transactions supported, see TransactionMode.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? chainId,
    $core.List<$core.int>? nonce,
    TransactionMode? txMode,
    $core.List<$core.int>? gasPrice,
    $core.List<$core.int>? gasLimit,
    $core.List<$core.int>? maxInclusionFeePerGas,
    $core.List<$core.int>? maxFeePerGas,
    $core.String? toAddress,
    $core.List<$core.int>? privateKey,
    Transaction? transaction,
    UserOperation? userOperation,
    $core.Iterable<Access>? accessList,
    UserOperationV0_7? userOperationV07,
    Authorization? eip7702Authorization,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    if (nonce != null) result.nonce = nonce;
    if (txMode != null) result.txMode = txMode;
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasLimit != null) result.gasLimit = gasLimit;
    if (maxInclusionFeePerGas != null)
      result.maxInclusionFeePerGas = maxInclusionFeePerGas;
    if (maxFeePerGas != null) result.maxFeePerGas = maxFeePerGas;
    if (toAddress != null) result.toAddress = toAddress;
    if (privateKey != null) result.privateKey = privateKey;
    if (transaction != null) result.transaction = transaction;
    if (userOperation != null) result.userOperation = userOperation;
    if (accessList != null) result.accessList.addAll(accessList);
    if (userOperationV07 != null) result.userOperationV07 = userOperationV07;
    if (eip7702Authorization != null)
      result.eip7702Authorization = eip7702Authorization;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_UserOperationOneof>
      _SigningInput_UserOperationOneofByTag = {
    11: SigningInput_UserOperationOneof.userOperation,
    13: SigningInput_UserOperationOneof.userOperationV07,
    0: SigningInput_UserOperationOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..oo(0, [11, 13])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'chainId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OY)
    ..aE<TransactionMode>(3, _omitFieldNames ? '' : 'txMode',
        enumValues: TransactionMode.values)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'gasLimit', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'maxInclusionFeePerGas', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'maxFeePerGas', $pb.PbFieldType.OY)
    ..aOS(8, _omitFieldNames ? '' : 'toAddress')
    ..a<$core.List<$core.int>>(
        9, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<Transaction>(10, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..aOM<UserOperation>(11, _omitFieldNames ? '' : 'userOperation',
        subBuilder: UserOperation.create)
    ..pPM<Access>(12, _omitFieldNames ? '' : 'accessList',
        subBuilder: Access.create)
    ..aOM<UserOperationV0_7>(13, _omitFieldNames ? '' : 'userOperationV07',
        protoName: 'user_operation_v0_7', subBuilder: UserOperationV0_7.create)
    ..aOM<Authorization>(15, _omitFieldNames ? '' : 'eip7702Authorization',
        subBuilder: Authorization.create)
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

  @$pb.TagNumber(11)
  @$pb.TagNumber(13)
  SigningInput_UserOperationOneof whichUserOperationOneof() =>
      _SigningInput_UserOperationOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(11)
  @$pb.TagNumber(13)
  void clearUserOperationOneof() => $_clearField($_whichOneof(0));

  /// Chain identifier (uint256, serialized big endian)
  @$pb.TagNumber(1)
  $core.List<$core.int> get chainId => $_getN(0);
  @$pb.TagNumber(1)
  set chainId($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => $_clearField(1);

  /// Nonce (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get nonce => $_getN(1);
  @$pb.TagNumber(2)
  set nonce($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => $_clearField(2);

  /// Transaction version selector: Legacy or enveloped, has impact on fee structure.
  /// Default is Legacy (value 0)
  @$pb.TagNumber(3)
  TransactionMode get txMode => $_getN(2);
  @$pb.TagNumber(3)
  set txMode(TransactionMode value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTxMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxMode() => $_clearField(3);

  /// Gas price (uint256, serialized big endian)
  /// Relevant for legacy transactions only (disregarded for enveloped/EIP1559)
  @$pb.TagNumber(4)
  $core.List<$core.int> get gasPrice => $_getN(3);
  @$pb.TagNumber(4)
  set gasPrice($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearGasPrice() => $_clearField(4);

  /// Gas limit (uint256, serialized big endian)
  @$pb.TagNumber(5)
  $core.List<$core.int> get gasLimit => $_getN(4);
  @$pb.TagNumber(5)
  set gasLimit($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearGasLimit() => $_clearField(5);

  /// Maximum optional inclusion fee (aka tip) (uint256, serialized big endian)
  /// Relevant for enveloped/EIP1559 transactions only, tx_mode=Enveloped, (disregarded for legacy)
  @$pb.TagNumber(6)
  $core.List<$core.int> get maxInclusionFeePerGas => $_getN(5);
  @$pb.TagNumber(6)
  set maxInclusionFeePerGas($core.List<$core.int> value) =>
      $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMaxInclusionFeePerGas() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxInclusionFeePerGas() => $_clearField(6);

  /// Maximum fee (uint256, serialized big endian)
  /// Relevant for enveloped/EIP1559 transactions only, tx_mode=Enveloped, (disregarded for legacy)
  @$pb.TagNumber(7)
  $core.List<$core.int> get maxFeePerGas => $_getN(6);
  @$pb.TagNumber(7)
  set maxFeePerGas($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMaxFeePerGas() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxFeePerGas() => $_clearField(7);

  /// Recipient's address.
  /// TODO currently, will be moved to each `Transaction` oneof soon.
  @$pb.TagNumber(8)
  $core.String get toAddress => $_getSZ(7);
  @$pb.TagNumber(8)
  set toAddress($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasToAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearToAddress() => $_clearField(8);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(9)
  $core.List<$core.int> get privateKey => $_getN(8);
  @$pb.TagNumber(9)
  set privateKey($core.List<$core.int> value) => $_setBytes(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPrivateKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrivateKey() => $_clearField(9);

  /// The payload transaction
  @$pb.TagNumber(10)
  Transaction get transaction => $_getN(9);
  @$pb.TagNumber(10)
  set transaction(Transaction value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTransaction() => $_has(9);
  @$pb.TagNumber(10)
  void clearTransaction() => $_clearField(10);
  @$pb.TagNumber(10)
  Transaction ensureTransaction() => $_ensure(9);

  @$pb.TagNumber(11)
  UserOperation get userOperation => $_getN(10);
  @$pb.TagNumber(11)
  set userOperation(UserOperation value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasUserOperation() => $_has(10);
  @$pb.TagNumber(11)
  void clearUserOperation() => $_clearField(11);
  @$pb.TagNumber(11)
  UserOperation ensureUserOperation() => $_ensure(10);

  /// Optional list of addresses and storage keys that the transaction plans to access.
  /// Used in `TransactionMode::Enveloped` only.
  @$pb.TagNumber(12)
  $pb.PbList<Access> get accessList => $_getList(11);

  /// EIP-7702 compatible
  @$pb.TagNumber(13)
  UserOperationV0_7 get userOperationV07 => $_getN(12);
  @$pb.TagNumber(13)
  set userOperationV07(UserOperationV0_7 value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasUserOperationV07() => $_has(12);
  @$pb.TagNumber(13)
  void clearUserOperationV07() => $_clearField(13);
  @$pb.TagNumber(13)
  UserOperationV0_7 ensureUserOperationV07() => $_ensure(12);

  /// EIP7702 authorization.
  /// Used in `TransactionMode::SetOp` or `TransactionMode::UserOp`.
  /// Currently, we support delegation to only one authority at a time.
  @$pb.TagNumber(15)
  Authorization get eip7702Authorization => $_getN(13);
  @$pb.TagNumber(15)
  set eip7702Authorization(Authorization value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasEip7702Authorization() => $_has(13);
  @$pb.TagNumber(15)
  void clearEip7702Authorization() => $_clearField(15);
  @$pb.TagNumber(15)
  Authorization ensureEip7702Authorization() => $_ensure(13);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? encoded,
    $core.List<$core.int>? v,
    $core.List<$core.int>? r,
    $core.List<$core.int>? s,
    $core.List<$core.int>? data,
    $0.SigningError? error,
    $core.String? errorMessage,
    $core.List<$core.int>? preHash,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
    if (v != null) result.v = v;
    if (r != null) result.r = r;
    if (s != null) result.s = s;
    if (data != null) result.data = data;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (preHash != null) result.preHash = preHash;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encoded', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'v', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'r', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 's', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(6, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(7, _omitFieldNames ? '' : 'errorMessage')
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'preHash', $pb.PbFieldType.OY)
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

  /// The V, R, S components of the resulting signature, (each uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get v => $_getN(1);
  @$pb.TagNumber(2)
  set v($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasV() => $_has(1);
  @$pb.TagNumber(2)
  void clearV() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get r => $_getN(2);
  @$pb.TagNumber(3)
  set r($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasR() => $_has(2);
  @$pb.TagNumber(3)
  void clearR() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get s => $_getN(3);
  @$pb.TagNumber(4)
  set s($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasS() => $_has(3);
  @$pb.TagNumber(4)
  void clearS() => $_clearField(4);

  /// The payload part, supplied in the input or assembled from input parameters
  @$pb.TagNumber(5)
  $core.List<$core.int> get data => $_getN(4);
  @$pb.TagNumber(5)
  set data($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => $_clearField(5);

  /// error code, 0 is ok, other codes will be treated as errors
  @$pb.TagNumber(6)
  $0.SigningError get error => $_getN(5);
  @$pb.TagNumber(6)
  set error($0.SigningError value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);

  /// error code description
  @$pb.TagNumber(7)
  $core.String get errorMessage => $_getSZ(6);
  @$pb.TagNumber(7)
  set errorMessage($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasErrorMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearErrorMessage() => $_clearField(7);

  /// Encoded transaction bytes.
  @$pb.TagNumber(8)
  $core.List<$core.int> get preHash => $_getN(7);
  @$pb.TagNumber(8)
  set preHash($core.List<$core.int> value) => $_setBytes(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPreHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreHash() => $_clearField(8);
}

class MaybeChainId extends $pb.GeneratedMessage {
  factory MaybeChainId({
    $fixnum.Int64? chainId,
  }) {
    final result = create();
    if (chainId != null) result.chainId = chainId;
    return result;
  }

  MaybeChainId._();

  factory MaybeChainId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MaybeChainId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MaybeChainId',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'chainId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MaybeChainId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MaybeChainId copyWith(void Function(MaybeChainId) updates) =>
      super.copyWith((message) => updates(message as MaybeChainId))
          as MaybeChainId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MaybeChainId create() => MaybeChainId._();
  @$core.override
  MaybeChainId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MaybeChainId getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MaybeChainId>(create);
  static MaybeChainId? _defaultInstance;

  /// Chain ID.
  @$pb.TagNumber(3)
  $fixnum.Int64 get chainId => $_getI64(0);
  @$pb.TagNumber(3)
  set chainId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(3)
  void clearChainId() => $_clearField(3);
}

class MessageSigningInput extends $pb.GeneratedMessage {
  factory MessageSigningInput({
    $core.List<$core.int>? privateKey,
    $core.String? message,
    MaybeChainId? chainId,
    MessageType? messageType,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (message != null) result.message = message;
    if (chainId != null) result.chainId = chainId;
    if (messageType != null) result.messageType = messageType;
    return result;
  }

  MessageSigningInput._();

  factory MessageSigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageSigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageSigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<MaybeChainId>(3, _omitFieldNames ? '' : 'chainId',
        subBuilder: MaybeChainId.create)
    ..aE<MessageType>(4, _omitFieldNames ? '' : 'messageType',
        enumValues: MessageType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningInput copyWith(void Function(MessageSigningInput) updates) =>
      super.copyWith((message) => updates(message as MessageSigningInput))
          as MessageSigningInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageSigningInput create() => MessageSigningInput._();
  @$core.override
  MessageSigningInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageSigningInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageSigningInput>(create);
  static MessageSigningInput? _defaultInstance;

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  /// Message to sign. Either a regular message or a typed data structured message in JSON format.
  /// Message type should be declared at `message_type`.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  /// Optional. Used in replay protection and to check Typed Structured Data input.
  /// Eg. should be set if `message_type` is `MessageType_eip155`, or MessageType_typed, or `MessageType_typed_eip155`.
  @$pb.TagNumber(3)
  MaybeChainId get chainId => $_getN(2);
  @$pb.TagNumber(3)
  set chainId(MaybeChainId value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChainId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChainId() => $_clearField(3);
  @$pb.TagNumber(3)
  MaybeChainId ensureChainId() => $_ensure(2);

  /// Message type.
  @$pb.TagNumber(4)
  MessageType get messageType => $_getN(3);
  @$pb.TagNumber(4)
  set messageType(MessageType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMessageType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageType() => $_clearField(4);
}

class MessageSigningOutput extends $pb.GeneratedMessage {
  factory MessageSigningOutput({
    $core.String? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (signature != null) result.signature = signature;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  MessageSigningOutput._();

  factory MessageSigningOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageSigningOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageSigningOutput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signature')
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageSigningOutput copyWith(void Function(MessageSigningOutput) updates) =>
      super.copyWith((message) => updates(message as MessageSigningOutput))
          as MessageSigningOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageSigningOutput create() => MessageSigningOutput._();
  @$core.override
  MessageSigningOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageSigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageSigningOutput>(create);
  static MessageSigningOutput? _defaultInstance;

  /// The signature, Hex-encoded.
  @$pb.TagNumber(1)
  $core.String get signature => $_getSZ(0);
  @$pb.TagNumber(1)
  set signature($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => $_clearField(1);

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

class MessageVerifyingInput extends $pb.GeneratedMessage {
  factory MessageVerifyingInput({
    $core.String? message,
    $core.List<$core.int>? publicKey,
    $core.String? signature,
  }) {
    final result = create();
    if (message != null) result.message = message;
    if (publicKey != null) result.publicKey = publicKey;
    if (signature != null) result.signature = signature;
    return result;
  }

  MessageVerifyingInput._();

  factory MessageVerifyingInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageVerifyingInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageVerifyingInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Ethereum.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'signature')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageVerifyingInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageVerifyingInput copyWith(
          void Function(MessageVerifyingInput) updates) =>
      super.copyWith((message) => updates(message as MessageVerifyingInput))
          as MessageVerifyingInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageVerifyingInput create() => MessageVerifyingInput._();
  @$core.override
  MessageVerifyingInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageVerifyingInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageVerifyingInput>(create);
  static MessageVerifyingInput? _defaultInstance;

  /// The message signed.
  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);

  /// Public key that will verify and recover the message from the signature.
  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);

  /// The signature, Hex-encoded.
  @$pb.TagNumber(3)
  $core.String get signature => $_getSZ(2);
  @$pb.TagNumber(3)
  set signature($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
