import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Harmony.pb.dart' as Harmony;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

const coin = TWCoinType.Harmony;

void main() {
  initTest();
  group('HarmonyCompiler', () {
    test('CompileWithSignatures', () {
      // txHash 0x238c0db5f139422d64d12b3d5208243b4b355bfb87024cec7795660291a628d0 on https://explorer.ps.hmny.io/
      /// Step 1: Prepare transaction input (protobuf)
      final input = Harmony.SigningInput(
        transactionMessage: Harmony.TransactionMessage(
          toAddress: 'one1y563nrrtcpu7874cry68ehxwrpteyhp0sztlym',
          payload: parse_hex(""),
          nonce: intToBytes(0),
          gasPrice: intToBytes(1000000000000000),
          gasLimit: intToBytes(1000000),
          fromShardId: intToBytes(0x0),
          toShardId: intToBytes(0x0),
          amount: intToBytes(10),
        ),
        privateKey: parse_hex(
            "4edef2c24995d15b0e25cbd152fb0e2c05d3b79b9c2afd134e6f59f91bf99e48"),
        chainId: intToBytes(0x4),
      );

      final inputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, inputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;

      const expectedPreImage =
          "e98087038d7ea4c68000830f42408080942535198c6bc079e3fab819347cdcce1857925c2f0a80048080";
      const expectedPreImageHash =
          "fd1be8579542dc60f15a6218887cc1b42945bf04b50205d15ad7df8b5fac5714";
      expect(hex(preImage), expectedPreImage);
      expect(hex(preImageHash), expectedPreImageHash);

      final privateKey = TWPrivateKey.createWithHexString(
          'b578822c5c718e510f67a9e291e9c6efdaf753f406020f55223b940e1ddb282e');
      final signature = parse_hex(
          "43824f50bf4b16ebe1020114de16e3579bdb5f3dcaa26117de87a73b5414b72550506609fd60e3cb565b1f9bae0952d37f3a6c6be262380f7f18cbda5216f34300");
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(signature, Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      const ExpectedTx =
          "f8698087038d7ea4c68000830f42408080942535198c6bc079e3fab819347cdcce1857925c2f0a802ba043824f50bf4b16ebe1020114de16e3579bdb5f3dcaa26117de87a73b5414b725a050506609fd60e3cb565b1f9bae0952d37f3a6c6be262380f7f18cbda5216f343";
      {
        final output = Harmony.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Harmony.SigningInput.fromBuffer(inputData);
        signingInput.privateKey = privateKey.data;

        final ouput = Harmony.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expectHex(ouput.encoded, ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Harmony.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Harmony.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
