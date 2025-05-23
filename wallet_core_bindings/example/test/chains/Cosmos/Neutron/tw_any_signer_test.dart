import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

const Address1 = "cro1ctwtcwpgksky988dhth6jslxveumgu0d45zgf0";
const Address2 = "cro1xpahy6c7wldxacv6ld99h435mhvfnsup24vcus";
const PrivateKey1 =
    "200e439e39cf1aad465ee3de6166247f914cbc0f823fc2dd48bf16dcd556f39d";

void main() {
  initTest();
  group('TWAnySignerNeutron', () {
    const coin = TWCoinType.Neutron;

    test('SignAirdropNeutron', () {
      const tokenContractAddress =
          "neutron1465d8udjudl6cd8kgdlh2s37p7q0cf9x7yveumqwqk6ng94qwnmq7n79qn";
      const txMessage =
          '{"claim":{"address":"neutron19h42zjnls2tpmg6yylcg6nr56cjxcx35q6xt57", "proof":["404ae2093edcca979ccb6ae4a36689cebc9c2c6a2b00b106c5396b079bf6dcf5","282fee30a25a60904f54d4f74aee8fcf8dd2822799c43be733e18e15743d4ece","e10de4202fe6532329d0d463d9669f1b659920868b9ea87d6715bfd223a86a40","564b4122c6f98653153d8e09d5a5f659fa7ebea740aa6b689c94211f8a11cc4b"], "amount":"2000000"}}';

      final privateKey = parse_hex(
          "37f0af5bc20adb6832d39368a15492cd1e9e0cc1556d4317a5f75f9ccdf525ee");
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(336),
        chainId: 'pion-1',
        memo: '',
        sequence: $fixnum.Int64(0),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            wasmExecuteContractGeneric:
                Cosmos.Message_WasmExecuteContractGeneric(
              senderAddress: 'neutron19h42zjnls2tpmg6yylcg6nr56cjxcx35q6xt57',
              contractAddress: tokenContractAddress,
              executeMsg: txMessage,
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(666666),
          amounts: [
            Cosmos.Amount(
              denom: 'untrn',
              amount: '1000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Successfully broadcasted: https://explorer.rs-testnet.polypore.xyz/pion-1/tx/28F25164B1E2556844C227819B1D5437960B7E91181B37460EC6792588FF7E4E
      expectJson(output.serialized, '''
        {
            "mode":"BROADCAST_MODE_BLOCK",
            "tx_bytes":"CpQECpEECiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QS6AMKLm5ldXRyb24xOWg0MnpqbmxzMnRwbWc2eXlsY2c2bnI1NmNqeGN4MzVxNnh0NTcSQm5ldXRyb24xNDY1ZDh1ZGp1ZGw2Y2Q4a2dkbGgyczM3cDdxMGNmOXg3eXZldW1xd3FrNm5nOTRxd25tcTduNzlxbhrxAnsiY2xhaW0iOnsiYWRkcmVzcyI6Im5ldXRyb24xOWg0MnpqbmxzMnRwbWc2eXlsY2c2bnI1NmNqeGN4MzVxNnh0NTciLCAicHJvb2YiOlsiNDA0YWUyMDkzZWRjY2E5NzljY2I2YWU0YTM2Njg5Y2ViYzljMmM2YTJiMDBiMTA2YzUzOTZiMDc5YmY2ZGNmNSIsIjI4MmZlZTMwYTI1YTYwOTA0ZjU0ZDRmNzRhZWU4ZmNmOGRkMjgyMjc5OWM0M2JlNzMzZTE4ZTE1NzQzZDRlY2UiLCJlMTBkZTQyMDJmZTY1MzIzMjlkMGQ0NjNkOTY2OWYxYjY1OTkyMDg2OGI5ZWE4N2Q2NzE1YmZkMjIzYTg2YTQwIiwiNTY0YjQxMjJjNmY5ODY1MzE1M2Q4ZTA5ZDVhNWY2NTlmYTdlYmVhNzQwYWE2YjY4OWM5NDIxMWY4YTExY2M0YiJdLCAiYW1vdW50IjoiMjAwMDAwMCJ9fRJlCk4KRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiECqPwhojhpWpB3vDr8R+qyUnDkcK3BPxS35F8OrHPq5WwSBAoCCAESEwoNCgV1bnRybhIEMTAwMBCq2CgaQMIEXC8zyuuXWuIeX7dZBBzxMjmheOP1ONitBrVZdwmuQUgClmwhOdW0JwRe8CJ5NUKqtDYZjKFAPKGEWQ2veDs="
        }
      ''');
      expectHex(output.signature,
          'c2045c2f33caeb975ae21e5fb759041cf13239a178e3f538d8ad06b5597709ae414802966c2139d5b427045ef022793542aab436198ca1403ca184590daf783b');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('SignWithdrawAirdropNeutron', () {
      const tokenContractAddress =
          "neutron1dv49y7afpq573yyk6zj2z4rn7gqh689plhtrf6223kqs8ee3tq9spqpuf2";
      const txMessage = '{"withdraw":{"amount":"313468"}}';

      final privateKey = parse_hex(
          "37f0af5bc20adb6832d39368a15492cd1e9e0cc1556d4317a5f75f9ccdf525ee");
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(336),
        chainId: 'pion-1',
        memo: '',
        sequence: $fixnum.Int64(1),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            wasmExecuteContractGeneric:
                Cosmos.Message_WasmExecuteContractGeneric(
              senderAddress: 'neutron19h42zjnls2tpmg6yylcg6nr56cjxcx35q6xt57',
              contractAddress: tokenContractAddress,
              executeMsg: txMessage,
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(666666),
          amounts: [
            Cosmos.Amount(
              denom: 'untrn',
              amount: '1000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Successfully broadcasted: https://explorer.rs-testnet.polypore.xyz/pion-1/tx/28F25164B1E2556844C227819B1D5437960B7E91181B37460EC6792588FF7E4E
      const expectedJson = '''
        {
            "mode":"BROADCAST_MODE_BLOCK",
            "tx_bytes":"CsIBCr8BCiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QSlgEKLm5ldXRyb24xOWg0MnpqbmxzMnRwbWc2eXlsY2c2bnI1NmNqeGN4MzVxNnh0NTcSQm5ldXRyb24xZHY0OXk3YWZwcTU3M3l5azZ6ajJ6NHJuN2dxaDY4OXBsaHRyZjYyMjNrcXM4ZWUzdHE5c3BxcHVmMhogeyJ3aXRoZHJhdyI6eyJhbW91bnQiOiIzMTM0NjgifX0SZwpQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAqj8IaI4aVqQd7w6/EfqslJw5HCtwT8Ut+RfDqxz6uVsEgQKAggBGAESEwoNCgV1bnRybhIEMTAwMBCq2CgaQN/zzFyDC2i/lvQUNJ9Y24sWlDsAx2pa+p7KPAIiya+TNrsVrgW9jq83gi8OPhS/+/47hPH8LYOR41TijWnLgDA="
        }
      ''';
      expectJson(output.serialized, expectedJson);
      expectHex(output.signature,
          'dff3cc5c830b68bf96f414349f58db8b16943b00c76a5afa9eca3c0222c9af9336bb15ae05bd8eaf37822f0e3e14bffbfe3b84f1fc2d8391e354e28d69cb8030');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });
  });
}
