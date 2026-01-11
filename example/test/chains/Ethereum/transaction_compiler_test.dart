import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('EthereumCompiler', () {
    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      const coin = TWCoinType.Ethereum;

      final nonce = intToBytes(11);
      final chainId = intToBytes(1);
      final gasPrice = intToBytes(20000000000);
      final gasLimit = intToBytes(21000);
      final amount = bigIntStringToBytes('1000000000000000000');

      final input = Ethereum.SigningInput(
        nonce: nonce,
        chainId: chainId,
        gasPrice: gasPrice,
        gasLimit: gasLimit,
        txMode: Ethereum.TransactionMode.Legacy,
        toAddress: '0x3535353535353535353535353535353535353535',
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: amount,
          ),
        ),
      );

      // Serialize back, this shows how to serialize SigningInput protobuf to byte array
      final txInputData = input.writeToBuffer();
      expect(txInputData.length, 77);

      /// Step 2: Obtain preimage hash
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.isNotEmpty, true);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expectHex(preImageHash,
          '15e180a6274b2f6a572b9b51823fce25ef39576d10188ecdcd7de44526c47217');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "044bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382ce28cab79ad711"
          "9ee1ad3ebcdb98a16805211530ecc6cfefa1b88e6dff99232a");
      final publicKey = TWPublicKey.createWithData(
          publicKeyData, TWPublicKeyType.SECP256k1Extended);
      final signature = parse_hex(
          "360a84fb41ad07f07c845fedc34cde728421803ebbaae392fc39c116b29fc07b53bd9d1376e15a19"
          "1d844db458893b928f3efbfee90c9febf51ab84c9796677900");

      // Verify signature (pubkey & hash & signature)
      {
        expect(
          publicKey.verify(signature, Uint8List.fromList(preImageHash)),
          true,
        );
      }

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );

      // We dont care about public key in ethereum. It is not part of the transaction.
      final outputDataWithoutPubKey =
          TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [],
      );

      expect(outputData, outputDataWithoutPubKey);

      const ExpectedTx =
          "f86c0b8504a817c800825208943535353535353535353535353535353535353535880de0b6b3a76400008025a0"
          "360a84fb41ad07f07c845fedc34cde728421803ebbaae392fc39c116b29fc07ba053bd9d1376e15a191d844db4"
          "58893b928f3efbfee90c9febf51ab84c97966779";

      {
        expect(outputData.length, 217);
        final output = Ethereum.SigningOutput.fromBuffer(outputData);

        expect(output.encoded.length, 110);
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Ethereum.SigningInput.fromBuffer(txInputData);
        final key = parse_hex(
            "4646464646464646464646464646464646464646464646464646464646464646");
        signingInput.privateKey = key;

        final output = Ethereum.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Ethereum.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}
