import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/NULS.pb.dart' as NULS;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('NULSSigner', () {
    const coin = TWCoinType.NULS;

    test('Sign', () {
      const from = "NULSd6HgWabfcG6H7NDK2TJvtoU3wxY1YLKwJ";
      const to = "NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe";
      const chainId = 1;
      const idassetsId = 1;
      final amount = intToBytes(10000000);
      final balance = intToBytes(100000000);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: from,
        to: to,
        amount: amount,
        chainId: chainId,
        idassetsId: idassetsId,
        nonce: nonce,
        balance: balance,
        timestamp: 1569228280,
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final preImage = preSigningOutput.data;
      expect(
        hex(preImage),
        "0200f885885d00008c01170100012c177a01a7afbe98e094007b99476534fb7926b701000100201d9a00"
        "000000000000000000000000000000000000000000000000000000000800000000000000000001170100"
        "01f05e7878971f3374515eabb6f16d75219d887312010001008096980000000000000000000000000000"
        "0000000000000000000000000000000000000000000000",
      );
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '8746b37cb4b443424d3093e8107c5dfd6c5318010bbffcc8e8ba7c1da60877fd');
      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "033c87a3d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0aff0ee045");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.SECP256k1,
      );
      final signature = parse_hex(
          "a5234269eab6fe8a1510dd0cb36070a03464b48856e1ef2681dbb79a5ec656f92961ac01d401a6f8"
          "49acc958c6c9653f49282f5a0916df036ea8766918bac19500");
      // Verify signature (pubkey & hash & signature)
      expect(
          publicKey.verify(signature, Uint8List.fromList(preImageHash)), true);

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );
      final ExpectedEncoded = parse_hex(
          "0200f885885d00008c01170100012c177a01a7afbe98e094007b99476534fb7926b701000100201d9a00000000"
          "00000000000000000000000000000000000000000000000000080000000000000000000117010001f05e787897"
          "1f3374515eabb6f16d75219d887312010001008096980000000000000000000000000000000000000000000000"
          "00000000000000000000000000006a21033c87a3d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0a"
          "ff0ee045473045022100a5234269eab6fe8a1510dd0cb36070a03464b48856e1ef2681dbb79a5ec656f9022029"
          "61ac01d401a6f849acc958c6c9653f49282f5a0916df036ea8766918bac195");
      expect(outputData.length, 259);
      {
        final output = NULS.SigningOutput.fromBuffer(outputData);

        expect(output.encoded, ExpectedEncoded);
        expect(output.encoded.length, 256);
      }
      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = NULS.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = parse_hex(
            "044014463e2ee3cc9c67a6f191dbac82288eb1d5c1111d21245bdc6a855082a1");

        final output = NULS.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.encoded, ExpectedEncoded);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKeyData],
        );
        final output = NULS.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });

    test('TokenCompileWithSignatures', () {
      const from = "NULSd6HgWabfcG6H7NDK2TJvtoU3wxY1YLKwJ";
      const to = "NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe";
      const chainId = 9;
      const idassetsId = 1;
      final amount = intToBytes(10000000);
      final balance = intToBytes(100000000);
      final feePayerBalance = intToBytes(100000000);
      final nonce = '0000000000000000'.codeUnits;
      final assetNonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: from,
        to: to,
        amount: amount,
        chainId: chainId,
        idassetsId: idassetsId,
        nonce: assetNonce,
        balance: balance,
        timestamp: 1569228280,
        feePayer: from,
        feePayerBalance: feePayerBalance,
        feePayerNonce: nonce,
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final preImage = preSigningOutput.data;
      expect(
        hex(preImage),
        "0200f885885d0000d202170100012c177a01a7afbe98e094007b99476534fb7926b70900010080969800000000"
        "0000000000000000000000000000000000000000000000000008000000000000000000170100012c177a01a7af"
        "be98e094007b99476534fb7926b701000100a08601000000000000000000000000000000000000000000000000"
        "0000000000080000000000000000000117010001f05e7878971f3374515eabb6f16d75219d8873120900010080"
        "969800000000000000000000000000000000000000000000000000000000000000000000000000",
      );
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '9040642ce845b320453b2ccd6f80efc38fdf61ec8f0c12e0c16f6244ec2e0496');
      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "033c87a3d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0aff0ee045");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.SECP256k1,
      );
      final signature = parse_hex(
          "5ddea604c6cdfcf6cbe32f5873937641676ee5f9aee3c40aa9857c59aefedff25b77429cf62307d4"
          "3a6a79b4c106123e6232e3981032573770fe2726bf9fc07c00");
      // Verify signature (pubkey & hash & signature)
      expect(
          publicKey.verify(signature, Uint8List.fromList(preImageHash)), true);

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );
      final ExpectedEncoded = parse_hex(
          "0200f885885d0000d202170100012c177a01a7afbe98e094007b99476534fb7926b70900010080969800000000"
          "0000000000000000000000000000000000000000000000000008000000000000000000170100012c177a01a7af"
          "be98e094007b99476534fb7926b701000100a08601000000000000000000000000000000000000000000000000"
          "0000000000080000000000000000000117010001f05e7878971f3374515eabb6f16d75219d8873120900010080"
          "9698000000000000000000000000000000000000000000000000000000000000000000000000006921033c87a3"
          "d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0aff0ee04546304402205ddea604c6cdfcf6cbe32f"
          "5873937641676ee5f9aee3c40aa9857c59aefedff202205b77429cf62307d43a6a79b4c106123e6232e3981032"
          "573770fe2726bf9fc07c");
      expect(outputData.length, 328);
      {
        final output = NULS.SigningOutput.fromBuffer(outputData);

        expect(output.encoded, ExpectedEncoded);
        expect(output.encoded.length, 325);
      }
      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = NULS.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = parse_hex(
            "044014463e2ee3cc9c67a6f191dbac82288eb1d5c1111d21245bdc6a855082a1");

        final output = NULS.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.encoded, ExpectedEncoded);
      }
    });

    // Tx:
    // https://nulscan.io/transaction/info?hash=58694394d2e28e18f66cf61697c791774c44d5275dce60d5e05d03df6ede0e22
    test('CompileWithSignaturesFeePayer', () {
      const from = "NULSd6HgYx7bdWWv7PxYhYeTRBhD6kZs1o5Ac";
      const to = "NULSd6HgaHjzhMEUjd4T5DFnLz9EvV4TntrdV";
      const chainId = 1;
      const idassetsId = 1;
      final amount = intToBytes(100000);
      final balance = intToBytes(1000000);
      final feePayerBalance = intToBytes(1000000);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: from,
        to: to,
        amount: amount,
        chainId: chainId,
        idassetsId: idassetsId,
        nonce: nonce,
        balance: balance,
        timestamp: 1660632991,
        // fee payer
        feePayer: 'NULSd6HgYj81NrQBFZYXvyQhHCJCkGYWDTNeA',
        feePayerNonce: '0000000000000000'.codeUnits,
        feePayerBalance: feePayerBalance,
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final preImage = preSigningOutput.data;
      expect(
        hex(preImage),
        "02009f3ffb620000d202170100014f019a4227bff89d51590fbf53fbd98d994485f801000100a0860100000000"
        "00000000000000000000000000000000000000000000000000080000000000000000001701000152a6388c8bf5"
        "4e8fcd73cc824813bfef0912299b01000100a08601000000000000000000000000000000000000000000000000"
        "0000000000080000000000000000000117010001686a3c9cd2ac45aee0ef825b0443d1eb209368b701000100a0"
        "860100000000000000000000000000000000000000000000000000000000000000000000000000",
      );
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '58694394d2e28e18f66cf61697c791774c44d5275dce60d5e05d03df6ede0e22');
      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "02764370693450d654d6fc061d1d4dbfbe0c95715fd3cde7e15df073ab0983b8c8");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.SECP256k1,
      );
      final feePayerPublicKeyData = parse_hex(
          "025910df09ca768909cce9224d182401044c7b5bd44b0adee2ec5f2e64446573ff");
      final feePayerPublicKey = TWPublicKey.createWithData(
        feePayerPublicKeyData,
        TWPublicKeyType.SECP256k1,
      );

      final signature = parse_hex(
          "40b5820b93fd5e272f2a00518af45a722571834934ba20d9a866de8e6d6409ab03c610c647648444"
          "c1e2193634b2c51817a5a6ac3fe781da1a9ea773506afd8201");
      final feePayerSignature = parse_hex(
          "140e46b260942a8475f38df39bf54a2eea56c77199fc7ba775aa4b7f147d0d216c82705cba509f37"
          "ba0e35520a97bccb71a9e35cadcb8d95dd7fde5c8aa9e42800");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(signature, Uint8List.fromList(preImageHash)),
        true,
      );
      expect(
        feePayerPublicKey.verify(
            feePayerSignature, Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature, feePayerSignature],
        publicKeys: [publicKeyData, feePayerPublicKeyData],
      );
      final ExpectedEncoded = parse_hex(
          "02009f3ffb620000d202170100014f019a4227bff89d51590fbf53fbd98d994485f801000100a0860100000000"
          "00000000000000000000000000000000000000000000000000080000000000000000001701000152a6388c8bf5"
          "4e8fcd73cc824813bfef0912299b01000100a08601000000000000000000000000000000000000000000000000"
          "0000000000080000000000000000000117010001686a3c9cd2ac45aee0ef825b0443d1eb209368b701000100a0"
          "860100000000000000000000000000000000000000000000000000000000000000000000000000d22102764370"
          "693450d654d6fc061d1d4dbfbe0c95715fd3cde7e15df073ab0983b8c8463044022040b5820b93fd5e272f2a00"
          "518af45a722571834934ba20d9a866de8e6d6409ab022003c610c647648444c1e2193634b2c51817a5a6ac3fe7"
          "81da1a9ea773506afd8221025910df09ca768909cce9224d182401044c7b5bd44b0adee2ec5f2e64446573ff46"
          "30440220140e46b260942a8475f38df39bf54a2eea56c77199fc7ba775aa4b7f147d0d2102206c82705cba509f"
          "37ba0e35520a97bccb71a9e35cadcb8d95dd7fde5c8aa9e428");
      expect(outputData.length, 433);
      {
        final output = NULS.SigningOutput.fromBuffer(outputData);

        expect(output.encoded, ExpectedEncoded);
        expect(output.encoded.length, 430);
      }
      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = NULS.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = parse_hex(
            "0x48c91cd24a27a1cdc791022ff39316444229db1c466b3b1841b40c919dee3002");
        signingInput.feePayerPrivateKey = parse_hex(
            "0x9401fd554cb700777e57b05338f9ff47597add8b23ce9f1c8e041e9b4e2116b6");

        final output = NULS.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.encoded, ExpectedEncoded);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKeyData],
        );
        final output = NULS.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });

    // Tx:
    // https://nulscan.io/transaction/info?hash=210731f7b4a96884a2e04925e758586fb2edb07627621ba1be4de2c54b0868fc
    test('TokenCompileWithSignaturesFeePayer', () {
      const from = "NULSd6HgYx7bdWWv7PxYhYeTRBhD6kZs1o5Ac";
      const to = "NULSd6HgaHjzhMEUjd4T5DFnLz9EvV4TntrdV";
      const chainId = 9;
      const idassetsId = 1;
      final amount = intToBytes(100000);
      final balance = intToBytes(900000);
      final feePayerBalance = intToBytes(1000000);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: from,
        to: to,
        amount: amount,
        chainId: chainId,
        idassetsId: idassetsId,
        nonce: nonce,
        balance: balance,
        timestamp: 1660636748,
        // fee payer
        feePayer: 'NULSd6HgYj81NrQBFZYXvyQhHCJCkGYWDTNeA',
        feePayerNonce: 'e05d03df6ede0e22'.codeUnits,
        feePayerBalance: feePayerBalance,
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final preImage = preSigningOutput.data;
      expect(
        hex(preImage),
        "02004c4efb620000d2021701000152a6388c8bf54e8fcd73cc824813bfef0912299b09000100a0860100000000"
        "0000000000000000000000000000000000000000000000000008000000000000000000170100014f019a4227bf"
        "f89d51590fbf53fbd98d994485f801000100a08601000000000000000000000000000000000000000000000000"
        "000000000008e05d03df6ede0e22000117010001686a3c9cd2ac45aee0ef825b0443d1eb209368b709000100a0"
        "860100000000000000000000000000000000000000000000000000000000000000000000000000",
      );
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '210731f7b4a96884a2e04925e758586fb2edb07627621ba1be4de2c54b0868fc');
      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "02764370693450d654d6fc061d1d4dbfbe0c95715fd3cde7e15df073ab0983b8c8");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.SECP256k1,
      );
      final feePayerPublicKeyData = parse_hex(
          "025910df09ca768909cce9224d182401044c7b5bd44b0adee2ec5f2e64446573ff");
      final feePayerPublicKey = TWPublicKey.createWithData(
        feePayerPublicKeyData,
        TWPublicKeyType.SECP256k1,
      );

      final signature = parse_hex(
          "25cb5b40bda4e6fc0ba719bb0c1a907b2a0faa91316ef2c836310d49f906b6a87d530a56a6c56d97"
          "4036c86125da06d6e47f9d8ba1544ac3e620cebd883a707800");
      final feePayerSignature = parse_hex(
          "ff6f45a1c3856f9ea954baca6b2988295bbb22c958f87f0d3baf998993054953426ecb1520513710"
          "b99ab50e1f6c7e21b0175adef08aa05070bb9bfca8a001d801");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(signature, Uint8List.fromList(preImageHash)),
        true,
      );
      expect(
        feePayerPublicKey.verify(
            feePayerSignature, Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature, feePayerSignature],
        publicKeys: [publicKeyData, feePayerPublicKeyData],
      );
      final ExpectedEncoded = parse_hex(
          "02004c4efb620000d2021701000152a6388c8bf54e8fcd73cc824813bfef0912299b09000100a0860100000000"
          "0000000000000000000000000000000000000000000000000008000000000000000000170100014f019a4227bf"
          "f89d51590fbf53fbd98d994485f801000100a08601000000000000000000000000000000000000000000000000"
          "000000000008e05d03df6ede0e22000117010001686a3c9cd2ac45aee0ef825b0443d1eb209368b709000100a0"
          "860100000000000000000000000000000000000000000000000000000000000000000000000000d32102764370"
          "693450d654d6fc061d1d4dbfbe0c95715fd3cde7e15df073ab0983b8c8463044022025cb5b40bda4e6fc0ba719"
          "bb0c1a907b2a0faa91316ef2c836310d49f906b6a802207d530a56a6c56d974036c86125da06d6e47f9d8ba154"
          "4ac3e620cebd883a707821025910df09ca768909cce9224d182401044c7b5bd44b0adee2ec5f2e64446573ff47"
          "3045022100ff6f45a1c3856f9ea954baca6b2988295bbb22c958f87f0d3baf9989930549530220426ecb152051"
          "3710b99ab50e1f6c7e21b0175adef08aa05070bb9bfca8a001d8");
      expect(outputData.length, 434);
      {
        final output = NULS.SigningOutput.fromBuffer(outputData);

        expect(output.encoded, ExpectedEncoded);
        expect(output.encoded.length, 431);
      }
      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = NULS.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = parse_hex(
            "0x48c91cd24a27a1cdc791022ff39316444229db1c466b3b1841b40c919dee3002");
        signingInput.feePayerPrivateKey = parse_hex(
            "0x9401fd554cb700777e57b05338f9ff47597add8b23ce9f1c8e041e9b4e2116b6");

        final output = NULS.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.encoded, ExpectedEncoded);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKeyData],
        );
        final output = NULS.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}
