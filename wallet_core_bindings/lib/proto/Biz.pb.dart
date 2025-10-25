//
//  Generated code. Do not modify.
//  source: Biz.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ExecuteWithPasskeySessionInput_Execution extends $pb.GeneratedMessage {
  factory ExecuteWithPasskeySessionInput_Execution({
    $core.String? address,
    $core.List<$core.int>? amount,
    $core.List<$core.int>? payload,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  ExecuteWithPasskeySessionInput_Execution._() : super();
  factory ExecuteWithPasskeySessionInput_Execution.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecuteWithPasskeySessionInput_Execution.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecuteWithPasskeySessionInput.Execution',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Biz.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecuteWithPasskeySessionInput_Execution clone() =>
      ExecuteWithPasskeySessionInput_Execution()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecuteWithPasskeySessionInput_Execution copyWith(
          void Function(ExecuteWithPasskeySessionInput_Execution) updates) =>
      super.copyWith((message) =>
              updates(message as ExecuteWithPasskeySessionInput_Execution))
          as ExecuteWithPasskeySessionInput_Execution;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteWithPasskeySessionInput_Execution create() =>
      ExecuteWithPasskeySessionInput_Execution._();
  ExecuteWithPasskeySessionInput_Execution createEmptyInstance() => create();
  static $pb.PbList<ExecuteWithPasskeySessionInput_Execution>
      createRepeated() =>
          $pb.PbList<ExecuteWithPasskeySessionInput_Execution>();
  @$core.pragma('dart2js:noInline')
  static ExecuteWithPasskeySessionInput_Execution getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ExecuteWithPasskeySessionInput_Execution>(create);
  static ExecuteWithPasskeySessionInput_Execution? _defaultInstance;

  /// Recipient addresses.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  /// Amounts to send in wei (uint256, serialized big endian)
  @$pb.TagNumber(2)
  $core.List<$core.int> get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  /// Contract call payloads data
  @$pb.TagNumber(3)
  $core.List<$core.int> get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => clearField(3);
}

class ExecuteWithPasskeySessionInput extends $pb.GeneratedMessage {
  factory ExecuteWithPasskeySessionInput({
    $core.Iterable<ExecuteWithPasskeySessionInput_Execution>? executions,
    $fixnum.Int64? validAfter,
    $fixnum.Int64? validUntil,
    $core.List<$core.int>? passkeySignature,
  }) {
    final $result = create();
    if (executions != null) {
      $result.executions.addAll(executions);
    }
    if (validAfter != null) {
      $result.validAfter = validAfter;
    }
    if (validUntil != null) {
      $result.validUntil = validUntil;
    }
    if (passkeySignature != null) {
      $result.passkeySignature = passkeySignature;
    }
    return $result;
  }
  ExecuteWithPasskeySessionInput._() : super();
  factory ExecuteWithPasskeySessionInput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExecuteWithPasskeySessionInput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecuteWithPasskeySessionInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Biz.Proto'),
      createEmptyInstance: create)
    ..pc<ExecuteWithPasskeySessionInput_Execution>(
        1, _omitFieldNames ? '' : 'executions', $pb.PbFieldType.PM,
        subBuilder: ExecuteWithPasskeySessionInput_Execution.create)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'validAfter', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'validUntil', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'passkeySignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExecuteWithPasskeySessionInput clone() =>
      ExecuteWithPasskeySessionInput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExecuteWithPasskeySessionInput copyWith(
          void Function(ExecuteWithPasskeySessionInput) updates) =>
      super.copyWith(
              (message) => updates(message as ExecuteWithPasskeySessionInput))
          as ExecuteWithPasskeySessionInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteWithPasskeySessionInput create() =>
      ExecuteWithPasskeySessionInput._();
  ExecuteWithPasskeySessionInput createEmptyInstance() => create();
  static $pb.PbList<ExecuteWithPasskeySessionInput> createRepeated() =>
      $pb.PbList<ExecuteWithPasskeySessionInput>();
  @$core.pragma('dart2js:noInline')
  static ExecuteWithPasskeySessionInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecuteWithPasskeySessionInput>(create);
  static ExecuteWithPasskeySessionInput? _defaultInstance;

  /// Batched executions to be executed on the smart contract wallet.
  @$pb.TagNumber(1)
  $core.List<ExecuteWithPasskeySessionInput_Execution> get executions =>
      $_getList(0);

  /// Transaction valid after this timestamp.
  @$pb.TagNumber(2)
  $fixnum.Int64 get validAfter => $_getI64(1);
  @$pb.TagNumber(2)
  set validAfter($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValidAfter() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidAfter() => clearField(2);

  /// Transaction valid until this timestamp.
  @$pb.TagNumber(3)
  $fixnum.Int64 get validUntil => $_getI64(2);
  @$pb.TagNumber(3)
  set validUntil($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValidUntil() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidUntil() => clearField(3);

  /// Passkey session signature.
  @$pb.TagNumber(4)
  $core.List<$core.int> get passkeySignature => $_getN(3);
  @$pb.TagNumber(4)
  set passkeySignature($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPasskeySignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearPasskeySignature() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
