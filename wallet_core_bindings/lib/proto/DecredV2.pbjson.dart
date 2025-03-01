//
//  Generated code. Do not modify.
//  source: DecredV2.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use outPointDescriptor instead')
const OutPoint$json = {
  '1': 'OutPoint',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
    {'1': 'tree', '3': 3, '4': 1, '5': 13, '10': 'tree'},
  ],
};

/// Descriptor for `OutPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outPointDescriptor = $convert.base64Decode(
    'CghPdXRQb2ludBISCgRoYXNoGAEgASgMUgRoYXNoEhIKBHZvdXQYAiABKA1SBHZvdXQSEgoEdH'
    'JlZRgDIAEoDVIEdHJlZQ==');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'serialize_type', '3': 1, '4': 1, '5': 13, '10': 'serializeType'},
    {'1': 'version', '3': 2, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'inputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.DecredV2.Proto.TransactionInput',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.DecredV2.Proto.TransactionOutput',
      '10': 'outputs'
    },
    {'1': 'lock_time', '3': 5, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'expiry', '3': 6, '4': 1, '5': 13, '10': 'expiry'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIlCg5zZXJpYWxpemVfdHlwZRgBIAEoDVINc2VyaWFsaXplVHlwZRIYCg'
    'd2ZXJzaW9uGAIgASgNUgd2ZXJzaW9uEjsKBmlucHV0cxgDIAMoCzIjLlRXLkRlY3JlZFYyLlBy'
    'b3RvLlRyYW5zYWN0aW9uSW5wdXRSBmlucHV0cxI+CgdvdXRwdXRzGAQgAygLMiQuVFcuRGVjcm'
    'VkVjIuUHJvdG8uVHJhbnNhY3Rpb25PdXRwdXRSB291dHB1dHMSGwoJbG9ja190aW1lGAUgASgN'
    'Ughsb2NrVGltZRIWCgZleHBpcnkYBiABKA1SBmV4cGlyeQ==');

@$core.Deprecated('Use transactionInputDescriptor instead')
const TransactionInput$json = {
  '1': 'TransactionInput',
  '2': [
    {
      '1': 'out_point',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.DecredV2.Proto.OutPoint',
      '10': 'outPoint'
    },
    {'1': 'sequence', '3': 2, '4': 1, '5': 13, '10': 'sequence'},
    {'1': 'value', '3': 3, '4': 1, '5': 3, '10': 'value'},
    {'1': 'block_height', '3': 4, '4': 1, '5': 13, '10': 'blockHeight'},
    {'1': 'block_index', '3': 5, '4': 1, '5': 13, '10': 'blockIndex'},
    {'1': 'script_sig', '3': 6, '4': 1, '5': 12, '10': 'scriptSig'},
  ],
};

/// Descriptor for `TransactionInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInputDescriptor = $convert.base64Decode(
    'ChBUcmFuc2FjdGlvbklucHV0EjgKCW91dF9wb2ludBgBIAEoCzIbLlRXLkRlY3JlZFYyLlByb3'
    'RvLk91dFBvaW50UghvdXRQb2ludBIaCghzZXF1ZW5jZRgCIAEoDVIIc2VxdWVuY2USFAoFdmFs'
    'dWUYAyABKANSBXZhbHVlEiEKDGJsb2NrX2hlaWdodBgEIAEoDVILYmxvY2tIZWlnaHQSHwoLYm'
    'xvY2tfaW5kZXgYBSABKA1SCmJsb2NrSW5kZXgSHQoKc2NyaXB0X3NpZxgGIAEoDFIJc2NyaXB0'
    'U2ln');

@$core.Deprecated('Use transactionOutputDescriptor instead')
const TransactionOutput$json = {
  '1': 'TransactionOutput',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
    {'1': 'version', '3': 2, '4': 1, '5': 13, '10': 'version'},
    {'1': 'script', '3': 3, '4': 1, '5': 12, '10': 'script'},
  ],
};

/// Descriptor for `TransactionOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionOutputDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvbk91dHB1dBIUCgV2YWx1ZRgBIAEoA1IFdmFsdWUSGAoHdmVyc2lvbhgCIA'
    'EoDVIHdmVyc2lvbhIWCgZzY3JpcHQYAyABKAxSBnNjcmlwdA==');
