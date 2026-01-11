// This is a generated file - do not edit.
//
// Generated from Everscale.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Everscale.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Everscale.pbenum.dart';

enum Transfer_AccountStateOneof { encodedContractData, notSet }

/// Transfer message
class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.bool? bounce,
    MessageBehavior? behavior,
    $fixnum.Int64? amount,
    $core.int? expiredAt,
    $core.String? to,
    $core.String? encodedContractData,
  }) {
    final result = create();
    if (bounce != null) result.bounce = bounce;
    if (behavior != null) result.behavior = behavior;
    if (amount != null) result.amount = amount;
    if (expiredAt != null) result.expiredAt = expiredAt;
    if (to != null) result.to = to;
    if (encodedContractData != null)
      result.encodedContractData = encodedContractData;
    return result;
  }

  Transfer._();

  factory Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Transfer_AccountStateOneof>
      _Transfer_AccountStateOneofByTag = {
    6: Transfer_AccountStateOneof.encodedContractData,
    0: Transfer_AccountStateOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transfer',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Everscale.Proto'),
      createEmptyInstance: create)
    ..oo(0, [6])
    ..aOB(1, _omitFieldNames ? '' : 'bounce')
    ..aE<MessageBehavior>(2, _omitFieldNames ? '' : 'behavior',
        enumValues: MessageBehavior.values)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'expiredAt', fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'to')
    ..aOS(6, _omitFieldNames ? '' : 'encodedContractData')
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

  @$pb.TagNumber(6)
  Transfer_AccountStateOneof whichAccountStateOneof() =>
      _Transfer_AccountStateOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(6)
  void clearAccountStateOneof() => $_clearField($_whichOneof(0));

  /// If set to true, then the message will be returned if there is an error on the recipient's side.
  @$pb.TagNumber(1)
  $core.bool get bounce => $_getBF(0);
  @$pb.TagNumber(1)
  set bounce($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBounce() => $_has(0);
  @$pb.TagNumber(1)
  void clearBounce() => $_clearField(1);

  /// Affect the attached amount and fees
  @$pb.TagNumber(2)
  MessageBehavior get behavior => $_getN(1);
  @$pb.TagNumber(2)
  set behavior(MessageBehavior value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBehavior() => $_has(1);
  @$pb.TagNumber(2)
  void clearBehavior() => $_clearField(2);

  /// Amount to send in nano EVER
  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  /// Expiration UNIX timestamp
  @$pb.TagNumber(4)
  $core.int get expiredAt => $_getIZ(3);
  @$pb.TagNumber(4)
  set expiredAt($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiredAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiredAt() => $_clearField(4);

  /// Recipient address
  @$pb.TagNumber(5)
  $core.String get to => $_getSZ(4);
  @$pb.TagNumber(5)
  set to($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => $_clearField(5);

  /// Just contract data
  @$pb.TagNumber(6)
  $core.String get encodedContractData => $_getSZ(5);
  @$pb.TagNumber(6)
  set encodedContractData($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEncodedContractData() => $_has(5);
  @$pb.TagNumber(6)
  void clearEncodedContractData() => $_clearField(6);
}

enum SigningInput_ActionOneof { transfer, notSet }

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    Transfer? transfer,
    $core.List<$core.int>? privateKey,
  }) {
    final result = create();
    if (transfer != null) result.transfer = transfer;
    if (privateKey != null) result.privateKey = privateKey;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_ActionOneof>
      _SigningInput_ActionOneofByTag = {
    1: SigningInput_ActionOneof.transfer,
    0: SigningInput_ActionOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Everscale.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Transfer>(1, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
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

  @$pb.TagNumber(1)
  SigningInput_ActionOneof whichActionOneof() =>
      _SigningInput_ActionOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearActionOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Transfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer(Transfer value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => $_clearField(1);
  @$pb.TagNumber(1)
  Transfer ensureTransfer() => $_ensure(0);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => $_clearField(2);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? encoded,
  }) {
    final result = create();
    if (encoded != null) result.encoded = encoded;
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
          const $pb.PackageName(_omitMessageNames ? '' : 'TW.Everscale.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'encoded')
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

  @$pb.TagNumber(1)
  $core.String get encoded => $_getSZ(0);
  @$pb.TagNumber(1)
  set encoded($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncoded() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncoded() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
