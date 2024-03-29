import 'dart:convert';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('THORChainSigner', () {
    const coin = TWCoinType.TWCoinTypeTHORChain;

    test('SignTx_Protobuf_7E480F', () {
      final fromAddress = TWAnyAddress.createBech32(
        string: 'thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r',
        coin: coin,
        hrp: 'thor',
      );
      final toAddress = TWAnyAddress.createBech32(
        string: 'thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn',
        coin: coin,
        hrp: 'thor',
      );

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        chainId: 'thorchain-mainnet-v1',
        accountNumber: $fixnum.Int64(593),
        sequence: $fixnum.Int64(21),
        memo: '',
        messages: [
          Cosmos.Message(
            thorchainSendMessage: Cosmos.Message_THORChainSend(
              fromAddress: fromAddress.data,
              toAddress: toAddress.data,
              amounts: [
                Cosmos.Amount(
                  denom: 'rune',
                  amount: '38000000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(2500000),
          amounts: [
            Cosmos.Amount(
              denom: 'rune',
              amount: '200',
            ),
          ],
        ),
      );

      final jsonObj = input.toProto3Json();
      expectJson(json.encode(jsonObj), '''
        {
            "accountNumber": "593",
            "chainId": "thorchain-mainnet-v1",
            "fee": {
                "amounts": [
                    {
                        "amount": "200",
                        "denom": "rune"
                    }
                ],
                "gas": "2500000"
            },
            "messages": [
                {
                    "thorchainSendMessage": {
                        "amounts": [
                            {
                                "amount": "38000000",
                                "denom": "rune"
                            }
                        ],
                        "fromAddress": "FSLnZ9tusZcIsAOAKb+9YHvJvQ4=",
                        "toAddress": "yoZFn7AFUcffQlQMXnhpGSyDOts="
                    }
                }
            ],
            "memo": "",
            "sequence": "21",
            "signingMode": "Protobuf"
        }
      ''');

      final privateKey = parse_hex(
          "7105512f0c020a1dd759e14b865ec0125f59ac31e34d7a2807a228ed50cb343e");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://viewblock.io/thorchain/tx/7E480FA163F6C6AFA17593F214C7BBC218F69AE3BC72366E39042AF381BFE105
      // curl -H 'Content-Type: application/json' --data-binary '{"mode":"BROADCAST_MODE_BLOCK","tx_bytes":"ClIKUAoO..89g="}' https://<thornode>/cosmos/tx/v1beta1/txs
      expectJson(output.serialized, '''
        {
            "mode": "BROADCAST_MODE_BLOCK",
            "tx_bytes": "ClIKUAoOL3R5cGVzLk1zZ1NlbmQSPgoUFSLnZ9tusZcIsAOAKb+9YHvJvQ4SFMqGRZ+wBVHH30JUDF54aRksgzrbGhAKBHJ1bmUSCDM4MDAwMDAwEmYKUApGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQPtmX45bPQpL1/OWkK7pBWZzNXZbjExVKfJ6nBJ3jF8dxIECgIIARgVEhIKCwoEcnVuZRIDMjAwEKDLmAEaQKZtS3ATa26OOGvqdKm14ZbHeNfkPtIajXi5MkZ5XaX2SWOeX+YnCPZ9TxF9Jj5cVIo71m55xq4hVL3yDbRe89g="
        }
      ''');
      expectHex(output.signature,
          'a66d4b70136b6e8e386bea74a9b5e196c778d7e43ed21a8d78b93246795da5f649639e5fe62708f67d4f117d263e5c548a3bd66e79c6ae2154bdf20db45ef3d8');
      expect(output.errorMessage, '');
      expect(output.json, '');
    });

    test('SignTx_MsgDeposit', () {
      final signerAddress = TWAnyAddress.createBech32(
        string: 'thor14j5lwl8ulexrqp5x39kmkctv2937694z3jn2dz',
        coin: coin,
        hrp: 'thor',
      );

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        chainId: 'thorchain-mainnet-v1',
        accountNumber: $fixnum.Int64(75247),
        sequence: $fixnum.Int64(7),
        memo: '',
        messages: [
          Cosmos.Message(
            thorchainDepositMessage: Cosmos.Message_THORChainDeposit(
              memo: '=:DOGE.DOGE:DNhRF1h8J4ZnB1bxp9kaqhVLYetkx1nSJ5::tr:0',
              signer: signerAddress.data,
              coins: [
                Cosmos.THORChainCoin(
                  amount: '150000000',
                  decimals: $fixnum.Int64(0),
                  asset: Cosmos.THORChainAsset(
                    chain: 'THOR',
                    symbol: 'RUNE',
                    ticker: 'RUNE',
                  ),
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(50000000),
        ),
      );

      final jsonObj = input.toProto3Json();
      expectJson(json.encode(jsonObj), '''
        {
            "accountNumber": "75247",
            "chainId": "thorchain-mainnet-v1",
            "fee": {
                "gas": "50000000"
            },
            "memo": "",
            "messages": [
                {
                    "thorchainDepositMessage": {
                        "coins": [
                            {
                                "amount": "150000000",
                                "decimals": "0",
                                "asset": {
                                    "chain": "THOR",
                                    "symbol": "RUNE",
                                    "ticker": "RUNE"
                                }
                            }
                        ],
                        "memo": "=:DOGE.DOGE:DNhRF1h8J4ZnB1bxp9kaqhVLYetkx1nSJ5::tr:0",
                        "signer": "rKn3fPz+TDAGholtu2FsUWPtFqI="
                    }
                }
            ],
            "sequence": "7",
            "signingMode": "Protobuf"
        }
      ''');

      final privateKey = parse_hex(
          "2659e41d54ebd449d68b9d58510d8eeeb837ee00d6ecc760b7a731238d8c3113");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://viewblock.io/thorchain/tx/0162213E7F9D85965B1C57FA3BF9603C655B542F358318303A7B00661AE42510
      // curl -H 'Content-Type: application/json' --data-binary '{"mode":"BROADCAST_MODE_BLOCK","tx_bytes":"CoUBCoIB..hiw="}' https://<thornode>/cosmos/tx/v1beta1/txs
      expectJson(output.serialized, '''
        {
            "mode": "BROADCAST_MODE_BLOCK",
            "tx_bytes": "CoUBCoIBChEvdHlwZXMuTXNnRGVwb3NpdBJtCh8KEgoEVEhPUhIEUlVORRoEUlVORRIJMTUwMDAwMDAwEjQ9OkRPR0UuRE9HRTpETmhSRjFoOEo0Wm5CMWJ4cDlrYXFoVkxZZXRreDFuU0o1Ojp0cjowGhSsqfd8/P5MMAaGiW27YWxRY+0WohJZClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEDuZVDlIFW3DtSEBa6aUBJ0DrQHlQ+2g7lIt5ekAM25SkSBAoCCAEYBxIFEIDh6xcaQAxKMZMKbM8gdLwn23GDXfbwyCkgqWzFMFlnrqFm0u54F8T32wmsoJQAdoLIyOskYmi7nb1rhryfabeeULwRhiw="
        }
      ''');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('SignTx_Json_Deprecated', () {
      final input = Cosmos.SigningInput(
        memo: 'memo1234',
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r',
              toAddress: 'thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn',
              amounts: [
                Cosmos.Amount(
                  denom: 'rune',
                  amount: '50000000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(2000000),
          amounts: [
            Cosmos.Amount(
              denom: 'rune',
              amount: '200',
            ),
          ],
        ),
      );

      final jsonObj = input.toProto3Json();
      expectJson(json.encode(jsonObj), '''
        {
            "fee": {
                "amounts": [
                    {
                        "denom": "rune",
                        "amount": "200"
                    }
                ],
                "gas": "2000000"
            },
            "memo": "memo1234",
            "messages": [
                {
                    "sendCoinsMessage": {
                        "fromAddress": "thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r",
                        "toAddress": "thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn",
                        "amounts": [
                            {
                                "denom": "rune",
                                "amount": "50000000"
                            }
                        ]
                    }
                }
            ]
        }
      ''');

      final privateKey = parse_hex(
          "7105512f0c020a1dd759e14b865ec0125f59ac31e34d7a2807a228ed50cb343e");
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
                            "denom": "rune"
                        }
                    ],
                    "gas": "2000000"
                },
                "memo": "memo1234",
                "msg": [
                    {
                        "type": "thorchain/MsgSend",
                        "value": {
                            "amount": [
                                {
                                    "amount": "50000000",
                                    "denom": "rune"
                                }
                            ],
                            "from_address": "thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r",
                            "to_address": "thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn"
                        }
                    }
                ],
                "signatures": [
                    {
                        "pub_key": {
                            "type": "tendermint/PubKeySecp256k1",
                            "value": "A+2Zfjls9CkvX85aQrukFZnM1dluMTFUp8nqcEneMXx3"
                        },
                        "signature": "12AaNC0v51Rhz8rBf7V7rpI6oksREWrjzba3RK1v1NNlqZq62sG0aXWvStp9zZXe07Pp2FviFBAx+uqWsO30NQ=="
                    }
                ]
            }
        }
      ''');
      expectHex(output.signature,
          'd7601a342d2fe75461cfcac17fb57bae923aa24b11116ae3cdb6b744ad6fd4d365a99abadac1b46975af4ada7dcd95ded3b3e9d85be2141031faea96b0edf435');
    });

    test('SignJson', () {
      final inputJson =
          '{"fee":{"amounts":[{"denom":"rune","amount":"200"}],"gas":"2000000"},"memo":"memo1234","messages":[{"sendCoinsMessage":{"fromAddress":"thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r","toAddress":"thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn","amounts":[{"denom":"rune","amount":"50000000"}]}}]}';
      final privateKey = parse_hex(
          "7105512f0c020a1dd759e14b865ec0125f59ac31e34d7a2807a228ed50cb343e");

      final outputJson =
          TWAnySigner.signJSON(json: inputJson, coin: coin, key: privateKey);

      expect(outputJson,
          '{"mode":"block","tx":{"fee":{"amount":[{"amount":"200","denom":"rune"}],"gas":"2000000"},"memo":"memo1234","msg":[{"type":"thorchain/MsgSend","value":{"amount":[{"amount":"50000000","denom":"rune"}],"from_address":"thor1z53wwe7md6cewz9sqwqzn0aavpaun0gw0exn2r","to_address":"thor1e2ryt8asq4gu0h6z2sx9u7rfrykgxwkmr9upxn"}}],"signatures":[{"pub_key":{"type":"tendermint/PubKeySecp256k1","value":"A+2Zfjls9CkvX85aQrukFZnM1dluMTFUp8nqcEneMXx3"},"signature":"12AaNC0v51Rhz8rBf7V7rpI6oksREWrjzba3RK1v1NNlqZq62sG0aXWvStp9zZXe07Pp2FviFBAx+uqWsO30NQ=="}]}}');
    });
  });
}
