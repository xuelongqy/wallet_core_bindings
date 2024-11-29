//
//  Generated code. Do not modify.
//  source: Pactus.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionMessageDescriptor instead')
const TransactionMessage$json = {
  '1': 'TransactionMessage',
  '2': [
    {'1': 'lock_time', '3': 1, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'fee', '3': 2, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'memo', '3': 3, '4': 1, '5': 9, '10': 'memo'},
    {
      '1': 'transfer',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.TW.Pactus.Proto.TransferPayload',
      '9': 0,
      '10': 'transfer'
    },
    {
      '1': 'bond',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.TW.Pactus.Proto.BondPayload',
      '9': 0,
      '10': 'bond'
    },
  ],
  '8': [
    {'1': 'payload'},
  ],
};

/// Descriptor for `TransactionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionMessageDescriptor = $convert.base64Decode(
    'ChJUcmFuc2FjdGlvbk1lc3NhZ2USGwoJbG9ja190aW1lGAEgASgNUghsb2NrVGltZRIQCgNmZW'
    'UYAiABKANSA2ZlZRISCgRtZW1vGAMgASgJUgRtZW1vEj4KCHRyYW5zZmVyGAogASgLMiAuVFcu'
    'UGFjdHVzLlByb3RvLlRyYW5zZmVyUGF5bG9hZEgAUgh0cmFuc2ZlchIyCgRib25kGAsgASgLMh'
    'wuVFcuUGFjdHVzLlByb3RvLkJvbmRQYXlsb2FkSABSBGJvbmRCCQoHcGF5bG9hZA==');

@$core.Deprecated('Use transferPayloadDescriptor instead')
const TransferPayload$json = {
  '1': 'TransferPayload',
  '2': [
    {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `TransferPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferPayloadDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2ZlclBheWxvYWQSFgoGc2VuZGVyGAEgASgJUgZzZW5kZXISGgoIcmVjZWl2ZXIYAi'
    'ABKAlSCHJlY2VpdmVyEhYKBmFtb3VudBgDIAEoA1IGYW1vdW50');

@$core.Deprecated('Use bondPayloadDescriptor instead')
const BondPayload$json = {
  '1': 'BondPayload',
  '2': [
    {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'stake', '3': 3, '4': 1, '5': 3, '10': 'stake'},
    {'1': 'public_key', '3': 4, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `BondPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bondPayloadDescriptor = $convert.base64Decode(
    'CgtCb25kUGF5bG9hZBIWCgZzZW5kZXIYASABKAlSBnNlbmRlchIaCghyZWNlaXZlchgCIAEoCV'
    'IIcmVjZWl2ZXISFAoFc3Rha2UYAyABKANSBXN0YWtlEh0KCnB1YmxpY19rZXkYBCABKAlSCXB1'
    'YmxpY0tleQ==');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'private_key', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    {
      '1': 'transaction',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Pactus.Proto.TransactionMessage',
      '10': 'transaction'
    },
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSHwoLcHJpdmF0ZV9rZXkYASABKAxSCnByaXZhdGVLZXkSRQoLdHJhbn'
    'NhY3Rpb24YAiABKAsyIy5UVy5QYWN0dXMuUHJvdG8uVHJhbnNhY3Rpb25NZXNzYWdlUgt0cmFu'
    'c2FjdGlvbg==');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {'1': 'transaction_id', '3': 1, '4': 1, '5': 12, '10': 'transactionId'},
    {
      '1': 'signed_transaction_data',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'signedTransactionData'
    },
    {'1': 'signature', '3': 3, '4': 1, '5': 12, '10': 'signature'},
    {
      '1': 'error',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 5, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0EiUKDnRyYW5zYWN0aW9uX2lkGAEgASgMUg10cmFuc2FjdGlvbklkEj'
    'YKF3NpZ25lZF90cmFuc2FjdGlvbl9kYXRhGAIgASgMUhVzaWduZWRUcmFuc2FjdGlvbkRhdGES'
    'HAoJc2lnbmF0dXJlGAMgASgMUglzaWduYXR1cmUSMwoFZXJyb3IYBCABKA4yHS5UVy5Db21tb2'
    '4uUHJvdG8uU2lnbmluZ0Vycm9yUgVlcnJvchIjCg1lcnJvcl9tZXNzYWdlGAUgASgJUgxlcnJv'
    'ck1lc3NhZ2U=');
