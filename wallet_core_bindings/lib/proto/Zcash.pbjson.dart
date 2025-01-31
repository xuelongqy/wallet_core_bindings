//
//  Generated code. Do not modify.
//  source: Zcash.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionBuilderExtraDataDescriptor instead')
const TransactionBuilderExtraData$json = {
  '1': 'TransactionBuilderExtraData',
  '2': [
    {'1': 'branch_id', '3': 1, '4': 1, '5': 12, '10': 'branchId'},
    {'1': 'expiry_height', '3': 2, '4': 1, '5': 13, '10': 'expiryHeight'},
    {'1': 'zip_0317', '3': 3, '4': 1, '5': 8, '10': 'zip0317'},
  ],
};

/// Descriptor for `TransactionBuilderExtraData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionBuilderExtraDataDescriptor =
    $convert.base64Decode(
        'ChtUcmFuc2FjdGlvbkJ1aWxkZXJFeHRyYURhdGESGwoJYnJhbmNoX2lkGAEgASgMUghicmFuY2'
        'hJZBIjCg1leHBpcnlfaGVpZ2h0GAIgASgNUgxleHBpcnlIZWlnaHQSGQoIemlwXzAzMTcYAyAB'
        'KAhSB3ppcDAzMTc=');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {'1': 'version_group_id', '3': 2, '4': 1, '5': 13, '10': 'versionGroupId'},
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
    {'1': 'lock_time', '3': 5, '4': 1, '5': 13, '10': 'lockTime'},
    {'1': 'expiry_height', '3': 6, '4': 1, '5': 13, '10': 'expiryHeight'},
    {
      '1': 'sapling_value_balance',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'saplingValueBalance'
    },
    {'1': 'branch_id', '3': 8, '4': 1, '5': 12, '10': 'branchId'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIYCgd2ZXJzaW9uGAEgASgFUgd2ZXJzaW9uEigKEHZlcnNpb25fZ3JvdX'
    'BfaWQYAiABKA1SDnZlcnNpb25Hcm91cElkEjcKBmlucHV0cxgDIAMoCzIfLlRXLlV0eG8uUHJv'
    'dG8uVHJhbnNhY3Rpb25JbnB1dFIGaW5wdXRzEjoKB291dHB1dHMYBCADKAsyIC5UVy5VdHhvLl'
    'Byb3RvLlRyYW5zYWN0aW9uT3V0cHV0UgdvdXRwdXRzEhsKCWxvY2tfdGltZRgFIAEoDVIIbG9j'
    'a1RpbWUSIwoNZXhwaXJ5X2hlaWdodBgGIAEoDVIMZXhwaXJ5SGVpZ2h0EjIKFXNhcGxpbmdfdm'
    'FsdWVfYmFsYW5jZRgHIAEoA1ITc2FwbGluZ1ZhbHVlQmFsYW5jZRIbCglicmFuY2hfaWQYCCAB'
    'KAxSCGJyYW5jaElk');
