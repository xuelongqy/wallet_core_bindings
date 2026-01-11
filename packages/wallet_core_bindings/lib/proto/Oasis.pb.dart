// This is a generated file - do not edit.
//
// Generated from Oasis.proto.

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

/// Transfer
class TransferMessage extends $pb.GeneratedMessage {
  factory TransferMessage({
    $core.String? to,
    $fixnum.Int64? gasPrice,
    $core.String? gasAmount,
    $core.String? amount,
    $fixnum.Int64? nonce,
    $core.String? context,
  }) {
    final result = create();
    if (to != null) result.to = to;
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasAmount != null) result.gasAmount = gasAmount;
    if (amount != null) result.amount = amount;
    if (nonce != null) result.nonce = nonce;
    if (context != null) result.context = context;
    return result;
  }

  TransferMessage._();

  factory TransferMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Oasis.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'gasAmount')
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'context')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferMessage copyWith(void Function(TransferMessage) updates) =>
      super.copyWith((message) => updates(message as TransferMessage))
          as TransferMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferMessage create() => TransferMessage._();
  @$core.override
  TransferMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferMessage>(create);
  static TransferMessage? _defaultInstance;

  /// destination address
  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => $_clearField(1);

  /// Gas price
  @$pb.TagNumber(2)
  $fixnum.Int64 get gasPrice => $_getI64(1);
  @$pb.TagNumber(2)
  set gasPrice($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearGasPrice() => $_clearField(2);

  /// Amount values strings prefixed by zero. e.g. "\u000010000000"
  @$pb.TagNumber(3)
  $core.String get gasAmount => $_getSZ(2);
  @$pb.TagNumber(3)
  set gasAmount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearGasAmount() => $_clearField(3);

  /// Amount values strings prefixed by zero
  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  /// Nonce (should be larger than in the last transaction of the account)
  @$pb.TagNumber(5)
  $fixnum.Int64 get nonce => $_getI64(4);
  @$pb.TagNumber(5)
  set nonce($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonce() => $_clearField(5);

  /// Context, see https://docs.oasis.dev/oasis-core/common-functionality/crypto#domain-separation
  @$pb.TagNumber(6)
  $core.String get context => $_getSZ(5);
  @$pb.TagNumber(6)
  set context($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContext() => $_has(5);
  @$pb.TagNumber(6)
  void clearContext() => $_clearField(6);
}

class EscrowMessage extends $pb.GeneratedMessage {
  factory EscrowMessage({
    $fixnum.Int64? gasPrice,
    $core.String? gasAmount,
    $fixnum.Int64? nonce,
    $core.String? account,
    $core.String? amount,
    $core.String? context,
  }) {
    final result = create();
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasAmount != null) result.gasAmount = gasAmount;
    if (nonce != null) result.nonce = nonce;
    if (account != null) result.account = account;
    if (amount != null) result.amount = amount;
    if (context != null) result.context = context;
    return result;
  }

  EscrowMessage._();

  factory EscrowMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EscrowMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EscrowMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Oasis.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'gasAmount')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'account')
    ..aOS(5, _omitFieldNames ? '' : 'amount')
    ..aOS(6, _omitFieldNames ? '' : 'context')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EscrowMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EscrowMessage copyWith(void Function(EscrowMessage) updates) =>
      super.copyWith((message) => updates(message as EscrowMessage))
          as EscrowMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EscrowMessage create() => EscrowMessage._();
  @$core.override
  EscrowMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EscrowMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EscrowMessage>(create);
  static EscrowMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gasPrice => $_getI64(0);
  @$pb.TagNumber(1)
  set gasPrice($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearGasPrice() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gasAmount => $_getSZ(1);
  @$pb.TagNumber(2)
  set gasAmount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearGasAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nonce => $_getI64(2);
  @$pb.TagNumber(3)
  set nonce($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearNonce() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get account => $_getSZ(3);
  @$pb.TagNumber(4)
  set account($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAccount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get amount => $_getSZ(4);
  @$pb.TagNumber(5)
  set amount($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get context => $_getSZ(5);
  @$pb.TagNumber(6)
  set context($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContext() => $_has(5);
  @$pb.TagNumber(6)
  void clearContext() => $_clearField(6);
}

class ReclaimEscrowMessage extends $pb.GeneratedMessage {
  factory ReclaimEscrowMessage({
    $fixnum.Int64? gasPrice,
    $core.String? gasAmount,
    $fixnum.Int64? nonce,
    $core.String? account,
    $core.String? shares,
    $core.String? context,
  }) {
    final result = create();
    if (gasPrice != null) result.gasPrice = gasPrice;
    if (gasAmount != null) result.gasAmount = gasAmount;
    if (nonce != null) result.nonce = nonce;
    if (account != null) result.account = account;
    if (shares != null) result.shares = shares;
    if (context != null) result.context = context;
    return result;
  }

  ReclaimEscrowMessage._();

  factory ReclaimEscrowMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReclaimEscrowMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReclaimEscrowMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Oasis.Proto'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'gasPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'gasAmount')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'account')
    ..aOS(5, _omitFieldNames ? '' : 'shares')
    ..aOS(6, _omitFieldNames ? '' : 'context')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReclaimEscrowMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReclaimEscrowMessage copyWith(void Function(ReclaimEscrowMessage) updates) =>
      super.copyWith((message) => updates(message as ReclaimEscrowMessage))
          as ReclaimEscrowMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReclaimEscrowMessage create() => ReclaimEscrowMessage._();
  @$core.override
  ReclaimEscrowMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReclaimEscrowMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReclaimEscrowMessage>(create);
  static ReclaimEscrowMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gasPrice => $_getI64(0);
  @$pb.TagNumber(1)
  set gasPrice($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearGasPrice() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gasAmount => $_getSZ(1);
  @$pb.TagNumber(2)
  set gasAmount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearGasAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get nonce => $_getI64(2);
  @$pb.TagNumber(3)
  set nonce($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearNonce() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get account => $_getSZ(3);
  @$pb.TagNumber(4)
  set account($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAccount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get shares => $_getSZ(4);
  @$pb.TagNumber(5)
  set shares($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasShares() => $_has(4);
  @$pb.TagNumber(5)
  void clearShares() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get context => $_getSZ(5);
  @$pb.TagNumber(6)
  set context($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContext() => $_has(5);
  @$pb.TagNumber(6)
  void clearContext() => $_clearField(6);
}

enum SigningInput_Message { transfer, escrow, reclaimEscrow, notSet }

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    TransferMessage? transfer,
    EscrowMessage? escrow,
    ReclaimEscrowMessage? reclaimEscrow,
  }) {
    final result = create();
    if (privateKey != null) result.privateKey = privateKey;
    if (transfer != null) result.transfer = transfer;
    if (escrow != null) result.escrow = escrow;
    if (reclaimEscrow != null) result.reclaimEscrow = reclaimEscrow;
    return result;
  }

  SigningInput._();

  factory SigningInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SigningInput_Message>
      _SigningInput_MessageByTag = {
    2: SigningInput_Message.transfer,
    3: SigningInput_Message.escrow,
    4: SigningInput_Message.reclaimEscrow,
    0: SigningInput_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Oasis.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<TransferMessage>(2, _omitFieldNames ? '' : 'transfer',
        subBuilder: TransferMessage.create)
    ..aOM<EscrowMessage>(3, _omitFieldNames ? '' : 'escrow',
        subBuilder: EscrowMessage.create)
    ..aOM<ReclaimEscrowMessage>(4, _omitFieldNames ? '' : 'reclaimEscrow',
        protoName: 'reclaimEscrow', subBuilder: ReclaimEscrowMessage.create)
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

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  SigningInput_Message whichMessage() =>
      _SigningInput_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => $_clearField(1);

  @$pb.TagNumber(2)
  TransferMessage get transfer => $_getN(1);
  @$pb.TagNumber(2)
  set transfer(TransferMessage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTransfer() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransfer() => $_clearField(2);
  @$pb.TagNumber(2)
  TransferMessage ensureTransfer() => $_ensure(1);

  @$pb.TagNumber(3)
  EscrowMessage get escrow => $_getN(2);
  @$pb.TagNumber(3)
  set escrow(EscrowMessage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEscrow() => $_has(2);
  @$pb.TagNumber(3)
  void clearEscrow() => $_clearField(3);
  @$pb.TagNumber(3)
  EscrowMessage ensureEscrow() => $_ensure(2);

  @$pb.TagNumber(4)
  ReclaimEscrowMessage get reclaimEscrow => $_getN(3);
  @$pb.TagNumber(4)
  set reclaimEscrow(ReclaimEscrowMessage value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasReclaimEscrow() => $_has(3);
  @$pb.TagNumber(4)
  void clearReclaimEscrow() => $_clearField(4);
  @$pb.TagNumber(4)
  ReclaimEscrowMessage ensureReclaimEscrow() => $_ensure(3);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Oasis.Proto'),
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

  /// Signed and encoded transaction bytes.
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
