import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../../utils.dart';

void main() {
  group('TWAnySignerStride', () {
    const coin = TWCoinType.TWCoinTypeStride;

    test('SignLiquidStaking', () {
      final privateKey = parse_hex(
          "a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433");

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(136412),
        chainId: 'stride-1',
        memo: '',
        sequence: $fixnum.Int64(0),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            msgStrideLiquidStakingStake:
                Cosmos.Message_MsgStrideLiquidStakingStake(
              creator: 'stride1mry47pkga5tdswtluy0m8teslpalkdq0a2sjge',
              amount: '100000',
              hostDenom: 'uatom',
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(500000),
          amounts: [
            Cosmos.Amount(
              denom: 'ustrd',
              amount: '0',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Successfully broadcasted: https://www.mintscan.io/stride/txs/48E51A2571D99453C4581B30CECA2A1156C0D1EBACCD3619729B5A35AD67CC94?height=3485243
      final expectedJson = '''
        {
            "mode":"BROADCAST_MODE_BLOCK",
            "tx_bytes":"CmMKYQofL3N0cmlkZS5zdGFrZWliYy5Nc2dMaXF1aWRTdGFrZRI+Ci1zdHJpZGUxbXJ5NDdwa2dhNXRkc3d0bHV5MG04dGVzbHBhbGtkcTBhMnNqZ2USBjEwMDAwMBoFdWF0b20SYgpOCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAsv9teRyiTMiKU5gzwiD1D30MeEInSnstEep5tVQRarlEgQKAggBEhAKCgoFdXN0cmQSATAQoMIeGkCDaZHV5/Z3CAQC5DXkaHmF6OKUiS5XKDsl3ZnBaaVuJjlSWV2vA7MPwGbC17P6jbVJt58ZLcxIWFt76UO3y1ix"
        }
      ''';
      expectJson(output.serialized, expectedJson);
      expectHex(output.signature,
          '836991d5e7f677080402e435e4687985e8e294892e57283b25dd99c169a56e263952595daf03b30fc066c2d7b3fa8db549b79f192dcc48585b7be943b7cb58b1');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('SignLiquidStakingRedeem', () {
      final privateKey = parse_hex(
          "a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433");

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(136412),
        chainId: 'stride-1',
        memo: '',
        sequence: $fixnum.Int64(1),
        privateKey: privateKey,
        messages: [
          Cosmos.Message(
            msgStrideLiquidStakingRedeem:
                Cosmos.Message_MsgStrideLiquidStakingRedeem(
              creator: 'stride1mry47pkga5tdswtluy0m8teslpalkdq0a2sjge',
              amount: '40000',
              receiver: 'cosmos1mry47pkga5tdswtluy0m8teslpalkdq07pswu4',
              hostZone: 'cosmoshub-4',
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(1000000),
          amounts: [
            Cosmos.Amount(
              denom: 'ustrd',
              amount: '0',
            ),
          ],
        ),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      // Successfully broadcasted: https://www.mintscan.io/stride/txs/B3D3A92A2FFB92A480A4B547A4303E6932204972A965D687DB4FB6B4E16B2C42?height=3485343
      final expectedJson = '''
        {
            "mode":"BROADCAST_MODE_BLOCK",
            "tx_bytes":"CpgBCpUBCh8vc3RyaWRlLnN0YWtlaWJjLk1zZ1JlZGVlbVN0YWtlEnIKLXN0cmlkZTFtcnk0N3BrZ2E1dGRzd3RsdXkwbTh0ZXNscGFsa2RxMGEyc2pnZRIFNDAwMDAaC2Nvc21vc2h1Yi00Ii1jb3Ntb3MxbXJ5NDdwa2dhNXRkc3d0bHV5MG04dGVzbHBhbGtkcTA3cHN3dTQSZApQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAsv9teRyiTMiKU5gzwiD1D30MeEInSnstEep5tVQRarlEgQKAggBGAESEAoKCgV1c3RyZBIBMBDAhD0aQKf84TYoPqwnXw22r0dok2fYplUFu003TlIfpoT+wqTZF1lHPC+RTAoJob6x50CnfvGlgJFBEQYPD+Ccv659VVA="
        }
      ''';
      expectJson(output.serialized, expectedJson);
      expect(TWBase64.encode(Uint8List.fromList(output.signature)),
          'p/zhNig+rCdfDbavR2iTZ9imVQW7TTdOUh+mhP7CpNkXWUc8L5FMCgmhvrHnQKd+8aWAkUERBg8P4Jy/rn1VUA==');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });
  });
}
