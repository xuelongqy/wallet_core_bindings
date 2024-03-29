import 'dart:convert';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('TerraClassicSigner', () {
    const coin = TWCoinType.TWCoinTypeTerra;

    test('SignSendTx', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.JSON,
        accountNumber: $fixnum.Int64(1037),
        chainId: 'columbus-5',
        memo: '',
        sequence: $fixnum.Int64(2),
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'terra1hsk6jryyqjfhp5dhc55tc9jtckygx0ep37hdd2',
              toAddress: 'terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf',
              amounts: [
                Cosmos.Amount(
                  denom: 'luna',
                  amount: '1000000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'luna',
              amount: '200',
            ),
          ],
        ),
      );

      final jsonObj = input.toProto3Json();
      expectJson(json.encode(jsonObj),
          '{"signingMode":"JSON","accountNumber":"1037","chainId":"columbus-5","memo":"","fee":{"amounts":[{"denom":"luna","amount":"200"}],"gas":"200000"},"sequence":"2","messages":[{"sendCoinsMessage":{"fromAddress":"terra1hsk6jryyqjfhp5dhc55tc9jtckygx0ep37hdd2","toAddress":"terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf","amounts":[{"denom":"luna","amount":"1000000"}]}}]}');

      final privateKey = parse_hex(
          "80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectJson(output.json, '''
        {
            "mode": "block",
            "tx": {
                "fee": {
                    "amount": [
                        {
                            "amount": "200",
                            "denom": "luna"
                        }
                    ],
                    "gas": "200000"
                },
                "memo": "",
                "msg": [
                    {
                        "type": "cosmos-sdk/MsgSend",
                        "value": {
                            "amount": [
                                {
                                    "amount": "1000000",
                                    "denom": "luna"
                                }
                            ],
                            "from_address": "terra1hsk6jryyqjfhp5dhc55tc9jtckygx0ep37hdd2",
                            "to_address": "terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf"
                        }
                    }
                ],
                "signatures": [
                    {
                        "pub_key": {
                            "type": "tendermint/PubKeySecp256k1",
                            "value": "AlcobsPzfTNVe7uqAAsndErJAjqplnyudaGB0f+R+p3F"
                        },
                        "signature": "ofdIsLJzkODcQwLG89eE2g4HOaUmfKPh/08t07ehKPUqRMl4rVonzo73mkOvqtrHWjdtB+6t6R8DGudPpb6bRg=="
                    }
                ]
            }
        }
      ''');
      expectHex(output.signature,
          'a1f748b0b27390e0dc4302c6f3d784da0e0739a5267ca3e1ff4f2dd3b7a128f52a44c978ad5a27ce8ef79a43afaadac75a376d07eeade91f031ae74fa5be9b46');
      expect(output.serialized, '');
      expect(output.errorMessage, '');
    });

    test('SignWasmTransferTxProtobuf_9FF3F0', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'columbus-5',
        memo: '',
        sequence: $fixnum.Int64(3),
        messages: [
          Cosmos.Message(
            wasmTerraExecuteContractTransferMessage:
                Cosmos.Message_WasmTerraExecuteContractTransfer(
              senderAddress: 'terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf',
              contractAddress: 'terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76',
              recipientAddress: 'terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp',
              amount: intToBytes(250000),
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'uluna',
              amount: '3000',
            ),
          ],
        ),
      );

      final jsonObj = input.toProto3Json();
      expectJson(json.encode(jsonObj), '''
        {
            "signingMode": "Protobuf",
            "accountNumber": "3407705",
            "chainId": "columbus-5",
            "memo": "",
            "fee": {
                "amounts": [
                    {
                        "denom": "uluna",
                        "amount": "3000"
                    }
                ],
                "gas": "200000"
            },
            "sequence": "3",
            "messages": [
                {
                    "wasmTerraExecuteContractTransferMessage": {
                        "senderAddress": "terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf",
                        "contractAddress": "terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76",
                        "amount": "A9CQ",
                        "recipientAddress": "terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp"
                    }
                }
            ]
        }
      ''');

      final privateKey = parse_hex(
          "cf08ee8493e6f6a53f9721b9045576e80f371c0e36d08fdaf78b27a7afd8e616");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://finder.terra.money/mainnet/tx/9FF3F0A16879254C22EB90D8B4D6195467FE5014381FD36BD3C23CA6698FE94B
      // curl -H 'Content-Type: application/json' --data-binary '{"mode": "BROADCAST_MODE_BLOCK","tx_bytes": "CogCCo..wld8"})' https://<lcd-node-url>/cosmos/tx/v1beta1/txs

      expectJson(output.serialized, '''
        {
            "tx_bytes": "CucBCuQBCiYvdGVycmEud2FzbS52MWJldGExLk1zZ0V4ZWN1dGVDb250cmFjdBK5AQosdGVycmExOHd1a3A4NGRxMjI3d3U0bWdoMGptNm45bmxuajZyczgycHA5d2YSLHRlcnJhMTR6NTZsMGZwMmxzZjg2enkzaHR5Mno0N2V6a2hudGh0cjl5cTc2Glt7InRyYW5zZmVyIjp7ImFtb3VudCI6IjI1MDAwMCIsInJlY2lwaWVudCI6InRlcnJhMWpsZ2FxeTludm4yaGY1dDJzcmE5eWN6OHM3N3duZjlsMGttZ2NwIn19EmcKUApGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQNwZjrHsPmJKW/rXOWfukpQ1+lOHOJW3/IlFFnKLNmsABIECgIIARgDEhMKDQoFdWx1bmESBDMwMDAQwJoMGkAaprIEMLPH2HmFdwFGoaipb2GIyhXt6ombz+WMnG2mORBI6gFt0M+IymYgzZz6w1SW52R922yafDnn7yXfutRw",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '1aa6b20430b3c7d87985770146a1a8a96f6188ca15edea899bcfe58c9c6da6391048ea016dd0cf88ca6620cd9cfac35496e7647ddb6c9a7c39e7ef25dfbad470');
      expect(output.json, '');
    });

    test('SignWasmTransferTxJson_078E90', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.JSON,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'columbus-5',
        memo: '',
        sequence: $fixnum.Int64(2),
        messages: [
          Cosmos.Message(
            wasmTerraExecuteContractTransferMessage:
                Cosmos.Message_WasmTerraExecuteContractTransfer(
              senderAddress: 'terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf',
              contractAddress: 'terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76',
              recipientAddress: 'terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp',
              amount: intToBytes(250000),
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'uluna',
              amount: '3000',
            ),
          ],
        ),
      );

      final privateKey = parse_hex(
          "cf08ee8493e6f6a53f9721b9045576e80f371c0e36d08fdaf78b27a7afd8e616");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://finder.terra.money/mainnet/tx/078E90458061611F6FD8B708882B55FF5C1FFB3FCE61322107A0A0DE39FC0F3E
      // curl -H 'Content-Type: application/json' --data-binary '{"mode": "block","tx":{...}}' https://<lcd-node-url>/txs
      expectJson(output.json, '''
        {
            "mode": "block",
            "tx":
                {
                    "fee": {"amount":[{"amount": "3000","denom": "uluna"}],"gas": "200000"},
                    "memo": "",
                    "msg":
                        [
                            {
                                "type": "wasm/MsgExecuteContract",
                                "value":
                                    {
                                        "sender": "terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf",
                                        "contract": "terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76",
                                        "execute_msg":
                                            {
                                                "transfer":
                                                    {
                                                        "amount": "250000",
                                                        "recipient": "terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp"
                                                    }
                                            },
                                        "coins": []
                                    }
                            }
                        ],
                    "signatures":
                        [
                            {
                                "pub_key":
                                    {
                                        "type": "tendermint/PubKeySecp256k1",
                                        "value": "A3BmOsew+Ykpb+tc5Z+6SlDX6U4c4lbf8iUUWcos2awA"
                                    },
                                "signature": "BjETdtbA97Wv1zvcsCV1tM+bdYKC8O3uGTk4mMRv6pBJB2y/Ds7qoS7s/zrkhYak1YChklQetHsI30XRXzGIkg=="
                            }
                        ]
                }
        }
      ''');
      expectHex(output.signature,
          '06311376d6c0f7b5afd73bdcb02575b4cf9b758282f0edee19393898c46fea9049076cbf0eceeaa12eecff3ae48586a4d580a192541eb47b08df45d15f318892');
      expect(output.serialized, '');
    });

    test('SignWasmGeneric_EC4F85', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'columbus-5',
        memo: '',
        sequence: $fixnum.Int64(7),
        messages: [
          Cosmos.Message(
            wasmTerraExecuteContractGeneric:
                Cosmos.Message_WasmTerraExecuteContractGeneric(
              senderAddress: 'terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf',
              contractAddress: 'terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76',
              executeMsg:
                  '{"transfer": { "amount": "250000", "recipient": "terra1d7048csap4wzcv5zm7z6tdqem2agyp9647vdyj" } }',
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'uluna',
              amount: '3000',
            ),
          ],
        ),
      );

      final privateKey = parse_hex(
          "cf08ee8493e6f6a53f9721b9045576e80f371c0e36d08fdaf78b27a7afd8e616");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://finder.terra.money/mainnet/tx/EC4F8532847E4D6AF016E6F6D3F027AE7FB6FF0B533C5132B01382D83B214A6F
      // curl -H 'Content-Type: application/json' --data-binary '{"mode": "BROADCAST_MODE_BLOCK","tx_bytes": "Cu4BC...iVt"})' https://<lcd-node-url>/cosmos/tx/v1beta1/txs
      expectJson(output.serialized, '''
        {
            "tx_bytes": "Cu4BCusBCiYvdGVycmEud2FzbS52MWJldGExLk1zZ0V4ZWN1dGVDb250cmFjdBLAAQosdGVycmExOHd1a3A4NGRxMjI3d3U0bWdoMGptNm45bmxuajZyczgycHA5d2YSLHRlcnJhMTR6NTZsMGZwMmxzZjg2enkzaHR5Mno0N2V6a2hudGh0cjl5cTc2GmJ7InRyYW5zZmVyIjogeyAiYW1vdW50IjogIjI1MDAwMCIsICJyZWNpcGllbnQiOiAidGVycmExZDcwNDhjc2FwNHd6Y3Y1em03ejZ0ZHFlbTJhZ3lwOTY0N3ZkeWoiIH0gfRJnClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEDcGY6x7D5iSlv61zln7pKUNfpThziVt/yJRRZyizZrAASBAoCCAEYBxITCg0KBXVsdW5hEgQzMDAwEMCaDBpAkPsS7xlSng2LMc9KiD1soN5NLaDcUh8I9okPmsdJN3le1B7yxRGNB4aQfhaRl/8Z0r5vitRT0AWuxDasd8wcFw==",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '90fb12ef19529e0d8b31cf4a883d6ca0de4d2da0dc521f08f6890f9ac74937795ed41ef2c5118d0786907e169197ff19d2be6f8ad453d005aec436ac77cc1c17');
      expect(output.json, '');
    });

    test('SignWasmGenericWithCoins_6651FC', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'columbus-5',
        memo: '',
        sequence: $fixnum.Int64(9),
        messages: [
          Cosmos.Message(
            wasmTerraExecuteContractGeneric:
                Cosmos.Message_WasmTerraExecuteContractGeneric(
              senderAddress: 'terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf',
              contractAddress: 'terra1sepfj7s0aeg5967uxnfk4thzlerrsktkpelm5s',
              executeMsg: '{ "deposit_stable": {} }',
              coins: [
                Cosmos.Amount(
                  denom: 'uusd',
                  amount: '1000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(600000),
          amounts: [
            Cosmos.Amount(
              denom: 'uluna',
              amount: '7000',
            ),
          ],
        ),
      );

      final privateKey = parse_hex(
          "cf08ee8493e6f6a53f9721b9045576e80f371c0e36d08fdaf78b27a7afd8e616");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://finder.terra.money/mainnet/tx/6651FCE0EE5C6D6ACB655CC49A6FD5E939FB082862854616EA0642475BCDD0C9
      // curl -H 'Content-Type: application/json' --data-binary '{"mode": "BROADCAST_MODE_BLOCK","tx_bytes": "CrIBCq8B.....0NWg=="})' https://<lcd-node-url>/cosmos/tx/v1beta1/txs
      expectJson(output.serialized, '''
        {
            "tx_bytes": "CrIBCq8BCiYvdGVycmEud2FzbS52MWJldGExLk1zZ0V4ZWN1dGVDb250cmFjdBKEAQosdGVycmExOHd1a3A4NGRxMjI3d3U0bWdoMGptNm45bmxuajZyczgycHA5d2YSLHRlcnJhMXNlcGZqN3MwYWVnNTk2N3V4bmZrNHRoemxlcnJza3RrcGVsbTVzGhh7ICJkZXBvc2l0X3N0YWJsZSI6IHt9IH0qDAoEdXVzZBIEMTAwMBJnClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEDcGY6x7D5iSlv61zln7pKUNfpThziVt/yJRRZyizZrAASBAoCCAEYCRITCg0KBXVsdW5hEgQ3MDAwEMDPJBpAGyi7f1ioY8XV6pjFq1s86Om4++CIUnd3rLHif2iopCcYvX0mLkTlQ6NUERg8nWTYgXcj6fOTO/ptgPuAtv0NWg==",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '1b28bb7f58a863c5d5ea98c5ab5b3ce8e9b8fbe088527777acb1e27f68a8a42718bd7d262e44e543a35411183c9d64d8817723e9f3933bfa6d80fb80b6fd0d5a');
      expect(output.json, '');
    });

    test('SignWasmSendTxProtobuf', () {
      final msgMsg = TWBase64.encode(
          TWData.createWithString('{"some_message":{}}').bytes()!);
      expect(msgMsg, 'eyJzb21lX21lc3NhZ2UiOnt9fQ==');

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'columbus-5',
        memo: '',
        sequence: $fixnum.Int64(4),
        messages: [
          Cosmos.Message(
            wasmTerraExecuteContractSendMessage:
                Cosmos.Message_WasmTerraExecuteContractSend(
              senderAddress: 'terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf',
              contractAddress: 'terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76',
              recipientContractAddress:
                  'terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp',
              amount: intToBytes(250000),
              msg: msgMsg,
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'uluna',
              amount: '3000',
            ),
          ],
        ),
      );

      final jsonObj = input.toProto3Json();
      expectJson(json.encode(jsonObj), '''
        {
            "signingMode": "Protobuf",
            "accountNumber": "3407705",
            "chainId": "columbus-5",
            "memo": "",
            "fee": {
                "amounts": [
                    {
                        "denom": "uluna",
                        "amount": "3000"
                    }
                ],
                "gas": "200000"
            },
            "sequence": "4",
            "messages": [
                {
                    "wasmTerraExecuteContractSendMessage": {
                        "senderAddress": "terra18wukp84dq227wu4mgh0jm6n9nlnj6rs82pp9wf",
                        "contractAddress": "terra14z56l0fp2lsf86zy3hty2z47ezkhnthtr9yq76",
                        "amount": "A9CQ",
                        "recipientContractAddress": "terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp",
                        "msg": "eyJzb21lX21lc3NhZ2UiOnt9fQ=="
                    }
                }
            ]
        }
      ''');

      final privateKey = parse_hex(
          "cf08ee8493e6f6a53f9721b9045576e80f371c0e36d08fdaf78b27a7afd8e616");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://finder.terra.money/mainnet/tx/9FF3F0A16879254C22EB90D8B4D6195467FE5014381FD36BD3C23CA6698FE94B
      // curl -H 'Content-Type: application/json' --data-binary '{"mode": "BROADCAST_MODE_BLOCK","tx_bytes": "CogCCo..wld8"})' https://<lcd-node-url>/cosmos/tx/v1beta1/txs
      expectJson(output.serialized, '''
        {
            "tx_bytes": "CocCCoQCCiYvdGVycmEud2FzbS52MWJldGExLk1zZ0V4ZWN1dGVDb250cmFjdBLZAQosdGVycmExOHd1a3A4NGRxMjI3d3U0bWdoMGptNm45bmxuajZyczgycHA5d2YSLHRlcnJhMTR6NTZsMGZwMmxzZjg2enkzaHR5Mno0N2V6a2hudGh0cjl5cTc2Gnt7InNlbmQiOnsiYW1vdW50IjoiMjUwMDAwIiwiY29udHJhY3QiOiJ0ZXJyYTFqbGdhcXk5bnZuMmhmNXQyc3JhOXljejhzNzd3bmY5bDBrbWdjcCIsIm1zZyI6ImV5SnpiMjFsWDIxbGMzTmhaMlVpT250OWZRPT0ifX0SZwpQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohA3BmOsew+Ykpb+tc5Z+6SlDX6U4c4lbf8iUUWcos2awAEgQKAggBGAQSEwoNCgV1bHVuYRIEMzAwMBDAmgwaQL6NByKeRZsyq5g6CTMdmPqiM77nOe9uLO8FjpetFgkBFiG3Le7ieZZ+4vCMhD1bcFgMwSHibFI/uPil847U/+g=",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          'be8d07229e459b32ab983a09331d98faa233bee739ef6e2cef058e97ad1609011621b72deee279967ee2f08c843d5b70580cc121e26c523fb8f8a5f38ed4ffe8');
      expect(output.json, '');
    });
  });
}
