//
//  Generated code. Do not modify.
//  source: Cosmos.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use broadcastModeDescriptor instead')
const BroadcastMode$json = {
  '1': 'BroadcastMode',
  '2': [
    {'1': 'BLOCK', '2': 0},
    {'1': 'SYNC', '2': 1},
    {'1': 'ASYNC', '2': 2},
  ],
};

/// Descriptor for `BroadcastMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List broadcastModeDescriptor = $convert.base64Decode(
    'Cg1Ccm9hZGNhc3RNb2RlEgkKBUJMT0NLEAASCAoEU1lOQxABEgkKBUFTWU5DEAI=');

@$core.Deprecated('Use signingModeDescriptor instead')
const SigningMode$json = {
  '1': 'SigningMode',
  '2': [
    {'1': 'JSON', '2': 0},
    {'1': 'Protobuf', '2': 1},
  ],
};

/// Descriptor for `SigningMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signingModeDescriptor = $convert
    .base64Decode('CgtTaWduaW5nTW9kZRIICgRKU09OEAASDAoIUHJvdG9idWYQAQ==');

@$core.Deprecated('Use txHasherDescriptor instead')
const TxHasher$json = {
  '1': 'TxHasher',
  '2': [
    {'1': 'UseDefault', '2': 0},
    {'1': 'Sha256', '2': 1},
    {'1': 'Keccak256', '2': 2},
  ],
};

/// Descriptor for `TxHasher`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List txHasherDescriptor = $convert.base64Decode(
    'CghUeEhhc2hlchIOCgpVc2VEZWZhdWx0EAASCgoGU2hhMjU2EAESDQoJS2VjY2FrMjU2EAI=');

@$core.Deprecated('Use signerPublicKeyTypeDescriptor instead')
const SignerPublicKeyType$json = {
  '1': 'SignerPublicKeyType',
  '2': [
    {'1': 'Secp256k1', '2': 0},
    {'1': 'Secp256k1Extended', '2': 1},
  ],
};

/// Descriptor for `SignerPublicKeyType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signerPublicKeyTypeDescriptor = $convert.base64Decode(
    'ChNTaWduZXJQdWJsaWNLZXlUeXBlEg0KCVNlY3AyNTZrMRAAEhUKEVNlY3AyNTZrMUV4dGVuZG'
    'VkEAE=');

@$core.Deprecated('Use amountDescriptor instead')
const Amount$json = {
  '1': 'Amount',
  '2': [
    {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    {'1': 'amount', '3': 2, '4': 1, '5': 9, '10': 'amount'},
  ],
};

/// Descriptor for `Amount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List amountDescriptor = $convert.base64Decode(
    'CgZBbW91bnQSFAoFZGVub20YASABKAlSBWRlbm9tEhYKBmFtb3VudBgCIAEoCVIGYW1vdW50');

@$core.Deprecated('Use feeDescriptor instead')
const Fee$json = {
  '1': 'Fee',
  '2': [
    {
      '1': 'amounts',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'amounts'
    },
    {'1': 'gas', '3': 2, '4': 1, '5': 4, '10': 'gas'},
  ],
};

/// Descriptor for `Fee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feeDescriptor = $convert.base64Decode(
    'CgNGZWUSMQoHYW1vdW50cxgBIAMoCzIXLlRXLkNvc21vcy5Qcm90by5BbW91bnRSB2Ftb3VudH'
    'MSEAoDZ2FzGAIgASgEUgNnYXM=');

@$core.Deprecated('Use heightDescriptor instead')
const Height$json = {
  '1': 'Height',
  '2': [
    {'1': 'revision_number', '3': 1, '4': 1, '5': 4, '10': 'revisionNumber'},
    {'1': 'revision_height', '3': 2, '4': 1, '5': 4, '10': 'revisionHeight'},
  ],
};

/// Descriptor for `Height`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heightDescriptor = $convert.base64Decode(
    'CgZIZWlnaHQSJwoPcmV2aXNpb25fbnVtYmVyGAEgASgEUg5yZXZpc2lvbk51bWJlchInCg9yZX'
    'Zpc2lvbl9oZWlnaHQYAiABKARSDnJldmlzaW9uSGVpZ2h0');

@$core.Deprecated('Use tHORChainAssetDescriptor instead')
const THORChainAsset$json = {
  '1': 'THORChainAsset',
  '2': [
    {'1': 'chain', '3': 1, '4': 1, '5': 9, '10': 'chain'},
    {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'ticker', '3': 3, '4': 1, '5': 9, '10': 'ticker'},
    {'1': 'synth', '3': 4, '4': 1, '5': 8, '10': 'synth'},
  ],
};

/// Descriptor for `THORChainAsset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tHORChainAssetDescriptor = $convert.base64Decode(
    'Cg5USE9SQ2hhaW5Bc3NldBIUCgVjaGFpbhgBIAEoCVIFY2hhaW4SFgoGc3ltYm9sGAIgASgJUg'
    'ZzeW1ib2wSFgoGdGlja2VyGAMgASgJUgZ0aWNrZXISFAoFc3ludGgYBCABKAhSBXN5bnRo');

@$core.Deprecated('Use tHORChainCoinDescriptor instead')
const THORChainCoin$json = {
  '1': 'THORChainCoin',
  '2': [
    {
      '1': 'asset',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.THORChainAsset',
      '10': 'asset'
    },
    {'1': 'amount', '3': 2, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'decimals', '3': 3, '4': 1, '5': 3, '10': 'decimals'},
  ],
};

/// Descriptor for `THORChainCoin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tHORChainCoinDescriptor = $convert.base64Decode(
    'Cg1USE9SQ2hhaW5Db2luEjUKBWFzc2V0GAEgASgLMh8uVFcuQ29zbW9zLlByb3RvLlRIT1JDaG'
    'FpbkFzc2V0UgVhc3NldBIWCgZhbW91bnQYAiABKAlSBmFtb3VudBIaCghkZWNpbWFscxgDIAEo'
    'A1IIZGVjaW1hbHM=');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {
      '1': 'send_coins_message',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.Send',
      '9': 0,
      '10': 'sendCoinsMessage'
    },
    {
      '1': 'transfer_tokens_message',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.Transfer',
      '9': 0,
      '10': 'transferTokensMessage'
    },
    {
      '1': 'stake_message',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.Delegate',
      '9': 0,
      '10': 'stakeMessage'
    },
    {
      '1': 'unstake_message',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.Undelegate',
      '9': 0,
      '10': 'unstakeMessage'
    },
    {
      '1': 'restake_message',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.BeginRedelegate',
      '9': 0,
      '10': 'restakeMessage'
    },
    {
      '1': 'withdraw_stake_reward_message',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WithdrawDelegationReward',
      '9': 0,
      '10': 'withdrawStakeRewardMessage'
    },
    {
      '1': 'raw_json_message',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.RawJSON',
      '9': 0,
      '10': 'rawJsonMessage'
    },
    {
      '1': 'wasm_terra_execute_contract_transfer_message',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmTerraExecuteContractTransfer',
      '9': 0,
      '10': 'wasmTerraExecuteContractTransferMessage'
    },
    {
      '1': 'wasm_terra_execute_contract_send_message',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmTerraExecuteContractSend',
      '9': 0,
      '10': 'wasmTerraExecuteContractSendMessage'
    },
    {
      '1': 'thorchain_send_message',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.THORChainSend',
      '9': 0,
      '10': 'thorchainSendMessage'
    },
    {
      '1': 'wasm_terra_execute_contract_generic',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmTerraExecuteContractGeneric',
      '9': 0,
      '10': 'wasmTerraExecuteContractGeneric'
    },
    {
      '1': 'wasm_execute_contract_transfer_message',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmExecuteContractTransfer',
      '9': 0,
      '10': 'wasmExecuteContractTransferMessage'
    },
    {
      '1': 'wasm_execute_contract_send_message',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmExecuteContractSend',
      '9': 0,
      '10': 'wasmExecuteContractSendMessage'
    },
    {
      '1': 'wasm_execute_contract_generic',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmExecuteContractGeneric',
      '9': 0,
      '10': 'wasmExecuteContractGeneric'
    },
    {
      '1': 'sign_direct_message',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.SignDirect',
      '9': 0,
      '10': 'signDirectMessage'
    },
    {
      '1': 'auth_grant',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.AuthGrant',
      '9': 0,
      '10': 'authGrant'
    },
    {
      '1': 'auth_revoke',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.AuthRevoke',
      '9': 0,
      '10': 'authRevoke'
    },
    {
      '1': 'set_withdraw_address_message',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.SetWithdrawAddress',
      '9': 0,
      '10': 'setWithdrawAddressMessage'
    },
    {
      '1': 'msg_vote',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.MsgVote',
      '9': 0,
      '10': 'msgVote'
    },
    {
      '1': 'msg_stride_liquid_staking_stake',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.MsgStrideLiquidStakingStake',
      '9': 0,
      '10': 'msgStrideLiquidStakingStake'
    },
    {
      '1': 'msg_stride_liquid_staking_redeem',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.MsgStrideLiquidStakingRedeem',
      '9': 0,
      '10': 'msgStrideLiquidStakingRedeem'
    },
    {
      '1': 'thorchain_deposit_message',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.THORChainDeposit',
      '9': 0,
      '10': 'thorchainDepositMessage'
    },
    {
      '1': 'wasm_instantiate_contract_message',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.WasmInstantiateContract',
      '9': 0,
      '10': 'wasmInstantiateContractMessage'
    },
  ],
  '3': [
    Message_Send$json,
    Message_Transfer$json,
    Message_Delegate$json,
    Message_Undelegate$json,
    Message_BeginRedelegate$json,
    Message_SetWithdrawAddress$json,
    Message_WithdrawDelegationReward$json,
    Message_WasmTerraExecuteContractTransfer$json,
    Message_WasmTerraExecuteContractSend$json,
    Message_THORChainSend$json,
    Message_THORChainDeposit$json,
    Message_WasmTerraExecuteContractGeneric$json,
    Message_WasmExecuteContractTransfer$json,
    Message_WasmExecuteContractSend$json,
    Message_WasmExecuteContractGeneric$json,
    Message_WasmInstantiateContract$json,
    Message_RawJSON$json,
    Message_SignDirect$json,
    Message_StakeAuthorization$json,
    Message_AuthGrant$json,
    Message_AuthRevoke$json,
    Message_MsgVote$json,
    Message_MsgStrideLiquidStakingStake$json,
    Message_MsgStrideLiquidStakingRedeem$json
  ],
  '4': [Message_AuthorizationType$json, Message_VoteOption$json],
  '8': [
    {'1': 'message_oneof'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_Send$json = {
  '1': 'Send',
  '2': [
    {'1': 'from_address', '3': 1, '4': 1, '5': 9, '10': 'fromAddress'},
    {'1': 'to_address', '3': 2, '4': 1, '5': 9, '10': 'toAddress'},
    {
      '1': 'amounts',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'amounts'
    },
    {'1': 'type_prefix', '3': 4, '4': 1, '5': 9, '10': 'typePrefix'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_Transfer$json = {
  '1': 'Transfer',
  '2': [
    {'1': 'source_port', '3': 1, '4': 1, '5': 9, '10': 'sourcePort'},
    {'1': 'source_channel', '3': 2, '4': 1, '5': 9, '10': 'sourceChannel'},
    {
      '1': 'token',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'token'
    },
    {'1': 'sender', '3': 4, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'receiver', '3': 5, '4': 1, '5': 9, '10': 'receiver'},
    {
      '1': 'timeout_height',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Height',
      '10': 'timeoutHeight'
    },
    {
      '1': 'timeout_timestamp',
      '3': 7,
      '4': 1,
      '5': 4,
      '10': 'timeoutTimestamp'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_Delegate$json = {
  '1': 'Delegate',
  '2': [
    {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddress'
    },
    {
      '1': 'validator_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorAddress'
    },
    {
      '1': 'amount',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'amount'
    },
    {'1': 'type_prefix', '3': 4, '4': 1, '5': 9, '10': 'typePrefix'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_Undelegate$json = {
  '1': 'Undelegate',
  '2': [
    {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddress'
    },
    {
      '1': 'validator_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorAddress'
    },
    {
      '1': 'amount',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'amount'
    },
    {'1': 'type_prefix', '3': 4, '4': 1, '5': 9, '10': 'typePrefix'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_BeginRedelegate$json = {
  '1': 'BeginRedelegate',
  '2': [
    {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddress'
    },
    {
      '1': 'validator_src_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorSrcAddress'
    },
    {
      '1': 'validator_dst_address',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'validatorDstAddress'
    },
    {
      '1': 'amount',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'amount'
    },
    {'1': 'type_prefix', '3': 5, '4': 1, '5': 9, '10': 'typePrefix'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_SetWithdrawAddress$json = {
  '1': 'SetWithdrawAddress',
  '2': [
    {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddress'
    },
    {'1': 'withdraw_address', '3': 2, '4': 1, '5': 9, '10': 'withdrawAddress'},
    {'1': 'type_prefix', '3': 3, '4': 1, '5': 9, '10': 'typePrefix'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WithdrawDelegationReward$json = {
  '1': 'WithdrawDelegationReward',
  '2': [
    {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddress'
    },
    {
      '1': 'validator_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorAddress'
    },
    {'1': 'type_prefix', '3': 3, '4': 1, '5': 9, '10': 'typePrefix'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmTerraExecuteContractTransfer$json = {
  '1': 'WasmTerraExecuteContractTransfer',
  '2': [
    {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
    {'1': 'amount', '3': 3, '4': 1, '5': 12, '10': 'amount'},
    {
      '1': 'recipient_address',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'recipientAddress'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmTerraExecuteContractSend$json = {
  '1': 'WasmTerraExecuteContractSend',
  '2': [
    {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
    {'1': 'amount', '3': 3, '4': 1, '5': 12, '10': 'amount'},
    {
      '1': 'recipient_contract_address',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'recipientContractAddress'
    },
    {'1': 'msg', '3': 5, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'coin', '3': 6, '4': 3, '5': 9, '10': 'coin'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_THORChainSend$json = {
  '1': 'THORChainSend',
  '2': [
    {'1': 'from_address', '3': 1, '4': 1, '5': 12, '10': 'fromAddress'},
    {'1': 'to_address', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    {
      '1': 'amounts',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'amounts'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_THORChainDeposit$json = {
  '1': 'THORChainDeposit',
  '2': [
    {
      '1': 'coins',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.THORChainCoin',
      '10': 'coins'
    },
    {'1': 'memo', '3': 2, '4': 1, '5': 9, '10': 'memo'},
    {'1': 'signer', '3': 3, '4': 1, '5': 12, '10': 'signer'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmTerraExecuteContractGeneric$json = {
  '1': 'WasmTerraExecuteContractGeneric',
  '2': [
    {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
    {'1': 'execute_msg', '3': 3, '4': 1, '5': 9, '10': 'executeMsg'},
    {
      '1': 'coins',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'coins'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmExecuteContractTransfer$json = {
  '1': 'WasmExecuteContractTransfer',
  '2': [
    {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
    {'1': 'amount', '3': 3, '4': 1, '5': 12, '10': 'amount'},
    {
      '1': 'recipient_address',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'recipientAddress'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmExecuteContractSend$json = {
  '1': 'WasmExecuteContractSend',
  '2': [
    {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
    {'1': 'amount', '3': 3, '4': 1, '5': 12, '10': 'amount'},
    {
      '1': 'recipient_contract_address',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'recipientContractAddress'
    },
    {'1': 'msg', '3': 5, '4': 1, '5': 9, '10': 'msg'},
    {'1': 'coin', '3': 6, '4': 3, '5': 9, '10': 'coin'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmExecuteContractGeneric$json = {
  '1': 'WasmExecuteContractGeneric',
  '2': [
    {'1': 'sender_address', '3': 1, '4': 1, '5': 9, '10': 'senderAddress'},
    {'1': 'contract_address', '3': 2, '4': 1, '5': 9, '10': 'contractAddress'},
    {'1': 'execute_msg', '3': 3, '4': 1, '5': 9, '10': 'executeMsg'},
    {
      '1': 'coins',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'coins'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_WasmInstantiateContract$json = {
  '1': 'WasmInstantiateContract',
  '2': [
    {'1': 'sender', '3': 1, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'admin', '3': 2, '4': 1, '5': 9, '10': 'admin'},
    {'1': 'code_id', '3': 3, '4': 1, '5': 4, '10': 'codeId'},
    {'1': 'label', '3': 4, '4': 1, '5': 9, '10': 'label'},
    {'1': 'msg', '3': 5, '4': 1, '5': 12, '10': 'msg'},
    {
      '1': 'init_funds',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'initFunds'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_RawJSON$json = {
  '1': 'RawJSON',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_SignDirect$json = {
  '1': 'SignDirect',
  '2': [
    {'1': 'body_bytes', '3': 1, '4': 1, '5': 12, '10': 'bodyBytes'},
    {'1': 'auth_info_bytes', '3': 2, '4': 1, '5': 12, '10': 'authInfoBytes'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StakeAuthorization$json = {
  '1': 'StakeAuthorization',
  '2': [
    {
      '1': 'max_tokens',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Amount',
      '10': 'maxTokens'
    },
    {
      '1': 'allow_list',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.StakeAuthorization.Validators',
      '9': 0,
      '10': 'allowList'
    },
    {
      '1': 'deny_list',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.StakeAuthorization.Validators',
      '9': 0,
      '10': 'denyList'
    },
    {
      '1': 'authorization_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.TW.Cosmos.Proto.Message.AuthorizationType',
      '10': 'authorizationType'
    },
  ],
  '3': [Message_StakeAuthorization_Validators$json],
  '8': [
    {'1': 'validators'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StakeAuthorization_Validators$json = {
  '1': 'Validators',
  '2': [
    {'1': 'address', '3': 1, '4': 3, '5': 9, '10': 'address'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AuthGrant$json = {
  '1': 'AuthGrant',
  '2': [
    {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    {
      '1': 'grant_stake',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message.StakeAuthorization',
      '9': 0,
      '10': 'grantStake'
    },
    {'1': 'expiration', '3': 4, '4': 1, '5': 3, '10': 'expiration'},
  ],
  '8': [
    {'1': 'grant_type'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AuthRevoke$json = {
  '1': 'AuthRevoke',
  '2': [
    {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    {'1': 'msg_type_url', '3': 3, '4': 1, '5': 9, '10': 'msgTypeUrl'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MsgVote$json = {
  '1': 'MsgVote',
  '2': [
    {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
    {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
    {
      '1': 'option',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.TW.Cosmos.Proto.Message.VoteOption',
      '10': 'option'
    },
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MsgStrideLiquidStakingStake$json = {
  '1': 'MsgStrideLiquidStakingStake',
  '2': [
    {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    {'1': 'amount', '3': 2, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'host_denom', '3': 3, '4': 1, '5': 9, '10': 'hostDenom'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MsgStrideLiquidStakingRedeem$json = {
  '1': 'MsgStrideLiquidStakingRedeem',
  '2': [
    {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    {'1': 'amount', '3': 2, '4': 1, '5': 9, '10': 'amount'},
    {'1': 'host_zone', '3': 3, '4': 1, '5': 9, '10': 'hostZone'},
    {'1': 'receiver', '3': 4, '4': 1, '5': 9, '10': 'receiver'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AuthorizationType$json = {
  '1': 'AuthorizationType',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'DELEGATE', '2': 1},
    {'1': 'UNDELEGATE', '2': 2},
    {'1': 'REDELEGATE', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_VoteOption$json = {
  '1': 'VoteOption',
  '2': [
    {'1': '_UNSPECIFIED', '2': 0},
    {'1': 'YES', '2': 1},
    {'1': 'ABSTAIN', '2': 2},
    {'1': 'NO', '2': 3},
    {'1': 'NO_WITH_VETO', '2': 4},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEk0KEnNlbmRfY29pbnNfbWVzc2FnZRgBIAEoCzIdLlRXLkNvc21vcy5Qcm90by'
    '5NZXNzYWdlLlNlbmRIAFIQc2VuZENvaW5zTWVzc2FnZRJbChd0cmFuc2Zlcl90b2tlbnNfbWVz'
    'c2FnZRgCIAEoCzIhLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLlRyYW5zZmVySABSFXRyYW5zZm'
    'VyVG9rZW5zTWVzc2FnZRJICg1zdGFrZV9tZXNzYWdlGAMgASgLMiEuVFcuQ29zbW9zLlByb3Rv'
    'Lk1lc3NhZ2UuRGVsZWdhdGVIAFIMc3Rha2VNZXNzYWdlEk4KD3Vuc3Rha2VfbWVzc2FnZRgEIA'
    'EoCzIjLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLlVuZGVsZWdhdGVIAFIOdW5zdGFrZU1lc3Nh'
    'Z2USUwoPcmVzdGFrZV9tZXNzYWdlGAUgASgLMiguVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuQm'
    'VnaW5SZWRlbGVnYXRlSABSDnJlc3Rha2VNZXNzYWdlEnYKHXdpdGhkcmF3X3N0YWtlX3Jld2Fy'
    'ZF9tZXNzYWdlGAYgASgLMjEuVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuV2l0aGRyYXdEZWxlZ2'
    'F0aW9uUmV3YXJkSABSGndpdGhkcmF3U3Rha2VSZXdhcmRNZXNzYWdlEkwKEHJhd19qc29uX21l'
    'c3NhZ2UYByABKAsyIC5UVy5Db3Ntb3MuUHJvdG8uTWVzc2FnZS5SYXdKU09OSABSDnJhd0pzb2'
    '5NZXNzYWdlEpoBCix3YXNtX3RlcnJhX2V4ZWN1dGVfY29udHJhY3RfdHJhbnNmZXJfbWVzc2Fn'
    'ZRgIIAEoCzI5LlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLldhc21UZXJyYUV4ZWN1dGVDb250cm'
    'FjdFRyYW5zZmVySABSJ3dhc21UZXJyYUV4ZWN1dGVDb250cmFjdFRyYW5zZmVyTWVzc2FnZRKO'
    'AQood2FzbV90ZXJyYV9leGVjdXRlX2NvbnRyYWN0X3NlbmRfbWVzc2FnZRgJIAEoCzI1LlRXLk'
    'Nvc21vcy5Qcm90by5NZXNzYWdlLldhc21UZXJyYUV4ZWN1dGVDb250cmFjdFNlbmRIAFIjd2Fz'
    'bVRlcnJhRXhlY3V0ZUNvbnRyYWN0U2VuZE1lc3NhZ2USXgoWdGhvcmNoYWluX3NlbmRfbWVzc2'
    'FnZRgKIAEoCzImLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLlRIT1JDaGFpblNlbmRIAFIUdGhv'
    'cmNoYWluU2VuZE1lc3NhZ2USiAEKI3dhc21fdGVycmFfZXhlY3V0ZV9jb250cmFjdF9nZW5lcm'
    'ljGAwgASgLMjguVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuV2FzbVRlcnJhRXhlY3V0ZUNvbnRy'
    'YWN0R2VuZXJpY0gAUh93YXNtVGVycmFFeGVjdXRlQ29udHJhY3RHZW5lcmljEooBCiZ3YXNtX2'
    'V4ZWN1dGVfY29udHJhY3RfdHJhbnNmZXJfbWVzc2FnZRgNIAEoCzI0LlRXLkNvc21vcy5Qcm90'
    'by5NZXNzYWdlLldhc21FeGVjdXRlQ29udHJhY3RUcmFuc2ZlckgAUiJ3YXNtRXhlY3V0ZUNvbn'
    'RyYWN0VHJhbnNmZXJNZXNzYWdlEn4KIndhc21fZXhlY3V0ZV9jb250cmFjdF9zZW5kX21lc3Nh'
    'Z2UYDiABKAsyMC5UVy5Db3Ntb3MuUHJvdG8uTWVzc2FnZS5XYXNtRXhlY3V0ZUNvbnRyYWN0U2'
    'VuZEgAUh53YXNtRXhlY3V0ZUNvbnRyYWN0U2VuZE1lc3NhZ2USeAodd2FzbV9leGVjdXRlX2Nv'
    'bnRyYWN0X2dlbmVyaWMYDyABKAsyMy5UVy5Db3Ntb3MuUHJvdG8uTWVzc2FnZS5XYXNtRXhlY3'
    'V0ZUNvbnRyYWN0R2VuZXJpY0gAUhp3YXNtRXhlY3V0ZUNvbnRyYWN0R2VuZXJpYxJVChNzaWdu'
    'X2RpcmVjdF9tZXNzYWdlGBAgASgLMiMuVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuU2lnbkRpcm'
    'VjdEgAUhFzaWduRGlyZWN0TWVzc2FnZRJDCgphdXRoX2dyYW50GBEgASgLMiIuVFcuQ29zbW9z'
    'LlByb3RvLk1lc3NhZ2UuQXV0aEdyYW50SABSCWF1dGhHcmFudBJGCgthdXRoX3Jldm9rZRgSIA'
    'EoCzIjLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLkF1dGhSZXZva2VIAFIKYXV0aFJldm9rZRJu'
    'ChxzZXRfd2l0aGRyYXdfYWRkcmVzc19tZXNzYWdlGBMgASgLMisuVFcuQ29zbW9zLlByb3RvLk'
    '1lc3NhZ2UuU2V0V2l0aGRyYXdBZGRyZXNzSABSGXNldFdpdGhkcmF3QWRkcmVzc01lc3NhZ2US'
    'PQoIbXNnX3ZvdGUYFCABKAsyIC5UVy5Db3Ntb3MuUHJvdG8uTWVzc2FnZS5Nc2dWb3RlSABSB2'
    '1zZ1ZvdGUSfAofbXNnX3N0cmlkZV9saXF1aWRfc3Rha2luZ19zdGFrZRgVIAEoCzI0LlRXLkNv'
    'c21vcy5Qcm90by5NZXNzYWdlLk1zZ1N0cmlkZUxpcXVpZFN0YWtpbmdTdGFrZUgAUhttc2dTdH'
    'JpZGVMaXF1aWRTdGFraW5nU3Rha2USfwogbXNnX3N0cmlkZV9saXF1aWRfc3Rha2luZ19yZWRl'
    'ZW0YFiABKAsyNS5UVy5Db3Ntb3MuUHJvdG8uTWVzc2FnZS5Nc2dTdHJpZGVMaXF1aWRTdGFraW'
    '5nUmVkZWVtSABSHG1zZ1N0cmlkZUxpcXVpZFN0YWtpbmdSZWRlZW0SZwoZdGhvcmNoYWluX2Rl'
    'cG9zaXRfbWVzc2FnZRgXIAEoCzIpLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLlRIT1JDaGFpbk'
    'RlcG9zaXRIAFIXdGhvcmNoYWluRGVwb3NpdE1lc3NhZ2USfQohd2FzbV9pbnN0YW50aWF0ZV9j'
    'b250cmFjdF9tZXNzYWdlGBggASgLMjAuVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuV2FzbUluc3'
    'RhbnRpYXRlQ29udHJhY3RIAFIed2FzbUluc3RhbnRpYXRlQ29udHJhY3RNZXNzYWdlGpwBCgRT'
    'ZW5kEiEKDGZyb21fYWRkcmVzcxgBIAEoCVILZnJvbUFkZHJlc3MSHQoKdG9fYWRkcmVzcxgCIA'
    'EoCVIJdG9BZGRyZXNzEjEKB2Ftb3VudHMYAyADKAsyFy5UVy5Db3Ntb3MuUHJvdG8uQW1vdW50'
    'UgdhbW91bnRzEh8KC3R5cGVfcHJlZml4GAQgASgJUgp0eXBlUHJlZml4GqICCghUcmFuc2Zlch'
    'IfCgtzb3VyY2VfcG9ydBgBIAEoCVIKc291cmNlUG9ydBIlCg5zb3VyY2VfY2hhbm5lbBgCIAEo'
    'CVINc291cmNlQ2hhbm5lbBItCgV0b2tlbhgDIAEoCzIXLlRXLkNvc21vcy5Qcm90by5BbW91bn'
    'RSBXRva2VuEhYKBnNlbmRlchgEIAEoCVIGc2VuZGVyEhoKCHJlY2VpdmVyGAUgASgJUghyZWNl'
    'aXZlchI+Cg50aW1lb3V0X2hlaWdodBgGIAEoCzIXLlRXLkNvc21vcy5Qcm90by5IZWlnaHRSDX'
    'RpbWVvdXRIZWlnaHQSKwoRdGltZW91dF90aW1lc3RhbXAYByABKARSEHRpbWVvdXRUaW1lc3Rh'
    'bXAatgEKCERlbGVnYXRlEisKEWRlbGVnYXRvcl9hZGRyZXNzGAEgASgJUhBkZWxlZ2F0b3JBZG'
    'RyZXNzEisKEXZhbGlkYXRvcl9hZGRyZXNzGAIgASgJUhB2YWxpZGF0b3JBZGRyZXNzEi8KBmFt'
    'b3VudBgDIAEoCzIXLlRXLkNvc21vcy5Qcm90by5BbW91bnRSBmFtb3VudBIfCgt0eXBlX3ByZW'
    'ZpeBgEIAEoCVIKdHlwZVByZWZpeBq4AQoKVW5kZWxlZ2F0ZRIrChFkZWxlZ2F0b3JfYWRkcmVz'
    'cxgBIAEoCVIQZGVsZWdhdG9yQWRkcmVzcxIrChF2YWxpZGF0b3JfYWRkcmVzcxgCIAEoCVIQdm'
    'FsaWRhdG9yQWRkcmVzcxIvCgZhbW91bnQYAyABKAsyFy5UVy5Db3Ntb3MuUHJvdG8uQW1vdW50'
    'UgZhbW91bnQSHwoLdHlwZV9wcmVmaXgYBCABKAlSCnR5cGVQcmVmaXga+AEKD0JlZ2luUmVkZW'
    'xlZ2F0ZRIrChFkZWxlZ2F0b3JfYWRkcmVzcxgBIAEoCVIQZGVsZWdhdG9yQWRkcmVzcxIyChV2'
    'YWxpZGF0b3Jfc3JjX2FkZHJlc3MYAiABKAlSE3ZhbGlkYXRvclNyY0FkZHJlc3MSMgoVdmFsaW'
    'RhdG9yX2RzdF9hZGRyZXNzGAMgASgJUhN2YWxpZGF0b3JEc3RBZGRyZXNzEi8KBmFtb3VudBgE'
    'IAEoCzIXLlRXLkNvc21vcy5Qcm90by5BbW91bnRSBmFtb3VudBIfCgt0eXBlX3ByZWZpeBgFIA'
    'EoCVIKdHlwZVByZWZpeBqNAQoSU2V0V2l0aGRyYXdBZGRyZXNzEisKEWRlbGVnYXRvcl9hZGRy'
    'ZXNzGAEgASgJUhBkZWxlZ2F0b3JBZGRyZXNzEikKEHdpdGhkcmF3X2FkZHJlc3MYAiABKAlSD3'
    'dpdGhkcmF3QWRkcmVzcxIfCgt0eXBlX3ByZWZpeBgDIAEoCVIKdHlwZVByZWZpeBqVAQoYV2l0'
    'aGRyYXdEZWxlZ2F0aW9uUmV3YXJkEisKEWRlbGVnYXRvcl9hZGRyZXNzGAEgASgJUhBkZWxlZ2'
    'F0b3JBZGRyZXNzEisKEXZhbGlkYXRvcl9hZGRyZXNzGAIgASgJUhB2YWxpZGF0b3JBZGRyZXNz'
    'Eh8KC3R5cGVfcHJlZml4GAMgASgJUgp0eXBlUHJlZml4GrkBCiBXYXNtVGVycmFFeGVjdXRlQ2'
    '9udHJhY3RUcmFuc2ZlchIlCg5zZW5kZXJfYWRkcmVzcxgBIAEoCVINc2VuZGVyQWRkcmVzcxIp'
    'ChBjb250cmFjdF9hZGRyZXNzGAIgASgJUg9jb250cmFjdEFkZHJlc3MSFgoGYW1vdW50GAMgAS'
    'gMUgZhbW91bnQSKwoRcmVjaXBpZW50X2FkZHJlc3MYBCABKAlSEHJlY2lwaWVudEFkZHJlc3Ma'
    '7AEKHFdhc21UZXJyYUV4ZWN1dGVDb250cmFjdFNlbmQSJQoOc2VuZGVyX2FkZHJlc3MYASABKA'
    'lSDXNlbmRlckFkZHJlc3MSKQoQY29udHJhY3RfYWRkcmVzcxgCIAEoCVIPY29udHJhY3RBZGRy'
    'ZXNzEhYKBmFtb3VudBgDIAEoDFIGYW1vdW50EjwKGnJlY2lwaWVudF9jb250cmFjdF9hZGRyZX'
    'NzGAQgASgJUhhyZWNpcGllbnRDb250cmFjdEFkZHJlc3MSEAoDbXNnGAUgASgJUgNtc2cSEgoE'
    'Y29pbhgGIAMoCVIEY29pbhqEAQoNVEhPUkNoYWluU2VuZBIhCgxmcm9tX2FkZHJlc3MYASABKA'
    'xSC2Zyb21BZGRyZXNzEh0KCnRvX2FkZHJlc3MYAiABKAxSCXRvQWRkcmVzcxIxCgdhbW91bnRz'
    'GAMgAygLMhcuVFcuQ29zbW9zLlByb3RvLkFtb3VudFIHYW1vdW50cxp0ChBUSE9SQ2hhaW5EZX'
    'Bvc2l0EjQKBWNvaW5zGAEgAygLMh4uVFcuQ29zbW9zLlByb3RvLlRIT1JDaGFpbkNvaW5SBWNv'
    'aW5zEhIKBG1lbW8YAiABKAlSBG1lbW8SFgoGc2lnbmVyGAMgASgMUgZzaWduZXIawwEKH1dhc2'
    '1UZXJyYUV4ZWN1dGVDb250cmFjdEdlbmVyaWMSJQoOc2VuZGVyX2FkZHJlc3MYASABKAlSDXNl'
    'bmRlckFkZHJlc3MSKQoQY29udHJhY3RfYWRkcmVzcxgCIAEoCVIPY29udHJhY3RBZGRyZXNzEh'
    '8KC2V4ZWN1dGVfbXNnGAMgASgJUgpleGVjdXRlTXNnEi0KBWNvaW5zGAUgAygLMhcuVFcuQ29z'
    'bW9zLlByb3RvLkFtb3VudFIFY29pbnMatAEKG1dhc21FeGVjdXRlQ29udHJhY3RUcmFuc2Zlch'
    'IlCg5zZW5kZXJfYWRkcmVzcxgBIAEoCVINc2VuZGVyQWRkcmVzcxIpChBjb250cmFjdF9hZGRy'
    'ZXNzGAIgASgJUg9jb250cmFjdEFkZHJlc3MSFgoGYW1vdW50GAMgASgMUgZhbW91bnQSKwoRcm'
    'VjaXBpZW50X2FkZHJlc3MYBCABKAlSEHJlY2lwaWVudEFkZHJlc3Ma5wEKF1dhc21FeGVjdXRl'
    'Q29udHJhY3RTZW5kEiUKDnNlbmRlcl9hZGRyZXNzGAEgASgJUg1zZW5kZXJBZGRyZXNzEikKEG'
    'NvbnRyYWN0X2FkZHJlc3MYAiABKAlSD2NvbnRyYWN0QWRkcmVzcxIWCgZhbW91bnQYAyABKAxS'
    'BmFtb3VudBI8ChpyZWNpcGllbnRfY29udHJhY3RfYWRkcmVzcxgEIAEoCVIYcmVjaXBpZW50Q2'
    '9udHJhY3RBZGRyZXNzEhAKA21zZxgFIAEoCVIDbXNnEhIKBGNvaW4YBiADKAlSBGNvaW4avgEK'
    'Gldhc21FeGVjdXRlQ29udHJhY3RHZW5lcmljEiUKDnNlbmRlcl9hZGRyZXNzGAEgASgJUg1zZW'
    '5kZXJBZGRyZXNzEikKEGNvbnRyYWN0X2FkZHJlc3MYAiABKAlSD2NvbnRyYWN0QWRkcmVzcxIf'
    'CgtleGVjdXRlX21zZxgDIAEoCVIKZXhlY3V0ZU1zZxItCgVjb2lucxgFIAMoCzIXLlRXLkNvc2'
    '1vcy5Qcm90by5BbW91bnRSBWNvaW5zGsABChdXYXNtSW5zdGFudGlhdGVDb250cmFjdBIWCgZz'
    'ZW5kZXIYASABKAlSBnNlbmRlchIUCgVhZG1pbhgCIAEoCVIFYWRtaW4SFwoHY29kZV9pZBgDIA'
    'EoBFIGY29kZUlkEhQKBWxhYmVsGAQgASgJUgVsYWJlbBIQCgNtc2cYBSABKAxSA21zZxI2Cgpp'
    'bml0X2Z1bmRzGAYgAygLMhcuVFcuQ29zbW9zLlByb3RvLkFtb3VudFIJaW5pdEZ1bmRzGjMKB1'
    'Jhd0pTT04SEgoEdHlwZRgBIAEoCVIEdHlwZRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWUaUwoKU2ln'
    'bkRpcmVjdBIdCgpib2R5X2J5dGVzGAEgASgMUglib2R5Qnl0ZXMSJgoPYXV0aF9pbmZvX2J5dG'
    'VzGAIgASgMUg1hdXRoSW5mb0J5dGVzGo0DChJTdGFrZUF1dGhvcml6YXRpb24SNgoKbWF4X3Rv'
    'a2VucxgBIAEoCzIXLlRXLkNvc21vcy5Qcm90by5BbW91bnRSCW1heFRva2VucxJXCgphbGxvd1'
    '9saXN0GAIgASgLMjYuVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuU3Rha2VBdXRob3JpemF0aW9u'
    'LlZhbGlkYXRvcnNIAFIJYWxsb3dMaXN0ElUKCWRlbnlfbGlzdBgDIAEoCzI2LlRXLkNvc21vcy'
    '5Qcm90by5NZXNzYWdlLlN0YWtlQXV0aG9yaXphdGlvbi5WYWxpZGF0b3JzSABSCGRlbnlMaXN0'
    'ElkKEmF1dGhvcml6YXRpb25fdHlwZRgEIAEoDjIqLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLk'
    'F1dGhvcml6YXRpb25UeXBlUhFhdXRob3JpemF0aW9uVHlwZRomCgpWYWxpZGF0b3JzEhgKB2Fk'
    'ZHJlc3MYASADKAlSB2FkZHJlc3NCDAoKdmFsaWRhdG9ycxq9AQoJQXV0aEdyYW50EhgKB2dyYW'
    '50ZXIYASABKAlSB2dyYW50ZXISGAoHZ3JhbnRlZRgCIAEoCVIHZ3JhbnRlZRJOCgtncmFudF9z'
    'dGFrZRgDIAEoCzIrLlRXLkNvc21vcy5Qcm90by5NZXNzYWdlLlN0YWtlQXV0aG9yaXphdGlvbk'
    'gAUgpncmFudFN0YWtlEh4KCmV4cGlyYXRpb24YBCABKANSCmV4cGlyYXRpb25CDAoKZ3JhbnRf'
    'dHlwZRpiCgpBdXRoUmV2b2tlEhgKB2dyYW50ZXIYASABKAlSB2dyYW50ZXISGAoHZ3JhbnRlZR'
    'gCIAEoCVIHZ3JhbnRlZRIgCgxtc2dfdHlwZV91cmwYAyABKAlSCm1zZ1R5cGVVcmwafQoHTXNn'
    'Vm90ZRIfCgtwcm9wb3NhbF9pZBgBIAEoBFIKcHJvcG9zYWxJZBIUCgV2b3RlchgCIAEoCVIFdm'
    '90ZXISOwoGb3B0aW9uGAMgASgOMiMuVFcuQ29zbW9zLlByb3RvLk1lc3NhZ2UuVm90ZU9wdGlv'
    'blIGb3B0aW9uGm4KG01zZ1N0cmlkZUxpcXVpZFN0YWtpbmdTdGFrZRIYCgdjcmVhdG9yGAEgAS'
    'gJUgdjcmVhdG9yEhYKBmFtb3VudBgCIAEoCVIGYW1vdW50Eh0KCmhvc3RfZGVub20YAyABKAlS'
    'CWhvc3REZW5vbRqJAQocTXNnU3RyaWRlTGlxdWlkU3Rha2luZ1JlZGVlbRIYCgdjcmVhdG9yGA'
    'EgASgJUgdjcmVhdG9yEhYKBmFtb3VudBgCIAEoCVIGYW1vdW50EhsKCWhvc3Rfem9uZRgDIAEo'
    'CVIIaG9zdFpvbmUSGgoIcmVjZWl2ZXIYBCABKAlSCHJlY2VpdmVyIlIKEUF1dGhvcml6YXRpb2'
    '5UeXBlEg8KC1VOU1BFQ0lGSUVEEAASDAoIREVMRUdBVEUQARIOCgpVTkRFTEVHQVRFEAISDgoK'
    'UkVERUxFR0FURRADIk4KClZvdGVPcHRpb24SEAoMX1VOU1BFQ0lGSUVEEAASBwoDWUVTEAESCw'
    'oHQUJTVEFJThACEgYKAk5PEAMSEAoMTk9fV0lUSF9WRVRPEARCDwoNbWVzc2FnZV9vbmVvZg==');

@$core.Deprecated('Use signerInfoDescriptor instead')
const SignerInfo$json = {
  '1': 'SignerInfo',
  '2': [
    {
      '1': 'public_key_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Cosmos.Proto.SignerPublicKeyType',
      '10': 'publicKeyType'
    },
    {'1': 'json_type', '3': 2, '4': 1, '5': 9, '10': 'jsonType'},
    {'1': 'protobuf_type', '3': 3, '4': 1, '5': 9, '10': 'protobufType'},
  ],
};

/// Descriptor for `SignerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signerInfoDescriptor = $convert.base64Decode(
    'CgpTaWduZXJJbmZvEkwKD3B1YmxpY19rZXlfdHlwZRgBIAEoDjIkLlRXLkNvc21vcy5Qcm90by'
    '5TaWduZXJQdWJsaWNLZXlUeXBlUg1wdWJsaWNLZXlUeXBlEhsKCWpzb25fdHlwZRgCIAEoCVII'
    'anNvblR5cGUSIwoNcHJvdG9idWZfdHlwZRgDIAEoCVIMcHJvdG9idWZUeXBl');

@$core.Deprecated('Use signingInputDescriptor instead')
const SigningInput$json = {
  '1': 'SigningInput',
  '2': [
    {
      '1': 'signing_mode',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.TW.Cosmos.Proto.SigningMode',
      '10': 'signingMode'
    },
    {'1': 'account_number', '3': 2, '4': 1, '5': 4, '10': 'accountNumber'},
    {'1': 'chain_id', '3': 3, '4': 1, '5': 9, '10': 'chainId'},
    {
      '1': 'fee',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Fee',
      '10': 'fee'
    },
    {'1': 'memo', '3': 5, '4': 1, '5': 9, '10': 'memo'},
    {'1': 'sequence', '3': 6, '4': 1, '5': 4, '10': 'sequence'},
    {'1': 'private_key', '3': 7, '4': 1, '5': 12, '10': 'privateKey'},
    {
      '1': 'messages',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.TW.Cosmos.Proto.Message',
      '10': 'messages'
    },
    {
      '1': 'mode',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.TW.Cosmos.Proto.BroadcastMode',
      '10': 'mode'
    },
    {'1': 'public_key', '3': 10, '4': 1, '5': 12, '10': 'publicKey'},
    {
      '1': 'tx_hasher',
      '3': 11,
      '4': 1,
      '5': 14,
      '6': '.TW.Cosmos.Proto.TxHasher',
      '10': 'txHasher'
    },
    {
      '1': 'signer_info',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.TW.Cosmos.Proto.SignerInfo',
      '10': 'signerInfo'
    },
    {'1': 'timeout_height', '3': 13, '4': 1, '5': 4, '10': 'timeoutHeight'},
  ],
};

/// Descriptor for `SigningInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInputDescriptor = $convert.base64Decode(
    'CgxTaWduaW5nSW5wdXQSPwoMc2lnbmluZ19tb2RlGAEgASgOMhwuVFcuQ29zbW9zLlByb3RvLl'
    'NpZ25pbmdNb2RlUgtzaWduaW5nTW9kZRIlCg5hY2NvdW50X251bWJlchgCIAEoBFINYWNjb3Vu'
    'dE51bWJlchIZCghjaGFpbl9pZBgDIAEoCVIHY2hhaW5JZBImCgNmZWUYBCABKAsyFC5UVy5Db3'
    'Ntb3MuUHJvdG8uRmVlUgNmZWUSEgoEbWVtbxgFIAEoCVIEbWVtbxIaCghzZXF1ZW5jZRgGIAEo'
    'BFIIc2VxdWVuY2USHwoLcHJpdmF0ZV9rZXkYByABKAxSCnByaXZhdGVLZXkSNAoIbWVzc2FnZX'
    'MYCCADKAsyGC5UVy5Db3Ntb3MuUHJvdG8uTWVzc2FnZVIIbWVzc2FnZXMSMgoEbW9kZRgJIAEo'
    'DjIeLlRXLkNvc21vcy5Qcm90by5Ccm9hZGNhc3RNb2RlUgRtb2RlEh0KCnB1YmxpY19rZXkYCi'
    'ABKAxSCXB1YmxpY0tleRI2Cgl0eF9oYXNoZXIYCyABKA4yGS5UVy5Db3Ntb3MuUHJvdG8uVHhI'
    'YXNoZXJSCHR4SGFzaGVyEjwKC3NpZ25lcl9pbmZvGAwgASgLMhsuVFcuQ29zbW9zLlByb3RvLl'
    'NpZ25lckluZm9SCnNpZ25lckluZm8SJQoOdGltZW91dF9oZWlnaHQYDSABKARSDXRpbWVvdXRI'
    'ZWlnaHQ=');

@$core.Deprecated('Use signingOutputDescriptor instead')
const SigningOutput$json = {
  '1': 'SigningOutput',
  '2': [
    {'1': 'signature', '3': 1, '4': 1, '5': 12, '10': 'signature'},
    {'1': 'json', '3': 2, '4': 1, '5': 9, '10': 'json'},
    {'1': 'serialized', '3': 3, '4': 1, '5': 9, '10': 'serialized'},
    {'1': 'signature_json', '3': 4, '4': 1, '5': 9, '10': 'signatureJson'},
    {'1': 'error_message', '3': 5, '4': 1, '5': 9, '10': 'errorMessage'},
    {
      '1': 'error',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.TW.Common.Proto.SigningError',
      '10': 'error'
    },
  ],
};

/// Descriptor for `SigningOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingOutputDescriptor = $convert.base64Decode(
    'Cg1TaWduaW5nT3V0cHV0EhwKCXNpZ25hdHVyZRgBIAEoDFIJc2lnbmF0dXJlEhIKBGpzb24YAi'
    'ABKAlSBGpzb24SHgoKc2VyaWFsaXplZBgDIAEoCVIKc2VyaWFsaXplZBIlCg5zaWduYXR1cmVf'
    'anNvbhgEIAEoCVINc2lnbmF0dXJlSnNvbhIjCg1lcnJvcl9tZXNzYWdlGAUgASgJUgxlcnJvck'
    '1lc3NhZ2USMwoFZXJyb3IYBiABKA4yHS5UVy5Db21tb24uUHJvdG8uU2lnbmluZ0Vycm9yUgVl'
    'cnJvcg==');
