//
//  Generated code. Do not modify.
//  source: TheOpenNetwork.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use walletVersionDescriptor instead')
const WalletVersion$json = {
  '1': 'WalletVersion',
  '2': [
    {'1': 'WALLET_V3_R1', '2': 0},
    {'1': 'WALLET_V3_R2', '2': 1},
    {'1': 'WALLET_V4_R2', '2': 2},
  ],
};

/// Descriptor for `WalletVersion`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List walletVersionDescriptor = $convert.base64Decode(
    'Cg1XYWxsZXRWZXJzaW9uEhAKDFdBTExFVF9WM19SMRAAEhAKDFdBTExFVF9WM19SMhABEhAKDF'
    'dBTExFVF9WNF9SMhAC');

@$core.Deprecated('Use sendModeDescriptor instead')
const SendMode$json = {
  '1': 'SendMode',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'PAY_FEES_SEPARATELY', '2': 1},
    {'1': 'IGNORE_ACTION_PHASE_ERRORS', '2': 2},
    {'1': 'DESTROY_ON_ZERO_BALANCE', '2': 32},
    {'1': 'ATTACH_ALL_INBOUND_MESSAGE_VALUE', '2': 64},
    {'1': 'ATTACH_ALL_CONTRACT_BALANCE', '2': 128},
  ],
};

/// Descriptor for `SendMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sendModeDescriptor = $convert.base64Decode(
    'CghTZW5kTW9kZRILCgdERUZBVUxUEAASFwoTUEFZX0ZFRVNfU0VQQVJBVEVMWRABEh4KGklHTk'
    '9SRV9BQ1RJT05fUEhBU0VfRVJST1JTEAISGwoXREVTVFJPWV9PTl9aRVJPX0JBTEFOQ0UQIBIk'
    'CiBBVFRBQ0hfQUxMX0lOQk9VTkRfTUVTU0FHRV9WQUxVRRBAEiAKG0FUVEFDSF9BTExfQ09OVF'
    'JBQ1RfQkFMQU5DRRCAAQ==');

@$core.Deprecated('Use transferDescriptor instead')
const Transfer$json = {
  '1': 'Transfer',
  '2': [
    {'1': 'wallet_version', '3': 1, '4': 1, '5': 14, '6': '.TW.TheOpenNetwork.Proto.WalletVersion', '10': 'walletVersion'},
    {'1': 'dest', '3': 2, '4': 1, '5': 9, '10': 'dest'},
    {'1': 'amount', '3': 3, '4': 1, '5': 4, '10': 'amount'},
    {'1': 'sequence_number', '3': 4, '4': 1, '5': 13, '10': 'sequenceNumber'},
    {'1': 'mode', '3': 5, '4': 1, '5': 13, '10': 'mode'},
    {'1': 'expire_at', '3': 6, '4': 1, '5': 13, '10': 'expireAt'},
    {'1': 'comment', '3': 7, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'bounceable', '3': 8, '4': 1, '5': 8, '10': 'bounceable'},
  ],
};

/// Descriptor for `Transfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferDescriptor = $convert.base64Decode(
    'CghUcmFuc2ZlchJNCg53YWxsZXRfdmVyc2lvbhgBIAEoDjImLlRXLlRoZU9wZW5OZXR3b3JrLl'
    'Byb3RvLldhbGxldFZlcnNpb25SDXdhbGxldFZlcnNpb24SEgoEZGVzdBgCIAEoCVIEZGVzdBIW'
    'CgZhbW91bnQYAyABKARSBmFtb3VudBInCg9zZXF1ZW5jZV9udW1iZXIYBCABKA1SDnNlcXVlbm'
    'NlTnVtYmVyEhIKBG1vZGUYBSABKA1SBG1vZGUSGwoJZXhwaXJlX2F0GAYgASgNUghleHBpcmVB'
    'dBIYCgdjb21tZW50GAcgASgJUgdjb21tZW50Eh4KCmJvdW5jZWFibGUYCCABKAhSCmJvdW5jZW'
    'FibGU=');

@$core.Deprecated('Use jettonTransferDescriptor instead')
const JettonTransfer$json = {
  '1': 'JettonTransfer',
  '2': [
    {'1': 'transfer', '3': 1, '4': 1, '5': 11, '6': '.TW.TheOpenNetwork.Proto.Transfer', '10': 'transfer'},
    {'1': 'query_id', '3': 2, '4': 1, '5': 4, '10': 'queryId'},
    {'1': 'jetton_amount', '3': 3, '4': 1, '5': 4, '10': 'jettonAmount'},
    {'1': 'to_owner', '3': 4, '4': 1, '5': 9, '10': 'toOwner'},
    {'1': 'response_address', '3': 5, '4': 1, '5': 9, '10': 'responseAddress'},
    {'1': 'forward_amount', '3': 6, '4': 1, '5': 4, '10': 'forwardAmount'},
  ],
};

/// Descriptor for `JettonTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List jettonTransferDescriptor = $convert.base64Decode(
    'Cg5KZXR0b25UcmFuc2ZlchI9Cgh0cmFuc2ZlchgBIAEoCzIhLlRXLlRoZU9wZW5OZXR3b3JrLl'
    'Byb3RvLlRyYW5zZmVyUgh0cmFuc2ZlchIZCghxdWVyeV9pZBgCIAEoBFIHcXVlcnlJZBIjCg1q'
    'ZXR0b25fYW1vdW50GAMgASgEUgxqZXR0b25BbW91bnQSGQoIdG9fb3duZXIYBCABKAlSB3RvT3'
    'duZXISKQoQcmVzcG9uc2VfYWRkcmVzcxgFIAEoCVIPcmVzcG9uc2VBZGRyZXNzEiUKDmZvcndh'
    'cmRfYW1vdW50GAYgASgEUg1mb3J3YXJkQW1vdW50');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'private_key', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    {'1': 'transfer', '3': 2, '4': 1, '5': 11, '6': '.TW.TheOpenNetwork.Proto.Transfer', '9': 0, '10': 'transfer'},
    {'1': 'jetton_transfer', '3': 3, '4': 1, '5': 11, '6': '.TW.TheOpenNetwork.Proto.JettonTransfer', '9': 0, '10': 'jettonTransfer'},
  ],
  '8': [
    {'1': 'action_oneof'},
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSHwoLcHJpdmF0ZV9rZXkYASABKAxSCnByaXZhdGVLZXkSPwoIdHJhbn'
    'NmZXIYAiABKAsyIS5UVy5UaGVPcGVuTmV0d29yay5Qcm90by5UcmFuc2ZlckgAUgh0cmFuc2Zl'
    'chJSCg9qZXR0b25fdHJhbnNmZXIYAyABKAsyJy5UVy5UaGVPcGVuTmV0d29yay5Qcm90by5KZX'
    'R0b25UcmFuc2ZlckgAUg5qZXR0b25UcmFuc2ZlckIOCgxhY3Rpb25fb25lb2Y=');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {'1': 'encoded', '3': 1, '4': 1, '5': 9, '10': 'encoded'},
    {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.TW.Common.Proto.SigningError', '10': 'error'},
    {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0EhgKB2VuY29kZWQYASABKAlSB2VuY29kZWQSMwoFZXJyb3IYAiABKA'
    '4yHS5UVy5Db21tb24uUHJvdG8uU2lnbmluZ0Vycm9yUgVlcnJvchIjCg1lcnJvcl9tZXNzYWdl'
    'GAMgASgJUgxlcnJvck1lc3NhZ2U=');

