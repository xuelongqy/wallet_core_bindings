import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('CosmosSigner', () {
    const coin = TWCoinType.Cosmos;

    test('SignDirect1', () {
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(1037),
        chainId: 'gaia-13003',
        messages: [
          Cosmos.Message(
            signDirectMessage: Cosmos.Message_SignDirect(
              bodyBytes: parse_hex(
                  '0a89010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e6412690a2d636f736d6f733168736b366a727979716a6668703564686335357463396a74636b796778306570683664643032122d636f736d6f73317a743530617a7570616e716c66616d356166687633686578777975746e756b656834633537331a090a046d756f6e120131'),
              authInfoBytes: parse_hex(
                  '0a500a460a1f2f636f736d6f732e63727970746f2e736563703235366b312e5075624b657912230a210257286ec3f37d33557bbbaa000b27744ac9023aa9967cae75a181d1ff91fa9dc512040a020801180812110a0b0a046d756f6e120332303010c09a0c'),
            ),
          ),
        ],
      );
      {
        final jsonStr = input.toProto3Json();
        expectJson(json.encode(jsonStr),
            '{"signingMode":"Protobuf","accountNumber":"1037","chainId":"gaia-13003","messages":[{"signDirectMessage":{"bodyBytes":"CokBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmkKLWNvc21vczFoc2s2anJ5eXFqZmhwNWRoYzU1dGM5anRja3lneDBlcGg2ZGQwMhItY29zbW9zMXp0NTBhenVwYW5xbGZhbTVhZmh2M2hleHd5dXRudWtlaDRjNTczGgkKBG11b24SATE=","authInfoBytes":"ClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiECVyhuw/N9M1V7u6oACyd0SskCOqmWfK51oYHR/5H6ncUSBAoCCAEYCBIRCgsKBG11b24SAzIwMBDAmgw="}}]}');
      }
      final privateKey = parse_hex(
          "80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectJson(output.serialized,
          "{\"tx_bytes\": \"CowBCokBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmkKLWNvc21vczFoc2s2anJ5eXFqZmhwNWRoYzU1dGM5anRja3lneDBlcGg2ZGQwMhItY29zbW9zMXp0NTBhenVwYW5xbGZhbTVhZmh2M2hleHd5dXRudWtlaDRjNTczGgkKBG11b24SATESZQpQCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAlcobsPzfTNVe7uqAAsndErJAjqplnyudaGB0f+R+p3FEgQKAggBGAgSEQoLCgRtdW9uEgMyMDAQwJoMGkD54fQAFlekIAnE62hZYl0uQelh/HLv0oQpCciY5Dn8H1SZFuTsrGdu41PH1Uxa4woptCELi/8Ov9yzdeEFAC9H\", \"mode\": \"BROADCAST_MODE_BLOCK\"}");
      expectHex(output.signature,
          'f9e1f4001657a42009c4eb6859625d2e41e961fc72efd2842909c898e439fc1f549916e4ecac676ee353c7d54c5ae30a29b4210b8bff0ebfdcb375e105002f47');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('SignDirect_0a90010a', () {
      // MsgSend:
      //   from: cosmos1pkptre7fdkl6gfrzlesjjvhxhlc3r4gmmk8rs6
      //   to: cosmos1qypqxpq9qcrsszg2pvxq6rs0zqg3yyc5lzv7xu
      //   amount: 1234567 ucosm
      final bodyBytes = parse_hex(
          "0a90010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e6412700a2d636f736d6f7331706b707472653766646b6c366766727a6c65736a6a766878686c63337234676d6d6b38727336122d636f736d6f7331717970717870713971637273737a673270767871367273307a716733797963356c7a763778751a100a0575636f736d120731323334353637");

      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(1),
        chainId: 'cosmoshub-4',
        messages: [
          Cosmos.Message(
            signDirectMessage: Cosmos.Message_SignDirect(
              bodyBytes: bodyBytes,
              authInfoBytes: parse_hex(
                  "0a0a0a0012040a020801180112130a0d0a0575636f736d12043230303010c09a0c"),
            ),
          ),
        ],
      );

      {
        final jsonStr = input.toProto3Json();
        expectJson(json.encode(jsonStr),
            '{"signingMode":"Protobuf","accountNumber":"1","chainId":"cosmoshub-4","messages":[{"signDirectMessage":{"bodyBytes":"CpABChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEnAKLWNvc21vczFwa3B0cmU3ZmRrbDZnZnJ6bGVzamp2aHhobGMzcjRnbW1rOHJzNhItY29zbW9zMXF5cHF4cHE5cWNyc3N6ZzJwdnhxNnJzMHpxZzN5eWM1bHp2N3h1GhAKBXVjb3NtEgcxMjM0NTY3","authInfoBytes":"CgoKABIECgIIARgBEhMKDQoFdWNvc20SBDIwMDAQwJoM"}}]}');
      }

      final privateKey = parse_hex(
          "80e81ea269e66a0a05b11236df7919fb7fbeedba87452d667489d7403a02f005");
      input.privateKey = privateKey;

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expectJson(output.serialized,
          "{\"tx_bytes\": \"CpMBCpABChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEnAKLWNvc21vczFwa3B0cmU3ZmRrbDZnZnJ6bGVzamp2aHhobGMzcjRnbW1rOHJzNhItY29zbW9zMXF5cHF4cHE5cWNyc3N6ZzJwdnhxNnJzMHpxZzN5eWM1bHp2N3h1GhAKBXVjb3NtEgcxMjM0NTY3EiEKCgoAEgQKAggBGAESEwoNCgV1Y29zbRIEMjAwMBDAmgwaQEgXmSAlm4M5bz+OX1GtvvZ3fBV2wrZrp4A/Imd55KM7ASivB/siYJegmYiOKzQ82uwoEmFalNnG2BrHHDwDR2Y=\", \"mode\": \"BROADCAST_MODE_BLOCK\"}");
      expectHex(output.signature,
          '48179920259b83396f3f8e5f51adbef6777c1576c2b66ba7803f226779e4a33b0128af07fb226097a099888e2b343cdaec2812615a94d9c6d81ac71c3c034766');
      expect(output.json, '');
      expect(output.errorMessage, '');
    });

    test('MsgVote', () {
      // Successfully broadcasted https://www.mintscan.io/cosmos/txs/2EFA054B842B1641B131137B13360F95164C6C1D51BB4A4AC6DE8F75F504AA4C
      final input = Cosmos.SigningInput(
        signingMode: Cosmos.SigningMode.Protobuf,
        accountNumber: $fixnum.Int64(1366160),
        chainId: 'cosmoshub-4',
        memo: '',
        sequence: $fixnum.Int64(0),
        messages: [
          Cosmos.Message(
            msgVote: Cosmos.Message_MsgVote(
              voter: 'cosmos1mry47pkga5tdswtluy0m8teslpalkdq07pswu4',
              proposalId: $fixnum.Int64(77),
              option: Cosmos.Message_VoteOption.YES,
            ),
          ),
        ],
        fee: Cosmos.Fee(
          gas: $fixnum.Int64(97681),
          amounts: [
            Cosmos.Amount(
              denom: 'uatom',
              amount: '2418',
            ),
          ],
        ),
        privateKey: parse_hex(
            'a498a9ee41af9bab5ef2a8be63d5c970135c3c109e70efc8c56c534e6636b433'),
      );

      final output = Cosmos.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const expected =
          '{"mode":"BROADCAST_MODE_BLOCK","tx_bytes":"ClQKUgobL2Nvc21vcy5nb3YudjFiZXRhMS5Nc2dWb3RlEjMITRItY29zbW9zMW1yeTQ3cGtnYTV0ZHN3dGx1eTBtOHRlc2xwYWxrZHEwN3Bzd3U0GAESZQpOCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAsv9teRyiTMiKU5gzwiD1D30MeEInSnstEep5tVQRarlEgQKAggBEhMKDQoFdWF0b20SBDI0MTgQkfsFGkA+Nb3NULc38quGC1x+8ZXry4w9mMX3IA7wUjFboTv7kVOwPlleIc8UqIsjVvKTUFnUuW8dlGQzNR1KkvbvZ1NA"}';
      expectJson(output.serialized, expected);
    });
  });
}
