import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/IOST.pb.dart' as IOST;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('IostCompiler', () {
    const coin = TWCoinType.IOST;

    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      final privKeyBytes = TWBase58.decodeNoCheck(
          '4TQwN7wWXg26ByuU5WkUPErd5v6PD6HsDuULyGNJgpS979wXF7jRU8NKviJs5boHrRKbLMomKycbek4NyDy6cLb8')!;
      final pkFrom = TWPrivateKey.createWithData(privKeyBytes.sublist(0, 32));
      final publicKey = pkFrom.getPublicKeyEd25519();
      final input = IOST.SigningInput(
        transferMemo: '',
        transactionTemplate: IOST.Transaction(
          publisher: 'astastooo',
          time: $fixnum.Int64(1647421579901555000),
          expiration: $fixnum.Int64(1647421879901555000),
          gasRatio: 1,
          gasLimit: 100000,
          chainId: 1023,
          delay: $fixnum.Int64(0),
          actions: [
            IOST.Action(
              contract: 'token.iost',
              actionName: 'transfer',
              data:
                  "[\"IOST\",\"astastooo\",\"test_iosted\",\"0.001\",\"test\"]",
            ),
          ],
          amountLimit: [
            IOST.AmountLimit(
              token: '*',
              value: 'unlimited',
            ),
          ],
        ),
        account: IOST.AccountInfo(
          activeKey: privKeyBytes,
        ),
      );

      final inputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, inputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '451ed1e542da2422ed152bff6f30c95e2a8ee2153f4d36f15c45914fa2d2e9f1');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = publicKey.data;
      final signature = parse_hex(
          "1e5e2de66512658e9317fa56766678166abcf492d020863935723db2030f736710e13437cef0981f"
          "cc376eae45349759508767d407b6c9963712910ada2c3606");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature, Uint8List.fromList(preSigningOutput.dataHash)),
        true,
      );

      /// Step 3: Compile transaction info
      const expectedTx =
          "7b2274696d65223a2231363437343231353739393031353535303030222c2265787069726174696f6e223a2231"
          "363437343231383739393031353535303030222c226761735f726174696f223a312c226761735f6c696d697422"
          "3a3130303030302c22636861696e5f6964223a313032332c22616374696f6e73223a5b7b22636f6e7472616374"
          "223a22746f6b656e2e696f7374222c22616374696f6e5f6e616d65223a227472616e73666572222c2264617461"
          "223a225b5c22494f53545c222c5c226173746173746f6f6f5c222c5c22746573745f696f737465645c222c5c22"
          "302e3030315c222c5c22746573745c225d227d5d2c22616d6f756e745f6c696d6974223a5b7b22746f6b656e22"
          "3a222a222c2276616c7565223a22756e6c696d69746564227d5d2c227075626c6973686572223a226173746173"
          "746f6f6f222c227075626c69736865725f73696773223a5b7b22616c676f726974686d223a322c227369676e61"
          "74757265223a22486c3474356d55535a593654462f7057646d5a34466d7138394a4c51494959354e5849397367"
          "4d5063326351345451337a76435948387733627135464e4a645a5549646e31416532795a59334570454b326977"
          "3242673d3d222c227075626c69635f6b6579223a2234687a496d2b6d383234536f663866645641474545332b64"
          "667931554c7a69786e6f4c5047694a565879383d227d5d7d";
      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature],
          publicKeys: [publicKeyData],
        );

        final output = IOST.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), expectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = IOST.SigningInput.fromBuffer(inputData);

        final output = IOST.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature, signature],
          publicKeys: [publicKeyData],
        );
        final output = IOST.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: invalid signatures
        final invalidSignature = parse_hex(
            "fb43727477caaa12542b9060856816d42eedef6ebf2e98e4f8dff4355fe384751925833c4a26b2fed1707aebe655cb3317504a61ee59697c086f7baa6ca06a09");
        if (isTestWasm) {
          expect(
              () => TWTransactionCompiler.compileWithSignatures(
                    coin: coin,
                    txInputData: inputData,
                    signatures: [invalidSignature],
                    publicKeys: [publicKeyData],
                  ),
              throwsException);
          return;
        }
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [invalidSignature],
          publicKeys: [publicKeyData],
        );
        final output = IOST.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_internal);
        expect(output.errorMessage,
            "Invalid signature/hash/publickey combination");
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [],
          publicKeys: [],
        );
        final output = IOST.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
