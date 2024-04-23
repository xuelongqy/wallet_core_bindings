import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;

import '../../utils.dart';

void main() {
  group('SolanaCompiler', () {
    const coin = TWCoinType.TWCoinTypeSolana;

    test('CompileTransferWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      final sender = 'sp6VUqq1nDEuU83bU2hstmEYrJNipJYpwS7gZ7Jv7ZH';
      final input = Solana.SigningInput(
        transferTransaction: Solana.Transfer(
          recipient: '3UVYmECPPMZSCqWKfENfuoTv51fTDTWicX9xmBD2euKe',
          value: $fixnum.Int64(1000),
        ),
        sender: sender,
        recentBlockhash: 'TPJFTN4CjBn12HiBfAbGUhpD9zGvRSm2RcheFRA4Fyv',
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          Solana.PreSigningOutput.fromBuffer(preImageHashesData);
      expect(preSigningOutput.signers.length, 1);
      final signer = preSigningOutput.signers[0];
      expect(String.fromCharCodes(signer), sender);
      final preImageHash = preSigningOutput.data;
      expect(
        hex(preImageHash),
        "010001030d044a62d0a4dfe5a037a15b59fa4d4d0d3ab81103a2c10a6da08a4d058611c024c255a8bc3e"
        "8496217a2cd2a1894b9b9dcace04fcd9c0d599acdaaea40a1b6100000000000000000000000000000000"
        "0000000000000000000000000000000006c25012cc11a599a45b3b2f7f8a7c65b0547fa0bb67170d7a0c"
        "d1eda4e2c9e501020200010c02000000e803000000000000",
      );
      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "0d044a62d0a4dfe5a037a15b59fa4d4d0d3ab81103a2c10a6da08a4d058611c0");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final signature = parse_hex(
          "a8c610697087eaf8a34b3facbe06f8e9bb9603bb03270dad021ffcd2fc37b6e9efcdcb78b227401f"
          "000eb9231c67685240890962e44a17fd27fc2ff7b971df03");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );
      final ExpectedTx =
          "5bWxVCP5fuzkKSGby9hnsLranszQJR2evJGTfBrpDQ4rJceW1WxKNrWqVPBsN2QCAGmE6W7VaYkyWjv39HhGrr1Ne2"
          "QSUuHZdyyn7hK4pxzLPMgPG8fY1XvXdppWMaKMLmhriLkckzGKJMaE3pWBRFBKzigXY28714uUNndb7S9hVakxa59h"
          "rLph39CMgAkcj6b8KYvJEkb1YdYytHSZNGi4kVVTNqiicNgPdf1gmG6qz9zVtnqj9JtaD2efdS8qxsKnvNWSgb8Xxb"
          "T6dwyp7msUUi7d27cYaPTpK";
      {
        final output = Solana.SigningOutput.fromBuffer(outputData);
        expect(output.encoded, ExpectedTx);
        expect(output.encoded.length, 293);
      }
      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Solana.SigningInput.fromBuffer(txInputData);
        final key = parse_hex(
            "044014463e2ee3cc9c67a6f191dbac82288eb1d5c1111d21245bdc6a855082a1");
        signingInput.privateKey = key;

        final output = Solana.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.encoded, ExpectedTx);
      }
    });

    test('CompileTransferWithPriorityFee', () {
      // tx on mainnet
      // https://explorer.solana.com/tx/5asW13PSGvbZAeiGe8YFo7jt3UTqb8KUfFhXh5DXpDVfpVup1ZP41tp7PmBJH43gK5xT9U4VDVChDynmC7PJp9fa

      /// Step 1: Prepare transaction input (protobuf)
      final sender = 'EQ37VYUVcqUSzYgvaguDB4yVRg5m3Xg7qQoKF8zFiJxe';
      final input = Solana.SigningInput(
        transferTransaction: Solana.Transfer(
          recipient: '6NdFCrugyZVRhFbHvJT3dFBrGE9ZYFbfc8dBS2q4d2a9',
          value: $fixnum.Int64(10000),
        ),
        sender: sender,
        recentBlockhash: '8oFmGuWUpsy8h8WP8AXTp3yhcLt4gQJRG5GxNcK7jfhX',
        nonceAccount: 'ubKTCz9avQt3twiC9TbRjfoCiJnggH1abjgj9FjZJJm',
        priorityFeePrice: Solana.PriorityFeePrice(
          price: $fixnum.Int64(40000),
        ),
        priorityFeeLimit: Solana.PriorityFeeLimit(
          limit: 480000,
        ),
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          Solana.PreSigningOutput.fromBuffer(preImageHashesData);
      expect(preSigningOutput.signers.length, 1);
      final signer = preSigningOutput.signers[0];
      expect(String.fromCharCodes(signer), sender);
      final preImageHash = preSigningOutput.data;
      expect(
        hex(preImageHash),
        "01000306c70ead37125b5e142838eb59a6883ef915474f9b0a52494f698a4d23f4827ca70d79017647148829ddee52e687a840b42ce55a808367ff3cb0dc67444f5361ca4fd49d2664e7ac3016160e0b943a9222a21bee6510248dc2ae341f58195a2a3606a7d517192c568ee08a845f73d29788cf035c3145b21ab344d8062ea940000000000000000000000000000000000000000000000000000000000000000000000306466fe5211732ffecadba72c39be7bc8ce5bbc5f7126b2c439b3a4000000073db37fafe5d370e4605395dfc4661d886170c751ecfd7d76a744ea43c9f16f6040403010300040400000005000903409c0000000000000500050200530700040200020c020000001027000000000000",
      );
      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "c70ead37125b5e142838eb59a6883ef915474f9b0a52494f698a4d23f4827ca7");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final signature = parse_hex(
          "e546dbc2b896ff53abe5d3f090abdea84fb3862c6dcab4a6878e4d0dc803a53a2b077ef14014737e049815ff4df5daa92dc3e11b55770466d5feab6bdfccf005");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );
      final ExpectedTx =
          "84RnGAbza5DstiCPgBwtyuGnB2TPYsRGFr4L9tvzc71tBjyPS5aK9xGfMPdKA16gm8dJSxdAwMQX22zF3bQAHtgNHSApaL9Hs2B4Rz1HjazPmbNYLJKkSZ4gq2MWbY6DSKkg3NUf4L9HpZVFbrUw7TNgFYbEYiA1wTJ4aVwVAh9NQLDaQBgANnMvjFTYy2rDjgHL8nZU6omjK2uvDaLdqp2L4hXjGTKQ1mMFVRLXnrMUX8dijBPty3NDcgJ3G442ccGguez7DwYooirYuZ5ajiJwkKtqu8tW4namRdvAC7YmL1tCqZpWXyDBhqMapoyf1bVCvUbnuz64RZwhd7nj6DyULtiMXCUXFayeShe2nvJGTkzWZxEEeHPyvLtTmSNrmRWqE2ZEDCFGH3bopBKG2QJVeEomh7rKFSZ6WTDmG2V7L6zPFexAhuen9ynEBu8JJWRM3nx5dj4BSDeQf";
      {
        final output = Solana.SigningOutput.fromBuffer(outputData);
        expect(output.encoded, ExpectedTx);
      }
    });
  });
}
