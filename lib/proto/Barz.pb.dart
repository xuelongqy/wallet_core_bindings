//
//  Generated code. Do not modify.
//  source: Barz.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Input parameters for calculating a counterfactual address for ERC-4337 based smart contract wallet
class ContractAddressInput extends $pb.GeneratedMessage {
  factory ContractAddressInput({
    $core.String? entryPoint,
    $core.String? factory,
    $core.String? accountFacet,
    $core.String? verificationFacet,
    $core.String? facetRegistry,
    $core.String? defaultFallback,
    $core.String? bytecode,
    $core.String? publicKey,
    $core.int? salt,
  }) {
    final $result = create();
    if (entryPoint != null) {
      $result.entryPoint = entryPoint;
    }
    if (factory != null) {
      $result.factory = factory;
    }
    if (accountFacet != null) {
      $result.accountFacet = accountFacet;
    }
    if (verificationFacet != null) {
      $result.verificationFacet = verificationFacet;
    }
    if (facetRegistry != null) {
      $result.facetRegistry = facetRegistry;
    }
    if (defaultFallback != null) {
      $result.defaultFallback = defaultFallback;
    }
    if (bytecode != null) {
      $result.bytecode = bytecode;
    }
    if (publicKey != null) {
      $result.publicKey = publicKey;
    }
    if (salt != null) {
      $result.salt = salt;
    }
    return $result;
  }
  ContractAddressInput._() : super();
  factory ContractAddressInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContractAddressInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContractAddressInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'TW.Barz.Proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'entryPoint')
    ..aOS(2, _omitFieldNames ? '' : 'factory')
    ..aOS(3, _omitFieldNames ? '' : 'accountFacet')
    ..aOS(4, _omitFieldNames ? '' : 'verificationFacet')
    ..aOS(5, _omitFieldNames ? '' : 'facetRegistry')
    ..aOS(6, _omitFieldNames ? '' : 'defaultFallback')
    ..aOS(7, _omitFieldNames ? '' : 'bytecode')
    ..aOS(8, _omitFieldNames ? '' : 'publicKey')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'salt', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContractAddressInput clone() => ContractAddressInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContractAddressInput copyWith(void Function(ContractAddressInput) updates) => super.copyWith((message) => updates(message as ContractAddressInput)) as ContractAddressInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractAddressInput create() => ContractAddressInput._();
  ContractAddressInput createEmptyInstance() => create();
  static $pb.PbList<ContractAddressInput> createRepeated() => $pb.PbList<ContractAddressInput>();
  @$core.pragma('dart2js:noInline')
  static ContractAddressInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContractAddressInput>(create);
  static ContractAddressInput? _defaultInstance;

  /// ERC-4337 entry point
  @$pb.TagNumber(1)
  $core.String get entryPoint => $_getSZ(0);
  @$pb.TagNumber(1)
  set entryPoint($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEntryPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntryPoint() => clearField(1);

  /// Address of the contract factory
  @$pb.TagNumber(2)
  $core.String get factory => $_getSZ(1);
  @$pb.TagNumber(2)
  set factory($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFactory() => $_has(1);
  @$pb.TagNumber(2)
  void clearFactory() => clearField(2);

  /// Diamond proxy facets required for the contract setup
  @$pb.TagNumber(3)
  $core.String get accountFacet => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountFacet($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountFacet() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountFacet() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get verificationFacet => $_getSZ(3);
  @$pb.TagNumber(4)
  set verificationFacet($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVerificationFacet() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerificationFacet() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get facetRegistry => $_getSZ(4);
  @$pb.TagNumber(5)
  set facetRegistry($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFacetRegistry() => $_has(4);
  @$pb.TagNumber(5)
  void clearFacetRegistry() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get defaultFallback => $_getSZ(5);
  @$pb.TagNumber(6)
  set defaultFallback($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefaultFallback() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefaultFallback() => clearField(6);

  /// Bytecode of the smart contract to deploy
  @$pb.TagNumber(7)
  $core.String get bytecode => $_getSZ(6);
  @$pb.TagNumber(7)
  set bytecode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBytecode() => $_has(6);
  @$pb.TagNumber(7)
  void clearBytecode() => clearField(7);

  /// PublicKey of the wallet
  @$pb.TagNumber(8)
  $core.String get publicKey => $_getSZ(7);
  @$pb.TagNumber(8)
  set publicKey($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPublicKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearPublicKey() => clearField(8);

  /// Salt is used to derive multiple account from the same public key
  @$pb.TagNumber(9)
  $core.int get salt => $_getIZ(8);
  @$pb.TagNumber(9)
  set salt($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSalt() => $_has(8);
  @$pb.TagNumber(9)
  void clearSalt() => clearField(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
