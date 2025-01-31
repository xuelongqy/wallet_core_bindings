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

@$core.Deprecated('Use inputSelectorDescriptor instead')
const InputSelector$json = {
  '1': 'InputSelector',
  '2': [
    {'1': 'SelectAscending', '2': 0},
    {'1': 'SelectInOrder', '2': 1},
    {'1': 'SelectDescending', '2': 2},
    {'1': 'UseAll', '2': 10},
  ],
};

/// Descriptor for `InputSelector`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List inputSelectorDescriptor = $convert.base64Decode(
    'Cg1JbnB1dFNlbGVjdG9yEhMKD1NlbGVjdEFzY2VuZGluZxAAEhEKDVNlbGVjdEluT3JkZXIQAR'
    'IUChBTZWxlY3REZXNjZW5kaW5nEAISCgoGVXNlQWxsEAo=');

@$core.Deprecated('Use transactionVersionDescriptor instead')
const TransactionVersion$json = {
  '1': 'TransactionVersion',
  '2': [
    {'1': 'UseDefault', '2': 0},
    {'1': 'V1', '2': 1},
    {'1': 'V2', '2': 2},
  ],
};

/// Descriptor for `TransactionVersion`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionVersionDescriptor = $convert.base64Decode(
    'ChJUcmFuc2FjdGlvblZlcnNpb24SDgoKVXNlRGVmYXVsdBAAEgYKAlYxEAESBgoCVjIQAg==');

@$core.Deprecated('Use publicKeyOrHashDescriptor instead')
const PublicKeyOrHash$json = {
  '1': 'PublicKeyOrHash',
  '2': [
    {'1': 'pubkey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'pubkey'},
    {'1': 'hash', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'hash'},
  ],
  '8': [
    {'1': 'variant'},
  ],
};

/// Descriptor for `PublicKeyOrHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicKeyOrHashDescriptor = $convert.base64Decode(
    'Cg9QdWJsaWNLZXlPckhhc2gSGAoGcHVia2V5GAEgASgMSABSBnB1YmtleRIUCgRoYXNoGAIgAS'
    'gMSABSBGhhc2hCCQoHdmFyaWFudA==');

@$core.Deprecated('Use publicKeySignatureDescriptor instead')
const PublicKeySignature$json = {
  '1': 'PublicKeySignature',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `PublicKeySignature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicKeySignatureDescriptor = $convert.base64Decode(
    'ChJQdWJsaWNLZXlTaWduYXR1cmUSHQoKcHVibGljX2tleRgBIAEoDFIJcHVibGljS2V5EhwKCX'
    'NpZ25hdHVyZRgCIAEoDFIJc2lnbmF0dXJl');

@$core.Deprecated('Use inputDescriptor instead')
const Input$json = {
  '1': 'Input',
  '2': [
    {
      '1': 'out_point',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Utxo.Proto.OutPoint',
      '10': 'outPoint'
    },
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
    {'1': 'sighash_type', '3': 3, '4': 1, '5': 13, '10': 'sighashType'},
    {
      '1': 'sequence',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.Sequence',
      '10': 'sequence'
    },
    {
      '1': 'script_builder',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input.InputBuilder',
      '9': 0,
      '10': 'scriptBuilder'
    },
    {'1': 'script_data', '3': 6, '4': 1, '5': 12, '9': 0, '10': 'scriptData'},
    {
      '1': 'receiver_address',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'receiverAddress'
    },
  ],
  '3': [
    Input_Sequence$json,
    Input_InputBuilder$json,
    Input_InputTaprootScriptPath$json,
    Input_InputBrc20Inscription$json
  ],
  '8': [
    {'1': 'claiming_script'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_Sequence$json = {
  '1': 'Sequence',
  '2': [
    {'1': 'sequence', '3': 1, '4': 1, '5': 13, '10': 'sequence'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputBuilder$json = {
  '1': 'InputBuilder',
  '2': [
    {'1': 'p2pk', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'p2pk'},
    {
      '1': 'p2pkh',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PublicKeyOrHash',
      '9': 0,
      '10': 'p2pkh'
    },
    {
      '1': 'p2wpkh',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PublicKeyOrHash',
      '9': 0,
      '10': 'p2wpkh'
    },
    {
      '1': 'p2tr_key_path',
      '3': 7,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'p2trKeyPath'
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
      '1': 'babylon_staking_timelock_path',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.InputBuilder.StakingTimelockPath',
      '9': 0,
      '10': 'babylonStakingTimelockPath'
    },
    {
      '1': 'babylon_staking_unbonding_path',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.InputBuilder.StakingUnbondingPath',
      '9': 0,
      '10': 'babylonStakingUnbondingPath'
    },
    {
      '1': 'babylon_staking_slashing_path',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.InputBuilder.StakingSlashingPath',
      '9': 0,
      '10': 'babylonStakingSlashingPath'
    },
    {
      '1': 'babylon_unbonding_timelock_path',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.InputBuilder.UnbondingTimelockPath',
      '9': 0,
      '10': 'babylonUnbondingTimelockPath'
    },
    {
      '1': 'babylon_unbonding_slashing_path',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.InputBuilder.UnbondingSlashingPath',
      '9': 0,
      '10': 'babylonUnbondingSlashingPath'
    },
  ],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputTaprootScriptPath$json = {
  '1': 'InputTaprootScriptPath',
  '2': [
    {'1': 'payload', '3': 2, '4': 1, '5': 12, '10': 'payload'},
    {'1': 'control_block', '3': 3, '4': 1, '5': 12, '10': 'controlBlock'},
  ],
};

@$core.Deprecated('Use inputDescriptor instead')
const Input_InputBrc20Inscription$json = {
  '1': 'InputBrc20Inscription',
  '2': [
    {'1': 'inscribe_to', '3': 2, '4': 1, '5': 12, '10': 'inscribeTo'},
    {'1': 'ticker', '3': 3, '4': 1, '5': 9, '10': 'ticker'},
    {'1': 'transfer_amount', '3': 4, '4': 1, '5': 9, '10': 'transferAmount'},
  ],
};

/// Descriptor for `Input`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputDescriptor = $convert.base64Decode(
    'CgVJbnB1dBI0CglvdXRfcG9pbnQYASABKAsyFy5UVy5VdHhvLlByb3RvLk91dFBvaW50UghvdX'
    'RQb2ludBIUCgV2YWx1ZRgCIAEoA1IFdmFsdWUSIQoMc2lnaGFzaF90eXBlGAMgASgNUgtzaWdo'
    'YXNoVHlwZRI+CghzZXF1ZW5jZRgEIAEoCzIiLlRXLkJpdGNvaW5WMi5Qcm90by5JbnB1dC5TZX'
    'F1ZW5jZVIIc2VxdWVuY2USTwoOc2NyaXB0X2J1aWxkZXIYBSABKAsyJi5UVy5CaXRjb2luVjIu'
    'UHJvdG8uSW5wdXQuSW5wdXRCdWlsZGVySABSDXNjcmlwdEJ1aWxkZXISIQoLc2NyaXB0X2RhdG'
    'EYBiABKAxIAFIKc2NyaXB0RGF0YRIrChByZWNlaXZlcl9hZGRyZXNzGAcgASgJSABSD3JlY2Vp'
    'dmVyQWRkcmVzcxomCghTZXF1ZW5jZRIaCghzZXF1ZW5jZRgBIAEoDVIIc2VxdWVuY2UavQcKDE'
    'lucHV0QnVpbGRlchIUCgRwMnBrGAIgASgMSABSBHAycGsSOwoFcDJwa2gYAyABKAsyIy5UVy5C'
    'aXRjb2luVjIuUHJvdG8uUHVibGljS2V5T3JIYXNoSABSBXAycGtoEj0KBnAyd3BraBgFIAEoCz'
    'IjLlRXLkJpdGNvaW5WMi5Qcm90by5QdWJsaWNLZXlPckhhc2hIAFIGcDJ3cGtoEiQKDXAydHJf'
    'a2V5X3BhdGgYByABKAxIAFILcDJ0cktleVBhdGgSWAoOYnJjMjBfaW5zY3JpYmUYCSABKAsyLy'
    '5UVy5CaXRjb2luVjIuUHJvdG8uSW5wdXQuSW5wdXRCcmMyMEluc2NyaXB0aW9uSABSDWJyYzIw'
    'SW5zY3JpYmUSfgodYmFieWxvbl9zdGFraW5nX3RpbWVsb2NrX3BhdGgYDyABKAsyOS5UVy5CYW'
    'J5bG9uU3Rha2luZy5Qcm90by5JbnB1dEJ1aWxkZXIuU3Rha2luZ1RpbWVsb2NrUGF0aEgAUhpi'
    'YWJ5bG9uU3Rha2luZ1RpbWVsb2NrUGF0aBKBAQoeYmFieWxvbl9zdGFraW5nX3VuYm9uZGluZ1'
    '9wYXRoGBAgASgLMjouVFcuQmFieWxvblN0YWtpbmcuUHJvdG8uSW5wdXRCdWlsZGVyLlN0YWtp'
    'bmdVbmJvbmRpbmdQYXRoSABSG2JhYnlsb25TdGFraW5nVW5ib25kaW5nUGF0aBJ+Ch1iYWJ5bG'
    '9uX3N0YWtpbmdfc2xhc2hpbmdfcGF0aBgRIAEoCzI5LlRXLkJhYnlsb25TdGFraW5nLlByb3Rv'
    'LklucHV0QnVpbGRlci5TdGFraW5nU2xhc2hpbmdQYXRoSABSGmJhYnlsb25TdGFraW5nU2xhc2'
    'hpbmdQYXRoEoQBCh9iYWJ5bG9uX3VuYm9uZGluZ190aW1lbG9ja19wYXRoGBIgASgLMjsuVFcu'
    'QmFieWxvblN0YWtpbmcuUHJvdG8uSW5wdXRCdWlsZGVyLlVuYm9uZGluZ1RpbWVsb2NrUGF0aE'
    'gAUhxiYWJ5bG9uVW5ib25kaW5nVGltZWxvY2tQYXRoEoQBCh9iYWJ5bG9uX3VuYm9uZGluZ19z'
    'bGFzaGluZ19wYXRoGBMgASgLMjsuVFcuQmFieWxvblN0YWtpbmcuUHJvdG8uSW5wdXRCdWlsZG'
    'VyLlVuYm9uZGluZ1NsYXNoaW5nUGF0aEgAUhxiYWJ5bG9uVW5ib25kaW5nU2xhc2hpbmdQYXRo'
    'QgkKB3ZhcmlhbnQaVwoWSW5wdXRUYXByb290U2NyaXB0UGF0aBIYCgdwYXlsb2FkGAIgASgMUg'
    'dwYXlsb2FkEiMKDWNvbnRyb2xfYmxvY2sYAyABKAxSDGNvbnRyb2xCbG9jaxp5ChVJbnB1dEJy'
    'YzIwSW5zY3JpcHRpb24SHwoLaW5zY3JpYmVfdG8YAiABKAxSCmluc2NyaWJlVG8SFgoGdGlja2'
    'VyGAMgASgJUgZ0aWNrZXISJwoPdHJhbnNmZXJfYW1vdW50GAQgASgJUg50cmFuc2ZlckFtb3Vu'
    'dEIRCg9jbGFpbWluZ19zY3JpcHQ=');

@$core.Deprecated('Use outputDescriptor instead')
const Output$json = {
  '1': 'Output',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
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
    {'1': 'to_address', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'toAddress'},
  ],
  '3': [
    Output_OutputBuilder$json,
    Output_RedeemScriptOrHash$json,
    Output_OutputTaprootScriptPath$json,
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
      '6': '.TW.BitcoinV2.Proto.Output.RedeemScriptOrHash',
      '9': 0,
      '10': 'p2sh'
    },
    {'1': 'p2pk', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'p2pk'},
    {
      '1': 'p2pkh',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PublicKeyOrHash',
      '9': 0,
      '10': 'p2pkh'
    },
    {
      '1': 'p2wsh',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.RedeemScriptOrHash',
      '9': 0,
      '10': 'p2wsh'
    },
    {
      '1': 'p2wpkh',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PublicKeyOrHash',
      '9': 0,
      '10': 'p2wpkh'
    },
    {
      '1': 'p2tr_key_path',
      '3': 6,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'p2trKeyPath'
    },
    {
      '1': 'p2tr_script_path',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputTaprootScriptPath',
      '9': 0,
      '10': 'p2trScriptPath'
    },
    {
      '1': 'p2tr_dangerous_assume_tweaked',
      '3': 8,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'p2trDangerousAssumeTweaked'
    },
    {
      '1': 'brc20_inscribe',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output.OutputBrc20Inscription',
      '9': 0,
      '10': 'brc20Inscribe'
    },
    {'1': 'op_return', '3': 12, '4': 1, '5': 12, '9': 0, '10': 'opReturn'},
    {
      '1': 'babylon_staking',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.OutputBuilder.StakingOutput',
      '9': 0,
      '10': 'babylonStaking'
    },
    {
      '1': 'babylon_unbonding',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.OutputBuilder.UnbondingOutput',
      '9': 0,
      '10': 'babylonUnbonding'
    },
    {
      '1': 'babylon_staking_op_return',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.OutputBuilder.OpReturn',
      '9': 0,
      '10': 'babylonStakingOpReturn'
    },
  ],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use outputDescriptor instead')
const Output_RedeemScriptOrHash$json = {
  '1': 'RedeemScriptOrHash',
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
    'CgZPdXRwdXQSFAoFdmFsdWUYASABKANSBXZhbHVlEkQKB2J1aWxkZXIYAiABKAsyKC5UVy5CaX'
    'Rjb2luVjIuUHJvdG8uT3V0cHV0Lk91dHB1dEJ1aWxkZXJIAFIHYnVpbGRlchIyChRjdXN0b21f'
    'c2NyaXB0X3B1YmtleRgDIAEoDEgAUhJjdXN0b21TY3JpcHRQdWJrZXkSHwoKdG9fYWRkcmVzcx'
    'gEIAEoCUgAUgl0b0FkZHJlc3MatAcKDU91dHB1dEJ1aWxkZXISQwoEcDJzaBgBIAEoCzItLlRX'
    'LkJpdGNvaW5WMi5Qcm90by5PdXRwdXQuUmVkZWVtU2NyaXB0T3JIYXNoSABSBHAyc2gSFAoEcD'
    'JwaxgCIAEoDEgAUgRwMnBrEjsKBXAycGtoGAMgASgLMiMuVFcuQml0Y29pblYyLlByb3RvLlB1'
    'YmxpY0tleU9ySGFzaEgAUgVwMnBraBJFCgVwMndzaBgEIAEoCzItLlRXLkJpdGNvaW5WMi5Qcm'
    '90by5PdXRwdXQuUmVkZWVtU2NyaXB0T3JIYXNoSABSBXAyd3NoEj0KBnAyd3BraBgFIAEoCzIj'
    'LlRXLkJpdGNvaW5WMi5Qcm90by5QdWJsaWNLZXlPckhhc2hIAFIGcDJ3cGtoEiQKDXAydHJfa2'
    'V5X3BhdGgYBiABKAxIAFILcDJ0cktleVBhdGgSXgoQcDJ0cl9zY3JpcHRfcGF0aBgHIAEoCzIy'
    'LlRXLkJpdGNvaW5WMi5Qcm90by5PdXRwdXQuT3V0cHV0VGFwcm9vdFNjcmlwdFBhdGhIAFIOcD'
    'J0clNjcmlwdFBhdGgSQwodcDJ0cl9kYW5nZXJvdXNfYXNzdW1lX3R3ZWFrZWQYCCABKAxIAFIa'
    'cDJ0ckRhbmdlcm91c0Fzc3VtZVR3ZWFrZWQSWgoOYnJjMjBfaW5zY3JpYmUYCSABKAsyMS5UVy'
    '5CaXRjb2luVjIuUHJvdG8uT3V0cHV0Lk91dHB1dEJyYzIwSW5zY3JpcHRpb25IAFINYnJjMjBJ'
    'bnNjcmliZRIdCglvcF9yZXR1cm4YDCABKAxIAFIIb3BSZXR1cm4SXwoPYmFieWxvbl9zdGFraW'
    '5nGA8gASgLMjQuVFcuQmFieWxvblN0YWtpbmcuUHJvdG8uT3V0cHV0QnVpbGRlci5TdGFraW5n'
    'T3V0cHV0SABSDmJhYnlsb25TdGFraW5nEmUKEWJhYnlsb25fdW5ib25kaW5nGBAgASgLMjYuVF'
    'cuQmFieWxvblN0YWtpbmcuUHJvdG8uT3V0cHV0QnVpbGRlci5VbmJvbmRpbmdPdXRwdXRIAFIQ'
    'YmFieWxvblVuYm9uZGluZxJsChliYWJ5bG9uX3N0YWtpbmdfb3BfcmV0dXJuGBEgASgLMi8uVF'
    'cuQmFieWxvblN0YWtpbmcuUHJvdG8uT3V0cHV0QnVpbGRlci5PcFJldHVybkgAUhZiYWJ5bG9u'
    'U3Rha2luZ09wUmV0dXJuQgkKB3ZhcmlhbnQaXAoSUmVkZWVtU2NyaXB0T3JIYXNoEiUKDXJlZG'
    'VlbV9zY3JpcHQYASABKAxIAFIMcmVkZWVtU2NyaXB0EhQKBGhhc2gYAiABKAxIAFIEaGFzaEIJ'
    'Cgd2YXJpYW50Gl0KF091dHB1dFRhcHJvb3RTY3JpcHRQYXRoEiEKDGludGVybmFsX2tleRgBIA'
    'EoDFILaW50ZXJuYWxLZXkSHwoLbWVya2xlX3Jvb3QYAiABKAxSCm1lcmtsZVJvb3QaegoWT3V0'
    'cHV0QnJjMjBJbnNjcmlwdGlvbhIfCgtpbnNjcmliZV90bxgBIAEoDFIKaW5zY3JpYmVUbxIWCg'
    'Z0aWNrZXIYAiABKAlSBnRpY2tlchInCg90cmFuc2Zlcl9hbW91bnQYAyABKAlSDnRyYW5zZmVy'
    'QW1vdW50Qg4KDHRvX3JlY2lwaWVudA==');

@$core.Deprecated('Use chainInfoDescriptor instead')
const ChainInfo$json = {
  '1': 'ChainInfo',
  '2': [
    {'1': 'p2pkh_prefix', '3': 1, '4': 1, '5': 13, '10': 'p2pkhPrefix'},
    {'1': 'p2sh_prefix', '3': 2, '4': 1, '5': 13, '10': 'p2shPrefix'},
    {'1': 'hrp', '3': 3, '4': 1, '5': 9, '10': 'hrp'},
  ],
};

/// Descriptor for `ChainInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chainInfoDescriptor = $convert.base64Decode(
    'CglDaGFpbkluZm8SIQoMcDJwa2hfcHJlZml4GAEgASgNUgtwMnBraFByZWZpeBIfCgtwMnNoX3'
    'ByZWZpeBgCIAEoDVIKcDJzaFByZWZpeBIQCgNocnAYAyABKAlSA2hycA==');

@$core.Deprecated('Use transactionBuilderDescriptor instead')
const TransactionBuilder$json = {
  '1': 'TransactionBuilder',
  '2': [
    {
      '1': 'version',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.BitcoinV2.Proto.TransactionVersion',
      '10': 'version'
    },
    {'1': 'lock_time', '3': 2, '4': 1, '5': 13, '10': 'lockTime'},
    {
      '1': 'inputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'outputs'
    },
    {
      '1': 'input_selector',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.TW.BitcoinV2.Proto.InputSelector',
      '10': 'inputSelector'
    },
    {'1': 'fee_per_vb', '3': 6, '4': 1, '5': 3, '10': 'feePerVb'},
    {
      '1': 'change_output',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'changeOutput'
    },
    {
      '1': 'max_amount_output',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'maxAmountOutput'
    },
    {
      '1': 'fixed_dust_threshold',
      '3': 10,
      '4': 1,
      '5': 3,
      '9': 0,
      '10': 'fixedDustThreshold'
    },
    {
      '1': 'zcash_extra_data',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.TW.Zcash.Proto.TransactionBuilderExtraData',
      '9': 1,
      '10': 'zcashExtraData'
    },
  ],
  '8': [
    {'1': 'dust_policy'},
    {'1': 'chain_specific'},
  ],
};

/// Descriptor for `TransactionBuilder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionBuilderDescriptor = $convert.base64Decode(
    'ChJUcmFuc2FjdGlvbkJ1aWxkZXISQAoHdmVyc2lvbhgBIAEoDjImLlRXLkJpdGNvaW5WMi5Qcm'
    '90by5UcmFuc2FjdGlvblZlcnNpb25SB3ZlcnNpb24SGwoJbG9ja190aW1lGAIgASgNUghsb2Nr'
    'VGltZRIxCgZpbnB1dHMYAyADKAsyGS5UVy5CaXRjb2luVjIuUHJvdG8uSW5wdXRSBmlucHV0cx'
    'I0CgdvdXRwdXRzGAQgAygLMhouVFcuQml0Y29pblYyLlByb3RvLk91dHB1dFIHb3V0cHV0cxJI'
    'Cg5pbnB1dF9zZWxlY3RvchgFIAEoDjIhLlRXLkJpdGNvaW5WMi5Qcm90by5JbnB1dFNlbGVjdG'
    '9yUg1pbnB1dFNlbGVjdG9yEhwKCmZlZV9wZXJfdmIYBiABKANSCGZlZVBlclZiEj8KDWNoYW5n'
    'ZV9vdXRwdXQYByABKAsyGi5UVy5CaXRjb2luVjIuUHJvdG8uT3V0cHV0UgxjaGFuZ2VPdXRwdX'
    'QSRgoRbWF4X2Ftb3VudF9vdXRwdXQYCCABKAsyGi5UVy5CaXRjb2luVjIuUHJvdG8uT3V0cHV0'
    'Ug9tYXhBbW91bnRPdXRwdXQSMgoUZml4ZWRfZHVzdF90aHJlc2hvbGQYCiABKANIAFISZml4ZW'
    'REdXN0VGhyZXNob2xkElcKEHpjYXNoX2V4dHJhX2RhdGEYFCABKAsyKy5UVy5aY2FzaC5Qcm90'
    'by5UcmFuc2FjdGlvbkJ1aWxkZXJFeHRyYURhdGFIAVIOemNhc2hFeHRyYURhdGFCDQoLZHVzdF'
    '9wb2xpY3lCEAoOY2hhaW5fc3BlY2lmaWM=');

@$core.Deprecated('Use psbtDescriptor instead')
const Psbt$json = {
  '1': 'Psbt',
  '2': [
    {'1': 'psbt', '3': 1, '4': 1, '5': 12, '10': 'psbt'},
  ],
};

/// Descriptor for `Psbt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List psbtDescriptor =
    $convert.base64Decode('CgRQc2J0EhIKBHBzYnQYASABKAxSBHBzYnQ=');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'private_keys', '3': 1, '4': 3, '5': 12, '10': 'privateKeys'},
    {'1': 'public_keys', '3': 2, '4': 3, '5': 12, '10': 'publicKeys'},
    {
      '1': 'chain_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.ChainInfo',
      '10': 'chainInfo'
    },
    {
      '1': 'dangerous_use_fixed_schnorr_rng',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'dangerousUseFixedSchnorrRng'
    },
    {
      '1': 'builder',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.TransactionBuilder',
      '9': 0,
      '10': 'builder'
    },
    {
      '1': 'psbt',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Psbt',
      '9': 0,
      '10': 'psbt'
    },
  ],
  '8': [
    {'1': 'transaction'},
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSIQoMcHJpdmF0ZV9rZXlzGAEgAygMUgtwcml2YXRlS2V5cxIfCgtwdW'
    'JsaWNfa2V5cxgCIAMoDFIKcHVibGljS2V5cxI8CgpjaGFpbl9pbmZvGAMgASgLMh0uVFcuQml0'
    'Y29pblYyLlByb3RvLkNoYWluSW5mb1IJY2hhaW5JbmZvEkQKH2Rhbmdlcm91c191c2VfZml4ZW'
    'Rfc2Nobm9ycl9ybmcYBCABKAhSG2Rhbmdlcm91c1VzZUZpeGVkU2Nobm9yclJuZxJCCgdidWls'
    'ZGVyGAogASgLMiYuVFcuQml0Y29pblYyLlByb3RvLlRyYW5zYWN0aW9uQnVpbGRlckgAUgdidW'
    'lsZGVyEi4KBHBzYnQYCyABKAsyGC5UVy5CaXRjb2luVjIuUHJvdG8uUHNidEgAUgRwc2J0Qg0K'
    'C3RyYW5zYWN0aW9u');

@$core.Deprecated('Use transactionPlanDescriptor instead')
const TransactionPlan$json = {
  '1': 'TransactionPlan',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'inputs',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Input',
      '10': 'inputs'
    },
    {
      '1': 'outputs',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Output',
      '10': 'outputs'
    },
    {'1': 'available_amount', '3': 5, '4': 1, '5': 3, '10': 'availableAmount'},
    {'1': 'send_amount', '3': 6, '4': 1, '5': 3, '10': 'sendAmount'},
    {'1': 'vsize_estimate', '3': 7, '4': 1, '5': 4, '10': 'vsizeEstimate'},
    {'1': 'fee_estimate', '3': 8, '4': 1, '5': 3, '10': 'feeEstimate'},
    {'1': 'change', '3': 9, '4': 1, '5': 3, '10': 'change'},
  ],
};

/// Descriptor for `TransactionPlan`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionPlanDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblBsYW4SMwoFZXJyb3IYASABKA4yHS5UVy5Db21tb24uUHJvdG8uU2lnbm'
    'luZ0Vycm9yUgVlcnJvchIjCg1lcnJvcl9tZXNzYWdlGAIgASgJUgxlcnJvck1lc3NhZ2USMQoG'
    'aW5wdXRzGAMgAygLMhkuVFcuQml0Y29pblYyLlByb3RvLklucHV0UgZpbnB1dHMSNAoHb3V0cH'
    'V0cxgEIAMoCzIaLlRXLkJpdGNvaW5WMi5Qcm90by5PdXRwdXRSB291dHB1dHMSKQoQYXZhaWxh'
    'YmxlX2Ftb3VudBgFIAEoA1IPYXZhaWxhYmxlQW1vdW50Eh8KC3NlbmRfYW1vdW50GAYgASgDUg'
    'pzZW5kQW1vdW50EiUKDnZzaXplX2VzdGltYXRlGAcgASgEUg12c2l6ZUVzdGltYXRlEiEKDGZl'
    'ZV9lc3RpbWF0ZRgIIAEoA1ILZmVlRXN0aW1hdGUSFgoGY2hhbmdlGAkgASgDUgZjaGFuZ2U=');

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput$json = {
  '1': 'PreSigningOutput',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'sighashes',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PreSigningOutput.Sighash',
      '10': 'sighashes'
    },
  ],
  '3': [PreSigningOutput_Sighash$json, PreSigningOutput_TaprootTweak$json],
  '4': [PreSigningOutput_SigningMethod$json],
};

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput_Sighash$json = {
  '1': 'Sighash',
  '2': [
    {'1': 'public_key', '3': 1, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'sighash', '3': 2, '4': 1, '5': 12, '10': 'sighash'},
    {
      '1': 'signing_method',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.BitcoinV2.Proto.PreSigningOutput.SigningMethod',
      '10': 'signingMethod'
    },
    {
      '1': 'tweak',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.PreSigningOutput.TaprootTweak',
      '10': 'tweak'
    },
  ],
};

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput_TaprootTweak$json = {
  '1': 'TaprootTweak',
  '2': [
    {'1': 'merkle_root', '3': 1, '4': 1, '5': 12, '10': 'merkleRoot'},
  ],
};

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput_SigningMethod$json = {
  '1': 'SigningMethod',
  '2': [
    {'1': 'Legacy', '2': 0},
    {'1': 'Segwit', '2': 1},
    {'1': 'Taproot', '2': 2},
  ],
};

/// Descriptor for `PreSigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preSigningOutputDescriptor = $convert.base64Decode(
    'ChBQcmVTaWduaW5nT3V0cHV0EjMKBWVycm9yGAEgASgOMh0uVFcuQ29tbW9uLlByb3RvLlNpZ2'
    '5pbmdFcnJvclIFZXJyb3ISIwoNZXJyb3JfbWVzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdlEkoK'
    'CXNpZ2hhc2hlcxgEIAMoCzIsLlRXLkJpdGNvaW5WMi5Qcm90by5QcmVTaWduaW5nT3V0cHV0Ll'
    'NpZ2hhc2hSCXNpZ2hhc2hlcxrmAQoHU2lnaGFzaBIdCgpwdWJsaWNfa2V5GAEgASgMUglwdWJs'
    'aWNLZXkSGAoHc2lnaGFzaBgCIAEoDFIHc2lnaGFzaBJZCg5zaWduaW5nX21ldGhvZBgDIAEoDj'
    'IyLlRXLkJpdGNvaW5WMi5Qcm90by5QcmVTaWduaW5nT3V0cHV0LlNpZ25pbmdNZXRob2RSDXNp'
    'Z25pbmdNZXRob2QSRwoFdHdlYWsYBCABKAsyMS5UVy5CaXRjb2luVjIuUHJvdG8uUHJlU2lnbm'
    'luZ091dHB1dC5UYXByb290VHdlYWtSBXR3ZWFrGi8KDFRhcHJvb3RUd2VhaxIfCgttZXJrbGVf'
    'cm9vdBgBIAEoDFIKbWVya2xlUm9vdCI0Cg1TaWduaW5nTWV0aG9kEgoKBkxlZ2FjeRAAEgoKBl'
    'NlZ3dpdBABEgsKB1RhcHJvb3QQAg==');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'encoded', '3': 4, '4': 1, '5': 12, '10': 'encoded'},
    {'1': 'txid', '3': 5, '4': 1, '5': 12, '10': 'txid'},
    {'1': 'vsize', '3': 6, '4': 1, '5': 4, '10': 'vsize'},
    {'1': 'weight', '3': 7, '4': 1, '5': 4, '10': 'weight'},
    {'1': 'fee', '3': 8, '4': 1, '5': 3, '10': 'fee'},
    {
      '1': 'psbt',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.BitcoinV2.Proto.Psbt',
      '10': 'psbt'
    },
    {
      '1': 'bitcoin',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.TW.Utxo.Proto.Transaction',
      '9': 0,
      '10': 'bitcoin'
    },
    {
      '1': 'zcash',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.TW.Zcash.Proto.Transaction',
      '9': 0,
      '10': 'zcash'
    },
  ],
  '8': [
    {'1': 'transaction'},
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0EjMKBWVycm9yGAEgASgOMh0uVFcuQ29tbW9uLlByb3RvLlNpZ25pbm'
    'dFcnJvclIFZXJyb3ISIwoNZXJyb3JfbWVzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdlEhgKB2Vu'
    'Y29kZWQYBCABKAxSB2VuY29kZWQSEgoEdHhpZBgFIAEoDFIEdHhpZBIUCgV2c2l6ZRgGIAEoBF'
    'IFdnNpemUSFgoGd2VpZ2h0GAcgASgEUgZ3ZWlnaHQSEAoDZmVlGAggASgDUgNmZWUSLAoEcHNi'
    'dBgJIAEoCzIYLlRXLkJpdGNvaW5WMi5Qcm90by5Qc2J0UgRwc2J0EjYKB2JpdGNvaW4YDyABKA'
    'syGi5UVy5VdHhvLlByb3RvLlRyYW5zYWN0aW9uSABSB2JpdGNvaW4SMwoFemNhc2gYECABKAsy'
    'Gy5UVy5aY2FzaC5Qcm90by5UcmFuc2FjdGlvbkgAUgV6Y2FzaEINCgt0cmFuc2FjdGlvbg==');
