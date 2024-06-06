import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Cosmos.pb.dart' as Cosmos;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('CosmosCompiler', () {
    const coin = TWCoinType.Cosmos;

    test('CompileWithSignatures', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '8bbec3772ddb4df68f3186440380c301af116d1422001c1877d6f5e4dba8c8af');
      final publicKey = privateKey.getPublicKeyByType(coin.publicKeyType);

      /// Step 1: Prepare transaction input (protobuf)
      final input = Cosmos.SigningInput(
        privateKey: privateKey.data,
        accountNumber: $fixnum.Int64(546179),
        chainId: 'cosmoshub-4',
        memo: '',
        sequence: $fixnum.Int64(0),
        publicKey: publicKey.data,
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

      /// Step 2: Obtain protobuf preimage hash
      input.signingMode = Cosmos.SigningMode.Protobuf;
      final protoInputData = input.writeToBuffer();

      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, protoInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);
      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      expectHex(
        preImage,
        "0a92010a8f010a1c2f636f736d6f732e62616e6b2e763162657461312e4d736753656e64126f0a2d636f736d6f"
        "73316d6b793639636e38656b74777930383435766563397570736470686b7478743033676b776c78122d636f73"
        "6d6f733138733068646e736c6c6763636c7765753961796d77346e676b7472326b30726b7967647a64701a0f0a"
        "057561746f6d120634303030303012650a4e0a460a1f2f636f736d6f732e63727970746f2e736563703235366b"
        "312e5075624b657912230a2102ecef5ce437a302c67f95468de4b31f36e911f467d7e6a52b41c1e13e1d563649"
        "12040a02080112130a0d0a057561746f6d12043130303010c09a0c1a0b636f736d6f736875622d342083ab21",
      );
      expectHex(preImageHash,
          'fa7990e1814c900efaedf1bdbedba22c22336675befe0ae39974130fc204f3de');

      const expectedTx =
          "7b226d6f6465223a2242524f4144434153545f4d4f44455f424c4f434b222c2274785f6279746573223a224370"
          "4942436f3842436877765932397a6257397a4c6d4a68626d7375646a46695a5852684d53354e633264545a5735"
          "6b456d384b4c574e7663323176637a467461336b324f574e754f475672644864354d4467304e585a6c597a6c31"
          "63484e6b63476872644868304d444e6e61336473654249745932397a6257397a4d54687a4d47686b626e4e7362"
          "47646a593278335a58553559586c74647a52755a327430636a4a724d484a726557646b656d52774767384b4258"
          "566864473974456759304d4441774d4441535a51704f436b594b4879396a62334e7462334d7559334a35634852"
          "764c6e4e6c593341794e545a724d53355164574a4c5a586b5349776f6841757a76584f51336f774c4766355647"
          "6a65537a487a62704566526e312b616c4b30484234543464566a5a4a4567514b4167674245684d4b44516f4664"
          "57463062323053424445774d444151774a6f4d476b437676564536643239503330634f392f6c6e587947756e57"
          "4d50784e5931324e75714463436e466b4e4d304834435551646c314763392b6f67494a62726f356e797a5a7a6c"
          "7639726c322f47735a6f782f4a586f4358227d";
      Uint8List signature;
      {
        final output = Cosmos.SigningOutput.fromBuffer(
            TWAnySigner.sign(protoInputData, coin));
        expectJson(
          output.serialized,
          "{\"tx_bytes\": "
          "\"CpIBCo8BChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEm8KLWNvc21vczFta3k2OWNuOGVrdHd5MDg0NXZl"
          "Yzl1cHNkcGhrdHh0MDNna3dseBItY29zbW9zMThzMGhkbnNsbGdjY2x3ZXU5YXltdzRuZ2t0cjJrMHJreWdkemRwGg"
          "8KBXVhdG9tEgY0MDAwMDASZQpOCkYKHy9jb3Ntb3MuY3J5cHRvLnNlY3AyNTZrMS5QdWJLZXkSIwohAuzvXOQ3owLG"
          "f5VGjeSzHzbpEfRn1+alK0HB4T4dVjZJEgQKAggBEhMKDQoFdWF0b20SBDEwMDAQwJoMGkCvvVE6d29P30cO9/"
          "lnXyGunWMPxNY12NuqDcCnFkNM0H4CUQdl1Gc9+ogIJbro5nyzZzlv9rl2/GsZox/JXoCX\", \"mode\": "
          "\"BROADCAST_MODE_BLOCK\"}",
        );

        signature = Uint8List.fromList(output.signature);
        expectHex(
          signature,
          "afbd513a776f4fdf470ef7f9675f21ae9d630fc4d635d8dbaa0dc0a716434cd07e02510765d4673dfa88"
          "0825bae8e67cb367396ff6b976fc6b19a31fc95e8097",
        );
        expect(
          publicKey.verify(signature, Uint8List.fromList(preImageHash)),
          true,
        );
        expect(hexString(output.serialized), expectedTx);
      }

      {
        // Negative: not enough signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: protoInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Cosmos.SigningOutput.fromBuffer(outputData);
        expect(output.serialized.length, 0);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: protoInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Cosmos.SigningOutput.fromBuffer(outputData);
        expect(output.serialized.length, 0);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }

      /// Step 3: Obtain json preimage hash
      input.signingMode = Cosmos.SigningMode.JSON;
      final jsonInputData = input.writeToBuffer();

      final jsonPreImageHashData =
          TWTransactionCompiler.preImageHashes(coin, jsonInputData);
      final jsonPreSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(jsonPreImageHashData);
      expect(jsonPreSigningOutput.error, Common.SigningError.OK);
      final jsonPreImage = jsonPreSigningOutput.data;
      final jsonPreImageHash = jsonPreSigningOutput.dataHash;
      expectHex(
        jsonPreImage,
        "7b226163636f756e745f6e756d626572223a22353436313739222c22636861696e5f6964223a22636f73"
        "6d6f736875622d34222c22666565223a7b22616d6f756e74223a5b7b22616d6f756e74223a2231303030"
        "222c2264656e6f6d223a227561746f6d227d5d2c22676173223a22323030303030227d2c226d656d6f22"
        "3a22222c226d736773223a5b7b2274797065223a22636f736d6f732d73646b2f4d736753656e64222c22"
        "76616c7565223a7b22616d6f756e74223a5b7b22616d6f756e74223a22343030303030222c2264656e6f"
        "6d223a227561746f6d227d5d2c2266726f6d5f61646472657373223a22636f736d6f73316d6b79363963"
        "6e38656b74777930383435766563397570736470686b7478743033676b776c78222c22746f5f61646472"
        "657373223a22636f736d6f733138733068646e736c6c6763636c7765753961796d77346e676b7472326b"
        "30726b7967647a6470227d7d5d2c2273657175656e6365223a2230227d",
      );
      expectHex(jsonPreImageHash,
          '0a31f6cd50f1a5c514929ba68a977e222a7df2dc11e8470e93118cc3545e6b37');

      signature = TWBase64.decode(
          'tTyOrburrHEHa14qiw78e9StoZyyGmoku98IxYrWCmtN8Qo5mTeKa0BKKDfgG4LmmNdwYcrXtqQQ7F4dL3c26g==')!;

      {
        // JSON
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: jsonInputData,
          signatures: [signature],
          publicKeys: [publicKey.data],
        );
        final output = Cosmos.SigningOutput.fromBuffer(outputData);

        expect(output.error, Common.SigningError.OK);
        expect(hexString(output.json),
            '7b226d6f6465223a22626c6f636b222c227478223a7b22666565223a7b22616d6f756e74223a5b7b22616d6f756e74223a2231303030222c2264656e6f6d223a227561746f6d227d5d2c22676173223a22323030303030227d2c226d656d6f223a22222c226d7367223a5b7b2274797065223a22636f736d6f732d73646b2f4d736753656e64222c2276616c7565223a7b22616d6f756e74223a5b7b22616d6f756e74223a22343030303030222c2264656e6f6d223a227561746f6d227d5d2c2266726f6d5f61646472657373223a22636f736d6f73316d6b793639636e38656b74777930383435766563397570736470686b7478743033676b776c78222c22746f5f61646472657373223a22636f736d6f733138733068646e736c6c6763636c7765753961796d77346e676b7472326b30726b7967647a6470227d7d5d2c227369676e617475726573223a5b7b227075625f6b6579223a7b2274797065223a2274656e6465726d696e742f5075624b6579536563703235366b31222c2276616c7565223a2241757a76584f51336f774c47663556476a65537a487a62704566526e312b616c4b30484234543464566a5a4a227d2c227369676e6174757265223a227454794f72627572724845486131347169773738653953746f5a7979476d6f6b7539384978597257436d744e38516f356d54654b6130424b4b44666747344c6d6d4e64775963725874715151374634644c33633236673d3d227d5d7d7d');
      }
    });
  });
}
