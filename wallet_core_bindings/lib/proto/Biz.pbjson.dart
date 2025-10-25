//
//  Generated code. Do not modify.
//  source: Biz.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use executeWithPasskeySessionInputDescriptor instead')
const ExecuteWithPasskeySessionInput$json = {
  '1': 'ExecuteWithPasskeySessionInput',
  '2': [
    {
      '1': 'executions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TW.Biz.Proto.ExecuteWithPasskeySessionInput.Execution',
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
  '3': [ExecuteWithPasskeySessionInput_Execution$json],
};

@$core.Deprecated('Use executeWithPasskeySessionInputDescriptor instead')
const ExecuteWithPasskeySessionInput_Execution$json = {
  '1': 'Execution',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'amount', '3': 2, '4': 1, '5': 12, '10': 'amount'},
    {'1': 'payload', '3': 3, '4': 1, '5': 12, '10': 'payload'},
  ],
};

/// Descriptor for `ExecuteWithPasskeySessionInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeWithPasskeySessionInputDescriptor = $convert.base64Decode(
    'Ch5FeGVjdXRlV2l0aFBhc3NrZXlTZXNzaW9uSW5wdXQSVgoKZXhlY3V0aW9ucxgBIAMoCzI2Ll'
    'RXLkJpei5Qcm90by5FeGVjdXRlV2l0aFBhc3NrZXlTZXNzaW9uSW5wdXQuRXhlY3V0aW9uUgpl'
    'eGVjdXRpb25zEh8KC3ZhbGlkX2FmdGVyGAIgASgEUgp2YWxpZEFmdGVyEh8KC3ZhbGlkX3VudG'
    'lsGAMgASgEUgp2YWxpZFVudGlsEisKEXBhc3NrZXlfc2lnbmF0dXJlGAQgASgMUhBwYXNza2V5'
    'U2lnbmF0dXJlGlcKCUV4ZWN1dGlvbhIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEhYKBmFtb3'
    'VudBgCIAEoDFIGYW1vdW50EhgKB3BheWxvYWQYAyABKAxSB3BheWxvYWQ=');
