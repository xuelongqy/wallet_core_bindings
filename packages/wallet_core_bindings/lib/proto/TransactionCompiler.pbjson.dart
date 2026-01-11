// This is a generated file - do not edit.
//
// Generated from TransactionCompiler.proto.

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

@$core.Deprecated('Use preSigningOutputDescriptor instead')
const PreSigningOutput$json = {
  '1': 'PreSigningOutput',
  '2': [
    {'1': 'data_hash', '3': 1, '4': 1, '5': 12, '10': 'dataHash'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 4, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `PreSigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preSigningOutputDescriptor = $convert.base64Decode(
    'ChBQcmVTaWduaW5nT3V0cHV0EhsKCWRhdGFfaGFzaBgBIAEoDFIIZGF0YUhhc2gSEgoEZGF0YR'
    'gCIAEoDFIEZGF0YRIzCgVlcnJvchgDIAEoDjIdLlRXLkNvbW1vbi5Qcm90by5TaWduaW5nRXJy'
    'b3JSBWVycm9yEiMKDWVycm9yX21lc3NhZ2UYBCABKAlSDGVycm9yTWVzc2FnZQ==');
