import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('FiroCompiler', () {
    const coin = TWCoinType.TWCoinTypeFiro;

    test('FiroCompileWithSignatures', () {
      // tx on mainnet
      // https://explorer.firo.org/tx/f1e9a418eb8d2bc96856ac221e9112ee061805af35d52be261caf7a7c9c48756

      final amount = 9999741;
      final fee = 259;
      final toAddress = "EXXQe1Xhay75BzoFFhXgpqNTtLomdBKSfyMZ";

      final toScript = TWBitcoinScript.lockScriptForAddress(toAddress, coin);
      expectHex(toScript.data,
          'e076a9146fa0b49c4fe011eeeeba6abb9ea6832d15acda1488ac');

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'EXXWKhUtcaFKVW1NeRFuqPq33zAJMtQJwR4y',
        coinType: coin,
        lockTime: 824147,
      );

      final txHash0 = parse_hex(
              "7d46af1b51ac6d55554e4748f08d87727214da7c6148da037cb71dc893b6297f")
          .reversed
          .toList();

      final utxoAddr0 = "EXXWKhUtcaFKVW1NeRFuqPq33zAJMtQJwR4y";
      final script0 = TWBitcoinScript.lockScriptForAddress(utxoAddr0, coin);
      expectHex(
          script0.data, 'e076a914adfae82521fb6bba65fecc265fe67e5ee476b5df88ac');

      input.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: txHash0,
          index: 1,
          sequence: UINT32_MAX - 1,
        ),
        amount: $fixnum.Int64(10000000),
        script: script0.data,
      ));
      expect(input.utxo.length, 1);

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(0);

      // Extend input with accepted plan
      input.plan = plan;

      // Serialize input
      final txInputData = input.writeToBuffer();
      expect(txInputData.isNotEmpty, true);

      /// Step 2: Obtain preimage hashes
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);

      expect(preSigningOutput.error, Common.SigningError.OK);
      expectHex(preSigningOutput.hashPublicKeys[0].dataHash,
          'c4841429065d36ec089c0d27b6f803b8fb1b2fb22d25629f38dcb40e2afff80d');

      expectHex(preSigningOutput.hashPublicKeys[0].publicKeyHash,
          'adfae82521fb6bba65fecc265fe67e5ee476b5df');

      final publicKeyHex =
          "034cc1963365aa67d35643f419d6601eca6ef7f62e46bf7f8b6ffa64e2f44fd0bf";
      final publicKey = TWPublicKey.createWithHexString(
          publicKeyHex, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      final signature = parse_hex(
          "304402206c5135f0ebfe329b1f1ba3b53730b2e1d02a6afca9c7c9ce007b8b956f9a235a0220482e76d74375b097bcd6275ab30d0c7a716263e744ecbbc33c651f83c15c4d99");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verifyAsDER(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      // Simulate signatures, normally obtained from signature server.
      final signatureVec = <Uint8List>[];
      final pubkeyVec = <Uint8List>[];
      signatureVec.add(signature);
      pubkeyVec.add(publicKey.data);

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatureVec,
        publicKeys: pubkeyVec,
      );

      final ExpectedTx =
          "01000000017f29b693c81db77c03da48617cda147272878df048474e55556dac511baf467d010000006a47304402206c5135f0ebfe329b1f1ba3b53730b2e1d02a6afca9c7c9ce007b8b956f9a235a0220482e76d74375b097bcd6275ab30d0c7a716263e744ecbbc33c651f83c15c4d990121034cc1963365aa67d35643f419d6601eca6ef7f62e46bf7f8b6ffa64e2f44fd0bffeffffff017d959800000000001ae076a9146fa0b49c4fe011eeeeba6abb9ea6832d15acda1488ac53930c00";
      {
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Negative: not enough signatures
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: pubkeyVec,
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: empty signatures
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: invalid public key
        final publicKeyBlake = parse_hex(
            "b689ab808542e13f3d2ec56fe1efe43a1660dcadc73ce489fde7df98dd8ce5d9");
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: signatureVec,
          publicKeys: [publicKeyBlake],
        );
        expect(outputData.isEmpty, true);
      }

      {
        // Negative: wrong signature (formally valid)
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [
            parse_hex(
                "415502201857bc6e6e48b46046a4bd204136fc77e24c240943fb5a1f0e86387aae59b349022"
                "00a7f31478784e51c49f46ef072745a4f263d7efdbc9c6784aa2571ff4f6f3b51")
          ],
          publicKeys: pubkeyVec,
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signing);
      }
    });
  });
}
