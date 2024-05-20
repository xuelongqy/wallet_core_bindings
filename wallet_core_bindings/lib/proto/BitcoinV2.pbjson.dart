//
//  Generated code. Do not modify.
//  source: BitcoinV2.proto
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
    {'1': 'Error_utxo_invalid_leaf_hash', '2': 2},
    {'1': 'Error_utxo_invalid_sighash_type', '2': 3},
    {'1': 'Error_utxo_invalid_lock_time', '2': 4},
    {'1': 'Error_utxo_invalid_txid', '2': 5},
    {'1': 'Error_utxo_sighash_failed', '2': 6},
    {'1': 'Error_utxo_missing_sighash_method', '2': 7},
    {'1': 'Error_utxo_failed_encoding', '2': 8},
    {'1': 'Error_utxo_insufficient_inputs', '2': 9},
    {'1': 'Error_utxo_no_outputs_specified', '2': 43},
    {'1': 'Error_utxo_missing_change_script_pubkey', '2': 10},
    {'1': 'Error_zero_sequence_not_enabled', '2': 11},
    {'1': 'Error_unmatched_input_signature_count', '2': 12},
    {'1': 'Error_missing_input_builder', '2': 13},
    {'1': 'Error_missing_output_builder', '2': 14},
    {'1': 'Error_missing_recipient', '2': 15},
    {'1': 'Error_missing_inscription', '2': 41},
    {'1': 'Error_missing_tagged_output', '2': 42},
    {'1': 'Error_legacy_p2tr_invalid_variant', '2': 16},
    {'1': 'Error_legacy_no_spending_script_provided', '2': 17},
    {'1': 'Error_legacy_expected_redeem_script', '2': 18},
    {'1': 'Error_legacy_outpoint_not_set', '2': 19},
    {'1': 'Error_legacy_no_private_key', '2': 36},
    {'1': 'Error_legacy_no_plan_provided', '2': 37},
    {'1': 'Error_invalid_private_key', '2': 20},
    {'1': 'Error_invalid_public_key', '2': 21},
    {'1': 'Error_invalid_sighash', '2': 22},
    {'1': 'Error_invalid_witness_pubkey_hash', '2': 23},
    {'1': 'Error_invalid_brc20_ticker', '2': 24},
    {'1': 'Error_invalid_ecdsa_signature', '2': 25},
    {'1': 'Error_invalid_schnorr_signature', '2': 26},
    {'1': 'Error_invalid_control_block', '2': 27},
    {'1': 'Error_invalid_pubkey_hash', '2': 28},
    {'1': 'Error_invalid_taproot_root', '2': 29},
    {'1': 'Error_invalid_redeem_script', '2': 30},
    {'1': 'Error_invalid_wpkh_script_code', '2': 1},
    {'1': 'Error_invalid_witness_redeem_script_hash', '2': 31},
    {'1': 'Error_invalid_witness_encoding', '2': 39},
    {'1': 'Error_invalid_taproot_tweaked_pubkey', '2': 32},
    {'1': 'Error_invalid_change_output', '2': 33},
    {'1': 'Error_unsupported_address_recipient', '2': 34},
    {'1': 'Error_bad_address_recipient', '2': 35},
    {'1': 'Error_ordinal_mime_type_too_large', '2': 38},
    {'1': 'Error_ordinal_payload_too_large', '2': 40},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchIGCgJPSxAAEiAKHEVycm9yX3V0eG9faW52YWxpZF9sZWFmX2hhc2gQAhIjCh9Fcn'
    'Jvcl91dHhvX2ludmFsaWRfc2lnaGFzaF90eXBlEAMSIAocRXJyb3JfdXR4b19pbnZhbGlkX2xv'
    'Y2tfdGltZRAEEhsKF0Vycm9yX3V0eG9faW52YWxpZF90eGlkEAUSHQoZRXJyb3JfdXR4b19zaW'
    'doYXNoX2ZhaWxlZBAGEiUKIUVycm9yX3V0eG9fbWlzc2luZ19zaWdoYXNoX21ldGhvZBAHEh4K'
    'GkVycm9yX3V0eG9fZmFpbGVkX2VuY29kaW5nEAgSIgoeRXJyb3JfdXR4b19pbnN1ZmZpY2llbn'
    'RfaW5wdXRzEAkSIwofRXJyb3JfdXR4b19ub19vdXRwdXRzX3NwZWNpZmllZBArEisKJ0Vycm9y'
    'X3V0eG9fbWlzc2luZ19jaGFuZ2Vfc2NyaXB0X3B1YmtleRAKEiMKH0Vycm9yX3plcm9fc2VxdW'
    'VuY2Vfbm90X2VuYWJsZWQQCxIpCiVFcnJvcl91bm1hdGNoZWRfaW5wdXRfc2lnbmF0dXJlX2Nv'
    'dW50EAwSHwobRXJyb3JfbWlzc2luZ19pbnB1dF9idWlsZGVyEA0SIAocRXJyb3JfbWlzc2luZ1'
    '9vdXRwdXRfYnVpbGRlchAOEhsKF0Vycm9yX21pc3NpbmdfcmVjaXBpZW50EA8SHQoZRXJyb3Jf'
    'bWlzc2luZ19pbnNjcmlwdGlvbhApEh8KG0Vycm9yX21pc3NpbmdfdGFnZ2VkX291dHB1dBAqEi'
    'UKIUVycm9yX2xlZ2FjeV9wMnRyX2ludmFsaWRfdmFyaWFudBAQEiwKKEVycm9yX2xlZ2FjeV9u'
    'b19zcGVuZGluZ19zY3JpcHRfcHJvdmlkZWQQERInCiNFcnJvcl9sZWdhY3lfZXhwZWN0ZWRfcm'
    'VkZWVtX3NjcmlwdBASEiEKHUVycm9yX2xlZ2FjeV9vdXRwb2ludF9ub3Rfc2V0EBMSHwobRXJy'
    'b3JfbGVnYWN5X25vX3ByaXZhdGVfa2V5ECQSIQodRXJyb3JfbGVnYWN5X25vX3BsYW5fcHJvdm'
    'lkZWQQJRIdChlFcnJvcl9pbnZhbGlkX3ByaXZhdGVfa2V5EBQSHAoYRXJyb3JfaW52YWxpZF9w'
    'dWJsaWNfa2V5EBUSGQoVRXJyb3JfaW52YWxpZF9zaWdoYXNoEBYSJQohRXJyb3JfaW52YWxpZF'
    '93aXRuZXNzX3B1YmtleV9oYXNoEBcSHgoaRXJyb3JfaW52YWxpZF9icmMyMF90aWNrZXIQGBIh'
    'Ch1FcnJvcl9pbnZhbGlkX2VjZHNhX3NpZ25hdHVyZRAZEiMKH0Vycm9yX2ludmFsaWRfc2Nobm'
    '9ycl9zaWduYXR1cmUQGhIfChtFcnJvcl9pbnZhbGlkX2NvbnRyb2xfYmxvY2sQGxIdChlFcnJv'
    'cl9pbnZhbGlkX3B1YmtleV9oYXNoEBwSHgoaRXJyb3JfaW52YWxpZF90YXByb290X3Jvb3QQHR'
    'IfChtFcnJvcl9pbnZhbGlkX3JlZGVlbV9zY3JpcHQQHhIiCh5FcnJvcl9pbnZhbGlkX3dwa2hf'
    'c2NyaXB0X2NvZGUQARIsCihFcnJvcl9pbnZhbGlkX3dpdG5lc3NfcmVkZWVtX3NjcmlwdF9oYX'
    'NoEB8SIgoeRXJyb3JfaW52YWxpZF93aXRuZXNzX2VuY29kaW5nECcSKAokRXJyb3JfaW52YWxp'
    'ZF90YXByb290X3R3ZWFrZWRfcHVia2V5ECASHwobRXJyb3JfaW52YWxpZF9jaGFuZ2Vfb3V0cH'
    'V0ECESJwojRXJyb3JfdW5zdXBwb3J0ZWRfYWRkcmVzc19yZWNpcGllbnQQIhIfChtFcnJvcl9i'
    'YWRfYWRkcmVzc19yZWNpcGllbnQQIxIlCiFFcnJvcl9vcmRpbmFsX21pbWVfdHlwZV90b29fbG'
    'FyZ2UQJhIjCh9FcnJvcl9vcmRpbmFsX3BheWxvYWRfdG9vX2xhcmdlECg=');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 5, '10': 'version'},
    {'1': 'private_key', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
    {
      '1': 'lock_time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Utxo.Proto.LockTime',
      '10': 'lockTime'
    },
    {
      '1': 'inputs',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'outputs'
    },
    {
      '1': 'input_selector',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.InputSelector',
      '10': 'inputSelector'
    },
    {'1': 'fee_per_vb', '3': 8, '4': 1, '5': 4, '10': 'feePerVb'},
    {
      '1': 'change_output',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'changeOutput'
    },
    {
      '1': 'disable_change_output',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'disableChangeOutput'
    },
    {
      '1': 'dangerous_use_fixed_schnorr_rng',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'dangerousUseFixedSchnorrRng'
    },
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSGAoHdmVyc2lvbhgBIAEoBVIHdmVyc2lvbhIfCgtwcml2YXRlX2tleR'
    'gCIAEoDFIKcHJpdmF0ZUtleRI0Cglsb2NrX3RpbWUYAyABKAsyFy5UVy5VdHhvLlByb3RvLkxv'
    'Y2tUaW1lUghsb2NrVGltZRIxCgZpbnB1dHMYBSADKAsyGS5UVy5CaXRjb2luVjIuUHJvdG8uSW'
    '5wdXRSBmlucHV0cxI0CgdvdXRwdXRzGAYgAygLMhouVFcuQml0Y29pblYyLlByb3RvLk91dHB1'
    'dFIHb3V0cHV0cxJDCg5pbnB1dF9zZWxlY3RvchgHIAEoDjIcLlRXLlV0eG8uUHJvdG8uSW5wdX'
    'RTZWxlY3RvclINaW5wdXRTZWxlY3RvchIcCgpmZWVfcGVyX3ZiGAggASgEUghmZWVQZXJWYhI/'
    'Cg1jaGFuZ2Vfb3V0cHV0GAkgASgLMhouVFcuQml0Y29pblYyLlByb3RvLk91dHB1dFIMY2hhbm'
    'dlT3V0cHV0EjIKFWRpc2FibGVfY2hhbmdlX291dHB1dBgKIAEoCFITZGlzYWJsZUNoYW5nZU91'
    'dHB1dBJECh9kYW5nZXJvdXNfdXNlX2ZpeGVkX3NjaG5vcnJfcm5nGAsgASgIUhtkYW5nZXJvdX'
    'NVc2VGaXhlZFNjaG5vcnJSbmc=');

@$core.Deprecated('Use inputDescriptor instead')
const Input$json = {
  '1': 'Input',
  '2': [
    {'1': 'private_key', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    {'1': 'txid', '3': 2, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'vout', '3': 3, '4': 1, '5': 13, '10': 'vout'},
    {'1': 'sequence', '3': 4, '4': 1, '5': 13, '10': 'sequence'},
    {
      '1': 'sequence_enable_zero',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'sequenceEnableZero'
    },
    {'1': 'value', '3': 6, '4': 1, '5': 4, '10': 'value'},
    {
      '1': 'sighash_type',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.SighashType',
      '10': 'sighashType'
    },
    {
      '1': 'builder',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputBuilder',
      '9': 0,
      '10': 'builder'
    },
    {
      '1': 'custom_script',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputScriptWitness',
      '9': 0,
      '10': 'customScript'
    },
  ],
  '3': [
    Input_InputBuilder$json,
    Input_InputScriptWitness$json,
    Input_InputTaprootKeyPath$json,
    Input_InputTaprootScriptPath$json,
    Input_InputOrdinalInscription$json,
    Input_InputBrc20Inscription$json
  ],
  '8': [
    {'1': 'to_recipient'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputBuilder$json = {
  '1': 'InputBuilder',
  '2': [
    {'1': 'p2sh', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'p2sh'},
    {'1': 'p2pkh', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'p2pkh'},
    {'1': 'p2wsh', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'p2wsh'},
    {'1': 'p2wpkh', '3': 6, '4': 1, '5': 12, '9': 0, '10': 'p2wpkh'},
    {
      '1': 'p2tr_key_path',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputTaprootKeyPath',
      '9': 0,
      '10': 'p2trKeyPath'
    },
    {
      '1': 'p2tr_script_path',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputTaprootScriptPath',
      '9': 0,
      '10': 'p2trScriptPath'
    },
    {
      '1': 'brc20_inscribe',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputBrc20Inscription',
      '9': 0,
      '10': 'brc20Inscribe'
    },
    {
      '1': 'ordinal_inscribe',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputOrdinalInscription',
      '9': 0,
      '10': 'ordinalInscribe'
    },
  ],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputScriptWitness$json = {
  '1': 'InputScriptWitness',
  '2': [
    {'1': 'script_pubkey', '3': 1, '4': 1, '5': 12, '10': 'scriptPubkey'},
    {'1': 'script_sig', '3': 2, '4': 1, '5': 12, '10': 'scriptSig'},
    {'1': 'witness_items', '3': 3, '4': 3, '5': 12, '10': 'witnessItems'},
    {
      '1': 'signing_method',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.SigningMethod',
      '10': 'signingMethod'
    },
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputTaprootKeyPath$json = {
  '1': 'InputTaprootKeyPath',
  '2': [
    {'1': 'one_prevout', '3': 1, '4': 1, '5': 8, '10': 'onePrevout'},
    {'1': 'public_key', '3': 2, '4': 1, '5': 12, '10': 'publicKey'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputTaprootScriptPath$json = {
  '1': 'InputTaprootScriptPath',
  '2': [
    {'1': 'one_prevout', '3': 1, '4': 1, '5': 8, '10': 'onePrevout'},
    {'1': 'payload', '3': 2, '4': 1, '5': 12, '10': 'payload'},
    {'1': 'control_block', '3': 3, '4': 1, '5': 12, '10': 'controlBlock'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputOrdinalInscription$json = {
  '1': 'InputOrdinalInscription',
  '2': [
    {'1': 'one_prevout', '3': 1, '4': 1, '5': 8, '10': 'onePrevout'},
    {'1': 'inscribe_to', '3': 2, '4': 1, '5': 12, '10': 'inscribeTo'},
    {'1': 'mime_type', '3': 3, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'payload', '3': 4, '4': 1, '5': 12, '10': 'payload'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputBrc20Inscription$json = {
  '1': 'InputBrc20Inscription',
  '2': [
    {'1': 'one_prevout', '3': 1, '4': 1, '5': 8, '10': 'onePrevout'},
    {'1': 'inscribe_to', '3': 2, '4': 1, '5': 12, '10': 'inscribeTo'},
    {'1': 'ticker', '3': 3, '4': 1, '5': 9, '10': 'ticker'},
    {'1': 'transfer_amount', '3': 4, '4': 1, '5': 9, '10': 'transferAmount'},
  ],
};

/// Descriptor for `Input`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputDescriptor = $convert.base64Decode(
    'CgVJbnB1dBIfCgtwcml2YXRlX2tleRgBIAEoDFIKcHJpdmF0ZUtleRISCgR0eGlkGAIgASgMUg'
    'R0eGlkEhIKBHZvdXQYAyABKA1SBHZvdXQSGgoIc2VxdWVuY2UYBCABKA1SCHNlcXVlbmNlEjAK'
    'FHNlcXVlbmNlX2VuYWJsZV96ZXJvGAUgASgIUhJzZXF1ZW5jZUVuYWJsZVplcm8SFAoFdmFsdW'
    'UYBiABKARSBXZhbHVlEj0KDHNpZ2hhc2hfdHlwZRgHIAEoDjIaLlRXLlV0eG8uUHJvdG8uU2ln'
    'aGFzaFR5cGVSC3NpZ2hhc2hUeXBlEkIKB2J1aWxkZXIYCCABKAsyJi5UVy5CaXRjb2luVjIuUH'
    'JvdG8uSW5wdXQuSW5wdXRCdWlsZGVySABSB2J1aWxkZXISUwoNY3VzdG9tX3NjcmlwdBgJIAEo'
    'CzIsLlRXLkJpdGNvaW5WMi5Qcm90by5JbnB1dC5JbnB1dFNjcmlwdFdpdG5lc3NIAFIMY3VzdG'
    '9tU2NyaXB0GuYDCgxJbnB1dEJ1aWxkZXISFAoEcDJzaBgBIAEoDEgAUgRwMnNoEhYKBXAycGto'
    'GAIgASgMSABSBXAycGtoEhYKBXAyd3NoGAMgASgMSABSBXAyd3NoEhgKBnAyd3BraBgGIAEoDE'
    'gAUgZwMndwa2gSUwoNcDJ0cl9rZXlfcGF0aBgHIAEoCzItLlRXLkJpdGNvaW5WMi5Qcm90by5J'
    'bnB1dC5JbnB1dFRhcHJvb3RLZXlQYXRoSABSC3AydHJLZXlQYXRoElwKEHAydHJfc2NyaXB0X3'
    'BhdGgYCCABKAsyMC5UVy5CaXRjb2luVjIuUHJvdG8uSW5wdXQuSW5wdXRUYXByb290U2NyaXB0'
    'UGF0aEgAUg5wMnRyU2NyaXB0UGF0aBJYCg5icmMyMF9pbnNjcmliZRgJIAEoCzIvLlRXLkJpdG'
    'NvaW5WMi5Qcm90by5JbnB1dC5JbnB1dEJyYzIwSW5zY3JpcHRpb25IAFINYnJjMjBJbnNjcmli'
    'ZRJeChBvcmRpbmFsX2luc2NyaWJlGAogASgLMjEuVFcuQml0Y29pblYyLlByb3RvLklucHV0Lk'
    'lucHV0T3JkaW5hbEluc2NyaXB0aW9uSABSD29yZGluYWxJbnNjcmliZUIJCgd2YXJpYW50GsIB'
    'ChJJbnB1dFNjcmlwdFdpdG5lc3MSIwoNc2NyaXB0X3B1YmtleRgBIAEoDFIMc2NyaXB0UHVia2'
    'V5Eh0KCnNjcmlwdF9zaWcYAiABKAxSCXNjcmlwdFNpZxIjCg13aXRuZXNzX2l0ZW1zGAMgAygM'
    'Ugx3aXRuZXNzSXRlbXMSQwoOc2lnbmluZ19tZXRob2QYBSABKA4yHC5UVy5VdHhvLlByb3RvLl'
    'NpZ25pbmdNZXRob2RSDXNpZ25pbmdNZXRob2QaVQoTSW5wdXRUYXByb290S2V5UGF0aBIfCgtv'
    'bmVfcHJldm91dBgBIAEoCFIKb25lUHJldm91dBIdCgpwdWJsaWNfa2V5GAIgASgMUglwdWJsaW'
    'NLZXkaeAoWSW5wdXRUYXByb290U2NyaXB0UGF0aBIfCgtvbmVfcHJldm91dBgBIAEoCFIKb25l'
    'UHJldm91dBIYCgdwYXlsb2FkGAIgASgMUgdwYXlsb2FkEiMKDWNvbnRyb2xfYmxvY2sYAyABKA'
    'xSDGNvbnRyb2xCbG9jaxqSAQoXSW5wdXRPcmRpbmFsSW5zY3JpcHRpb24SHwoLb25lX3ByZXZv'
    'dXQYASABKAhSCm9uZVByZXZvdXQSHwoLaW5zY3JpYmVfdG8YAiABKAxSCmluc2NyaWJlVG8SGw'
    'oJbWltZV90eXBlGAMgASgJUghtaW1lVHlwZRIYCgdwYXlsb2FkGAQgASgMUgdwYXlsb2FkGpoB'
    'ChVJbnB1dEJyYzIwSW5zY3JpcHRpb24SHwoLb25lX3ByZXZvdXQYASABKAhSCm9uZVByZXZvdX'
    'QSHwoLaW5zY3JpYmVfdG8YAiABKAxSCmluc2NyaWJlVG8SFgoGdGlja2VyGAMgASgJUgZ0aWNr'
    'ZXISJwoPdHJhbnNmZXJfYW1vdW50GAQgASgJUg50cmFuc2ZlckFtb3VudEIOCgx0b19yZWNpcG'
    'llbnQ=');

@$core.Deprecated('Use outputDescriptor instead')
const Output$json = {
  '1': 'Output',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 4, '10': 'value'},
    {
      '1': 'builder',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputBuilder',
      '9': 0,
      '10': 'builder'
    },
    {
      '1': 'custom_script_pubkey',
      '3': 3,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'customScriptPubkey'
    },
    {'1': 'from_address', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'fromAddress'},
  ],
  '3': [
    Output_OutputBuilder$json,
    Output_OutputRedeemScriptOrHash$json,
    Output_OutputTaprootScriptPath$json,
    Output_OutputOrdinalInscription$json,
    Output_OutputBrc20Inscription$json
  ],
  '8': [
    {'1': 'to_recipient'},
  ],
};

@$core.Deprecated('Use outputDescriptor instead')
const Output_OutputBuilder$json = {
  '1': 'OutputBuilder',
  '2': [
    {
      '1': 'p2sh',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputRedeemScriptOrHash',
      '9': 0,
      '10': 'p2sh'
    },
    {
      '1': 'p2pkh',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.ToPublicKeyOrHash',
      '9': 0,
      '10': 'p2pkh'
    },
    {
      '1': 'p2wsh',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputRedeemScriptOrHash',
      '9': 0,
      '10': 'p2wsh'
    },
    {
      '1': 'p2wpkh',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.ToPublicKeyOrHash',
      '9': 0,
      '10': 'p2wpkh'
    },
    {
      '1': 'p2tr_key_path',
      '3': 5,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'p2trKeyPath'
    },
    {
      '1': 'p2tr_script_path',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputTaprootScriptPath',
      '9': 0,
      '10': 'p2trScriptPath'
    },
    {
      '1': 'p2tr_dangerous_assume_tweaked',
      '3': 7,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'p2trDangerousAssumeTweaked'
    },
    {
      '1': 'brc20_inscribe',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputBrc20Inscription',
      '9': 0,
      '10': 'brc20Inscribe'
    },
    {
      '1': 'ordinal_inscribe',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputOrdinalInscription',
      '9': 0,
      '10': 'ordinalInscribe'
    },
  ],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use outputDescriptor instead')
const Output_OutputRedeemScriptOrHash$json = {
  '1': 'OutputRedeemScriptOrHash',
  '2': [
    {
      '1': 'redeem_script',
      '3': 1,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'redeemScript'
    },
    {'1': 'hash', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'hash'},
  ],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use outputDescriptor instead')
const Output_OutputTaprootScriptPath$json = {
  '1': 'OutputTaprootScriptPath',
  '2': [
    {'1': 'internal_key', '3': 1, '4': 1, '5': 12, '10': 'internalKey'},
    {'1': 'merkle_root', '3': 2, '4': 1, '5': 12, '10': 'merkleRoot'},
  ],
};

@$core.Deprecated('Use outputDescriptor instead')
const Output_OutputOrdinalInscription$json = {
  '1': 'OutputOrdinalInscription',
  '2': [
    {'1': 'inscribe_to', '3': 1, '4': 1, '5': 12, '10': 'inscribeTo'},
    {'1': 'mime_type', '3': 2, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'payload', '3': 3, '4': 1, '5': 12, '10': 'payload'},
  ],
};

@$core.Deprecated('Use outputDescriptor instead')
const Output_OutputBrc20Inscription$json = {
  '1': 'OutputBrc20Inscription',
  '2': [
    {'1': 'inscribe_to', '3': 1, '4': 1, '5': 12, '10': 'inscribeTo'},
    {'1': 'ticker', '3': 2, '4': 1, '5': 9, '10': 'ticker'},
    {'1': 'transfer_amount', '3': 3, '4': 1, '5': 9, '10': 'transferAmount'},
  ],
};

/// Descriptor for `Output`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputDescriptor = $convert.base64Decode(
    'CgZPdXRwdXQSFAoFdmFsdWUYASABKARSBXZhbHVlEkQKB2J1aWxkZXIYAiABKAsyKC5UVy5CaX'
    'Rjb2luVjIuUHJvdG8uT3V0cHV0Lk91dHB1dEJ1aWxkZXJIAFIHYnVpbGRlchIyChRjdXN0b21f'
    'c2NyaXB0X3B1YmtleRgDIAEoDEgAUhJjdXN0b21TY3JpcHRQdWJrZXkSIwoMZnJvbV9hZGRyZX'
    'NzGAQgASgJSABSC2Zyb21BZGRyZXNzGrsFCg1PdXRwdXRCdWlsZGVyEkkKBHAyc2gYASABKAsy'
    'My5UVy5CaXRjb2luVjIuUHJvdG8uT3V0cHV0Lk91dHB1dFJlZGVlbVNjcmlwdE9ySGFzaEgAUg'
    'RwMnNoEj0KBXAycGtoGAIgASgLMiUuVFcuQml0Y29pblYyLlByb3RvLlRvUHVibGljS2V5T3JI'
    'YXNoSABSBXAycGtoEksKBXAyd3NoGAMgASgLMjMuVFcuQml0Y29pblYyLlByb3RvLk91dHB1dC'
    '5PdXRwdXRSZWRlZW1TY3JpcHRPckhhc2hIAFIFcDJ3c2gSPwoGcDJ3cGtoGAQgASgLMiUuVFcu'
    'Qml0Y29pblYyLlByb3RvLlRvUHVibGljS2V5T3JIYXNoSABSBnAyd3BraBIkCg1wMnRyX2tleV'
    '9wYXRoGAUgASgMSABSC3AydHJLZXlQYXRoEl4KEHAydHJfc2NyaXB0X3BhdGgYBiABKAsyMi5U'
    'Vy5CaXRjb2luVjIuUHJvdG8uT3V0cHV0Lk91dHB1dFRhcHJvb3RTY3JpcHRQYXRoSABSDnAydH'
    'JTY3JpcHRQYXRoEkMKHXAydHJfZGFuZ2Vyb3VzX2Fzc3VtZV90d2Vha2VkGAcgASgMSABSGnAy'
    'dHJEYW5nZXJvdXNBc3N1bWVUd2Vha2VkEloKDmJyYzIwX2luc2NyaWJlGAggASgLMjEuVFcuQm'
    'l0Y29pblYyLlByb3RvLk91dHB1dC5PdXRwdXRCcmMyMEluc2NyaXB0aW9uSABSDWJyYzIwSW5z'
    'Y3JpYmUSYAoQb3JkaW5hbF9pbnNjcmliZRgJIAEoCzIzLlRXLkJpdGNvaW5WMi5Qcm90by5PdX'
    'RwdXQuT3V0cHV0T3JkaW5hbEluc2NyaXB0aW9uSABSD29yZGluYWxJbnNjcmliZUIJCgd2YXJp'
    'YW50GmIKGE91dHB1dFJlZGVlbVNjcmlwdE9ySGFzaBIlCg1yZWRlZW1fc2NyaXB0GAEgASgMSA'
    'BSDHJlZGVlbVNjcmlwdBIUCgRoYXNoGAIgASgMSABSBGhhc2hCCQoHdmFyaWFudBpdChdPdXRw'
    'dXRUYXByb290U2NyaXB0UGF0aBIhCgxpbnRlcm5hbF9rZXkYASABKAxSC2ludGVybmFsS2V5Eh'
    '8KC21lcmtsZV9yb290GAIgASgMUgptZXJrbGVSb290GnIKGE91dHB1dE9yZGluYWxJbnNjcmlw'
    'dGlvbhIfCgtpbnNjcmliZV90bxgBIAEoDFIKaW5zY3JpYmVUbxIbCgltaW1lX3R5cGUYAiABKA'
    'lSCG1pbWVUeXBlEhgKB3BheWxvYWQYAyABKAxSB3BheWxvYWQaegoWT3V0cHV0QnJjMjBJbnNj'
    'cmlwdGlvbhIfCgtpbnNjcmliZV90bxgBIAEoDFIKaW5zY3JpYmVUbxIWCgZ0aWNrZXIYAiABKA'
    'lSBnRpY2tlchInCg90cmFuc2Zlcl9hbW91bnQYAyABKAlSDnRyYW5zZmVyQW1vdW50Qg4KDHRv'
    'X3JlY2lwaWVudA==');

@$core.Deprecated('Use toPublicKeyOrHashDescriptor instead')
const ToPublicKeyOrHash$json = {
  '1': 'ToPublicKeyOrHash',
  '2': [
    {'1': 'pubkey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'pubkey'},
    {'1': 'hash', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'hash'},
  ],
  '8': [
    {'1': 'to_address'},
  ],
};

/// Descriptor for `ToPublicKeyOrHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toPublicKeyOrHashDescriptor = $convert.base64Decode(
    'ChFUb1B1YmxpY0tleU9ySGFzaBIYCgZwdWJrZXkYASABKAxIAFIGcHVia2V5EhQKBGhhc2gYAi'
    'ABKAxIAFIEaGFzaEIMCgp0b19hZGRyZXNz');

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput$json = {
  '1': 'PreSigningOutput',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.BitcoinV2.Proto.Error',
      '10': 'error'
    },
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'txid', '3': 3, '4': 1, '5': 12, '10': 'txid'},
    {
      '1': 'sighashes',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.Sighash',
      '10': 'sighashes'
    },
    {
      '1': 'utxo_inputs',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.TW.Utxo.Proto.TxIn',
      '10': 'utxoInputs'
    },
    {
      '1': 'utxo_outputs',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PreSigningOutput.TxOut',
      '10': 'utxoOutputs'
    },
    {'1': 'weight_estimate', '3': 7, '4': 1, '5': 4, '10': 'weightEstimate'},
    {'1': 'fee_estimate', '3': 8, '4': 1, '5': 4, '10': 'feeEstimate'},
  ],
  '3': [PreSigningOutput_TxOut$json],
};

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput_TxOut$json = {
  '1': 'TxOut',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 4, '10': 'value'},
    {'1': 'script_pubkey', '3': 2, '4': 1, '5': 12, '10': 'scriptPubkey'},
    {'1': 'taproot_payload', '3': 3, '4': 1, '5': 12, '10': 'taprootPayload'},
    {'1': 'control_block', '3': 4, '4': 1, '5': 12, '10': 'controlBlock'},
  ],
};

/// Descriptor for `PreSigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preSigningOutputDescriptor = $convert.base64Decode(
    'ChBQcmVTaWduaW5nT3V0cHV0Ei8KBWVycm9yGAEgASgOMhkuVFcuQml0Y29pblYyLlByb3RvLk'
    'Vycm9yUgVlcnJvchIjCg1lcnJvcl9tZXNzYWdlGAIgASgJUgxlcnJvck1lc3NhZ2USEgoEdHhp'
    'ZBgDIAEoDFIEdHhpZBI0CglzaWdoYXNoZXMYBCADKAsyFi5UVy5VdHhvLlByb3RvLlNpZ2hhc2'
    'hSCXNpZ2hhc2hlcxI0Cgt1dHhvX2lucHV0cxgFIAMoCzITLlRXLlV0eG8uUHJvdG8uVHhJblIK'
    'dXR4b0lucHV0cxJNCgx1dHhvX291dHB1dHMYBiADKAsyKi5UVy5CaXRjb2luVjIuUHJvdG8uUH'
    'JlU2lnbmluZ091dHB1dC5UeE91dFILdXR4b091dHB1dHMSJwoPd2VpZ2h0X2VzdGltYXRlGAcg'
    'ASgEUg53ZWlnaHRFc3RpbWF0ZRIhCgxmZWVfZXN0aW1hdGUYCCABKARSC2ZlZUVzdGltYXRlGp'
    'ABCgVUeE91dBIUCgV2YWx1ZRgBIAEoBFIFdmFsdWUSIwoNc2NyaXB0X3B1YmtleRgCIAEoDFIM'
    'c2NyaXB0UHVia2V5EicKD3RhcHJvb3RfcGF5bG9hZBgDIAEoDFIOdGFwcm9vdFBheWxvYWQSIw'
    'oNY29udHJvbF9ibG9jaxgEIAEoDFIMY29udHJvbEJsb2Nr');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.BitcoinV2.Proto.Error',
      '10': 'error'
    },
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'transaction',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Transaction',
      '10': 'transaction'
    },
    {'1': 'encoded', '3': 4, '4': 1, '5': 12, '10': 'encoded'},
    {'1': 'txid', '3': 5, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'weight', '3': 6, '4': 1, '5': 4, '10': 'weight'},
    {'1': 'fee', '3': 7, '4': 1, '5': 4, '10': 'fee'},
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0Ei8KBWVycm9yGAEgASgOMhkuVFcuQml0Y29pblYyLlByb3RvLkVycm'
    '9yUgVlcnJvchIjCg1lcnJvcl9tZXNzYWdlGAIgASgJUgxlcnJvck1lc3NhZ2USQQoLdHJhbnNh'
    'Y3Rpb24YAyABKAsyHy5UVy5CaXRjb2luVjIuUHJvdG8uVHJhbnNhY3Rpb25SC3RyYW5zYWN0aW'
    '9uEhgKB2VuY29kZWQYBCABKAxSB2VuY29kZWQSEgoEdHhpZBgFIAEoDFIEdHhpZBIWCgZ3ZWln'
    'aHQYBiABKARSBndlaWdodBIQCgNmZWUYByABKARSA2ZlZQ==');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
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
      '6': '.TW.BitcoinV2.Proto.TransactionInput',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.TransactionOutput',
      '10': 'outputs'
    },
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIYCgd2ZXJzaW9uGAEgASgFUgd2ZXJzaW9uEjQKCWxvY2tfdGltZRgCIA'
    'EoCzIXLlRXLlV0eG8uUHJvdG8uTG9ja1RpbWVSCGxvY2tUaW1lEjwKBmlucHV0cxgDIAMoCzIk'
    'LlRXLkJpdGNvaW5WMi5Qcm90by5UcmFuc2FjdGlvbklucHV0UgZpbnB1dHMSPwoHb3V0cHV0cx'
    'gEIAMoCzIlLlRXLkJpdGNvaW5WMi5Qcm90by5UcmFuc2FjdGlvbk91dHB1dFIHb3V0cHV0cw==');

@$core.Deprecated('Use transactionInputDescriptor instead')
const TransactionInput$json = {
  '1': 'TransactionInput',
  '2': [
    {'1': 'txid', '3': 1, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'vout', '3': 3, '4': 1, '5': 13, '10': 'vout'},
    {'1': 'sequence', '3': 4, '4': 1, '5': 13, '10': 'sequence'},
    {'1': 'script_sig', '3': 5, '4': 1, '5': 12, '10': 'scriptSig'},
    {'1': 'witness_items', '3': 6, '4': 3, '5': 12, '10': 'witnessItems'},
  ],
};

/// Descriptor for `TransactionInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInputDescriptor = $convert.base64Decode(
    'ChBUcmFuc2FjdGlvbklucHV0EhIKBHR4aWQYASABKAxSBHR4aWQSEgoEdm91dBgDIAEoDVIEdm'
    '91dBIaCghzZXF1ZW5jZRgEIAEoDVIIc2VxdWVuY2USHQoKc2NyaXB0X3NpZxgFIAEoDFIJc2Ny'
    'aXB0U2lnEiMKDXdpdG5lc3NfaXRlbXMYBiADKAxSDHdpdG5lc3NJdGVtcw==');

@$core.Deprecated('Use transactionOutputDescriptor instead')
const TransactionOutput$json = {
  '1': 'TransactionOutput',
  '2': [
    {'1': 'script_pubkey', '3': 1, '4': 1, '5': 12, '10': 'scriptPubkey'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
    {'1': 'taproot_payload', '3': 3, '4': 1, '5': 12, '10': 'taprootPayload'},
    {'1': 'control_block', '3': 4, '4': 1, '5': 12, '10': 'controlBlock'},
  ],
};

/// Descriptor for `TransactionOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionOutputDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvbk91dHB1dBIjCg1zY3JpcHRfcHVia2V5GAEgASgMUgxzY3JpcHRQdWJrZX'
    'kSFAoFdmFsdWUYAiABKARSBXZhbHVlEicKD3RhcHJvb3RfcGF5bG9hZBgDIAEoDFIOdGFwcm9v'
    'dFBheWxvYWQSIwoNY29udHJvbF9ibG9jaxgEIAEoDFIMY29udHJvbEJsb2Nr');

@$core.Deprecated('Use composePlanDescriptor instead')
const ComposePlan$json = {
  '1': 'ComposePlan',
  '2': [
    {
      '1': 'brc20',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.ComposePlan.ComposeBrc20Plan',
      '9': 0,
      '10': 'brc20'
    },
  ],
  '3': [ComposePlan_ComposeBrc20Plan$json],
  '8': [
    {'1': 'compose'},
  ],
};

@$core.Deprecated('Use composePlanDescriptor instead')
const ComposePlan_ComposeBrc20Plan$json = {
  '1': 'ComposeBrc20Plan',
  '2': [
    {'1': 'private_key', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    {
      '1': 'inputs',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input',
      '10': 'inputs'
    },
    {
      '1': 'input_selector',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.Utxo.Proto.InputSelector',
      '10': 'inputSelector'
    },
    {
      '1': 'tagged_output',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'taggedOutput'
    },
    {
      '1': 'inscription',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputBrc20Inscription',
      '10': 'inscription'
    },
    {'1': 'fee_per_vb', '3': 6, '4': 1, '5': 4, '10': 'feePerVb'},
    {
      '1': 'change_output',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'changeOutput'
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

/// Descriptor for `ComposePlan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List composePlanDescriptor = $convert.base64Decode(
    'CgtDb21wb3NlUGxhbhJICgVicmMyMBgBIAEoCzIwLlRXLkJpdGNvaW5WMi5Qcm90by5Db21wb3'
    'NlUGxhbi5Db21wb3NlQnJjMjBQbGFuSABSBWJyYzIwGtIDChBDb21wb3NlQnJjMjBQbGFuEh8K'
    'C3ByaXZhdGVfa2V5GAEgASgMUgpwcml2YXRlS2V5EjEKBmlucHV0cxgCIAMoCzIZLlRXLkJpdG'
    'NvaW5WMi5Qcm90by5JbnB1dFIGaW5wdXRzEkMKDmlucHV0X3NlbGVjdG9yGAMgASgOMhwuVFcu'
    'VXR4by5Qcm90by5JbnB1dFNlbGVjdG9yUg1pbnB1dFNlbGVjdG9yEj8KDXRhZ2dlZF9vdXRwdX'
    'QYBCABKAsyGi5UVy5CaXRjb2luVjIuUHJvdG8uT3V0cHV0Ugx0YWdnZWRPdXRwdXQSUQoLaW5z'
    'Y3JpcHRpb24YBSABKAsyLy5UVy5CaXRjb2luVjIuUHJvdG8uSW5wdXQuSW5wdXRCcmMyMEluc2'
    'NyaXB0aW9uUgtpbnNjcmlwdGlvbhIcCgpmZWVfcGVyX3ZiGAYgASgEUghmZWVQZXJWYhI/Cg1j'
    'aGFuZ2Vfb3V0cHV0GAcgASgLMhouVFcuQml0Y29pblYyLlByb3RvLk91dHB1dFIMY2hhbmdlT3'
    'V0cHV0EjIKFWRpc2FibGVfY2hhbmdlX291dHB1dBgIIAEoCFITZGlzYWJsZUNoYW5nZU91dHB1'
    'dEIJCgdjb21wb3Nl');

@$core.Deprecated('Use transactionPlanDescriptor instead')
const TransactionPlan$json = {
  '1': 'TransactionPlan',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.BitcoinV2.Proto.Error',
      '10': 'error'
    },
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'brc20',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.TransactionPlan.Brc20Plan',
      '9': 0,
      '10': 'brc20'
    },
  ],
  '3': [TransactionPlan_Brc20Plan$json],
  '8': [
    {'1': 'plan'},
  ],
};

@$core.Deprecated('Use transactionPlanDescriptor instead')
const TransactionPlan_Brc20Plan$json = {
  '1': 'Brc20Plan',
  '2': [
    {
      '1': 'commit',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.SigningInput',
      '10': 'commit'
    },
    {
      '1': 'reveal',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.SigningInput',
      '10': 'reveal'
    },
  ],
};

/// Descriptor for `TransactionPlan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionPlanDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblBsYW4SLwoFZXJyb3IYASABKA4yGS5UVy5CaXRjb2luVjIuUHJvdG8uRX'
    'Jyb3JSBWVycm9yEiMKDWVycm9yX21lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZRJFCgVicmMy'
    'MBgDIAEoCzItLlRXLkJpdGNvaW5WMi5Qcm90by5UcmFuc2FjdGlvblBsYW4uQnJjMjBQbGFuSA'
    'BSBWJyYzIwGn8KCUJyYzIwUGxhbhI4CgZjb21taXQYASABKAsyIC5UVy5CaXRjb2luVjIuUHJv'
    'dG8uU2lnbmluZ0lucHV0UgZjb21taXQSOAoGcmV2ZWFsGAIgASgLMiAuVFcuQml0Y29pblYyLl'
    'Byb3RvLlNpZ25pbmdJbnB1dFIGcmV2ZWFsQgYKBHBsYW4=');
