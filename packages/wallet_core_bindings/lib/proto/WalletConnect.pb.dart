// This is a generated file - do not edit.
//
// Generated from WalletConnect.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Binance.pb.dart' as $0;
import 'Common.pbenum.dart' as $2;
import 'Solana.pb.dart' as $1;
import 'WalletConnect.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'WalletConnect.pbenum.dart';

class ParseRequestInput extends $pb.GeneratedMessage {
  factory ParseRequestInput({
    Protocol? protocol,
    Method? method,
    $core.String? payload,
  }) {
    final result = create();
    if (protocol != null) result.protocol = protocol;
    if (method != null) result.method = method;
    if (payload != null) result.payload = payload;
    return result;
  }

  ParseRequestInput._();

  factory ParseRequestInput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParseRequestInput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParseRequestInput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.WalletConnect.Proto'),
      createEmptyInstance: create)
    ..aE<Protocol>(1, _omitFieldNames ? '' : 'protocol',
        enumValues: Protocol.values)
    ..aE<Method>(2, _omitFieldNames ? '' : 'method', enumValues: Method.values)
    ..aOS(3, _omitFieldNames ? '' : 'payload')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseRequestInput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseRequestInput copyWith(void Function(ParseRequestInput) updates) =>
      super.copyWith((message) => updates(message as ParseRequestInput))
          as ParseRequestInput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseRequestInput create() => ParseRequestInput._();
  @$core.override
  ParseRequestInput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParseRequestInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParseRequestInput>(create);
  static ParseRequestInput? _defaultInstance;

  /// A protocol version.
  @$pb.TagNumber(1)
  Protocol get protocol => $_getN(0);
  @$pb.TagNumber(1)
  set protocol(Protocol value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProtocol() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocol() => $_clearField(1);

  /// A signing method like "cosmos_signAmino" or "eth_signTransaction".
  @$pb.TagNumber(2)
  Method get method => $_getN(1);
  @$pb.TagNumber(2)
  set method(Method value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMethod() => $_has(1);
  @$pb.TagNumber(2)
  void clearMethod() => $_clearField(2);

  /// Transaction payload to sign.
  /// Basically, a JSON object.
  @$pb.TagNumber(3)
  $core.String get payload => $_getSZ(2);
  @$pb.TagNumber(3)
  set payload($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => $_clearField(3);
}

enum ParseRequestOutput_SigningInputOneof { binance, solana, notSet }

class ParseRequestOutput extends $pb.GeneratedMessage {
  factory ParseRequestOutput({
    $2.SigningError? error,
    $core.String? errorMessage,
    $0.SigningInput? binance,
    $1.SigningInput? solana,
  }) {
    final result = create();
    if (error != null) result.error = error;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (binance != null) result.binance = binance;
    if (solana != null) result.solana = solana;
    return result;
  }

  ParseRequestOutput._();

  factory ParseRequestOutput.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParseRequestOutput.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ParseRequestOutput_SigningInputOneof>
      _ParseRequestOutput_SigningInputOneofByTag = {
    3: ParseRequestOutput_SigningInputOneof.binance,
    4: ParseRequestOutput_SigningInputOneof.solana,
    0: ParseRequestOutput_SigningInputOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParseRequestOutput',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'TW.WalletConnect.Proto'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aE<$2.SigningError>(1, _omitFieldNames ? '' : 'error',
        enumValues: $2.SigningError.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..aOM<$0.SigningInput>(3, _omitFieldNames ? '' : 'binance',
        subBuilder: $0.SigningInput.create)
    ..aOM<$1.SigningInput>(4, _omitFieldNames ? '' : 'solana',
        subBuilder: $1.SigningInput.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseRequestOutput clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseRequestOutput copyWith(void Function(ParseRequestOutput) updates) =>
      super.copyWith((message) => updates(message as ParseRequestOutput))
          as ParseRequestOutput;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseRequestOutput create() => ParseRequestOutput._();
  @$core.override
  ParseRequestOutput createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParseRequestOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParseRequestOutput>(create);
  static ParseRequestOutput? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  ParseRequestOutput_SigningInputOneof whichSigningInputOneof() =>
      _ParseRequestOutput_SigningInputOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearSigningInputOneof() => $_clearField($_whichOneof(0));

  /// OK (=0) or other codes in case of error
  @$pb.TagNumber(1)
  $2.SigningError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error($2.SigningError value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => $_clearField(1);

  /// error description in case of error
  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.SigningInput get binance => $_getN(2);
  @$pb.TagNumber(3)
  set binance($0.SigningInput value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBinance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBinance() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.SigningInput ensureBinance() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.SigningInput get solana => $_getN(3);
  @$pb.TagNumber(4)
  set solana($1.SigningInput value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSolana() => $_has(3);
  @$pb.TagNumber(4)
  void clearSolana() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.SigningInput ensureSolana() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
