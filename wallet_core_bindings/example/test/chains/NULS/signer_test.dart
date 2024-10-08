import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/NULS.pb.dart' as NULS;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('NULSSigner', () {
    const coin = TWCoinType.NULS;

    test('Sign', () {
      final privateKey = parse_hex(
          "0x9ce21dad67e0f0af2599b41b515a7f7018059418bab892a7b68f283d489abc4b");
      final amount = intToBytes(10000000);
      final balance = intToBytes(100000000);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6Hgj7ZoVgsPN9ybB4C1N2TbvkgLc8Z9H',
        to: 'NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe',
        amount: amount,
        chainId: 1,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1569228280,
        nonce: nonce,
      );

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        "0200f885885d00008c0117010001f7ec6473df12e751d64cf20a8baa7edd50810f8101000100201d9a00000000"
        "00000000000000000000000000000000000000000000000000080000000000000000000117010001f05e787897"
        "1f3374515eabb6f16d75219d887312010001008096980000000000000000000000000000000000000000000000"
        "0000000000000000000000000000692103958b790c331954ed367d37bac901de5c2f06ac8368b37d7bd6cd5ae1"
        "43c1d7e3463044022028019c0099e2233c7adb84bb03a9a5666ece4a5b65a026a090fa460f3679654702204df0"
        "fcb8762b5944b3aba033fa1a287ccb098150035dd8b66f52dc58d3d0843a",
      );
    });

    test('SignToken', () {
      final privateKey = parse_hex(
          "0x9ce21dad67e0f0af2599b41b515a7f7018059418bab892a7b68f283d489abc4b");
      final amount = intToBytes(10000000);
      final balance = intToBytes(100000000);
      final feePayerBalance = intToBytes(1000000);
      final nonce = '0000000000000000'.codeUnits;
      final assetNonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6Hgj7ZoVgsPN9ybB4C1N2TbvkgLc8Z9H',
        to: 'NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe',
        amount: amount,
        chainId: 9,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1569228280,
        nonce: assetNonce,
        feePayer: 'NULSd6Hgj7ZoVgsPN9ybB4C1N2TbvkgLc8Z9H',
        feePayerNonce: nonce,
        feePayerBalance: feePayerBalance,
      );

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        "0200f885885d0000d20217010001f7ec6473df12e751d64cf20a8baa7edd50810f810900010080969800"
        "000000000000000000000000000000000000000000000000000000000800000000000000000017010001"
        "f7ec6473df12e751d64cf20a8baa7edd50810f8101000100a08601000000000000000000000000000000"
        "0000000000000000000000000000080000000000000000000117010001f05e7878971f3374515eabb6f1"
        "6d75219d8873120900010080969800000000000000000000000000000000000000000000000000000000"
        "000000000000000000692103958b790c331954ed367d37bac901de5c2f06ac8368b37d7bd6cd5ae143c1"
        "d7e346304402204629e7e39708468a405f8d8dd208d0133a686beb5d3ae829b7a2f5867c74480902203d"
        "0dffac8189b1caa9087e480fd57581e8c382cc4e17034b492dd2178dac851d",
      );
    });

    test('SignWithFeePayer', () {
      final privateKey = parse_hex(
          "0x48c91cd24a27a1cdc791022ff39316444229db1c466b3b1841b40c919dee3002");
      final feePayerPrivateKey = parse_hex(
          "0x9401fd554cb700777e57b05338f9ff47597add8b23ce9f1c8e041e9b4e2116b6");
      final amount = intToBytes(100000);
      final balance = intToBytes(1000000);
      final feePayerBalance = intToBytes(1000000);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6HgYx7bdWWv7PxYhYeTRBhD6kZs1o5Ac',
        to: 'NULSd6HgaHjzhMEUjd4T5DFnLz9EvV4TntrdV',
        amount: amount,
        chainId: 1,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1660632991,
        nonce: nonce,
        // fee payer
        feePayer: 'NULSd6HgYj81NrQBFZYXvyQhHCJCkGYWDTNeA',
        feePayerNonce: '0000000000000000'.codeUnits,
        feePayerPrivateKey: feePayerPrivateKey,
        feePayerBalance: feePayerBalance,
      );

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        "02009f3ffb620000d202170100014f019a4227bff89d51590fbf53fbd98d994485f801000100a0860100000000"
        "00000000000000000000000000000000000000000000000000080000000000000000001701000152a6388c8bf5"
        "4e8fcd73cc824813bfef0912299b01000100a08601000000000000000000000000000000000000000000000000"
        "0000000000080000000000000000000117010001686a3c9cd2ac45aee0ef825b0443d1eb209368b701000100a0"
        "860100000000000000000000000000000000000000000000000000000000000000000000000000d22102764370"
        "693450d654d6fc061d1d4dbfbe0c95715fd3cde7e15df073ab0983b8c8463044022040b5820b93fd5e272f2a00"
        "518af45a722571834934ba20d9a866de8e6d6409ab022003c610c647648444c1e2193634b2c51817a5a6ac3fe7"
        "81da1a9ea773506afd8221025910df09ca768909cce9224d182401044c7b5bd44b0adee2ec5f2e64446573ff46"
        "30440220140e46b260942a8475f38df39bf54a2eea56c77199fc7ba775aa4b7f147d0d2102206c82705cba509f"
        "37ba0e35520a97bccb71a9e35cadcb8d95dd7fde5c8aa9e428",
      );
    });

    test('SignTokenWithFeePayer', () {
      final privateKey = parse_hex(
          "0x48c91cd24a27a1cdc791022ff39316444229db1c466b3b1841b40c919dee3002");
      final feePayerPrivateKey = parse_hex(
          "0x9401fd554cb700777e57b05338f9ff47597add8b23ce9f1c8e041e9b4e2116b6");
      final amount = intToBytes(100000);
      final balance = intToBytes(900000);
      final feePayerBalance = intToBytes(1000000);
      final assetNonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6HgYx7bdWWv7PxYhYeTRBhD6kZs1o5Ac',
        to: 'NULSd6HgaHjzhMEUjd4T5DFnLz9EvV4TntrdV',
        amount: amount,
        chainId: 9,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1660636748,
        nonce: assetNonce,
        // fee payer
        feePayer: 'NULSd6HgYj81NrQBFZYXvyQhHCJCkGYWDTNeA',
        feePayerNonce: 'e05d03df6ede0e22'.codeUnits,
        feePayerPrivateKey: feePayerPrivateKey,
        feePayerBalance: feePayerBalance,
      );

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(
        hex(output.encoded),
        "02004c4efb620000d2021701000152a6388c8bf54e8fcd73cc824813bfef0912299b09000100a0860100000000"
        "0000000000000000000000000000000000000000000000000008000000000000000000170100014f019a4227bf"
        "f89d51590fbf53fbd98d994485f801000100a08601000000000000000000000000000000000000000000000000"
        "000000000008e05d03df6ede0e22000117010001686a3c9cd2ac45aee0ef825b0443d1eb209368b709000100a0"
        "860100000000000000000000000000000000000000000000000000000000000000000000000000d32102764370"
        "693450d654d6fc061d1d4dbfbe0c95715fd3cde7e15df073ab0983b8c8463044022025cb5b40bda4e6fc0ba719"
        "bb0c1a907b2a0faa91316ef2c836310d49f906b6a802207d530a56a6c56d974036c86125da06d6e47f9d8ba154"
        "4ac3e620cebd883a707821025910df09ca768909cce9224d182401044c7b5bd44b0adee2ec5f2e64446573ff47"
        "3045022100ff6f45a1c3856f9ea954baca6b2988295bbb22c958f87f0d3baf9989930549530220426ecb152051"
        "3710b99ab50e1f6c7e21b0175adef08aa05070bb9bfca8a001d8",
      );
    });

    test('InsufficientBalance', () {
      final privateKey = parse_hex(
          "0x48c91cd24a27a1cdc791022ff39316444229db1c466b3b1841b40c919dee3002");
      final feePayerPrivateKey = parse_hex(
          "0x9401fd554cb700777e57b05338f9ff47597add8b23ce9f1c8e041e9b4e2116b6");
      final amount = intToBytes(10000000);
      final balance = intToBytes(100);
      final feePayerBalance = intToBytes(1000000);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6HgYx7bdWWv7PxYhYeTRBhD6kZs1o5Ac',
        to: 'NULSd6HgaHjzhMEUjd4T5DFnLz9EvV4TntrdV',
        amount: amount,
        chainId: 1,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1660632991,
        nonce: nonce,
        // fee payer
        feePayer: 'NULSd6HgYj81NrQBFZYXvyQhHCJCkGYWDTNeA',
        feePayerNonce: '0000000000000000'.codeUnits,
        feePayerPrivateKey: feePayerPrivateKey,
        feePayerBalance: feePayerBalance,
      );

      if (isTestWasm) {
        expect(
            () => NULS.SigningOutput.fromBuffer(
                TWAnySigner.sign(input.writeToBuffer(), coin)),
            throwsException);
        return;
      }

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.Error_general);
      expect(output.errorMessage, 'User account balance not sufficient');
    });

    test('InsufficientBalanceWithFeePayer', () {
      final privateKey = parse_hex(
          "0x48c91cd24a27a1cdc791022ff39316444229db1c466b3b1841b40c919dee3002");
      final feePayerPrivateKey = parse_hex(
          "0x9401fd554cb700777e57b05338f9ff47597add8b23ce9f1c8e041e9b4e2116b6");
      final amount = intToBytes(10000000);
      final balance = intToBytes(100000000);
      final feePayerBalance = intToBytes(100);
      final nonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6HgYx7bdWWv7PxYhYeTRBhD6kZs1o5Ac',
        to: 'NULSd6HgaHjzhMEUjd4T5DFnLz9EvV4TntrdV',
        amount: amount,
        chainId: 1,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1660632991,
        nonce: nonce,
        // fee payer
        feePayer: 'NULSd6HgYj81NrQBFZYXvyQhHCJCkGYWDTNeA',
        feePayerNonce: '0000000000000000'.codeUnits,
        feePayerPrivateKey: feePayerPrivateKey,
        feePayerBalance: feePayerBalance,
      );

      if (isTestWasm) {
        expect(
            () => NULS.SigningOutput.fromBuffer(
                TWAnySigner.sign(input.writeToBuffer(), coin)),
            throwsException);
        return;
      }

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.Error_general);
      expect(output.errorMessage, 'fee payer balance not sufficient');
    });

    test('TokenInsufficientBalance', () {
      final privateKey = parse_hex(
          "0x9ce21dad67e0f0af2599b41b515a7f7018059418bab892a7b68f283d489abc4b");
      final amount = intToBytes(10000000);
      final balance = intToBytes(100000000);
      final feePayerBalance = intToBytes(100);
      final nonce = '0000000000000000'.codeUnits;
      final assetNonce = '0000000000000000'.codeUnits;

      final input = NULS.SigningInput(
        from: 'NULSd6Hgj7ZoVgsPN9ybB4C1N2TbvkgLc8Z9H',
        to: 'NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe',
        amount: amount,
        chainId: 9,
        idassetsId: 1,
        privateKey: privateKey,
        balance: balance,
        timestamp: 1569228280,
        nonce: assetNonce,
        feePayer: 'NULSd6Hgj7ZoVgsPN9ybB4C1N2TbvkgLc8Z9H',
        feePayerNonce: nonce,
        feePayerBalance: feePayerBalance,
      );

      if (isTestWasm) {
        expect(
            () => NULS.SigningOutput.fromBuffer(
                TWAnySigner.sign(input.writeToBuffer(), coin)),
            throwsException);
        return;
      }

      final output = NULS.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      expect(output.error, Common.SigningError.Error_general);
      expect(output.errorMessage, 'fee payer balance not sufficient');
    });
  });
}
