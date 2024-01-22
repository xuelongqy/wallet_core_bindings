//
//  Generated code. Do not modify.
//  source: Barz.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use contractAddressInputDescriptor instead')
const ContractAddressInput$json = {
  '1': 'ContractAddressInput',
  '2': [
    {'1': 'entry_point', '3': 1, '4': 1, '5': 9, '10': 'entryPoint'},
    {'1': 'factory', '3': 2, '4': 1, '5': 9, '10': 'factory'},
    {'1': 'account_facet', '3': 3, '4': 1, '5': 9, '10': 'accountFacet'},
    {
      '1': 'verification_facet',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'verificationFacet'
    },
    {'1': 'facet_registry', '3': 5, '4': 1, '5': 9, '10': 'facetRegistry'},
    {'1': 'default_fallback', '3': 6, '4': 1, '5': 9, '10': 'defaultFallback'},
    {'1': 'bytecode', '3': 7, '4': 1, '5': 9, '10': 'bytecode'},
    {'1': 'public_key', '3': 8, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'salt', '3': 9, '4': 1, '5': 13, '10': 'salt'},
  ],
};

/// Descriptor for `ContractAddressInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contractAddressInputDescriptor = $convert.base64Decode(
    'ChRDb250cmFjdEFkZHJlc3NJbnB1dBIfCgtlbnRyeV9wb2ludBgBIAEoCVIKZW50cnlQb2ludB'
    'IYCgdmYWN0b3J5GAIgASgJUgdmYWN0b3J5EiMKDWFjY291bnRfZmFjZXQYAyABKAlSDGFjY291'
    'bnRGYWNldBItChJ2ZXJpZmljYXRpb25fZmFjZXQYBCABKAlSEXZlcmlmaWNhdGlvbkZhY2V0Ei'
    'UKDmZhY2V0X3JlZ2lzdHJ5GAUgASgJUg1mYWNldFJlZ2lzdHJ5EikKEGRlZmF1bHRfZmFsbGJh'
    'Y2sYBiABKAlSD2RlZmF1bHRGYWxsYmFjaxIaCghieXRlY29kZRgHIAEoCVIIYnl0ZWNvZGUSHQ'
    'oKcHVibGljX2tleRgIIAEoCVIJcHVibGljS2V5EhIKBHNhbHQYCSABKA1SBHNhbHQ=');
