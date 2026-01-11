// This is a generated file - do not edit.
//
// Generated from Polymesh.proto.

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

@$core.Deprecated('Use balanceDescriptor instead')
const Balance$json = {
  '1': 'Balance',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Balance.Transfer',
      '9': 0,
      '10': 'transfer'
    },
  ],
  '3': [Balance_Transfer$json],
  '8': [
    {'1': 'message_oneof'},
  ],
};

@$core.Deprecated('Use balanceDescriptor instead')
const Balance_Transfer$json = {
  '1': 'Transfer',
  '2': [
    {'1': 'to_address', '3': 1, '4': 1, '5': 9, '10': 'toAddress'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
    {'1': 'memo', '3': 3, '4': 1, '5': 9, '10': 'memo'},
    {
      '1': 'call_indices',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

/// Descriptor for `Balance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List balanceDescriptor = $convert.base64Decode(
    'CgdCYWxhbmNlEkEKCHRyYW5zZmVyGAEgASgLMiMuVFcuUG9seW1lc2guUHJvdG8uQmFsYW5jZS'
    '5UcmFuc2ZlckgAUgh0cmFuc2ZlchqWAQoIVHJhbnNmZXISHQoKdG9fYWRkcmVzcxgBIAEoCVIJ'
    'dG9BZGRyZXNzEhQKBXZhbHVlGAIgASgMUgV2YWx1ZRISCgRtZW1vGAMgASgJUgRtZW1vEkEKDG'
    'NhbGxfaW5kaWNlcxgEIAEoCzIeLlRXLlBvbGthZG90LlByb3RvLkNhbGxJbmRpY2VzUgtjYWxs'
    'SW5kaWNlc0IPCg1tZXNzYWdlX29uZW9m');

@$core.Deprecated('Use stakingDescriptor instead')
const Staking$json = {
  '1': 'Staking',
  '2': [
    {
      '1': 'bond',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.Bond',
      '9': 0,
      '10': 'bond'
    },
    {
      '1': 'bond_extra',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.BondExtra',
      '9': 0,
      '10': 'bondExtra'
    },
    {
      '1': 'unbond',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.Unbond',
      '9': 0,
      '10': 'unbond'
    },
    {
      '1': 'withdraw_unbonded',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.WithdrawUnbonded',
      '9': 0,
      '10': 'withdrawUnbonded'
    },
    {
      '1': 'nominate',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.Nominate',
      '9': 0,
      '10': 'nominate'
    },
    {
      '1': 'chill',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.Chill',
      '9': 0,
      '10': 'chill'
    },
    {
      '1': 'rebond',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking.Rebond',
      '9': 0,
      '10': 'rebond'
    },
  ],
  '3': [
    Staking_Bond$json,
    Staking_BondExtra$json,
    Staking_Unbond$json,
    Staking_Rebond$json,
    Staking_WithdrawUnbonded$json,
    Staking_Nominate$json,
    Staking_Chill$json
  ],
  '8': [
    {'1': 'message_oneof'},
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_Bond$json = {
  '1': 'Bond',
  '2': [
    {'1': 'controller', '3': 1, '4': 1, '5': 9, '10': 'controller'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
    {
      '1': 'reward_destination',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.Polkadot.Proto.RewardDestination',
      '10': 'rewardDestination'
    },
    {
      '1': 'call_indices',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_BondExtra$json = {
  '1': 'BondExtra',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
    {
      '1': 'call_indices',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_Unbond$json = {
  '1': 'Unbond',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
    {
      '1': 'call_indices',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_Rebond$json = {
  '1': 'Rebond',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
    {
      '1': 'call_indices',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_WithdrawUnbonded$json = {
  '1': 'WithdrawUnbonded',
  '2': [
    {'1': 'slashing_spans', '3': 1, '4': 1, '5': 5, '10': 'slashingSpans'},
    {
      '1': 'call_indices',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_Nominate$json = {
  '1': 'Nominate',
  '2': [
    {'1': 'nominators', '3': 1, '4': 3, '5': 9, '10': 'nominators'},
    {
      '1': 'call_indices',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use stakingDescriptor instead')
const Staking_Chill$json = {
  '1': 'Chill',
  '2': [
    {
      '1': 'call_indices',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

/// Descriptor for `Staking`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stakingDescriptor = $convert.base64Decode(
    'CgdTdGFraW5nEjUKBGJvbmQYASABKAsyHy5UVy5Qb2x5bWVzaC5Qcm90by5TdGFraW5nLkJvbm'
    'RIAFIEYm9uZBJFCgpib25kX2V4dHJhGAIgASgLMiQuVFcuUG9seW1lc2guUHJvdG8uU3Rha2lu'
    'Zy5Cb25kRXh0cmFIAFIJYm9uZEV4dHJhEjsKBnVuYm9uZBgDIAEoCzIhLlRXLlBvbHltZXNoLl'
    'Byb3RvLlN0YWtpbmcuVW5ib25kSABSBnVuYm9uZBJaChF3aXRoZHJhd191bmJvbmRlZBgEIAEo'
    'CzIrLlRXLlBvbHltZXNoLlByb3RvLlN0YWtpbmcuV2l0aGRyYXdVbmJvbmRlZEgAUhB3aXRoZH'
    'Jhd1VuYm9uZGVkEkEKCG5vbWluYXRlGAUgASgLMiMuVFcuUG9seW1lc2guUHJvdG8uU3Rha2lu'
    'Zy5Ob21pbmF0ZUgAUghub21pbmF0ZRI4CgVjaGlsbBgGIAEoCzIgLlRXLlBvbHltZXNoLlByb3'
    'RvLlN0YWtpbmcuQ2hpbGxIAFIFY2hpbGwSOwoGcmVib25kGAcgASgLMiEuVFcuUG9seW1lc2gu'
    'UHJvdG8uU3Rha2luZy5SZWJvbmRIAFIGcmVib25kGtQBCgRCb25kEh4KCmNvbnRyb2xsZXIYAS'
    'ABKAlSCmNvbnRyb2xsZXISFAoFdmFsdWUYAiABKAxSBXZhbHVlElMKEnJld2FyZF9kZXN0aW5h'
    'dGlvbhgDIAEoDjIkLlRXLlBvbGthZG90LlByb3RvLlJld2FyZERlc3RpbmF0aW9uUhFyZXdhcm'
    'REZXN0aW5hdGlvbhJBCgxjYWxsX2luZGljZXMYBCABKAsyHi5UVy5Qb2xrYWRvdC5Qcm90by5D'
    'YWxsSW5kaWNlc1ILY2FsbEluZGljZXMaZAoJQm9uZEV4dHJhEhQKBXZhbHVlGAEgASgMUgV2YW'
    'x1ZRJBCgxjYWxsX2luZGljZXMYAiABKAsyHi5UVy5Qb2xrYWRvdC5Qcm90by5DYWxsSW5kaWNl'
    'c1ILY2FsbEluZGljZXMaYQoGVW5ib25kEhQKBXZhbHVlGAEgASgMUgV2YWx1ZRJBCgxjYWxsX2'
    'luZGljZXMYAiABKAsyHi5UVy5Qb2xrYWRvdC5Qcm90by5DYWxsSW5kaWNlc1ILY2FsbEluZGlj'
    'ZXMaYQoGUmVib25kEhQKBXZhbHVlGAEgASgMUgV2YWx1ZRJBCgxjYWxsX2luZGljZXMYAiABKA'
    'syHi5UVy5Qb2xrYWRvdC5Qcm90by5DYWxsSW5kaWNlc1ILY2FsbEluZGljZXMafAoQV2l0aGRy'
    'YXdVbmJvbmRlZBIlCg5zbGFzaGluZ19zcGFucxgBIAEoBVINc2xhc2hpbmdTcGFucxJBCgxjYW'
    'xsX2luZGljZXMYAiABKAsyHi5UVy5Qb2xrYWRvdC5Qcm90by5DYWxsSW5kaWNlc1ILY2FsbElu'
    'ZGljZXMabQoITm9taW5hdGUSHgoKbm9taW5hdG9ycxgBIAMoCVIKbm9taW5hdG9ycxJBCgxjYW'
    'xsX2luZGljZXMYAiABKAsyHi5UVy5Qb2xrYWRvdC5Qcm90by5DYWxsSW5kaWNlc1ILY2FsbElu'
    'ZGljZXMaSgoFQ2hpbGwSQQoMY2FsbF9pbmRpY2VzGAEgASgLMh4uVFcuUG9sa2Fkb3QuUHJvdG'
    '8uQ2FsbEluZGljZXNSC2NhbGxJbmRpY2VzQg8KDW1lc3NhZ2Vfb25lb2Y=');

@$core.Deprecated('Use identityIdDescriptor instead')
const IdentityId$json = {
  '1': 'IdentityId',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

/// Descriptor for `IdentityId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List identityIdDescriptor =
    $convert.base64Decode('CgpJZGVudGl0eUlkEg4KAmlkGAEgASgMUgJpZA==');

@$core.Deprecated('Use assetIdDescriptor instead')
const AssetId$json = {
  '1': 'AssetId',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

/// Descriptor for `AssetId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetIdDescriptor =
    $convert.base64Decode('CgdBc3NldElkEg4KAmlkGAEgASgMUgJpZA==');

@$core.Deprecated('Use portfolioIdDescriptor instead')
const PortfolioId$json = {
  '1': 'PortfolioId',
  '2': [
    {
      '1': 'identity',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.IdentityId',
      '10': 'identity'
    },
    {'1': 'default', '3': 2, '4': 1, '5': 8, '10': 'default'},
    {'1': 'user', '3': 3, '4': 1, '5': 4, '10': 'user'},
  ],
};

/// Descriptor for `PortfolioId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioIdDescriptor = $convert.base64Decode(
    'CgtQb3J0Zm9saW9JZBI5CghpZGVudGl0eRgBIAEoCzIdLlRXLlBvbHltZXNoLlByb3RvLklkZW'
    '50aXR5SWRSCGlkZW50aXR5EhgKB2RlZmF1bHQYAiABKAhSB2RlZmF1bHQSEgoEdXNlchgDIAEo'
    'BFIEdXNlcg==');

@$core.Deprecated('Use secondaryKeyPermissionsDescriptor instead')
const SecondaryKeyPermissions$json = {
  '1': 'SecondaryKeyPermissions',
  '2': [
    {
      '1': 'asset',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.AssetPermissions',
      '10': 'asset'
    },
    {
      '1': 'extrinsic',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.ExtrinsicPermissions',
      '10': 'extrinsic'
    },
    {
      '1': 'portfolio',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.PortfolioPermissions',
      '10': 'portfolio'
    },
  ],
  '3': [
    SecondaryKeyPermissions_AssetPermissions$json,
    SecondaryKeyPermissions_PortfolioPermissions$json,
    SecondaryKeyPermissions_PalletPermissions$json,
    SecondaryKeyPermissions_ExtrinsicPermissions$json
  ],
  '4': [SecondaryKeyPermissions_RestrictionKind$json],
};

@$core.Deprecated('Use secondaryKeyPermissionsDescriptor instead')
const SecondaryKeyPermissions_AssetPermissions$json = {
  '1': 'AssetPermissions',
  '2': [
    {
      '1': 'kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.RestrictionKind',
      '10': 'kind'
    },
    {
      '1': 'assets',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TW.Polymesh.Proto.AssetId',
      '10': 'assets'
    },
  ],
};

@$core.Deprecated('Use secondaryKeyPermissionsDescriptor instead')
const SecondaryKeyPermissions_PortfolioPermissions$json = {
  '1': 'PortfolioPermissions',
  '2': [
    {
      '1': 'kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.RestrictionKind',
      '10': 'kind'
    },
    {
      '1': 'portfolios',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TW.Polymesh.Proto.PortfolioId',
      '10': 'portfolios'
    },
  ],
};

@$core.Deprecated('Use secondaryKeyPermissionsDescriptor instead')
const SecondaryKeyPermissions_PalletPermissions$json = {
  '1': 'PalletPermissions',
  '2': [
    {'1': 'pallet_name', '3': 1, '4': 1, '5': 9, '10': 'palletName'},
    {
      '1': 'kind',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.RestrictionKind',
      '10': 'kind'
    },
    {'1': 'extrinsic_names', '3': 3, '4': 3, '5': 9, '10': 'extrinsicNames'},
  ],
};

@$core.Deprecated('Use secondaryKeyPermissionsDescriptor instead')
const SecondaryKeyPermissions_ExtrinsicPermissions$json = {
  '1': 'ExtrinsicPermissions',
  '2': [
    {
      '1': 'kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.RestrictionKind',
      '10': 'kind'
    },
    {
      '1': 'pallets',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions.PalletPermissions',
      '10': 'pallets'
    },
  ],
};

@$core.Deprecated('Use secondaryKeyPermissionsDescriptor instead')
const SecondaryKeyPermissions_RestrictionKind$json = {
  '1': 'RestrictionKind',
  '2': [
    {'1': 'Whole', '2': 0},
    {'1': 'These', '2': 1},
    {'1': 'Except', '2': 2},
  ],
};

/// Descriptor for `SecondaryKeyPermissions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secondaryKeyPermissionsDescriptor = $convert.base64Decode(
    'ChdTZWNvbmRhcnlLZXlQZXJtaXNzaW9ucxJRCgVhc3NldBgBIAEoCzI7LlRXLlBvbHltZXNoLl'
    'Byb3RvLlNlY29uZGFyeUtleVBlcm1pc3Npb25zLkFzc2V0UGVybWlzc2lvbnNSBWFzc2V0El0K'
    'CWV4dHJpbnNpYxgCIAEoCzI/LlRXLlBvbHltZXNoLlByb3RvLlNlY29uZGFyeUtleVBlcm1pc3'
    'Npb25zLkV4dHJpbnNpY1Blcm1pc3Npb25zUglleHRyaW5zaWMSXQoJcG9ydGZvbGlvGAMgASgL'
    'Mj8uVFcuUG9seW1lc2guUHJvdG8uU2Vjb25kYXJ5S2V5UGVybWlzc2lvbnMuUG9ydGZvbGlvUG'
    'VybWlzc2lvbnNSCXBvcnRmb2xpbxqWAQoQQXNzZXRQZXJtaXNzaW9ucxJOCgRraW5kGAEgASgO'
    'MjouVFcuUG9seW1lc2guUHJvdG8uU2Vjb25kYXJ5S2V5UGVybWlzc2lvbnMuUmVzdHJpY3Rpb2'
    '5LaW5kUgRraW5kEjIKBmFzc2V0cxgCIAMoCzIaLlRXLlBvbHltZXNoLlByb3RvLkFzc2V0SWRS'
    'BmFzc2V0cxqmAQoUUG9ydGZvbGlvUGVybWlzc2lvbnMSTgoEa2luZBgBIAEoDjI6LlRXLlBvbH'
    'ltZXNoLlByb3RvLlNlY29uZGFyeUtleVBlcm1pc3Npb25zLlJlc3RyaWN0aW9uS2luZFIEa2lu'
    'ZBI+Cgpwb3J0Zm9saW9zGAIgAygLMh4uVFcuUG9seW1lc2guUHJvdG8uUG9ydGZvbGlvSWRSCn'
    'BvcnRmb2xpb3MarQEKEVBhbGxldFBlcm1pc3Npb25zEh8KC3BhbGxldF9uYW1lGAEgASgJUgpw'
    'YWxsZXROYW1lEk4KBGtpbmQYAiABKA4yOi5UVy5Qb2x5bWVzaC5Qcm90by5TZWNvbmRhcnlLZX'
    'lQZXJtaXNzaW9ucy5SZXN0cmljdGlvbktpbmRSBGtpbmQSJwoPZXh0cmluc2ljX25hbWVzGAMg'
    'AygJUg5leHRyaW5zaWNOYW1lcxq+AQoURXh0cmluc2ljUGVybWlzc2lvbnMSTgoEa2luZBgBIA'
    'EoDjI6LlRXLlBvbHltZXNoLlByb3RvLlNlY29uZGFyeUtleVBlcm1pc3Npb25zLlJlc3RyaWN0'
    'aW9uS2luZFIEa2luZBJWCgdwYWxsZXRzGAIgAygLMjwuVFcuUG9seW1lc2guUHJvdG8uU2Vjb2'
    '5kYXJ5S2V5UGVybWlzc2lvbnMuUGFsbGV0UGVybWlzc2lvbnNSB3BhbGxldHMiMwoPUmVzdHJp'
    'Y3Rpb25LaW5kEgkKBVdob2xlEAASCQoFVGhlc2UQARIKCgZFeGNlcHQQAg==');

@$core.Deprecated('Use identityDescriptor instead')
const Identity$json = {
  '1': 'Identity',
  '2': [
    {
      '1': 'join_identity_as_key',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Identity.JoinIdentityAsKey',
      '9': 0,
      '10': 'joinIdentityAsKey'
    },
    {
      '1': 'add_authorization',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Identity.AddAuthorization',
      '9': 0,
      '10': 'addAuthorization'
    },
    {
      '1': 'leave_identity_as_key',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Identity.LeaveIdentityAsKey',
      '9': 0,
      '10': 'leaveIdentityAsKey'
    },
  ],
  '3': [
    Identity_JoinIdentityAsKey$json,
    Identity_LeaveIdentityAsKey$json,
    Identity_AddAuthorization$json
  ],
  '8': [
    {'1': 'message_oneof'},
  ],
};

@$core.Deprecated('Use identityDescriptor instead')
const Identity_JoinIdentityAsKey$json = {
  '1': 'JoinIdentityAsKey',
  '2': [
    {
      '1': 'call_indices',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
    {'1': 'auth_id', '3': 2, '4': 1, '5': 4, '10': 'authId'},
  ],
};

@$core.Deprecated('Use identityDescriptor instead')
const Identity_LeaveIdentityAsKey$json = {
  '1': 'LeaveIdentityAsKey',
  '2': [
    {
      '1': 'call_indices',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use identityDescriptor instead')
const Identity_AddAuthorization$json = {
  '1': 'AddAuthorization',
  '2': [
    {
      '1': 'call_indices',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
    {'1': 'target', '3': 2, '4': 1, '5': 9, '10': 'target'},
    {
      '1': 'authorization',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Identity.AddAuthorization.Authorization',
      '10': 'authorization'
    },
    {'1': 'expiry', '3': 4, '4': 1, '5': 4, '10': 'expiry'},
  ],
  '3': [Identity_AddAuthorization_Authorization$json],
};

@$core.Deprecated('Use identityDescriptor instead')
const Identity_AddAuthorization_Authorization$json = {
  '1': 'Authorization',
  '2': [
    {
      '1': 'join_identity',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.SecondaryKeyPermissions',
      '9': 0,
      '10': 'joinIdentity'
    },
  ],
  '8': [
    {'1': 'auth_oneof'},
  ],
};

/// Descriptor for `Identity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List identityDescriptor = $convert.base64Decode(
    'CghJZGVudGl0eRJgChRqb2luX2lkZW50aXR5X2FzX2tleRgBIAEoCzItLlRXLlBvbHltZXNoLl'
    'Byb3RvLklkZW50aXR5LkpvaW5JZGVudGl0eUFzS2V5SABSEWpvaW5JZGVudGl0eUFzS2V5ElsK'
    'EWFkZF9hdXRob3JpemF0aW9uGAIgASgLMiwuVFcuUG9seW1lc2guUHJvdG8uSWRlbnRpdHkuQW'
    'RkQXV0aG9yaXphdGlvbkgAUhBhZGRBdXRob3JpemF0aW9uEmMKFWxlYXZlX2lkZW50aXR5X2Fz'
    'X2tleRgDIAEoCzIuLlRXLlBvbHltZXNoLlByb3RvLklkZW50aXR5LkxlYXZlSWRlbnRpdHlBc0'
    'tleUgAUhJsZWF2ZUlkZW50aXR5QXNLZXkabwoRSm9pbklkZW50aXR5QXNLZXkSQQoMY2FsbF9p'
    'bmRpY2VzGAEgASgLMh4uVFcuUG9sa2Fkb3QuUHJvdG8uQ2FsbEluZGljZXNSC2NhbGxJbmRpY2'
    'VzEhcKB2F1dGhfaWQYAiABKARSBmF1dGhJZBpXChJMZWF2ZUlkZW50aXR5QXNLZXkSQQoMY2Fs'
    'bF9pbmRpY2VzGAEgASgLMh4uVFcuUG9sa2Fkb3QuUHJvdG8uQ2FsbEluZGljZXNSC2NhbGxJbm'
    'RpY2VzGtkCChBBZGRBdXRob3JpemF0aW9uEkEKDGNhbGxfaW5kaWNlcxgBIAEoCzIeLlRXLlBv'
    'bGthZG90LlByb3RvLkNhbGxJbmRpY2VzUgtjYWxsSW5kaWNlcxIWCgZ0YXJnZXQYAiABKAlSBn'
    'RhcmdldBJgCg1hdXRob3JpemF0aW9uGAMgASgLMjouVFcuUG9seW1lc2guUHJvdG8uSWRlbnRp'
    'dHkuQWRkQXV0aG9yaXphdGlvbi5BdXRob3JpemF0aW9uUg1hdXRob3JpemF0aW9uEhYKBmV4cG'
    'lyeRgEIAEoBFIGZXhwaXJ5GnAKDUF1dGhvcml6YXRpb24SUQoNam9pbl9pZGVudGl0eRgGIAEo'
    'CzIqLlRXLlBvbHltZXNoLlByb3RvLlNlY29uZGFyeUtleVBlcm1pc3Npb25zSABSDGpvaW5JZG'
    'VudGl0eUIMCgphdXRoX29uZW9mQg8KDW1lc3NhZ2Vfb25lb2Y=');

@$core.Deprecated('Use utilityDescriptor instead')
const Utility$json = {
  '1': 'Utility',
  '2': [
    {
      '1': 'batch',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Utility.Batch',
      '9': 0,
      '10': 'batch'
    },
  ],
  '3': [Utility_Batch$json],
  '4': [Utility_BatchKind$json],
  '8': [
    {'1': 'message_oneof'},
  ],
};

@$core.Deprecated('Use utilityDescriptor instead')
const Utility_Batch$json = {
  '1': 'Batch',
  '2': [
    {
      '1': 'kind',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Polymesh.Proto.Utility.BatchKind',
      '10': 'kind'
    },
    {
      '1': 'calls',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.TW.Polymesh.Proto.RuntimeCall',
      '10': 'calls'
    },
    {
      '1': 'call_indices',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.CallIndices',
      '10': 'callIndices'
    },
  ],
};

@$core.Deprecated('Use utilityDescriptor instead')
const Utility_BatchKind$json = {
  '1': 'BatchKind',
  '2': [
    {'1': 'StopOnError', '2': 0},
    {'1': 'Atomic', '2': 1},
    {'1': 'Optimistic', '2': 2},
  ],
};

/// Descriptor for `Utility`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List utilityDescriptor = $convert.base64Decode(
    'CgdVdGlsaXR5EjgKBWJhdGNoGAEgASgLMiAuVFcuUG9seW1lc2guUHJvdG8uVXRpbGl0eS5CYX'
    'RjaEgAUgViYXRjaBq6AQoFQmF0Y2gSOAoEa2luZBgBIAEoDjIkLlRXLlBvbHltZXNoLlByb3Rv'
    'LlV0aWxpdHkuQmF0Y2hLaW5kUgRraW5kEjQKBWNhbGxzGAIgAygLMh4uVFcuUG9seW1lc2guUH'
    'JvdG8uUnVudGltZUNhbGxSBWNhbGxzEkEKDGNhbGxfaW5kaWNlcxgDIAEoCzIeLlRXLlBvbGth'
    'ZG90LlByb3RvLkNhbGxJbmRpY2VzUgtjYWxsSW5kaWNlcyI4CglCYXRjaEtpbmQSDwoLU3RvcE'
    '9uRXJyb3IQABIKCgZBdG9taWMQARIOCgpPcHRpbWlzdGljEAJCDwoNbWVzc2FnZV9vbmVvZg==');

@$core.Deprecated('Use runtimeCallDescriptor instead')
const RuntimeCall$json = {
  '1': 'RuntimeCall',
  '2': [
    {
      '1': 'balance_call',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Balance',
      '9': 0,
      '10': 'balanceCall'
    },
    {
      '1': 'staking_call',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Staking',
      '9': 0,
      '10': 'stakingCall'
    },
    {
      '1': 'identity_call',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Identity',
      '9': 0,
      '10': 'identityCall'
    },
    {
      '1': 'utility_call',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.Utility',
      '9': 0,
      '10': 'utilityCall'
    },
  ],
  '8': [
    {'1': 'pallet_oneof'},
  ],
};

/// Descriptor for `RuntimeCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeCallDescriptor = $convert.base64Decode(
    'CgtSdW50aW1lQ2FsbBI/CgxiYWxhbmNlX2NhbGwYASABKAsyGi5UVy5Qb2x5bWVzaC5Qcm90by'
    '5CYWxhbmNlSABSC2JhbGFuY2VDYWxsEj8KDHN0YWtpbmdfY2FsbBgCIAEoCzIaLlRXLlBvbHlt'
    'ZXNoLlByb3RvLlN0YWtpbmdIAFILc3Rha2luZ0NhbGwSQgoNaWRlbnRpdHlfY2FsbBgDIAEoCz'
    'IbLlRXLlBvbHltZXNoLlByb3RvLklkZW50aXR5SABSDGlkZW50aXR5Q2FsbBI/Cgx1dGlsaXR5'
    'X2NhbGwYBCABKAsyGi5UVy5Qb2x5bWVzaC5Qcm90by5VdGlsaXR5SABSC3V0aWxpdHlDYWxsQg'
    '4KDHBhbGxldF9vbmVvZg==');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'block_hash', '3': 1, '4': 1, '5': 12, '10': 'blockHash'},
    {'1': 'genesis_hash', '3': 2, '4': 1, '5': 12, '10': 'genesisHash'},
    {'1': 'nonce', '3': 3, '4': 1, '5': 4, '10': 'nonce'},
    {'1': 'spec_version', '3': 4, '4': 1, '5': 13, '10': 'specVersion'},
    {
      '1': 'transaction_version',
      '3': 5,
      '4': 1,
      '5': 13,
      '10': 'transactionVersion'
    },
    {'1': 'tip', '3': 6, '4': 1, '5': 12, '10': 'tip'},
    {
      '1': 'era',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.Polkadot.Proto.Era',
      '10': 'era'
    },
    {'1': 'private_key', '3': 8, '4': 1, '5': 12, '10': 'privateKey'},
    {'1': 'network', '3': 9, '4': 1, '5': 13, '10': 'network'},
    {
      '1': 'runtime_call',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.TW.Polymesh.Proto.RuntimeCall',
      '10': 'runtimeCall'
    },
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSHQoKYmxvY2tfaGFzaBgBIAEoDFIJYmxvY2tIYXNoEiEKDGdlbmVzaX'
    'NfaGFzaBgCIAEoDFILZ2VuZXNpc0hhc2gSFAoFbm9uY2UYAyABKARSBW5vbmNlEiEKDHNwZWNf'
    'dmVyc2lvbhgEIAEoDVILc3BlY1ZlcnNpb24SLwoTdHJhbnNhY3Rpb25fdmVyc2lvbhgFIAEoDV'
    'ISdHJhbnNhY3Rpb25WZXJzaW9uEhAKA3RpcBgGIAEoDFIDdGlwEigKA2VyYRgHIAEoCzIWLlRX'
    'LlBvbGthZG90LlByb3RvLkVyYVIDZXJhEh8KC3ByaXZhdGVfa2V5GAggASgMUgpwcml2YXRlS2'
    'V5EhgKB25ldHdvcmsYCSABKA1SB25ldHdvcmsSQQoMcnVudGltZV9jYWxsGAogASgLMh4uVFcu'
    'UG9seW1lc2guUHJvdG8uUnVudGltZUNhbGxSC3J1bnRpbWVDYWxs');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {'1': 'encoded', '3': 1, '4': 1, '5': 12, '10': 'encoded'},
    {
      '1': 'error',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0EhgKB2VuY29kZWQYASABKAxSB2VuY29kZWQSMwoFZXJyb3IYAiABKA'
    '4yHS5UVy5Db21tb24uUHJvdG8uU2lnbmluZ0Vycm9yUgVlcnJvchIjCg1lcnJvcl9tZXNzYWdl'
    'GAMgASgJUgxlcnJvck1lc3NhZ2U=');
