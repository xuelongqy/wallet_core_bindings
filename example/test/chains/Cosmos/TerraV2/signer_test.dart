import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  initTest();
  group('TerraSigner', () {
    const coin = TWCoinType.TerraV2;

    test('SignSendTx', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(1037),
        chainId: 'phoenix-1',
        memo: '',
        sequence: $fixnum.Int64(1),
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'terra1hsk6jryyqjfhp5dhc55tc9jtckygx0ep37hdd2',
              toAddress: 'terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp',
              amounts: [
                Cosmos.Amount(
                  denom: 'uluna',
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
              denom: 'uluna',
              amount: '30000',
            ),
          ],
        ),
      );

      {
        final jsonObj = input.toProto3Json();
        expectJson(json.encode(jsonObj), '''
          {
              "signingMode": "Protobuf",
              "accountNumber": "1037",
              "chainId": "phoenix-1",
              "memo": "",
              "fee": {
                  "amounts": [
                      {
                          "denom": "uluna",
                          "amount": "30000"
                      }
                  ],
                  "gas": "200000"
              },
              "sequence": "1",
              "messages": [
                  {
                      "sendCoinsMessage": {
                          "fromAddress": "terra1hsk6jryyqjfhp5dhc55tc9jtckygx0ep37hdd2",
                          "toAddress": "terra1jlgaqy9nvn2hf5t2sra9ycz8s77wnf9l0kmgcp",
                          "amounts": [
                              {
                                  "denom": "uluna",
                                  "amount": "1000000"
                              }
                          ]
                      }
                  }
              ]
          }
        ''');
      }

      final privateKey = parse_hex(
          "80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // similar tx: https://finder.terra.money/mainnet/tx/fbbe73ad2f0db3a13911dc424f8a34370dc4b7e8b66687f536797e68ee200ece
      expectJson(output.serialized, '''
        {
            "tx_bytes": "CpEBCo4BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm4KLHRlcnJhMWhzazZqcnl5cWpmaHA1ZGhjNTV0YzlqdGNreWd4MGVwMzdoZGQyEix0ZXJyYTFqbGdhcXk5bnZuMmhmNXQyc3JhOXljejhzNzd3bmY5bDBrbWdjcBoQCgV1bHVuYRIHMTAwMDAwMBJoClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiECVyhuw/N9M1V7u6oACyd0SskCOqmWfK51oYHR/5H6ncUSBAoCCAEYARIUCg4KBXVsdW5hEgUzMDAwMBDAmgwaQPh0C3rjzdixIUiyPx3FlWAxzbKILNAcSRVeQnaTl1vsI5DEfYa2oYlUBLqyilcMCcU/iaJLhex30No2ak0Zn1Q=",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          'f8740b7ae3cdd8b12148b23f1dc5956031cdb2882cd01c49155e427693975bec2390c47d86b6a1895404bab28a570c09c53f89a24b85ec77d0da366a4d199f54');
      expect(output.errorMessage, '');
      expect(output.json, '');
    });

    test('SignWasmTransferTx', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'phoenix-1',
        memo: '',
        sequence: $fixnum.Int64(3),
        messages: [
          Cosmos.Message(
            wasmExecuteContractTransferMessage:
                Cosmos.Message_WasmExecuteContractTransfer(
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
            "chainId": "phoenix-1",
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
                    "wasmExecuteContractTransferMessage": {
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

      expectJson(output.serialized, '''
        {
            "tx_bytes": "CuUBCuIBCiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QSuQEKLHRlcnJhMTh3dWtwODRkcTIyN3d1NG1naDBqbTZuOW5sbmo2cnM4MnBwOXdmEix0ZXJyYTE0ejU2bDBmcDJsc2Y4Nnp5M2h0eTJ6NDdlemtobnRodHI5eXE3NhpbeyJ0cmFuc2ZlciI6eyJhbW91bnQiOiIyNTAwMDAiLCJyZWNpcGllbnQiOiJ0ZXJyYTFqbGdhcXk5bnZuMmhmNXQyc3JhOXljejhzNzd3bmY5bDBrbWdjcCJ9fRJnClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEDcGY6x7D5iSlv61zln7pKUNfpThziVt/yJRRZyizZrAASBAoCCAEYAxITCg0KBXVsdW5hEgQzMDAwEMCaDBpAiBGbQaj+jsXE6/FssD3fC77QOxpli9GqsPea+KoNyMIEgVj89Hii+oU1bAEQS4qV0SaE2V6RNy24uCcFTIRbcQ==",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '88119b41a8fe8ec5c4ebf16cb03ddf0bbed03b1a658bd1aab0f79af8aa0dc8c2048158fcf478a2fa85356c01104b8a95d12684d95e91372db8b827054c845b71');
      expect(output.errorMessage, '');
      expect(output.json, '');
    });

    test('SignWasmGeneric', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'phoenix-1',
        memo: '',
        sequence: $fixnum.Int64(7),
        messages: [
          Cosmos.Message(
            wasmExecuteContractGeneric:
                Cosmos.Message_WasmExecuteContractGeneric(
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

      expectJson(output.serialized, '''
        {
            "tx_bytes": "CuwBCukBCiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QSwAEKLHRlcnJhMTh3dWtwODRkcTIyN3d1NG1naDBqbTZuOW5sbmo2cnM4MnBwOXdmEix0ZXJyYTE0ejU2bDBmcDJsc2Y4Nnp5M2h0eTJ6NDdlemtobnRodHI5eXE3NhpieyJ0cmFuc2ZlciI6IHsgImFtb3VudCI6ICIyNTAwMDAiLCAicmVjaXBpZW50IjogInRlcnJhMWQ3MDQ4Y3NhcDR3emN2NXptN3o2dGRxZW0yYWd5cDk2NDd2ZHlqIiB9IH0SZwpQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohA3BmOsew+Ykpb+tc5Z+6SlDX6U4c4lbf8iUUWcos2awAEgQKAggBGAcSEwoNCgV1bHVuYRIEMzAwMBDAmgwaQGlYzOoAu/PfyCTSTisGJVW9KWwifxMbCmzy2xwqNg+ZHQkDjVRyUBl7gmbXXLzdOMqtwF1CMauJhlGwmEdzhK4=",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '6958ccea00bbf3dfc824d24e2b062555bd296c227f131b0a6cf2db1c2a360f991d09038d547250197b8266d75cbcdd38caadc05d4231ab898651b098477384ae');
      expect(output.errorMessage, '');
      expect(output.json, '');
    });

    test('SignWasmGenericWithCoins', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'phoenix-1',
        memo: '',
        sequence: $fixnum.Int64(9),
        messages: [
          Cosmos.Message(
            wasmExecuteContractGeneric:
                Cosmos.Message_WasmExecuteContractGeneric(
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

      expectJson(output.serialized, '''
        {
            "tx_bytes": "CrABCq0BCiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QShAEKLHRlcnJhMTh3dWtwODRkcTIyN3d1NG1naDBqbTZuOW5sbmo2cnM4MnBwOXdmEix0ZXJyYTFzZXBmajdzMGFlZzU5Njd1eG5mazR0aHpsZXJyc2t0a3BlbG01cxoYeyAiZGVwb3NpdF9zdGFibGUiOiB7fSB9KgwKBHV1c2QSBDEwMDASZwpQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohA3BmOsew+Ykpb+tc5Z+6SlDX6U4c4lbf8iUUWcos2awAEgQKAggBGAkSEwoNCgV1bHVuYRIENzAwMBDAzyQaQEDA2foXegF+rslj6o8bX2HPJfn+q/6Ezbq2iAd0SFOTQqS8aAyywQkdZJRToXcaby1HOYL1WvmsMPgrFzChiY4=",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '40c0d9fa177a017eaec963ea8f1b5f61cf25f9feabfe84cdbab688077448539342a4bc680cb2c1091d649453a1771a6f2d473982f55af9ac30f82b1730a1898e');
      expect(output.errorMessage, '');
      expect(output.json, '');
    });

    test('SignWasmSendTx', () {
      final msgMsg = TWBase64.encode(
          TWData.createWithString('{"some_message":{}}').bytes()!);
      expect(msgMsg, 'eyJzb21lX21lc3NhZ2UiOnt9fQ==');

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(3407705),
        chainId: 'phoenix-1',
        memo: '',
        sequence: $fixnum.Int64(4),
        messages: [
          Cosmos.Message(
            wasmExecuteContractSendMessage:
                Cosmos.Message_WasmExecuteContractSend(
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
            "chainId": "phoenix-1",
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
                    "wasmExecuteContractSendMessage": {
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

      expectJson(output.serialized, '''
        {
            "tx_bytes": "CoUCCoICCiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QS2QEKLHRlcnJhMTh3dWtwODRkcTIyN3d1NG1naDBqbTZuOW5sbmo2cnM4MnBwOXdmEix0ZXJyYTE0ejU2bDBmcDJsc2Y4Nnp5M2h0eTJ6NDdlemtobnRodHI5eXE3Nhp7eyJzZW5kIjp7ImFtb3VudCI6IjI1MDAwMCIsImNvbnRyYWN0IjoidGVycmExamxnYXF5OW52bjJoZjV0MnNyYTl5Y3o4czc3d25mOWwwa21nY3AiLCJtc2ciOiJleUp6YjIxbFgyMWxjM05oWjJVaU9udDlmUT09In19EmcKUApGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQNwZjrHsPmJKW/rXOWfukpQ1+lOHOJW3/IlFFnKLNmsABIECgIIARgEEhMKDQoFdWx1bmESBDMwMDAQwJoMGkBKJbW1GDrv9j2FIckm7MtpDZzP2RjgDjU84oYmOHNHsxEBPLjtt3YAjsKWBCAsjbnbVoJ3s2XFG08nxQXS9xBK",
            "mode": "BROADCAST_MODE_BLOCK"
        }
      ''');
      expectHex(output.signature,
          '4a25b5b5183aeff63d8521c926eccb690d9ccfd918e00e353ce28626387347b311013cb8edb776008ec29604202c8db9db568277b365c51b4f27c505d2f7104a');
      expect(output.json, '');
    });
  });
}
