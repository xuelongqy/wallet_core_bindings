import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('PivxCompiler', () {
    const coin = TWCoinType.Pivx;

    test('CompileWithSignatures', () {
      // tx on mainnet
      // https://pivx.ccore.online/transaction/e5376c954c748926c373eb08df50ad72b3869be230c659689f9d83c150efd6be
      const amount = 87090;
      const fee = 2910;
      const toAddress = "D6MrY5B9oZaCYNaXCbt2uvmjKC1nPgrgrq";

      final toScript = TWBitcoinScript.lockScriptForAddress(toAddress, coin);
      expect(hex(toScript.data),
          '76a9140d61d810a1ae2a9c4638808dd73b64e3ea54caf488ac');

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'DFsBL73ZaDAJkzv9DeBLEzX8Jh6kkmkfzV',
        coinType: coin.value,
      );

      final txHash0 = parse_hex(
              "1eda07bd98ea04d322d65facaed830024e264e356810e55111cf6d7c26dff3de")
          .reversed
          .toList();

      input.utxo.add(
        Bitcoin.UnspentTransaction(
          outPoint: Bitcoin.OutPoint(
            hash: txHash0,
            index: 1,
            sequence: UINT32_MAX,
          ),
          amount: $fixnum.Int64(26910000),
        ),
      );

      const utxoAddr0 = "D6E4vLacYhKc6RVxLNQg5j8rtWbAH8fybH";
      final script0 = TWBitcoinScript.lockScriptForAddress(utxoAddr0, coin);
      expect(hex(script0.data),
          '76a9140be8da968f9bc6c1c16b8c635544e757aade701388ac');
      input.utxo[0].script = script0.data;
      expect(input.utxo.length, 1);

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(26820000);

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
      expect(
        hex(preSigningOutput.hashPublicKeys[0].dataHash),
        '7d1af92dd981db6512142aa84c38385664d6751cc858a57e4adee34e6cae1449',
      );

      expect(
        hex(preSigningOutput.hashPublicKeys[0].publicKeyHash),
        '0be8da968f9bc6c1c16b8c635544e757aade7013',
      );

      const publicKeyHex =
          "0273132ffeafdc0eec3aaef5684a320a677cc77ba43df81de944af4a7fc6de66c9";
      final publickey = TWPublicKey.createWithHexString(
        publicKeyHex,
        TWPublicKeyType.SECP256k1,
      );
      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      final signature = parse_hex(
          "304402202bd34158770290fb304ec85d8a92671e003681e20fb64a346ac5bd8d3686571402207c64b662d85367a949cc275a15aa10713f91815c37cf2979408dc1aa9ddbf4ab");

      // Verify signature (pubkey & hash & signature)
      expect(
        publickey.verifyAsDER(signature, Uint8List.fromList(preImageHash)),
        true,
      );

      // Simulate signatures, normally obtained from signature server.
      final signatureVec = [signature];
      final pubkeyVec = [publickey.data];

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatureVec,
        publicKeys: pubkeyVec,
      );

      const ExpectedTx =
          "0100000001def3df267c6dcf1151e51068354e264e0230d8aeac5fd622d304ea98bd07da1e010000006a47304402202bd34158770290fb304ec85d8a92671e003681e20fb64a346ac5bd8d3686571402207c64b662d85367a949cc275a15aa10713f91815c37cf2979408dc1aa9ddbf4ab01210273132ffeafdc0eec3aaef5684a320a677cc77ba43df81de944af4a7fc6de66c9ffffffff0232540100000000001976a9140d61d810a1ae2a9c4638808dd73b64e3ea54caf488aca03d9901000000001976a91475a6ba23a1faaceed874538fe42362b72a1a156588ac00000000";
      {
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), ExpectedTx);
      }

      {
        // Negative: not enough signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
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
        outputData = TWTransactionCompiler.compileWithSignatures(
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
        expectWasmWithException(
            () => TWTransactionCompiler.compileWithSignatures(
                  coin: coin,
                  txInputData: txInputData,
                  signatures: signatureVec,
                  publicKeys: [publicKeyBlake],
                ).isEmpty,
            true);
      }

      {
        // Negative: wrong signature (formally valid)
        outputData = TWTransactionCompiler.compileWithSignatures(
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
