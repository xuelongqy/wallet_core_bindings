import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerStargaze', () {
    const coin = TWCoinType.Secret;

    test('SignNftTransferCW721', () {
      final privateKey = parse_hex(
          "a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433");

      const tokenContractAddress =
          "stars14gmjlyfz5mpv5d8zrksn0tjhz2wwvdc4yk06754alfasq9qen7fsknry42";
      const txMessage =
          '{"transfer_nft": {"recipient": "stars1kd5q7qejlqz94kpmd9pvr4v2gzgnca3lvt6xnp","token_id": "1209"}}';

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(188393),
        chainId: 'stargaze-1',
        memo: '',
        sequence: $fixnum.Int64(5),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            wasmExecuteContractGeneric:
                Cosmos.Message_WasmExecuteContractGeneric(
              senderAddress: 'stars1mry47pkga5tdswtluy0m8teslpalkdq02a8nhy',
              contractAddress: tokenContractAddress,
              executeMsg: txMessage,
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(666666),
          amounts: [
            Cosmos.Amount(
              denom: 'ustars',
              amount: '1000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://www.mintscan.io/stargaze/txs/300836A5BF9002CF38EE34A8C56E8E7E6854FA64F1DEB3AE108F381A48150F7C
      const expectedJson = '''
        {
            "mode":"BROADCAST_MODE_BLOCK",
            "tx_bytes":"CoACCv0BCiQvY29zbXdhc20ud2FzbS52MS5Nc2dFeGVjdXRlQ29udHJhY3QS1AEKLHN0YXJzMW1yeTQ3cGtnYTV0ZHN3dGx1eTBtOHRlc2xwYWxrZHEwMmE4bmh5EkBzdGFyczE0Z21qbHlmejVtcHY1ZDh6cmtzbjB0amh6Mnd3dmRjNHlrMDY3NTRhbGZhc3E5cWVuN2Zza25yeTQyGmJ7InRyYW5zZmVyX25mdCI6IHsicmVjaXBpZW50IjogInN0YXJzMWtkNXE3cWVqbHF6OTRrcG1kOXB2cjR2Mmd6Z25jYTNsdnQ2eG5wIiwidG9rZW5faWQiOiAiMTIwOSJ9fRJoClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiECy/215HKJMyIpTmDPCIPUPfQx4QidKey0R6nm1VBFquUSBAoCCAEYBRIUCg4KBnVzdGFycxIEMTAwMBCq2CgaQMx+l2sdM5DAPbDyY1p173MLnjGyNWIcRmaFiVNphLuTV3tjhwPbsXEA0hyRxyWS3vN0/xUF/JEsO9wRspj2aJ4="
        }
      ''';
      expectJson(output.serialized, expectedJson);
      expectHex(output.signature,
          'cc7e976b1d3390c03db0f2635a75ef730b9e31b235621c46668589536984bb93577b638703dbb17100d21c91c72592def374ff1505fc912c3bdc11b298f6689e');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('Sign', () {
      final privateKey = parse_hex(
          "a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433");

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(188393),
        chainId: 'stargaze-1',
        memo: '',
        sequence: $fixnum.Int64(0),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            sendCoinsMessage: Cosmos.Message_Send(
              fromAddress: 'stars1mry47pkga5tdswtluy0m8teslpalkdq02a8nhy',
              toAddress: 'stars1mry47pkga5tdswtluy0m8teslpalkdq02a8nhy',
              amounts: [
                Cosmos.Amount(
                  denom: 'ustars',
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
              denom: 'ustars',
              amount: '1000',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // https://www.mintscan.io/stargaze/txs/98D5E36CA7080DDB286FE924A5A9976ABD4EBE49C92A09D322F29AD30DE4BE4D
      const expectedJson = '''
        {
            "mode":"BROADCAST_MODE_BLOCK",
            "tx_bytes":"CpABCo0BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm0KLHN0YXJzMW1yeTQ3cGtnYTV0ZHN3dGx1eTBtOHRlc2xwYWxrZHEwMmE4bmh5EixzdGFyczFtcnk0N3BrZ2E1dGRzd3RsdXkwbTh0ZXNscGFsa2RxMDJhOG5oeRoPCgZ1c3RhcnMSBTEwMDAwEmYKTgpGCh8vY29zbW9zLmNyeXB0by5zZWNwMjU2azEuUHViS2V5EiMKIQLL/bXkcokzIilOYM8Ig9Q99DHhCJ0p7LRHqebVUEWq5RIECgIIARIUCg4KBnVzdGFycxIEMTAwMBCA8QQaQHAkntxzC1oH7Yde4+KEmnB+K3XbJIYw0q6MqMPEY65YAwBDNDOdaTu/rpehus/20MvBfbAEZiw9+whzXLpkQ5A="
        }
      ''';
      expectJson(output.serialized, expectedJson);
      expectHex(output.signature,
          '70249edc730b5a07ed875ee3e2849a707e2b75db248630d2ae8ca8c3c463ae5803004334339d693bbfae97a1bacff6d0cbc17db004662c3dfb08735cba644390');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });
  });
}
