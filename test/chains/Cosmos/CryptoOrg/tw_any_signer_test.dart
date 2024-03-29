import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

final Address1 = "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0";
final Address2 = "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus";
final PrivateKey1 =
    "200e439e39cf1aad465ee3de6166247f914cbc0f823fc2dd48bf16dcd556f39d";

void main() {
  group('TWAnySignerCryptoorg', () {
    const coin = TWCoinType.TWCoinTypeCryptoOrg;

    test('SignTx_Proto_BCB213', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(125798),
        sequence: $fixnum.Int64(2),
        chainId: 'crypto-org-chain-mainnet-1',
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: Address1,
              toAddress: Address2,
              amounts: [
                Cosmos.Amount(
                  denom: 'basecro',
                  amount: '50000000',
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

      final privateKey = parse_hex(PrivateKey1);
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://crypto.org/explorer/tx/BCB213B0A121F0CF11BECCF52475F1C8328D6070F3CFDA9E14C42E6DB30E847E
      // curl -H 'Content-Type: application/json' --data-binary '{"tx_bytes": "CpABC...F0SI=", "mode": "BROADCAST_MODE_BLOCK"}' https://mainnet.crypto.org:1317/cosmos/tx/v1beta1/txs
      expectJson(output.serialized,
          "{\"tx_bytes\": \"CpABCo0BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm0KKmNybzFjdHd0Y3dwZ2tza3k5ODhkaHRoNmpzbHh2ZXVtZ3UwZDQ1emdmMBIqY3JvMXhwYWh5NmM3d2xkeGFjdjZsZDk5aDQzNW1odmZuc3VwMjR2Y3VzGhMKB2Jhc2Vjcm8SCDUwMDAwMDAwEmkKUApGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQOIMbBhYj5+i+WdiIxxCEpFyNCJMHy/XsVdxiwde9Vr4xIECgIIARgCEhUKDwoHYmFzZWNybxIENTAwMBDAmgwaQAcxK9xk6r69gmz+1UWaCnYxNuXPXZdp59YcqKPJE5d6fp+IICTBOwd2rs8MiApcf8kNSrbZ6oECxcGQAdxF0SI=\", \"mode\": \"BROADCAST_MODE_BLOCK\"}");
      expectHex(output.signature,
          '07312bdc64eabebd826cfed5459a0a763136e5cf5d9769e7d61ca8a3c913977a7e9f882024c13b0776aecf0c880a5c7fc90d4ab6d9ea8102c5c19001dc45d122');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('SignTx_Json_DDCCE4', () {
      final input = Cosmos.SigningInput(
        // obsolete
        signingMode: Cosmos.SigningMode.JSON,
        accountNumber: $fixnum.Int64(125798),
        sequence: $fixnum.Int64(0),
        chainId: 'crypto-org-chain-mainnet-1',
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: Address1,
              toAddress: Address2,
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

      final privateKey = parse_hex(PrivateKey1);
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
      expect(output.serialized, '');
      expect(output.errorMessage, '');

      /// https://crypto.org/explorer/tx/DDCCE4052040B05914CADEFE78C0A75BE363AE39504E7EF6B2EDB8A9072AD44B
      /// curl -H 'Content-Type: application/json' --data-binary '{"mode":"block","tx":{"fee": ... }}' https://mainnet.crypto.org:1317/txs
    });
  });
}
