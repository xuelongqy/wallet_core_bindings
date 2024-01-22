//
//  Generated code. Do not modify.
//  source: Sui.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Common.pbenum.dart' as $0;

/// Base64 encoded msg to sign (string)
class SignDirect extends $pb.GeneratedMessage {
  factory SignDirect({
    $core.String? unsignedTxMsg,
  }) {
    final $result = create();
    if (unsignedTxMsg != null) {
      $result.unsignedTxMsg = unsignedTxMsg;
    }
    return $result;
  }
  SignDirect._() : super();
  factory SignDirect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignDirect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SignDirect',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'unsignedTxMsg')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignDirect clone() => SignDirect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignDirect copyWith(void Function(SignDirect) updates) =>
      super.copyWith((message) => updates(message as SignDirect)) as SignDirect;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignDirect create() => SignDirect._();
  SignDirect createEmptyInstance() => create();
  static $pb.PbList<SignDirect> createRepeated() => $pb.PbList<SignDirect>();
  @$core.pragma('dart2js:noInline')
  static SignDirect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignDirect>(create);
  static SignDirect? _defaultInstance;

  /// Obtain by calling any write RpcJson on SUI
  @$pb.TagNumber(1)
  $core.String get unsignedTxMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set unsignedTxMsg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnsignedTxMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnsignedTxMsg() => clearField(1);
}

enum SigningInput_TransactionPayload { signDirectMessage, notSet }

/// Input data necessary to create a signed transaction.
class SigningInput extends $pb.GeneratedMessage {
  factory SigningInput({
    $core.List<$core.int>? privateKey,
    SignDirect? signDirectMessage,
  }) {
    final $result = create();
    if (privateKey != null) {
      $result.privateKey = privateKey;
    }
    if (signDirectMessage != null) {
      $result.signDirectMessage = signDirectMessage;
    }
    return $result;
  }
  SigningInput._() : super();
  factory SigningInput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SigningInput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SigningInput_TransactionPayload>
      _SigningInput_TransactionPayloadByTag = {
    2: SigningInput_TransactionPayload.signDirectMessage,
    0: SigningInput_TransactionPayload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningInput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'privateKey', $pb.PbFieldType.OY)
    ..aOM<SignDirect>(2, _omitFieldNames ? '' : 'signDirectMessage',
        subBuilder: SignDirect.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SigningInput clone() => SigningInput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SigningInput copyWith(void Function(SigningInput) updates) =>
      super.copyWith((message) => updates(message as SigningInput))
          as SigningInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningInput create() => SigningInput._();
  SigningInput createEmptyInstance() => create();
  static $pb.PbList<SigningInput> createRepeated() =>
      $pb.PbList<SigningInput>();
  @$core.pragma('dart2js:noInline')
  static SigningInput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningInput>(create);
  static SigningInput? _defaultInstance;

  SigningInput_TransactionPayload whichTransactionPayload() =>
      _SigningInput_TransactionPayloadByTag[$_whichOneof(0)]!;
  void clearTransactionPayload() => clearField($_whichOneof(0));

  /// Private key to sign the transaction (bytes)
  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(2)
  SignDirect get signDirectMessage => $_getN(1);
  @$pb.TagNumber(2)
  set signDirectMessage(SignDirect v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSignDirectMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignDirectMessage() => clearField(2);
  @$pb.TagNumber(2)
  SignDirect ensureSignDirectMessage() => $_ensure(1);
}

/// Transaction signing output.
class SigningOutput extends $pb.GeneratedMessage {
  factory SigningOutput({
    $core.String? unsignedTx,
    $core.String? signature,
    $0.SigningError? error,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (unsignedTx != null) {
      $result.unsignedTx = unsignedTx;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    if (error != null) {
      $result.error = error;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    return $result;
  }
  SigningOutput._() : super();
  factory SigningOutput.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SigningOutput.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningOutput',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Sui.Proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'unsignedTx')
    ..aOS(2, _omitFieldNames ? '' : 'signature')
    ..e<$0.SigningError>(3, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE,
        defaultOrMaker: $0.SigningError.OK,
        valueOf: $0.SigningError.valueOf,
        enumValues: $0.SigningError.values)
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SigningOutput clone() => SigningOutput()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SigningOutput copyWith(void Function(SigningOutput) updates) =>
      super.copyWith((message) => updates(message as SigningOutput))
          as SigningOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningOutput create() => SigningOutput._();
  SigningOutput createEmptyInstance() => create();
  static $pb.PbList<SigningOutput> createRepeated() =>
      $pb.PbList<SigningOutput>();
  @$core.pragma('dart2js:noInline')
  static SigningOutput getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningOutput>(create);
  static SigningOutput? _defaultInstance;

  /// / The raw transaction without indent in base64
  @$pb.TagNumber(1)
  $core.String get unsignedTx => $_getSZ(0);
  @$pb.TagNumber(1)
  set unsignedTx($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnsignedTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnsignedTx() => clearField(1);

  /// / The signature encoded in base64
  @$pb.TagNumber(2)
  $core.String get signature => $_getSZ(1);
  @$pb.TagNumber(2)
  set signature($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);

  /// Error code, 0 is ok, other codes will be treated as errors.
  @$pb.TagNumber(3)
  $0.SigningError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($0.SigningError v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);

  /// Error description.
  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
