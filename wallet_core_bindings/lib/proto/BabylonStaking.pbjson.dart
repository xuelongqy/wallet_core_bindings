//
//  Generated code. Do not modify.
//  source: BabylonStaking.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

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

@$core.Deprecated('Use stakingInfoDescriptor instead')
const StakingInfo$json = {
  '1': 'StakingInfo',
  '2': [
    {
      '1': 'staker_public_key',
      '3': 1,
      '4': 1,
      '5': 12,
      '10': 'stakerPublicKey'
    },
    {
      '1': 'finality_provider_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'finalityProviderPublicKey'
    },
    {'1': 'staking_time', '3': 3, '4': 1, '5': 13, '10': 'stakingTime'},
    {
      '1': 'covenant_committee_public_keys',
      '3': 4,
      '4': 3,
      '5': 12,
      '10': 'covenantCommitteePublicKeys'
    },
    {'1': 'covenant_quorum', '3': 5, '4': 1, '5': 13, '10': 'covenantQuorum'},
  ],
};

/// Descriptor for `StakingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stakingInfoDescriptor = $convert.base64Decode(
    'CgtTdGFraW5nSW5mbxIqChFzdGFrZXJfcHVibGljX2tleRgBIAEoDFIPc3Rha2VyUHVibGljS2'
    'V5Ej8KHGZpbmFsaXR5X3Byb3ZpZGVyX3B1YmxpY19rZXkYAiABKAxSGWZpbmFsaXR5UHJvdmlk'
    'ZXJQdWJsaWNLZXkSIQoMc3Rha2luZ190aW1lGAMgASgNUgtzdGFraW5nVGltZRJDCh5jb3Zlbm'
    'FudF9jb21taXR0ZWVfcHVibGljX2tleXMYBCADKAxSG2NvdmVuYW50Q29tbWl0dGVlUHVibGlj'
    'S2V5cxInCg9jb3ZlbmFudF9xdW9ydW0YBSABKA1SDmNvdmVuYW50UXVvcnVt');

@$core.Deprecated('Use inputBuilderDescriptor instead')
const InputBuilder$json = {
  '1': 'InputBuilder',
  '3': [
    InputBuilder_StakingTimelockPath$json,
    InputBuilder_StakingUnbondingPath$json,
    InputBuilder_StakingSlashingPath$json,
    InputBuilder_UnbondingTimelockPath$json,
    InputBuilder_UnbondingSlashingPath$json
  ],
};

@$core.Deprecated('Use inputBuilderDescriptor instead')
const InputBuilder_StakingTimelockPath$json = {
  '1': 'StakingTimelockPath',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
  ],
};

@$core.Deprecated('Use inputBuilderDescriptor instead')
const InputBuilder_StakingUnbondingPath$json = {
  '1': 'StakingUnbondingPath',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
    {
      '1': 'covenant_committee_signatures',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.PublicKeySignature',
      '10': 'covenantCommitteeSignatures'
    },
  ],
};

@$core.Deprecated('Use inputBuilderDescriptor instead')
const InputBuilder_StakingSlashingPath$json = {
  '1': 'StakingSlashingPath',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
    {
      '1': 'finality_provider_signature',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.PublicKeySignature',
      '10': 'finalityProviderSignature'
    },
  ],
};

@$core.Deprecated('Use inputBuilderDescriptor instead')
const InputBuilder_UnbondingTimelockPath$json = {
  '1': 'UnbondingTimelockPath',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
  ],
};

@$core.Deprecated('Use inputBuilderDescriptor instead')
const InputBuilder_UnbondingSlashingPath$json = {
  '1': 'UnbondingSlashingPath',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
    {
      '1': 'finality_provider_signature',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.PublicKeySignature',
      '10': 'finalityProviderSignature'
    },
  ],
};

/// Descriptor for `InputBuilder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputBuilderDescriptor = $convert.base64Decode(
    'CgxJbnB1dEJ1aWxkZXIaUwoTU3Rha2luZ1RpbWVsb2NrUGF0aBI8CgZwYXJhbXMYASABKAsyJC'
    '5UVy5CYWJ5bG9uU3Rha2luZy5Qcm90by5TdGFraW5nSW5mb1IGcGFyYW1zGsUBChRTdGFraW5n'
    'VW5ib25kaW5nUGF0aBI8CgZwYXJhbXMYASABKAsyJC5UVy5CYWJ5bG9uU3Rha2luZy5Qcm90by'
    '5TdGFraW5nSW5mb1IGcGFyYW1zEm8KHWNvdmVuYW50X2NvbW1pdHRlZV9zaWduYXR1cmVzGAIg'
    'AygLMisuVFcuQmFieWxvblN0YWtpbmcuUHJvdG8uUHVibGljS2V5U2lnbmF0dXJlUhtjb3Zlbm'
    'FudENvbW1pdHRlZVNpZ25hdHVyZXMawAEKE1N0YWtpbmdTbGFzaGluZ1BhdGgSPAoGcGFyYW1z'
    'GAEgASgLMiQuVFcuQmFieWxvblN0YWtpbmcuUHJvdG8uU3Rha2luZ0luZm9SBnBhcmFtcxJrCh'
    'tmaW5hbGl0eV9wcm92aWRlcl9zaWduYXR1cmUYAiABKAsyKy5UVy5CYWJ5bG9uU3Rha2luZy5Q'
    'cm90by5QdWJsaWNLZXlTaWduYXR1cmVSGWZpbmFsaXR5UHJvdmlkZXJTaWduYXR1cmUaVQoVVW'
    '5ib25kaW5nVGltZWxvY2tQYXRoEjwKBnBhcmFtcxgBIAEoCzIkLlRXLkJhYnlsb25TdGFraW5n'
    'LlByb3RvLlN0YWtpbmdJbmZvUgZwYXJhbXMawgEKFVVuYm9uZGluZ1NsYXNoaW5nUGF0aBI8Cg'
    'ZwYXJhbXMYASABKAsyJC5UVy5CYWJ5bG9uU3Rha2luZy5Qcm90by5TdGFraW5nSW5mb1IGcGFy'
    'YW1zEmsKG2ZpbmFsaXR5X3Byb3ZpZGVyX3NpZ25hdHVyZRgCIAEoCzIrLlRXLkJhYnlsb25TdG'
    'FraW5nLlByb3RvLlB1YmxpY0tleVNpZ25hdHVyZVIZZmluYWxpdHlQcm92aWRlclNpZ25hdHVy'
    'ZQ==');

@$core.Deprecated('Use outputBuilderDescriptor instead')
const OutputBuilder$json = {
  '1': 'OutputBuilder',
  '3': [
    OutputBuilder_StakingOutput$json,
    OutputBuilder_UnbondingOutput$json,
    OutputBuilder_OpReturn$json
  ],
};

@$core.Deprecated('Use outputBuilderDescriptor instead')
const OutputBuilder_StakingOutput$json = {
  '1': 'StakingOutput',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
  ],
};

@$core.Deprecated('Use outputBuilderDescriptor instead')
const OutputBuilder_UnbondingOutput$json = {
  '1': 'UnbondingOutput',
  '2': [
    {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.BabylonStaking.Proto.StakingInfo',
      '10': 'params'
    },
  ],
};

@$core.Deprecated('Use outputBuilderDescriptor instead')
const OutputBuilder_OpReturn$json = {
  '1': 'OpReturn',
  '2': [
    {'1': 'tag', '3': 1, '4': 1, '5': 12, '10': 'tag'},
    {
      '1': 'staker_public_key',
      '3': 2,
      '4': 1,
      '5': 12,
      '10': 'stakerPublicKey'
    },
    {
      '1': 'finality_provider_public_key',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'finalityProviderPublicKey'
    },
    {'1': 'staking_time', '3': 4, '4': 1, '5': 13, '10': 'stakingTime'},
  ],
};

/// Descriptor for `OutputBuilder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputBuilderDescriptor = $convert.base64Decode(
    'Cg1PdXRwdXRCdWlsZGVyGk0KDVN0YWtpbmdPdXRwdXQSPAoGcGFyYW1zGAEgASgLMiQuVFcuQm'
    'FieWxvblN0YWtpbmcuUHJvdG8uU3Rha2luZ0luZm9SBnBhcmFtcxpPCg9VbmJvbmRpbmdPdXRw'
    'dXQSPAoGcGFyYW1zGAEgASgLMiQuVFcuQmFieWxvblN0YWtpbmcuUHJvdG8uU3Rha2luZ0luZm'
    '9SBnBhcmFtcxqsAQoIT3BSZXR1cm4SEAoDdGFnGAEgASgMUgN0YWcSKgoRc3Rha2VyX3B1Ymxp'
    'Y19rZXkYAiABKAxSD3N0YWtlclB1YmxpY0tleRI/ChxmaW5hbGl0eV9wcm92aWRlcl9wdWJsaW'
    'Nfa2V5GAMgASgMUhlmaW5hbGl0eVByb3ZpZGVyUHVibGljS2V5EiEKDHN0YWtpbmdfdGltZRgE'
    'IAEoDVILc3Rha2luZ1RpbWU=');
