//
//  Generated code. Do not modify.
//  source: Utxo.proto
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
  ],
};

/// Descriptor for `OutPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outPointDescriptor = $convert.base64Decode(
    'CghPdXRQb2ludBISCgRoYXNoGAEgASgMUgRoYXNoEhIKBHZvdXQYAiABKA1SBHZvdXQ=');

@$core.Deprecated('Use transactionInputDescriptor instead')
const TransactionInput$json = {
  '1': 'TransactionInput',
  '2': [
    {
      '1': 'out_point',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Utxo.Proto.OutPoint',
      '10': 'outPoint'
    },
    {'1': 'sequence', '3': 2, '4': 1, '5': 13, '10': 'sequence'},
    {'1': 'script_sig', '3': 3, '4': 1, '5': 12, '10': 'scriptSig'},
    {'1': 'witness_items', '3': 4, '4': 3, '5': 12, '10': 'witnessItems'},
  ],
};

/// Descriptor for `TransactionInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInputDescriptor = $convert.base64Decode(
    'ChBUcmFuc2FjdGlvbklucHV0EjQKCW91dF9wb2ludBgBIAEoCzIXLlRXLlV0eG8uUHJvdG8uT3'
    'V0UG9pbnRSCG91dFBvaW50EhoKCHNlcXVlbmNlGAIgASgNUghzZXF1ZW5jZRIdCgpzY3JpcHRf'
    'c2lnGAMgASgMUglzY3JpcHRTaWcSIwoNd2l0bmVzc19pdGVtcxgEIAMoDFIMd2l0bmVzc0l0ZW'
    '1z');

@$core.Deprecated('Use transactionOutputDescriptor instead')
const TransactionOutput$json = {
  '1': 'TransactionOutput',
  '2': [
    {'1': 'script_pubkey', '3': 1, '4': 1, '5': 12, '10': 'scriptPubkey'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
};

/// Descriptor for `TransactionOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionOutputDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvbk91dHB1dBIjCg1zY3JpcHRfcHVia2V5GAEgASgMUgxzY3JpcHRQdWJrZX'
    'kSFAoFdmFsdWUYAiABKANSBXZhbHVl');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {'1': 'lock_time', '3': 2, '4': 1, '5': 13, '10': 'lockTime'},
    {
      '1': 'inputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TransactionInput',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TransactionOutput',
      '10': 'outputs'
    },
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIYCgd2ZXJzaW9uGAEgASgFUgd2ZXJzaW9uEhsKCWxvY2tfdGltZRgCIA'
    'EoDVIIbG9ja1RpbWUSNwoGaW5wdXRzGAMgAygLMh8uVFcuVXR4by5Qcm90by5UcmFuc2FjdGlv'
    'bklucHV0UgZpbnB1dHMSOgoHb3V0cHV0cxgEIAMoCzIgLlRXLlV0eG8uUHJvdG8uVHJhbnNhY3'
    'Rpb25PdXRwdXRSB291dHB1dHM=');
