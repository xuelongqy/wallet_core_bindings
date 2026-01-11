// This is a generated file - do not edit.
//
// Generated from NEAR.proto.

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

/// Public key with type
class PublicKey extends $pb.GeneratedMessage {
  factory PublicKey({
    $core.int? keyType,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (keyType != null) result.keyType = keyType;
    if (data != null) result.data = data;
    return result;
  }

  PublicKey._();

  factory PublicKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublicKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublicKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'keyType', fieldType: $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublicKey copyWith(void Function(PublicKey) updates) =>
      super.copyWith((message) => updates(message as PublicKey)) as PublicKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicKey create() => PublicKey._();
  @$core.override
  PublicKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublicKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicKey>(create);
  static PublicKey? _defaultInstance;

  /// Key type
  @$pb.TagNumber(1)
  $core.int get keyType => $_getIZ(0);
  @$pb.TagNumber(1)
  set keyType($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeyType() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyType() => $_clearField(1);

  /// The public key data
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
}

/// Permissions for a function call
class FunctionCallPermission extends $pb.GeneratedMessage {
  factory FunctionCallPermission({
    $core.List<$core.int>? allowance,
    $core.String? receiverId,
    $core.Iterable<$core.String>? methodNames,
  }) {
    final result = create();
    if (allowance != null) result.allowance = allowance;
    if (receiverId != null) result.receiverId = receiverId;
    if (methodNames != null) result.methodNames.addAll(methodNames);
    return result;
  }

  FunctionCallPermission._();

  factory FunctionCallPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionCallPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionCallPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'allowance', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'receiverId')
    ..pPS(3, _omitFieldNames ? '' : 'methodNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionCallPermission clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionCallPermission copyWith(
          void Function(FunctionCallPermission) updates) =>
      super.copyWith((message) => updates(message as FunctionCallPermission))
          as FunctionCallPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionCallPermission create() => FunctionCallPermission._();
  @$core.override
  FunctionCallPermission createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FunctionCallPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionCallPermission>(create);
  static FunctionCallPermission? _defaultInstance;

  /// uint128 / big endian byte order
  @$pb.TagNumber(1)
  $core.List<$core.int> get allowance => $_getN(0);
  @$pb.TagNumber(1)
  set allowance($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAllowance() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowance() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiverId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get methodNames => $_getList(2);
}

/// Full access
class FullAccessPermission extends $pb.GeneratedMessage {
  factory FullAccessPermission() => create();

  FullAccessPermission._();

  factory FullAccessPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FullAccessPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FullAccessPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FullAccessPermission clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FullAccessPermission copyWith(void Function(FullAccessPermission) updates) =>
      super.copyWith((message) => updates(message as FullAccessPermission))
          as FullAccessPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FullAccessPermission create() => FullAccessPermission._();
  @$core.override
  FullAccessPermission createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FullAccessPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FullAccessPermission>(create);
  static FullAccessPermission? _defaultInstance;
}

enum AccessKey_Permission { functionCall, fullAccess, notSet }

/// Access key: nonce + permission
class AccessKey extends $pb.GeneratedMessage {
  factory AccessKey({
    $fixnum.Int64? nonce,
    FunctionCallPermission? functionCall,
    FullAccessPermission? fullAccess,
  }) {
    final result = create();
    if (nonce != null) result.nonce = nonce;
    if (functionCall != null) result.functionCall = functionCall;
    if (fullAccess != null) result.fullAccess = fullAccess;
    return result;
  }

  AccessKey._();

  factory AccessKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccessKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, AccessKey_Permission>
      _AccessKey_PermissionByTag = {
    2: AccessKey_Permission.functionCall,
    3: AccessKey_Permission.fullAccess,
    0: AccessKey_Permission.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccessKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<FunctionCallPermission>(2, _omitFieldNames ? '' : 'functionCall',
        subBuilder: FunctionCallPermission.create)
    ..aOM<FullAccessPermission>(3, _omitFieldNames ? '' : 'fullAccess',
        subBuilder: FullAccessPermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessKey copyWith(void Function(AccessKey) updates) =>
      super.copyWith((message) => updates(message as AccessKey)) as AccessKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessKey create() => AccessKey._();
  @$core.override
  AccessKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccessKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessKey>(create);
  static AccessKey? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  AccessKey_Permission whichPermission() =>
      _AccessKey_PermissionByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearPermission() => $_clearField($_whichOneof(0));

  /// Nonce
  @$pb.TagNumber(1)
  $fixnum.Int64 get nonce => $_getI64(0);
  @$pb.TagNumber(1)
  set nonce($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => $_clearField(1);

  @$pb.TagNumber(2)
  FunctionCallPermission get functionCall => $_getN(1);
  @$pb.TagNumber(2)
  set functionCall(FunctionCallPermission value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFunctionCall() => $_has(1);
  @$pb.TagNumber(2)
  void clearFunctionCall() => $_clearField(2);
  @$pb.TagNumber(2)
  FunctionCallPermission ensureFunctionCall() => $_ensure(1);

  @$pb.TagNumber(3)
  FullAccessPermission get fullAccess => $_getN(2);
  @$pb.TagNumber(3)
  set fullAccess(FullAccessPermission value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFullAccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullAccess() => $_clearField(3);
  @$pb.TagNumber(3)
  FullAccessPermission ensureFullAccess() => $_ensure(2);
}

/// Create Account
class CreateAccount extends $pb.GeneratedMessage {
  factory CreateAccount() => create();

  CreateAccount._();

  factory CreateAccount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateAccount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateAccount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAccount copyWith(void Function(CreateAccount) updates) =>
      super.copyWith((message) => updates(message as CreateAccount))
          as CreateAccount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccount create() => CreateAccount._();
  @$core.override
  CreateAccount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateAccount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateAccount>(create);
  static CreateAccount? _defaultInstance;
}

/// Deploying a contract
class DeployContract extends $pb.GeneratedMessage {
  factory DeployContract({
    $core.List<$core.int>? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  DeployContract._();

  factory DeployContract.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeployContract.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeployContract',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeployContract clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeployContract copyWith(void Function(DeployContract) updates) =>
      super.copyWith((message) => updates(message as DeployContract))
          as DeployContract;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeployContract create() => DeployContract._();
  @$core.override
  DeployContract createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeployContract getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeployContract>(create);
  static DeployContract? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

/// A method/function call
class FunctionCall extends $pb.GeneratedMessage {
  factory FunctionCall({
    $core.String? methodName,
    $core.List<$core.int>? args,
    $fixnum.Int64? gas,
    $core.List<$core.int>? deposit,
  }) {
    final result = create();
    if (methodName != null) result.methodName = methodName;
    if (args != null) result.args = args;
    if (gas != null) result.gas = gas;
    if (deposit != null) result.deposit = deposit;
    return result;
  }

  FunctionCall._();

  factory FunctionCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FunctionCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FunctionCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'methodName')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'args', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'gas', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'deposit', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionCall clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FunctionCall copyWith(void Function(FunctionCall) updates) =>
      super.copyWith((message) => updates(message as FunctionCall))
          as FunctionCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FunctionCall create() => FunctionCall._();
  @$core.override
  FunctionCall createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FunctionCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FunctionCall>(create);
  static FunctionCall? _defaultInstance;

  /// Method/function name
  @$pb.TagNumber(1)
  $core.String get methodName => $_getSZ(0);
  @$pb.TagNumber(1)
  set methodName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMethodName() => $_has(0);
  @$pb.TagNumber(1)
  void clearMethodName() => $_clearField(1);

  /// input arguments
  @$pb.TagNumber(2)
  $core.List<$core.int> get args => $_getN(1);
  @$pb.TagNumber(2)
  set args($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasArgs() => $_has(1);
  @$pb.TagNumber(2)
  void clearArgs() => $_clearField(2);

  /// gas
  @$pb.TagNumber(3)
  $fixnum.Int64 get gas => $_getI64(2);
  @$pb.TagNumber(3)
  set gas($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGas() => $_has(2);
  @$pb.TagNumber(3)
  void clearGas() => $_clearField(3);

  /// uint128 / big endian byte order
  @$pb.TagNumber(4)
  $core.List<$core.int> get deposit => $_getN(3);
  @$pb.TagNumber(4)
  set deposit($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeposit() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeposit() => $_clearField(4);
}

/// Transfer
class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.List<$core.int>? deposit,
  }) {
    final result = create();
    if (deposit != null) result.deposit = deposit;
    return result;
  }

  Transfer._();

  factory Transfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'deposit', $pb.PbFieldType.OY)
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

  /// amount; uint128 / big endian byte order
  @$pb.TagNumber(1)
  $core.List<$core.int> get deposit => $_getN(0);
  @$pb.TagNumber(1)
  set deposit($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeposit() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeposit() => $_clearField(1);
}

/// Stake
class Stake extends $pb.GeneratedMessage {
  factory Stake({
    $core.List<$core.int>? stake,
    PublicKey? publicKey,
  }) {
    final result = create();
    if (stake != null) result.stake = stake;
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  Stake._();

  factory Stake.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Stake.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Stake',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'stake', $pb.PbFieldType.OY)
    ..aOM<PublicKey>(2, _omitFieldNames ? '' : 'publicKey',
        subBuilder: PublicKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stake clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Stake copyWith(void Function(Stake) updates) =>
      super.copyWith((message) => updates(message as Stake)) as Stake;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Stake create() => Stake._();
  @$core.override
  Stake createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Stake getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stake>(create);
  static Stake? _defaultInstance;

  /// amount; uint128 / big endian byte order
  @$pb.TagNumber(1)
  $core.List<$core.int> get stake => $_getN(0);
  @$pb.TagNumber(1)
  set stake($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStake() => $_has(0);
  @$pb.TagNumber(1)
  void clearStake() => $_clearField(1);

  /// owner public key
  @$pb.TagNumber(2)
  PublicKey get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey(PublicKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => $_clearField(2);
  @$pb.TagNumber(2)
  PublicKey ensurePublicKey() => $_ensure(1);
}

/// Add a key
class AddKey extends $pb.GeneratedMessage {
  factory AddKey({
    PublicKey? publicKey,
    AccessKey? accessKey,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    if (accessKey != null) result.accessKey = accessKey;
    return result;
  }

  AddKey._();

  factory AddKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aOM<PublicKey>(1, _omitFieldNames ? '' : 'publicKey',
        subBuilder: PublicKey.create)
    ..aOM<AccessKey>(2, _omitFieldNames ? '' : 'accessKey',
        subBuilder: AccessKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddKey copyWith(void Function(AddKey) updates) =>
      super.copyWith((message) => updates(message as AddKey)) as AddKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddKey create() => AddKey._();
  @$core.override
  AddKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddKey>(create);
  static AddKey? _defaultInstance;

  @$pb.TagNumber(1)
  PublicKey get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey(PublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);
  @$pb.TagNumber(1)
  PublicKey ensurePublicKey() => $_ensure(0);

  @$pb.TagNumber(2)
  AccessKey get accessKey => $_getN(1);
  @$pb.TagNumber(2)
  set accessKey(AccessKey value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAccessKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessKey() => $_clearField(2);
  @$pb.TagNumber(2)
  AccessKey ensureAccessKey() => $_ensure(1);
}

/// Delete a key
class DeleteKey extends $pb.GeneratedMessage {
  factory DeleteKey({
    PublicKey? publicKey,
  }) {
    final result = create();
    if (publicKey != null) result.publicKey = publicKey;
    return result;
  }

  DeleteKey._();

  factory DeleteKey.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteKey.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteKey',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aOM<PublicKey>(1, _omitFieldNames ? '' : 'publicKey',
        subBuilder: PublicKey.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteKey clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteKey copyWith(void Function(DeleteKey) updates) =>
      super.copyWith((message) => updates(message as DeleteKey)) as DeleteKey;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteKey create() => DeleteKey._();
  @$core.override
  DeleteKey createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteKey getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteKey>(create);
  static DeleteKey? _defaultInstance;

  @$pb.TagNumber(1)
  PublicKey get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey(PublicKey value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => $_clearField(1);
  @$pb.TagNumber(1)
  PublicKey ensurePublicKey() => $_ensure(0);
}

/// Delete account
class DeleteAccount extends $pb.GeneratedMessage {
  factory DeleteAccount({
    $core.String? beneficiaryId,
  }) {
    final result = create();
    if (beneficiaryId != null) result.beneficiaryId = beneficiaryId;
    return result;
  }

  DeleteAccount._();

  factory DeleteAccount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteAccount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteAccount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'beneficiaryId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAccount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAccount copyWith(void Function(DeleteAccount) updates) =>
      super.copyWith((message) => updates(message as DeleteAccount))
          as DeleteAccount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAccount create() => DeleteAccount._();
  @$core.override
  DeleteAccount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteAccount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAccount>(create);
  static DeleteAccount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get beneficiaryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set beneficiaryId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBeneficiaryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeneficiaryId() => $_clearField(1);
}

/// Fungible token transfer
class TokenTransfer extends $pb.GeneratedMessage {
  factory TokenTransfer({
    $core.String? tokenAmount,
    $core.String? receiverId,
    $fixnum.Int64? gas,
    $core.List<$core.int>? deposit,
  }) {
    final result = create();
    if (tokenAmount != null) result.tokenAmount = tokenAmount;
    if (receiverId != null) result.receiverId = receiverId;
    if (gas != null) result.gas = gas;
    if (deposit != null) result.deposit = deposit;
    return result;
  }

  TokenTransfer._();

  factory TokenTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenTransfer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tokenAmount')
    ..aOS(2, _omitFieldNames ? '' : 'receiverId')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'gas', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'deposit', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransfer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenTransfer copyWith(void Function(TokenTransfer) updates) =>
      super.copyWith((message) => updates(message as TokenTransfer))
          as TokenTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenTransfer create() => TokenTransfer._();
  @$core.override
  TokenTransfer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenTransfer>(create);
  static TokenTransfer? _defaultInstance;

  /// Token amount. Base-10 decimal string.
  @$pb.TagNumber(1)
  $core.String get tokenAmount => $_getSZ(0);
  @$pb.TagNumber(1)
  set tokenAmount($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTokenAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenAmount() => $_clearField(1);

  /// ID of the receiver.
  @$pb.TagNumber(2)
  $core.String get receiverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiverId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverId() => $_clearField(2);

  /// Gas.
  @$pb.TagNumber(3)
  $fixnum.Int64 get gas => $_getI64(2);
  @$pb.TagNumber(3)
  set gas($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGas() => $_has(2);
  @$pb.TagNumber(3)
  void clearGas() => $_clearField(3);

  /// NEAR deposit amount; uint128 / big endian byte order.
  @$pb.TagNumber(4)
  $core.List<$core.int> get deposit => $_getN(3);
  @$pb.TagNumber(4)
  set deposit($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeposit() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeposit() => $_clearField(4);
}

enum Action_Payload {
  createAccount,
  deployContract,
  functionCall,
  transfer,
  stake,
  addKey,
  deleteKey,
  deleteAccount,
  tokenTransfer,
  notSet
}

/// Represents an action
class Action extends $pb.GeneratedMessage {
  factory Action({
    CreateAccount? createAccount,
    DeployContract? deployContract,
    FunctionCall? functionCall,
    Transfer? transfer,
    Stake? stake,
    AddKey? addKey,
    DeleteKey? deleteKey,
    DeleteAccount? deleteAccount,
    TokenTransfer? tokenTransfer,
  }) {
    final result = create();
    if (createAccount != null) result.createAccount = createAccount;
    if (deployContract != null) result.deployContract = deployContract;
    if (functionCall != null) result.functionCall = functionCall;
    if (transfer != null) result.transfer = transfer;
    if (stake != null) result.stake = stake;
    if (addKey != null) result.addKey = addKey;
    if (deleteKey != null) result.deleteKey = deleteKey;
    if (deleteAccount != null) result.deleteAccount = deleteAccount;
    if (tokenTransfer != null) result.tokenTransfer = tokenTransfer;
    return result;
  }

  Action._();

  factory Action.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Action.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Action_Payload> _Action_PayloadByTag = {
    1: Action_Payload.createAccount,
    2: Action_Payload.deployContract,
    3: Action_Payload.functionCall,
    4: Action_Payload.transfer,
    5: Action_Payload.stake,
    6: Action_Payload.addKey,
    7: Action_Payload.deleteKey,
    8: Action_Payload.deleteAccount,
    13: Action_Payload.tokenTransfer,
    0: Action_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Action',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 13])
    ..aOM<CreateAccount>(1, _omitFieldNames ? '' : 'createAccount',
        subBuilder: CreateAccount.create)
    ..aOM<DeployContract>(2, _omitFieldNames ? '' : 'deployContract',
        subBuilder: DeployContract.create)
    ..aOM<FunctionCall>(3, _omitFieldNames ? '' : 'functionCall',
        subBuilder: FunctionCall.create)
    ..aOM<Transfer>(4, _omitFieldNames ? '' : 'transfer',
        subBuilder: Transfer.create)
    ..aOM<Stake>(5, _omitFieldNames ? '' : 'stake', subBuilder: Stake.create)
    ..aOM<AddKey>(6, _omitFieldNames ? '' : 'addKey', subBuilder: AddKey.create)
    ..aOM<DeleteKey>(7, _omitFieldNames ? '' : 'deleteKey',
        subBuilder: DeleteKey.create)
    ..aOM<DeleteAccount>(8, _omitFieldNames ? '' : 'deleteAccount',
        subBuilder: DeleteAccount.create)
    ..aOM<TokenTransfer>(13, _omitFieldNames ? '' : 'tokenTransfer',
        subBuilder: TokenTransfer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Action copyWith(void Function(Action) updates) =>
      super.copyWith((message) => updates(message as Action)) as Action;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Action create() => Action._();
  @$core.override
  Action createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Action getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Action>(create);
  static Action? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(13)
  Action_Payload whichPayload() => _Action_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(13)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CreateAccount get createAccount => $_getN(0);
  @$pb.TagNumber(1)
  set createAccount(CreateAccount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCreateAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateAccount() => $_clearField(1);
  @$pb.TagNumber(1)
  CreateAccount ensureCreateAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  DeployContract get deployContract => $_getN(1);
  @$pb.TagNumber(2)
  set deployContract(DeployContract value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDeployContract() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeployContract() => $_clearField(2);
  @$pb.TagNumber(2)
  DeployContract ensureDeployContract() => $_ensure(1);

  @$pb.TagNumber(3)
  FunctionCall get functionCall => $_getN(2);
  @$pb.TagNumber(3)
  set functionCall(FunctionCall value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFunctionCall() => $_has(2);
  @$pb.TagNumber(3)
  void clearFunctionCall() => $_clearField(3);
  @$pb.TagNumber(3)
  FunctionCall ensureFunctionCall() => $_ensure(2);

  @$pb.TagNumber(4)
  Transfer get transfer => $_getN(3);
  @$pb.TagNumber(4)
  set transfer(Transfer value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransfer() => $_clearField(4);
  @$pb.TagNumber(4)
  Transfer ensureTransfer() => $_ensure(3);

  @$pb.TagNumber(5)
  Stake get stake => $_getN(4);
  @$pb.TagNumber(5)
  set stake(Stake value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStake() => $_has(4);
  @$pb.TagNumber(5)
  void clearStake() => $_clearField(5);
  @$pb.TagNumber(5)
  Stake ensureStake() => $_ensure(4);

  @$pb.TagNumber(6)
  AddKey get addKey => $_getN(5);
  @$pb.TagNumber(6)
  set addKey(AddKey value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAddKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearAddKey() => $_clearField(6);
  @$pb.TagNumber(6)
  AddKey ensureAddKey() => $_ensure(5);

  @$pb.TagNumber(7)
  DeleteKey get deleteKey => $_getN(6);
  @$pb.TagNumber(7)
  set deleteKey(DeleteKey value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDeleteKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeleteKey() => $_clearField(7);
  @$pb.TagNumber(7)
  DeleteKey ensureDeleteKey() => $_ensure(6);

  @$pb.TagNumber(8)
  DeleteAccount get deleteAccount => $_getN(7);
  @$pb.TagNumber(8)
  set deleteAccount(DeleteAccount value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasDeleteAccount() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeleteAccount() => $_clearField(8);
  @$pb.TagNumber(8)
  DeleteAccount ensureDeleteAccount() => $_ensure(7);

  /// Gap in field numbering is intentional as it's not a standard NEAR action.
  @$pb.TagNumber(13)
  TokenTransfer get tokenTransfer => $_getN(8);
  @$pb.TagNumber(13)
  set tokenTransfer(TokenTransfer value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasTokenTransfer() => $_has(8);
  @$pb.TagNumber(13)
  void clearTokenTransfer() => $_clearField(13);
  @$pb.TagNumber(13)
  TokenTransfer ensureTokenTransfer() => $_ensure(8);
}

/// Input data necessary to create a signed order.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.String? signerId,
    $fixnum.Int64? nonce,
    $core.String? receiverId,
    $core.List<$core.int>? blockHash,
    $core.Iterable<Action>? actions,
    $core.List<$core.int>? privateKey,
    $core.List<$core.int>? publicKey,
  }) {
    final result = create();
    if (signerId != null) result.signerId = signerId;
    if (nonce != null) result.nonce = nonce;
    if (receiverId != null) result.receiverId = receiverId;
    if (blockHash != null) result.blockHash = blockHash;
    if (actions != null) result.actions.addAll(actions);
    if (privateKey != null) result.privateKey = privateKey;
    if (publicKey != null) result.publicKey = publicKey;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signerId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'nonce', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'receiverId')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'blockHash', $pb.PbFieldType.OY)
    ..pPM<Action>(5, _omitFieldNames ? '' : 'actions',
        subBuilder: Action.create)
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7, _omitFieldNames ? '' : 'publicKey', $pb.PbFieldType.OY)
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

  /// ID of the sender
  @$pb.TagNumber(1)
  $core.String get signerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set signerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignerId() => $_clearField(1);

  /// Nonce (should be larger than in the last transaction of the account)
  @$pb.TagNumber(2)
  $fixnum.Int64 get nonce => $_getI64(1);
  @$pb.TagNumber(2)
  set nonce($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => $_clearField(2);

  /// ID of the receiver
  @$pb.TagNumber(3)
  $core.String get receiverId => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiverId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiverId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverId() => $_clearField(3);

  /// Recent block hash
  @$pb.TagNumber(4)
  $core.List<$core.int> get blockHash => $_getN(3);
  @$pb.TagNumber(4)
  set blockHash($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBlockHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockHash() => $_clearField(4);

  /// Payload action(s)
  @$pb.TagNumber(5)
  $pb.PbList<Action> get actions => $_getList(4);

  /// The secret private key used for signing (32 bytes).
  @$pb.TagNumber(6)
  $core.List<$core.int> get privateKey => $_getN(5);
  @$pb.TagNumber(6)
  set privateKey($core.List<$core.int> value) => $_setBytes(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrivateKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrivateKey() => $_clearField(6);

  /// The public key used for compiling a transaction with a signature.
  @$pb.TagNumber(7)
  $core.List<$core.int> get publicKey => $_getN(6);
  @$pb.TagNumber(7)
  set publicKey($core.List<$core.int> value) => $_setBytes(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPublicKey() => $_has(6);
  @$pb.TagNumber(7)
  void clearPublicKey() => $_clearField(7);
}

/// Result containing the signed and encoded transaction.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.List<$core.int>? signedTransaction,
    $0.SigningError? error,
    $core.String? errorMessage,
    $core.List<$core.int>? hash,
  }) {
    final result = create();
    if (signedTransaction != null) result.signedTransaction = signedTransaction;
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (hash != null) result.hash = hash;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.NEAR.Proto'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'signedTransaction', $pb.PbFieldType.OY)
    ..aE<$0.SigningError>(2, _omitFieldNames ? '' : 'error',
        enumValues: $0.SigningError.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
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

  /// Signed transaction blob
  @$pb.TagNumber(1)
  $core.List<$core.int> get signedTransaction => $_getN(0);
  @$pb.TagNumber(1)
  set signedTransaction($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedTransaction() => $_clearField(1);

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

  /// Hash of the transaction
  @$pb.TagNumber(4)
  $core.List<$core.int> get hash => $_getN(3);
  @$pb.TagNumber(4)
  set hash($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearHash() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
