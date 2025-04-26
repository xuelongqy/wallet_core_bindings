//
//  Generated code. Do not modify.
//  source: Ethereum.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionModeDescriptor instead')
const TransactionMode$json = {
  '1': 'TransactionMode',
  '2': [
    {'1': 'Legacy', '2': 0},
    {'1': 'Enveloped', '2': 1},
    {'1': 'UserOp', '2': 2},
    {'1': 'SetCode', '2': 4},
  ],
};

/// Descriptor for `TransactionMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionModeDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvbk1vZGUSCgoGTGVnYWN5EAASDQoJRW52ZWxvcGVkEAESCgoGVXNlck9wEA'
    'ISCwoHU2V0Q29kZRAE');

@$core.Deprecated('Use sCWalletTypeDescriptor instead')
const SCWalletType$json = {
  '1': 'SCWalletType',
  '2': [
    {'1': 'SimpleAccount', '2': 0},
    {'1': 'Biz4337', '2': 1},
    {'1': 'Biz', '2': 2},
  ],
};

/// Descriptor for `SCWalletType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sCWalletTypeDescriptor = $convert.base64Decode(
    'CgxTQ1dhbGxldFR5cGUSEQoNU2ltcGxlQWNjb3VudBAAEgsKB0JpejQzMzcQARIHCgNCaXoQAg'
    '==');

@$core.Deprecated('Use messageTypeDescriptor instead')
const MessageType$json = {
  '1': 'MessageType',
  '2': [
    {'1': 'MessageType_legacy', '2': 0},
    {'1': 'MessageType_eip155', '2': 1},
    {'1': 'MessageType_typed', '2': 2},
    {'1': 'MessageType_typed_eip155', '2': 3},
    {'1': 'MessageType_immutable_x', '2': 4},
  ],
};

/// Descriptor for `MessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageTypeDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlVHlwZRIWChJNZXNzYWdlVHlwZV9sZWdhY3kQABIWChJNZXNzYWdlVHlwZV9laX'
    'AxNTUQARIVChFNZXNzYWdlVHlwZV90eXBlZBACEhwKGE1lc3NhZ2VUeXBlX3R5cGVkX2VpcDE1'
    'NRADEhsKF01lc3NhZ2VUeXBlX2ltbXV0YWJsZV94EAQ=');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {
      '1': 'transfer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.Transfer',
      '9': 0,
      '10': 'transfer'
    },
    {
      '1': 'erc20_transfer',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.ERC20Transfer',
      '9': 0,
      '10': 'erc20Transfer'
    },
    {
      '1': 'erc20_approve',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.ERC20Approve',
      '9': 0,
      '10': 'erc20Approve'
    },
    {
      '1': 'erc721_transfer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.ERC721Transfer',
      '9': 0,
      '10': 'erc721Transfer'
    },
    {
      '1': 'erc1155_transfer',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.ERC1155Transfer',
      '9': 0,
      '10': 'erc1155Transfer'
    },
    {
      '1': 'contract_generic',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.ContractGeneric',
      '9': 0,
      '10': 'contractGeneric'
    },
    {
      '1': 'scw_batch',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.SCWalletBatch',
      '9': 0,
      '10': 'scwBatch'
    },
    {
      '1': 'scw_execute',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.SCWalletExecute',
      '9': 0,
      '10': 'scwExecute'
    },
  ],
  '3': [
    Transaction_Transfer$json,
    Transaction_ERC20Transfer$json,
    Transaction_ERC20Approve$json,
    Transaction_ERC721Transfer$json,
    Transaction_ERC1155Transfer$json,
    Transaction_ContractGeneric$json,
    Transaction_SCWalletBatch$json,
    Transaction_SCWalletExecute$json
  ],
  '8': [
    {'1': 'transaction_oneof'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_Transfer$json = {
  '1': 'Transfer',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 12, '10': 'amount'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_ERC20Transfer$json = {
  '1': 'ERC20Transfer',
  '2': [
    {'1': 'to', '3': 1, '4': 1, '5': 9, '10': 'to'},
    {'1': 'amount', '3': 2, '4': 1, '5': 12, '10': 'amount'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_ERC20Approve$json = {
  '1': 'ERC20Approve',
  '2': [
    {'1': 'spender', '3': 1, '4': 1, '5': 9, '10': 'spender'},
    {'1': 'amount', '3': 2, '4': 1, '5': 12, '10': 'amount'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_ERC721Transfer$json = {
  '1': 'ERC721Transfer',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_ERC1155Transfer$json = {
  '1': 'ERC1155Transfer',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    {'1': 'value', '3': 4, '4': 1, '5': 12, '10': 'value'},
    {'1': 'data', '3': 5, '4': 1, '5': 12, '10': 'data'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_ContractGeneric$json = {
  '1': 'ContractGeneric',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 12, '10': 'amount'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_SCWalletBatch$json = {
  '1': 'SCWalletBatch',
  '2': [
    {
      '1': 'calls',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction.SCWalletBatch.BatchedCall',
      '10': 'calls'
    },
    {
      '1': 'wallet_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.TW.Ethereum.Proto.SCWalletType',
      '10': 'walletType'
    },
  ],
  '3': [Transaction_SCWalletBatch_BatchedCall$json],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_SCWalletBatch_BatchedCall$json = {
  '1': 'BatchedCall',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'amount', '3': 2, '4': 1, '5': 12, '10': 'amount'},
    {'1': 'payload', '3': 3, '4': 1, '5': 12, '10': 'payload'},
  ],
};

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction_SCWalletExecute$json = {
  '1': 'SCWalletExecute',
  '2': [
    {
      '1': 'transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction',
      '10': 'transaction'
    },
    {
      '1': 'wallet_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.TW.Ethereum.Proto.SCWalletType',
      '10': 'walletType'
    },
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhJFCgh0cmFuc2ZlchgBIAEoCzInLlRXLkV0aGVyZXVtLlByb3RvLlRyYW'
    '5zYWN0aW9uLlRyYW5zZmVySABSCHRyYW5zZmVyElUKDmVyYzIwX3RyYW5zZmVyGAIgASgLMiwu'
    'VFcuRXRoZXJldW0uUHJvdG8uVHJhbnNhY3Rpb24uRVJDMjBUcmFuc2ZlckgAUg1lcmMyMFRyYW'
    '5zZmVyElIKDWVyYzIwX2FwcHJvdmUYAyABKAsyKy5UVy5FdGhlcmV1bS5Qcm90by5UcmFuc2Fj'
    'dGlvbi5FUkMyMEFwcHJvdmVIAFIMZXJjMjBBcHByb3ZlElgKD2VyYzcyMV90cmFuc2ZlchgEIA'
    'EoCzItLlRXLkV0aGVyZXVtLlByb3RvLlRyYW5zYWN0aW9uLkVSQzcyMVRyYW5zZmVySABSDmVy'
    'YzcyMVRyYW5zZmVyElsKEGVyYzExNTVfdHJhbnNmZXIYBSABKAsyLi5UVy5FdGhlcmV1bS5Qcm'
    '90by5UcmFuc2FjdGlvbi5FUkMxMTU1VHJhbnNmZXJIAFIPZXJjMTE1NVRyYW5zZmVyElsKEGNv'
    'bnRyYWN0X2dlbmVyaWMYBiABKAsyLi5UVy5FdGhlcmV1bS5Qcm90by5UcmFuc2FjdGlvbi5Db2'
    '50cmFjdEdlbmVyaWNIAFIPY29udHJhY3RHZW5lcmljEksKCXNjd19iYXRjaBgHIAEoCzIsLlRX'
    'LkV0aGVyZXVtLlByb3RvLlRyYW5zYWN0aW9uLlNDV2FsbGV0QmF0Y2hIAFIIc2N3QmF0Y2gSUQ'
    'oLc2N3X2V4ZWN1dGUYCCABKAsyLi5UVy5FdGhlcmV1bS5Qcm90by5UcmFuc2FjdGlvbi5TQ1dh'
    'bGxldEV4ZWN1dGVIAFIKc2N3RXhlY3V0ZRo2CghUcmFuc2ZlchIWCgZhbW91bnQYASABKAxSBm'
    'Ftb3VudBISCgRkYXRhGAIgASgMUgRkYXRhGjcKDUVSQzIwVHJhbnNmZXISDgoCdG8YASABKAlS'
    'AnRvEhYKBmFtb3VudBgCIAEoDFIGYW1vdW50GkAKDEVSQzIwQXBwcm92ZRIYCgdzcGVuZGVyGA'
    'EgASgJUgdzcGVuZGVyEhYKBmFtb3VudBgCIAEoDFIGYW1vdW50Gk8KDkVSQzcyMVRyYW5zZmVy'
    'EhIKBGZyb20YASABKAlSBGZyb20SDgoCdG8YAiABKAlSAnRvEhkKCHRva2VuX2lkGAMgASgMUg'
    'd0b2tlbklkGnoKD0VSQzExNTVUcmFuc2ZlchISCgRmcm9tGAEgASgJUgRmcm9tEg4KAnRvGAIg'
    'ASgJUgJ0bxIZCgh0b2tlbl9pZBgDIAEoDFIHdG9rZW5JZBIUCgV2YWx1ZRgEIAEoDFIFdmFsdW'
    'USEgoEZGF0YRgFIAEoDFIEZGF0YRo9Cg9Db250cmFjdEdlbmVyaWMSFgoGYW1vdW50GAEgASgM'
    'UgZhbW91bnQSEgoEZGF0YRgCIAEoDFIEZGF0YRr8AQoNU0NXYWxsZXRCYXRjaBJOCgVjYWxscx'
    'gBIAMoCzI4LlRXLkV0aGVyZXVtLlByb3RvLlRyYW5zYWN0aW9uLlNDV2FsbGV0QmF0Y2guQmF0'
    'Y2hlZENhbGxSBWNhbGxzEkAKC3dhbGxldF90eXBlGAIgASgOMh8uVFcuRXRoZXJldW0uUHJvdG'
    '8uU0NXYWxsZXRUeXBlUgp3YWxsZXRUeXBlGlkKC0JhdGNoZWRDYWxsEhgKB2FkZHJlc3MYASAB'
    'KAlSB2FkZHJlc3MSFgoGYW1vdW50GAIgASgMUgZhbW91bnQSGAoHcGF5bG9hZBgDIAEoDFIHcG'
    'F5bG9hZBqVAQoPU0NXYWxsZXRFeGVjdXRlEkAKC3RyYW5zYWN0aW9uGAEgASgLMh4uVFcuRXRo'
    'ZXJldW0uUHJvdG8uVHJhbnNhY3Rpb25SC3RyYW5zYWN0aW9uEkAKC3dhbGxldF90eXBlGAIgAS'
    'gOMh8uVFcuRXRoZXJldW0uUHJvdG8uU0NXYWxsZXRUeXBlUgp3YWxsZXRUeXBlQhMKEXRyYW5z'
    'YWN0aW9uX29uZW9m');

@$core.Deprecated('Use userOperationDescriptor instead')
const UserOperation$json = {
  '1': 'UserOperation',
  '2': [
    {'1': 'entry_point', '3': 1, '4': 1, '5': 9, '10': 'entryPoint'},
    {'1': 'init_code', '3': 2, '4': 1, '5': 12, '10': 'initCode'},
    {'1': 'sender', '3': 3, '4': 1, '5': 9, '10': 'sender'},
    {
      '1': 'pre_verification_gas',
      '3': 4,
      '4': 1,
      '5': 12,
      '10': 'preVerificationGas'
    },
    {
      '1': 'verification_gas_limit',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'verificationGasLimit'
    },
    {
      '1': 'paymaster_and_data',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'paymasterAndData'
    },
  ],
};

/// Descriptor for `UserOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userOperationDescriptor = $convert.base64Decode(
    'Cg1Vc2VyT3BlcmF0aW9uEh8KC2VudHJ5X3BvaW50GAEgASgJUgplbnRyeVBvaW50EhsKCWluaX'
    'RfY29kZRgCIAEoDFIIaW5pdENvZGUSFgoGc2VuZGVyGAMgASgJUgZzZW5kZXISMAoUcHJlX3Zl'
    'cmlmaWNhdGlvbl9nYXMYBCABKAxSEnByZVZlcmlmaWNhdGlvbkdhcxI0ChZ2ZXJpZmljYXRpb2'
    '5fZ2FzX2xpbWl0GAUgASgMUhR2ZXJpZmljYXRpb25HYXNMaW1pdBIsChJwYXltYXN0ZXJfYW5k'
    'X2RhdGEYBiABKAxSEHBheW1hc3RlckFuZERhdGE=');

@$core.Deprecated('Use userOperationV0_7Descriptor instead')
const UserOperationV0_7$json = {
  '1': 'UserOperationV0_7',
  '2': [
    {'1': 'entry_point', '3': 1, '4': 1, '5': 9, '10': 'entryPoint'},
    {'1': 'factory', '3': 2, '4': 1, '5': 9, '10': 'factory'},
    {'1': 'factory_data', '3': 3, '4': 1, '5': 12, '10': 'factoryData'},
    {'1': 'sender', '3': 4, '4': 1, '5': 9, '10': 'sender'},
    {
      '1': 'pre_verification_gas',
      '3': 5,
      '4': 1,
      '5': 12,
      '10': 'preVerificationGas'
    },
    {
      '1': 'verification_gas_limit',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'verificationGasLimit'
    },
    {'1': 'paymaster', '3': 7, '4': 1, '5': 9, '10': 'paymaster'},
    {
      '1': 'paymaster_verification_gas_limit',
      '3': 8,
      '4': 1,
      '5': 12,
      '10': 'paymasterVerificationGasLimit'
    },
    {
      '1': 'paymaster_post_op_gas_limit',
      '3': 9,
      '4': 1,
      '5': 12,
      '10': 'paymasterPostOpGasLimit'
    },
    {'1': 'paymaster_data', '3': 10, '4': 1, '5': 12, '10': 'paymasterData'},
  ],
};

/// Descriptor for `UserOperationV0_7`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userOperationV0_7Descriptor = $convert.base64Decode(
    'ChFVc2VyT3BlcmF0aW9uVjBfNxIfCgtlbnRyeV9wb2ludBgBIAEoCVIKZW50cnlQb2ludBIYCg'
    'dmYWN0b3J5GAIgASgJUgdmYWN0b3J5EiEKDGZhY3RvcnlfZGF0YRgDIAEoDFILZmFjdG9yeURh'
    'dGESFgoGc2VuZGVyGAQgASgJUgZzZW5kZXISMAoUcHJlX3ZlcmlmaWNhdGlvbl9nYXMYBSABKA'
    'xSEnByZVZlcmlmaWNhdGlvbkdhcxI0ChZ2ZXJpZmljYXRpb25fZ2FzX2xpbWl0GAYgASgMUhR2'
    'ZXJpZmljYXRpb25HYXNMaW1pdBIcCglwYXltYXN0ZXIYByABKAlSCXBheW1hc3RlchJHCiBwYX'
    'ltYXN0ZXJfdmVyaWZpY2F0aW9uX2dhc19saW1pdBgIIAEoDFIdcGF5bWFzdGVyVmVyaWZpY2F0'
    'aW9uR2FzTGltaXQSPAobcGF5bWFzdGVyX3Bvc3Rfb3BfZ2FzX2xpbWl0GAkgASgMUhdwYXltYX'
    'N0ZXJQb3N0T3BHYXNMaW1pdBIlCg5wYXltYXN0ZXJfZGF0YRgKIAEoDFINcGF5bWFzdGVyRGF0'
    'YQ==');

@$core.Deprecated('Use accessDescriptor instead')
const Access$json = {
  '1': 'Access',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'stored_keys', '3': 2, '4': 3, '5': 12, '10': 'storedKeys'},
  ],
};

/// Descriptor for `Access`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessDescriptor = $convert.base64Decode(
    'CgZBY2Nlc3MSGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxIfCgtzdG9yZWRfa2V5cxgCIAMoDF'
    'IKc3RvcmVkS2V5cw==');

@$core.Deprecated('Use authorizationDescriptor instead')
const Authorization$json = {
  '1': 'Authorization',
  '2': [
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {
      '1': 'custom_signature',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.AuthorizationCustomSignature',
      '10': 'customSignature'
    },
  ],
};

/// Descriptor for `Authorization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorizationDescriptor = $convert.base64Decode(
    'Cg1BdXRob3JpemF0aW9uEhgKB2FkZHJlc3MYAiABKAlSB2FkZHJlc3MSWgoQY3VzdG9tX3NpZ2'
    '5hdHVyZRgDIAEoCzIvLlRXLkV0aGVyZXVtLlByb3RvLkF1dGhvcml6YXRpb25DdXN0b21TaWdu'
    'YXR1cmVSD2N1c3RvbVNpZ25hdHVyZQ==');

@$core.Deprecated('Use authorizationCustomSignatureDescriptor instead')
const AuthorizationCustomSignature$json = {
  '1': 'AuthorizationCustomSignature',
  '2': [
    {'1': 'chain_id', '3': 1, '4': 1, '5': 12, '10': 'chainId'},
    {'1': 'nonce', '3': 2, '4': 1, '5': 12, '10': 'nonce'},
    {'1': 'signature', '3': 3, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `AuthorizationCustomSignature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorizationCustomSignatureDescriptor =
    $convert.base64Decode(
        'ChxBdXRob3JpemF0aW9uQ3VzdG9tU2lnbmF0dXJlEhkKCGNoYWluX2lkGAEgASgMUgdjaGFpbk'
        'lkEhQKBW5vbmNlGAIgASgMUgVub25jZRIcCglzaWduYXR1cmUYAyABKAlSCXNpZ25hdHVyZQ==');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {'1': 'chain_id', '3': 1, '4': 1, '5': 12, '10': 'chainId'},
    {'1': 'nonce', '3': 2, '4': 1, '5': 12, '10': 'nonce'},
    {
      '1': 'tx_mode',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.Ethereum.Proto.TransactionMode',
      '10': 'txMode'
    },
    {'1': 'gas_price', '3': 4, '4': 1, '5': 12, '10': 'gasPrice'},
    {'1': 'gas_limit', '3': 5, '4': 1, '5': 12, '10': 'gasLimit'},
    {
      '1': 'max_inclusion_fee_per_gas',
      '3': 6,
      '4': 1,
      '5': 12,
      '10': 'maxInclusionFeePerGas'
    },
    {'1': 'max_fee_per_gas', '3': 7, '4': 1, '5': 12, '10': 'maxFeePerGas'},
    {'1': 'to_address', '3': 8, '4': 1, '5': 9, '10': 'toAddress'},
    {'1': 'private_key', '3': 9, '4': 1, '5': 12, '10': 'privateKey'},
    {
      '1': 'transaction',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Transaction',
      '10': 'transaction'
    },
    {
      '1': 'user_operation',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.UserOperation',
      '9': 0,
      '10': 'userOperation'
    },
    {
      '1': 'user_operation_v0_7',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.UserOperationV0_7',
      '9': 0,
      '10': 'userOperationV07'
    },
    {
      '1': 'access_list',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Access',
      '10': 'accessList'
    },
    {
      '1': 'eip7702_authorization',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.Authorization',
      '10': 'eip7702Authorization'
    },
  ],
  '8': [
    {'1': 'user_operation_oneof'},
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSGQoIY2hhaW5faWQYASABKAxSB2NoYWluSWQSFAoFbm9uY2UYAiABKA'
    'xSBW5vbmNlEjsKB3R4X21vZGUYAyABKA4yIi5UVy5FdGhlcmV1bS5Qcm90by5UcmFuc2FjdGlv'
    'bk1vZGVSBnR4TW9kZRIbCglnYXNfcHJpY2UYBCABKAxSCGdhc1ByaWNlEhsKCWdhc19saW1pdB'
    'gFIAEoDFIIZ2FzTGltaXQSOAoZbWF4X2luY2x1c2lvbl9mZWVfcGVyX2dhcxgGIAEoDFIVbWF4'
    'SW5jbHVzaW9uRmVlUGVyR2FzEiUKD21heF9mZWVfcGVyX2dhcxgHIAEoDFIMbWF4RmVlUGVyR2'
    'FzEh0KCnRvX2FkZHJlc3MYCCABKAlSCXRvQWRkcmVzcxIfCgtwcml2YXRlX2tleRgJIAEoDFIK'
    'cHJpdmF0ZUtleRJACgt0cmFuc2FjdGlvbhgKIAEoCzIeLlRXLkV0aGVyZXVtLlByb3RvLlRyYW'
    '5zYWN0aW9uUgt0cmFuc2FjdGlvbhJJCg51c2VyX29wZXJhdGlvbhgLIAEoCzIgLlRXLkV0aGVy'
    'ZXVtLlByb3RvLlVzZXJPcGVyYXRpb25IAFINdXNlck9wZXJhdGlvbhJVChN1c2VyX29wZXJhdG'
    'lvbl92MF83GA0gASgLMiQuVFcuRXRoZXJldW0uUHJvdG8uVXNlck9wZXJhdGlvblYwXzdIAFIQ'
    'dXNlck9wZXJhdGlvblYwNxI6CgthY2Nlc3NfbGlzdBgMIAMoCzIZLlRXLkV0aGVyZXVtLlByb3'
    'RvLkFjY2Vzc1IKYWNjZXNzTGlzdBJVChVlaXA3NzAyX2F1dGhvcml6YXRpb24YDyABKAsyIC5U'
    'Vy5FdGhlcmV1bS5Qcm90by5BdXRob3JpemF0aW9uUhRlaXA3NzAyQXV0aG9yaXphdGlvbkIWCh'
    'R1c2VyX29wZXJhdGlvbl9vbmVvZg==');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {'1': 'encoded', '3': 1, '4': 1, '5': 12, '10': 'encoded'},
    {'1': 'v', '3': 2, '4': 1, '5': 12, '10': 'v'},
    {'1': 'r', '3': 3, '4': 1, '5': 12, '10': 'r'},
    {'1': 's', '3': 4, '4': 1, '5': 12, '10': 's'},
    {'1': 'data', '3': 5, '4': 1, '5': 12, '10': 'data'},
    {
      '1': 'error',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
    {'1': 'error_message', '3': 7, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'pre_hash', '3': 8, '4': 1, '5': 12, '10': 'preHash'},
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0EhgKB2VuY29kZWQYASABKAxSB2VuY29kZWQSDAoBdhgCIAEoDFIBdh'
    'IMCgFyGAMgASgMUgFyEgwKAXMYBCABKAxSAXMSEgoEZGF0YRgFIAEoDFIEZGF0YRIzCgVlcnJv'
    'chgGIAEoDjIdLlRXLkNvbW1vbi5Qcm90by5TaWduaW5nRXJyb3JSBWVycm9yEiMKDWVycm9yX2'
    '1lc3NhZ2UYByABKAlSDGVycm9yTWVzc2FnZRIZCghwcmVfaGFzaBgIIAEoDFIHcHJlSGFzaA==');

@$core.Deprecated('Use maybeChainIdDescriptor instead')
const MaybeChainId$json = {
  '1': 'MaybeChainId',
  '2': [
    {'1': 'chain_id', '3': 3, '4': 1, '5': 4, '10': 'chainId'},
  ],
};

/// Descriptor for `MaybeChainId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List maybeChainIdDescriptor = $convert
    .base64Decode('CgxNYXliZUNoYWluSWQSGQoIY2hhaW5faWQYAyABKARSB2NoYWluSWQ=');

@$core.Deprecated('Use messageSigningInputDescriptor instead')
const MessageSigningInput$json = {
  '1': 'MessageSigningInput',
  '2': [
    {'1': 'private_key', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {
      '1': 'chain_id',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Ethereum.Proto.MaybeChainId',
      '10': 'chainId'
    },
    {
      '1': 'message_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.TW.Ethereum.Proto.MessageType',
      '10': 'messageType'
    },
  ],
};

/// Descriptor for `MessageSigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSigningInputDescriptor = $convert.base64Decode(
    'ChNNZXNzYWdlU2lnbmluZ0lucHV0Eh8KC3ByaXZhdGVfa2V5GAEgASgMUgpwcml2YXRlS2V5Eh'
    'gKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USOgoIY2hhaW5faWQYAyABKAsyHy5UVy5FdGhlcmV1'
    'bS5Qcm90by5NYXliZUNoYWluSWRSB2NoYWluSWQSQQoMbWVzc2FnZV90eXBlGAQgASgOMh4uVF'
    'cuRXRoZXJldW0uUHJvdG8uTWVzc2FnZVR5cGVSC21lc3NhZ2VUeXBl');

@$core.Deprecated('Use messageSigningOutputDescriptor instead')
const MessageSigningOutput$json = {
  '1': 'MessageSigningOutput',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 9, '10': 'signature'},
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

/// Descriptor for `MessageSigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSigningOutputDescriptor = $convert.base64Decode(
    'ChRNZXNzYWdlU2lnbmluZ091dHB1dBIcCglzaWduYXR1cmUYASABKAlSCXNpZ25hdHVyZRIzCg'
    'VlcnJvchgCIAEoDjIdLlRXLkNvbW1vbi5Qcm90by5TaWduaW5nRXJyb3JSBWVycm9yEiMKDWVy'
    'cm9yX21lc3NhZ2UYAyABKAlSDGVycm9yTWVzc2FnZQ==');

@$core.Deprecated('Use messageVerifyingInputDescriptor instead')
const MessageVerifyingInput$json = {
  '1': 'MessageVerifyingInput',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'public_key', '3': 2, '4': 1, '5': 12, '10': 'publicKey'},
    {'1': 'signature', '3': 3, '4': 1, '5': 9, '10': 'signature'},
  ],
};

/// Descriptor for `MessageVerifyingInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageVerifyingInputDescriptor = $convert.base64Decode(
    'ChVNZXNzYWdlVmVyaWZ5aW5nSW5wdXQSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIdCgpwdW'
    'JsaWNfa2V5GAIgASgMUglwdWJsaWNLZXkSHAoJc2lnbmF0dXJlGAMgASgJUglzaWduYXR1cmU=');
