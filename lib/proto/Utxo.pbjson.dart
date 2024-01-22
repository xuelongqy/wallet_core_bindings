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

@$core.Deprecated('Use errorDescriptor instead')
const Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'OK', '2': 0},
    {'1': 'Error_invalid_leaf_hash', '2': 1},
    {'1': 'Error_invalid_sighash_type', '2': 2},
    {'1': 'Error_invalid_lock_time', '2': 3},
    {'1': 'Error_invalid_txid', '2': 4},
    {'1': 'Error_sighash_failed', '2': 5},
    {'1': 'Error_missing_sighash_method', '2': 6},
    {'1': 'Error_failed_encoding', '2': 7},
    {'1': 'Error_insufficient_inputs', '2': 8},
    {'1': 'Error_missing_change_script_pubkey', '2': 9},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchIGCgJPSxAAEhsKF0Vycm9yX2ludmFsaWRfbGVhZl9oYXNoEAESHgoaRXJyb3JfaW'
    '52YWxpZF9zaWdoYXNoX3R5cGUQAhIbChdFcnJvcl9pbnZhbGlkX2xvY2tfdGltZRADEhYKEkVy'
    'cm9yX2ludmFsaWRfdHhpZBAEEhgKFEVycm9yX3NpZ2hhc2hfZmFpbGVkEAUSIAocRXJyb3JfbW'
    'lzc2luZ19zaWdoYXNoX21ldGhvZBAGEhkKFUVycm9yX2ZhaWxlZF9lbmNvZGluZxAHEh0KGUVy'
    'cm9yX2luc3VmZmljaWVudF9pbnB1dHMQCBImCiJFcnJvcl9taXNzaW5nX2NoYW5nZV9zY3JpcH'
    'RfcHVia2V5EAk=');

@$core.Deprecated('Use inputSelectorDescriptor instead')
const InputSelector$json = {
  '1': 'InputSelector',
  '2': [
    {'1': 'UseAll', '2': 0},
    {'1': 'SelectInOrder', '2': 1},
    {'1': 'SelectAscending', '2': 2},
  ],
};

/// Descriptor for `InputSelector`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List inputSelectorDescriptor = $convert.base64Decode(
    'Cg1JbnB1dFNlbGVjdG9yEgoKBlVzZUFsbBAAEhEKDVNlbGVjdEluT3JkZXIQARITCg9TZWxlY3'
    'RBc2NlbmRpbmcQAg==');

@$core.Deprecated('Use signingMethodDescriptor instead')
const SigningMethod$json = {
  '1': 'SigningMethod',
  '2': [
    {'1': 'Legacy', '2': 0},
    {'1': 'Segwit', '2': 1},
    {'1': 'TaprootAll', '2': 2},
    {'1': 'TaprootOnePrevout', '2': 3},
  ],
};

/// Descriptor for `SigningMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signingMethodDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nTWV0aG9kEgoKBkxlZ2FjeRAAEgoKBlNlZ3dpdBABEg4KClRhcHJvb3RBbGwQAh'
    'IVChFUYXByb290T25lUHJldm91dBAD');

@$core.Deprecated('Use sighashTypeDescriptor instead')
const SighashType$json = {
  '1': 'SighashType',
  '2': [
    {'1': 'UseDefault', '2': 0},
    {'1': 'All', '2': 1},
    {'1': 'None', '2': 2},
    {'1': 'Single', '2': 3},
    {'1': 'AllPlusAnyoneCanPay', '2': 129},
    {'1': 'NonePlusAnyoneCanPay', '2': 130},
    {'1': 'SinglePlusAnyoneCanPay', '2': 131},
  ],
};

/// Descriptor for `SighashType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sighashTypeDescriptor = $convert.base64Decode(
    'CgtTaWdoYXNoVHlwZRIOCgpVc2VEZWZhdWx0EAASBwoDQWxsEAESCAoETm9uZRACEgoKBlNpbm'
    'dsZRADEhgKE0FsbFBsdXNBbnlvbmVDYW5QYXkQgQESGQoUTm9uZVBsdXNBbnlvbmVDYW5QYXkQ'
    'ggESGwoWU2luZ2xlUGx1c0FueW9uZUNhblBheRCDAQ==');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {
      '1': 'lock_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Utxo.Proto.LockTime',
      '10': 'lockTime'
    },
    {
      '1': 'inputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxIn',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxOut',
      '10': 'outputs'
    },
    {
      '1': 'input_selector',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.InputSelector',
      '10': 'inputSelector'
    },
    {'1': 'weight_base', '3': 6, '4': 1, '5': 4, '10': 'weightBase'},
    {
      '1': 'change_script_pubkey',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'changeScriptPubkey'
    },
    {
      '1': 'disable_change_output',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'disableChangeOutput'
    },
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSGAoHdmVyc2lvbhgBIAEoBVIHdmVyc2lvbhI0Cglsb2NrX3RpbWUYAi'
    'ABKAsyFy5UVy5VdHhvLlByb3RvLkxvY2tUaW1lUghsb2NrVGltZRIrCgZpbnB1dHMYAyADKAsy'
    'Ey5UVy5VdHhvLlByb3RvLlR4SW5SBmlucHV0cxIuCgdvdXRwdXRzGAQgAygLMhQuVFcuVXR4by'
    '5Qcm90by5UeE91dFIHb3V0cHV0cxJDCg5pbnB1dF9zZWxlY3RvchgFIAEoDjIcLlRXLlV0eG8u'
    'UHJvdG8uSW5wdXRTZWxlY3RvclINaW5wdXRTZWxlY3RvchIfCgt3ZWlnaHRfYmFzZRgGIAEoBF'
    'IKd2VpZ2h0QmFzZRIwChRjaGFuZ2Vfc2NyaXB0X3B1YmtleRgHIAEoDFISY2hhbmdlU2NyaXB0'
    'UHVia2V5EjIKFWRpc2FibGVfY2hhbmdlX291dHB1dBgIIAEoCFITZGlzYWJsZUNoYW5nZU91dH'
    'B1dA==');

@$core.Deprecated('Use lockTimeDescriptor instead')
const LockTime$json = {
  '1': 'LockTime',
  '2': [
    {'1': 'blocks', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'blocks'},
    {'1': 'seconds', '3': 2, '4': 1, '5': 13, '9': 0, '10': 'seconds'},
  ],
  '8': [
    {'1': 'variant'},
  ],
};

/// Descriptor for `LockTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockTimeDescriptor = $convert.base64Decode(
    'CghMb2NrVGltZRIYCgZibG9ja3MYASABKA1IAFIGYmxvY2tzEhoKB3NlY29uZHMYAiABKA1IAF'
    'IHc2Vjb25kc0IJCgd2YXJpYW50');

@$core.Deprecated('Use txInDescriptor instead')
const TxIn$json = {
  '1': 'TxIn',
  '2': [
    {'1': 'txid', '3': 1, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
    {'1': 'value', '3': 3, '4': 1, '5': 4, '10': 'value'},
    {'1': 'sequence', '3': 4, '4': 1, '5': 13, '10': 'sequence'},
    {'1': 'script_pubkey', '3': 7, '4': 1, '5': 12, '10': 'scriptPubkey'},
    {
      '1': 'sighash_type',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.SighashType',
      '10': 'sighashType'
    },
    {
      '1': 'signing_method',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.SigningMethod',
      '10': 'signingMethod'
    },
    {'1': 'weight_estimate', '3': 10, '4': 1, '5': 4, '10': 'weightEstimate'},
    {'1': 'leaf_hash', '3': 11, '4': 1, '5': 12, '10': 'leafHash'},
  ],
};

/// Descriptor for `TxIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txInDescriptor = $convert.base64Decode(
    'CgRUeEluEhIKBHR4aWQYASABKAxSBHR4aWQSEgoEdm91dBgCIAEoDVIEdm91dBIUCgV2YWx1ZR'
    'gDIAEoBFIFdmFsdWUSGgoIc2VxdWVuY2UYBCABKA1SCHNlcXVlbmNlEiMKDXNjcmlwdF9wdWJr'
    'ZXkYByABKAxSDHNjcmlwdFB1YmtleRI9CgxzaWdoYXNoX3R5cGUYCCABKA4yGi5UVy5VdHhvLl'
    'Byb3RvLlNpZ2hhc2hUeXBlUgtzaWdoYXNoVHlwZRJDCg5zaWduaW5nX21ldGhvZBgJIAEoDjIc'
    'LlRXLlV0eG8uUHJvdG8uU2lnbmluZ01ldGhvZFINc2lnbmluZ01ldGhvZBInCg93ZWlnaHRfZX'
    'N0aW1hdGUYCiABKARSDndlaWdodEVzdGltYXRlEhsKCWxlYWZfaGFzaBgLIAEoDFIIbGVhZkhh'
    'c2g=');

@$core.Deprecated('Use txOutDescriptor instead')
const TxOut$json = {
  '1': 'TxOut',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 4, '10': 'value'},
    {'1': 'script_pubkey', '3': 2, '4': 1, '5': 12, '10': 'scriptPubkey'},
  ],
};

/// Descriptor for `TxOut`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txOutDescriptor = $convert.base64Decode(
    'CgVUeE91dBIUCgV2YWx1ZRgBIAEoBFIFdmFsdWUSIwoNc2NyaXB0X3B1YmtleRgCIAEoDFIMc2'
    'NyaXB0UHVia2V5');

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput$json = {
  '1': 'PreSigningOutput',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.Error',
      '10': 'error'
    },
    {'1': 'txid', '3': 2, '4': 1, '5': 12, '10': 'txid'},
    {
      '1': 'sighashes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.Sighash',
      '10': 'sighashes'
    },
    {
      '1': 'inputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxIn',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxOut',
      '10': 'outputs'
    },
    {'1': 'weight_estimate', '3': 6, '4': 1, '5': 4, '10': 'weightEstimate'},
    {'1': 'fee_estimate', '3': 7, '4': 1, '5': 4, '10': 'feeEstimate'},
  ],
};

/// Descriptor for `PreSigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preSigningOutputDescriptor = $convert.base64Decode(
    'ChBQcmVTaWduaW5nT3V0cHV0EioKBWVycm9yGAEgASgOMhQuVFcuVXR4by5Qcm90by5FcnJvcl'
    'IFZXJyb3ISEgoEdHhpZBgCIAEoDFIEdHhpZBI0CglzaWdoYXNoZXMYAyADKAsyFi5UVy5VdHhv'
    'LlByb3RvLlNpZ2hhc2hSCXNpZ2hhc2hlcxIrCgZpbnB1dHMYBCADKAsyEy5UVy5VdHhvLlByb3'
    'RvLlR4SW5SBmlucHV0cxIuCgdvdXRwdXRzGAUgAygLMhQuVFcuVXR4by5Qcm90by5UeE91dFIH'
    'b3V0cHV0cxInCg93ZWlnaHRfZXN0aW1hdGUYBiABKARSDndlaWdodEVzdGltYXRlEiEKDGZlZV'
    '9lc3RpbWF0ZRgHIAEoBFILZmVlRXN0aW1hdGU=');

@$core.Deprecated('Use sighashDescriptor instead')
const Sighash$json = {
  '1': 'Sighash',
  '2': [
    {'1': 'sighash', '3': 1, '4': 1, '5': 12, '10': 'sighash'},
    {
      '1': 'signing_method',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.SigningMethod',
      '10': 'signingMethod'
    },
    {
      '1': 'sighash_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.SighashType',
      '10': 'sighashType'
    },
  ],
};

/// Descriptor for `Sighash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sighashDescriptor = $convert.base64Decode(
    'CgdTaWdoYXNoEhgKB3NpZ2hhc2gYASABKAxSB3NpZ2hhc2gSQwoOc2lnbmluZ19tZXRob2QYAi'
    'ABKA4yHC5UVy5VdHhvLlByb3RvLlNpZ25pbmdNZXRob2RSDXNpZ25pbmdNZXRob2QSPQoMc2ln'
    'aGFzaF90eXBlGAMgASgOMhouVFcuVXR4by5Qcm90by5TaWdoYXNoVHlwZVILc2lnaGFzaFR5cG'
    'U=');

@$core.Deprecated('Use preSerializationDescriptor instead')
const PreSerialization$json = {
  '1': 'PreSerialization',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {
      '1': 'lock_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Utxo.Proto.LockTime',
      '10': 'lockTime'
    },
    {
      '1': 'inputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxInClaim',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxOut',
      '10': 'outputs'
    },
    {'1': 'weight_base', '3': 5, '4': 1, '5': 4, '10': 'weightBase'},
  ],
};

/// Descriptor for `PreSerialization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preSerializationDescriptor = $convert.base64Decode(
    'ChBQcmVTZXJpYWxpemF0aW9uEhgKB3ZlcnNpb24YASABKAVSB3ZlcnNpb24SNAoJbG9ja190aW'
    '1lGAIgASgLMhcuVFcuVXR4by5Qcm90by5Mb2NrVGltZVIIbG9ja1RpbWUSMAoGaW5wdXRzGAMg'
    'AygLMhguVFcuVXR4by5Qcm90by5UeEluQ2xhaW1SBmlucHV0cxIuCgdvdXRwdXRzGAQgAygLMh'
    'QuVFcuVXR4by5Qcm90by5UeE91dFIHb3V0cHV0cxIfCgt3ZWlnaHRfYmFzZRgFIAEoBFIKd2Vp'
    'Z2h0QmFzZQ==');

@$core.Deprecated('Use txInClaimDescriptor instead')
const TxInClaim$json = {
  '1': 'TxInClaim',
  '2': [
    {'1': 'txid', '3': 1, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'vout', '3': 2, '4': 1, '5': 13, '10': 'vout'},
    {'1': 'sequence', '3': 3, '4': 1, '5': 13, '10': 'sequence'},
    {'1': 'script_sig', '3': 4, '4': 1, '5': 12, '10': 'scriptSig'},
    {'1': 'witness_items', '3': 5, '4': 3, '5': 12, '10': 'witnessItems'},
  ],
};

/// Descriptor for `TxInClaim`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txInClaimDescriptor = $convert.base64Decode(
    'CglUeEluQ2xhaW0SEgoEdHhpZBgBIAEoDFIEdHhpZBISCgR2b3V0GAIgASgNUgR2b3V0EhoKCH'
    'NlcXVlbmNlGAMgASgNUghzZXF1ZW5jZRIdCgpzY3JpcHRfc2lnGAQgASgMUglzY3JpcHRTaWcS'
    'IwoNd2l0bmVzc19pdGVtcxgFIAMoDFIMd2l0bmVzc0l0ZW1z');

@$core.Deprecated('Use serializedTransactionDescriptor instead')
const SerializedTransaction$json = {
  '1': 'SerializedTransaction',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.Error',
      '10': 'error'
    },
    {'1': 'encoded', '3': 2, '4': 1, '5': 12, '10': 'encoded'},
    {'1': 'txid', '3': 3, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'weight', '3': 4, '4': 1, '5': 4, '10': 'weight'},
    {'1': 'fee', '3': 5, '4': 1, '5': 4, '10': 'fee'},
  ],
};

/// Descriptor for `SerializedTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serializedTransactionDescriptor = $convert.base64Decode(
    'ChVTZXJpYWxpemVkVHJhbnNhY3Rpb24SKgoFZXJyb3IYASABKA4yFC5UVy5VdHhvLlByb3RvLk'
    'Vycm9yUgVlcnJvchIYCgdlbmNvZGVkGAIgASgMUgdlbmNvZGVkEhIKBHR4aWQYAyABKAxSBHR4'
    'aWQSFgoGd2VpZ2h0GAQgASgEUgZ3ZWlnaHQSEAoDZmVlGAUgASgEUgNmZWU=');
