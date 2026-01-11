import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerCosmos', () {
    const coin = TWCoinType.Cosmos;

    test('SignTx', () {
      final privateKey = parse_hex(
          "8bbec3772ddb4df68f3186440380c301af116d1422001c1877d6f5e4dba8c8af");
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(546179),
        chainId: 'cosmoshub-4',
        memo: '',
        sequence: $fixnum.Int64(0),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'cosmos1mky69cn8ektwy0845vec9upsdphktxt03gkwlx',
              toAddress: 'cosmos18s0hdnsllgcclweu9aymw4ngktr2k0rkygdzdp',
              amounts: [
                Cosmos.Amount(
                  denom: 'uatom',
                  amount: '400000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(200000),
          amounts: [
            Cosmos.Amount(
              denom: 'uatom',
              amount: '1000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      // https://www.mintscan.io/cosmos/txs/85392373F54577562067030BF0D61596C91188AA5E6CA8FFE731BD0349296411
      // curl -H 'Content-Type: application/json' --data-binary '{"tx_bytes": "CpIBC...JXoCX", "mode": "BROADCAST_MODE_BLOCK"}' https://api.cosmos.network/cosmos/tx/v1beta1/txs
      expectJson(output.serialized,
          "{\"tx_bytes\": \"CpIBCo8BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm8KLWNvc21vczFta3k2OWNuOGVrdHd5MDg0NXZlYzl1cHNkcGhrdHh0MDNna3dseBItY29zbW9zMThzMGhkbnNsbGdjY2x3ZXU5YXltdzRuZ2t0cjJrMHJreWdkemRwGg8KBXVhdG9tEgY0MDAwMDASZQpOCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAuzvXOQ3owLGf5VGjeSzHzbpEfRn1+alK0HB4T4dVjZJEgQKAggBEhMKDQoFdWF0b20SBDEwMDAQwJoMGkCvvVE6d29P30cO9/lnXyGunWMPxNY12NuqDcCnFkNM0H4CUQdl1Gc9+ogIJbro5nyzZzlv9rl2/GsZox/JXoCX\", \"mode\": \"BROADCAST_MODE_BLOCK\"}");
      expectHex(output.signature,
          'afbd513a776f4fdf470ef7f9675f21ae9d630fc4d635d8dbaa0dc0a716434cd07e02510765d4673dfa880825bae8e67cb367396ff6b976fc6b19a31fc95e8097');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('SignJSON', () {
      const jsonStr =
          '{"accountNumber":"8733","chainId":"cosmoshub-2","fee":{"amounts":[{"denom":"uatom","amount":"5000"}],"gas":"200000"}, "memo":"Testing", "messages":[{"sendCoinsMessage":{"fromAddress":"cosmos1ufwv9ymhqaal6xz47n0jhzm2wf4empfqvjy575","toAddress":"cosmos135qla4294zxarqhhgxsx0sw56yssa3z0f78pm0","amounts":[{"denom":"uatom","amount":"995000"}]}}]}';
      final key = parse_hex(
          'c9b0a273831931aa4a5f8d1a570d5021dda91d3319bd3819becdaabfb7b44e3b');
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);
      expect(result,
          '{"mode":"block","tx":{"fee":{"amount":[{"amount":"5000","denom":"uatom"}],"gas":"200000"},"memo":"Testing","msg":[{"type":"cosmos-sdk/MsgSend","value":{"amount":[{"amount":"995000","denom":"uatom"}],"from_address":"cosmos1ufwv9ymhqaal6xz47n0jhzm2wf4empfqvjy575","to_address":"cosmos135qla4294zxarqhhgxsx0sw56yssa3z0f78pm0"}}],"signatures":[{"pub_key":{"type":"tendermint/PubKeySecp256k1","value":"A6EsukEXB53GhohQVeDpxtkeH8KQIayd/Co/ApYRYkTm"},"signature":"ULEpUqNzoAnYEx2x22F3ANAiPXquAU9+mqLWoAA/ZOUGTMsdb6vryzsW6AKX2Kqj1pGNdrTcQ58Z09JPyjpgEA=="}]}}');
    });
  });
}
