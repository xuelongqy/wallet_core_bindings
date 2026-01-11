import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

const Address1 = "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0";
const Address2 = "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus";
const PrivateKey1 =
    "200e439e39cf1aad465ee3de6166247f914cbc0f823fc2dd48bf16dcd556f39d";

void main() {
  initTest();
  group('TWAnySignerJuno', () {
    const coin = TWCoinType.Juno;

    test('Sign', () {
      final privateKey = parse_hex(
          "a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433");
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(376606),
        chainId: 'juno-1',
        memo: '',
        sequence: $fixnum.Int64(0),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf',
              toAddress: 'juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf',
              amounts: [
                Cosmos.Amount(
                  denom: 'ujuno',
                  amount: '10000',
                ),
              ],
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(80000),
          amounts: [
            Cosmos.Amount(
              denom: 'ujuno',
              amount: '1000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));
      expect(output.error, Common.SigningError.OK);

      // https://www.mintscan.io/juno/txs/3DCE6AAF19657BCF11D44FD6BE124D57B44E04CA34851DE0ECCE619F70ECC46F
      expectJson(output.serialized, '''
        {
            "mode": "BROADCAST_MODE_BLOCK",
            "tx_bytes": "Co0BCooBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmoKK2p1bm8xbXJ5NDdwa2dhNXRkc3d0bHV5MG04dGVzbHBhbGtkcTBnbm40bWYSK2p1bm8xbXJ5NDdwa2dhNXRkc3d0bHV5MG04dGVzbHBhbGtkcTBnbm40bWYaDgoFdWp1bm8SBTEwMDAwEmUKTgpGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQLL/bXkcokzIilOYM8Ig9Q99DHhCJ0p7LRHqebVUEWq5RIECgIIARITCg0KBXVqdW5vEgQxMDAwEIDxBBpABrA2SUNtur1XqAIzNjM4UYtFylKARkfMd2YJUi11qqMkX0rZfmHrELL+QqjERn0o3vsR231fmPGJe4P0Isjwjw=="
        }
      ''');
      expectHex(output.signature,
          '06b03649436dbabd57a80233363338518b45ca52804647cc776609522d75aaa3245f4ad97e61eb10b2fe42a8c4467d28defb11db7d5f98f1897b83f422c8f08f');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });
  });
}
