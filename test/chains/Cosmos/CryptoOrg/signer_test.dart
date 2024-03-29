import 'dart:convert';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('CryptoorgSigner', () {
    const coin = TWCoinType.TWCoinTypeCryptoOrg;

    test('SignTx_DDCCE4', () {
      final input = Cosmos.SigningInput(
        accountNumber: $fixnum.Int64(125798),
        sequence: $fixnum.Int64(0),
        chainId: 'crypto-org-chain-mainnet-1',
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0',
              toAddress: 'cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus',
              amounts: [
                Cosmos.Amount(
                  denom: 'basecro',
                  amount: '100000000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'basecro',
              amount: '5000',
            ),
          ],
        ),
      );

      final jsonStr = input.toProto3Json();
      expectJson(json.encode(jsonStr), '''
        {
            "accountNumber": "125798",
            "chainId": "crypto-org-chain-mainnet-1",
            "fee": {
                "amounts": [
                    {
                        "denom": "basecro",
                        "amount": "5000"
                    }
                ],
                "gas": "200000"
            },
            "sequence":"0",
            "messages": [
                {
                    "sendCoinsMessage": {
                        "fromAddress": "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0",
                        "toAddress": "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus",
                        "amounts": [
                            {
                                "denom": "basecro",
                                "amount": "100000000"
                            }
                        ]
                    }
                }
            ]
        }
      ''');

      final privateKey = parse_hex(
          "200e439e39cf1aad465ee3de6166247f914cbc0f823fc2dd48bf16dcd556f39d");
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
                            "amount": "5000",
                            "denom": "basecro"
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
                                    "amount": "100000000",
                                    "denom": "basecro"
                                }
                            ],
                            "from_address": "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0",
                            "to_address": "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus"
                        }
                    }
                ],
                "signatures": [
                    {
                        "pub_key": {
                            "type": "tendermint/PubKeySecp256k1",
                            "value": "A4gxsGFiPn6L5Z2IjHEISkXI0IkwfL9exV3GLB171Wvj"
                        },
                        "signature": "5+5rSFFg0FE9cTklQWQHNktBDJsz7UCnMSgF0t0+gYcrIhEWUyTtibXaHZQbKAAaciJ1BkHXYREjU55VswByVg=="
                    }
                ]
            }
        }
      ''');
      expectHex(output.signature,
          'e7ee6b485160d0513d713925416407364b410c9b33ed40a7312805d2dd3e81872b2211165324ed89b5da1d941b28001a7222750641d7611123539e55b3007256');

      /// https://crypto.org/explorer/tx/DDCCE4052040B05914CADEFE78C0A75BE363AE39504E7EF6B2EDB8A9072AD44B
      /// curl -H 'Content-Type: application/json' --data-binary '{"mode":"block","tx":{"fee": ... }}' https://mainnet.crypto.org:1317/txs
    });

    test('SignJson', () {
      final inputJson =
          '{"accountNumber":"125798","chainId":"crypto-org-chain-mainnet-1","fee":{"amounts":[{"denom":"basecro","amount":"5000"}],"gas":"200000"},"messages":[{"sendCoinsMessage":{"fromAddress":"cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0","toAddress":"cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus","amounts":[{"denom":"basecro","amount":"100000000"}]}}]}';
      final privateKey = parse_hex(
          "200e439e39cf1aad465ee3de6166247f914cbc0f823fc2dd48bf16dcd556f39d");

      final outputJson =
          TWAnySigner.signJSON(json: inputJson, key: privateKey, coin: coin);

      expectJson(outputJson, '''
        {
            "mode": "block",
            "tx": {
                "fee": {
                    "amount": [
                        {
                            "amount": "5000",
                            "denom": "basecro"
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
                                    "amount": "100000000",
                                    "denom": "basecro"
                                }
                            ],
                            "from_address": "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0",
                            "to_address": "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus"
                        }
                    }
                ],
                "signatures": [
                    {
                        "pub_key": {
                            "type": "tendermint/PubKeySecp256k1",
                            "value": "A4gxsGFiPn6L5Z2IjHEISkXI0IkwfL9exV3GLB171Wvj"
                        },
                        "signature": "5+5rSFFg0FE9cTklQWQHNktBDJsz7UCnMSgF0t0+gYcrIhEWUyTtibXaHZQbKAAaciJ1BkHXYREjU55VswByVg=="
                    }
                ]
            }
        }
      ''');
    });
  });
}
