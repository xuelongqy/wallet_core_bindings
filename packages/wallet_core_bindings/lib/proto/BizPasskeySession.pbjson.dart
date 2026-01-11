// This is a generated file - do not edit.
//
// Generated from BizPasskeySession.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use encodingHashParamsDescriptor instead')
const EncodingHashParams$json = {
  '1': 'EncodingHashParams',
  '2': [
    {'1': 'chain_id', '3': 1, '4': 1, '5': 12, '10': 'chainId'},
    {'1': 'code_address', '3': 2, '4': 1, '5': 9, '10': 'codeAddress'},
    {'1': 'code_name', '3': 3, '4': 1, '5': 9, '10': 'codeName'},
    {'1': 'code_version', '3': 4, '4': 1, '5': 9, '10': 'codeVersion'},
    {'1': 'type_hash', '3': 5, '4': 1, '5': 9, '10': 'typeHash'},
    {
      '1': 'domain_separator_hash',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'domainSeparatorHash'
    },
  ],
};

/// Descriptor for `EncodingHashParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encodingHashParamsDescriptor = $convert.base64Decode(
    'ChJFbmNvZGluZ0hhc2hQYXJhbXMSGQoIY2hhaW5faWQYASABKAxSB2NoYWluSWQSIQoMY29kZV'
    '9hZGRyZXNzGAIgASgJUgtjb2RlQWRkcmVzcxIbCgljb2RlX25hbWUYAyABKAlSCGNvZGVOYW1l'
    'EiEKDGNvZGVfdmVyc2lvbhgEIAEoCVILY29kZVZlcnNpb24SGwoJdHlwZV9oYXNoGAUgASgJUg'
    'h0eXBlSGFzaBIyChVkb21haW5fc2VwYXJhdG9yX2hhc2gYBiABKAlSE2RvbWFpblNlcGFyYXRv'
    'ckhhc2g=');

@$core.Deprecated('Use executionDescriptor instead')
const Execution$json = {
  '1': 'Execution',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'amount', '3': 2, '4': 1, '5': 12, '10': 'amount'},
    {'1': 'payload', '3': 3, '4': 1, '5': 12, '10': 'payload'},
  ],
};

/// Descriptor for `Execution`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executionDescriptor = $convert.base64Decode(
    'CglFeGVjdXRpb24SGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxIWCgZhbW91bnQYAiABKAxSBm'
    'Ftb3VudBIYCgdwYXlsb2FkGAMgASgMUgdwYXlsb2Fk');

@$core.Deprecated('Use executeWithPasskeySessionInputDescriptor instead')
const ExecuteWithPasskeySessionInput$json = {
  '1': 'ExecuteWithPasskeySessionInput',
  '2': [
    {
      '1': 'executions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TW.BizPasskeySession.Proto.Execution',
      '10': 'executions'
    },
    {'1': 'valid_after', '3': 2, '4': 1, '5': 4, '10': 'validAfter'},
    {'1': 'valid_until', '3': 3, '4': 1, '5': 4, '10': 'validUntil'},
    {
      '1': 'passkey_signature',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'passkeySignature'
    },
  ],
};

/// Descriptor for `ExecuteWithPasskeySessionInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeWithPasskeySessionInputDescriptor =
    $convert.base64Decode(
        'Ch5FeGVjdXRlV2l0aFBhc3NrZXlTZXNzaW9uSW5wdXQSRQoKZXhlY3V0aW9ucxgBIAMoCzIlLl'
        'RXLkJpelBhc3NrZXlTZXNzaW9uLlByb3RvLkV4ZWN1dGlvblIKZXhlY3V0aW9ucxIfCgt2YWxp'
        'ZF9hZnRlchgCIAEoBFIKdmFsaWRBZnRlchIfCgt2YWxpZF91bnRpbBgDIAEoBFIKdmFsaWRVbn'
        'RpbBIrChFwYXNza2V5X3NpZ25hdHVyZRgEIAEoDFIQcGFzc2tleVNpZ25hdHVyZQ==');

@$core.Deprecated('Use executeWithSignatureInputDescriptor instead')
const ExecuteWithSignatureInput$json = {
  '1': 'ExecuteWithSignatureInput',
  '2': [
    {
      '1': 'executions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TW.BizPasskeySession.Proto.Execution',
      '10': 'executions'
    },
    {'1': 'private_key', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
    {'1': 'nonce', '3': 3, '4': 1, '5': 12, '10': 'nonce'},
    {'1': 'valid_after', '3': 4, '4': 1, '5': 4, '10': 'validAfter'},
    {'1': 'valid_until', '3': 5, '4': 1, '5': 4, '10': 'validUntil'},
    {
      '1': 'encoding_hash_params',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.BizPasskeySession.Proto.EncodingHashParams',
      '10': 'encodingHashParams'
    },
  ],
};

/// Descriptor for `ExecuteWithSignatureInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeWithSignatureInputDescriptor = $convert.base64Decode(
    'ChlFeGVjdXRlV2l0aFNpZ25hdHVyZUlucHV0EkUKCmV4ZWN1dGlvbnMYASADKAsyJS5UVy5CaX'
    'pQYXNza2V5U2Vzc2lvbi5Qcm90by5FeGVjdXRpb25SCmV4ZWN1dGlvbnMSHwoLcHJpdmF0ZV9r'
    'ZXkYAiABKAxSCnByaXZhdGVLZXkSFAoFbm9uY2UYAyABKAxSBW5vbmNlEh8KC3ZhbGlkX2FmdG'
    'VyGAQgASgEUgp2YWxpZEFmdGVyEh8KC3ZhbGlkX3VudGlsGAUgASgEUgp2YWxpZFVudGlsEmAK'
    'FGVuY29kaW5nX2hhc2hfcGFyYW1zGAYgASgLMi4uVFcuQml6UGFzc2tleVNlc3Npb24uUHJvdG'
    '8uRW5jb2RpbmdIYXNoUGFyYW1zUhJlbmNvZGluZ0hhc2hQYXJhbXM=');
