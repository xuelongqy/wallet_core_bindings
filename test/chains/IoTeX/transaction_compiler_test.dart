import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/IoTeX.pb.dart' as IoTeX;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('TransactionCompiler', () {
    const coin = TWCoinType.TWCoinTypeIoTeX;

    test('IoTeXCompileWithSignatures', () {
      final privateKey0 = parse_hex(
          "0806c458b262edd333a191e92f561aff338211ee3e18ab315a074a2d82aa343f");
      final privateKey1 = parse_hex(
          "6021efcf7555f90627364339fc921139dd40a06ccb2cb2a2a4f8f4ea7a2dc74d");
      final pubKey0 = parse_hex(
          "034e18306ae9ef4ec9d07bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c");
      final pubKey1 = parse_hex(
          "0253ad2f3b734a197f64911242aabc9b5b10bf5744949f5396e56427f35448eafa");
      final ExpectedTx0 =
          "0a4c0801107b18f8062203393939523e0a033435361229696f313837777a703038766e686a6a706b79646e7239"
          "37716c68386b683064706b6b797466616d386a1a0c68656c6c6f20776f726c64211241044e18306ae9ef4ec9d0"
          "7bf6e705442d4d1a75e6cdf750330ca2d880f2cc54607c9c33deb9eae9c06e06e04fe9ce3d43962cc67d5aa34f"
          "beb71270d4bad3d648d91a41555cc8af4181bf85c044c3201462eeeb95374f78aa48c67b87510ee63d5e502372"
          "e53082f03e9a11c1e351de539cedf85d8dff87de9d003cb9f92243541541a000";
      final ExpectedTx1 =
          "0a4c0801107b18f8062203393939523e0a033435361229696f313837777a703038766e686a6a706b79646e7239"
          "37716c68386b683064706b6b797466616d386a1a0c68656c6c6f20776f726c642112410453ad2f3b734a197f64"
          "911242aabc9b5b10bf5744949f5396e56427f35448eafa84a5d74b49ecb56e011b18c3d5a300e8cff7c6b39d33"
          "0d1d3799c4700a0b1be21a41de4be56ce74dce8e526590f5b5f947385b00947c4c2ead014429aa706a2470055c"
          "56c7e57d1b119b487765d59b21bcdeafac25108f6929a14f9edf4b2309534501";

      final prkey0 = TWPrivateKey.createWithData(privateKey0);
      final pbkey0 = prkey0
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);

      final prkey1 = TWPrivateKey.createWithData(privateKey1);
      final pbkey1 = prkey1
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);

      /// Step 1: Prepare transaction input (protobuf)
      final input = IoTeX.SigningInput(
        version: 1,
        nonce: $fixnum.Int64(123),
        gasLimit: $fixnum.Int64(888),
        gasPrice: '999',
        privateKey: privateKey0,
        transfer: IoTeX.Transfer(
          amount: '456',
          recipient: 'io187wzp08vnhjjpkydnr97qlh8kh0dpkkytfam8j',
          payload: parse_hex("68656c6c6f20776f726c6421"), // "hello world!"
        ),
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

      final expectedPreImage =
          "0801107b18f8062203393939523e0a033435361229696f313837777a703038766e686a6a706b79646e72393771"
          "6c68386b683064706b6b797466616d386a1a0c68656c6c6f20776f726c6421";
      final expectedPreImageHash =
          "0f17cd7f43bdbeff73dfe8f5cb0c0045f2990884e5050841de887cf22ca35b50";
      expect(hex(preImage), expectedPreImage);
      expect(hex(preImageHash), expectedPreImageHash);

      final signature = parse_hex(
          "555cc8af4181bf85c044c3201462eeeb95374f78aa48c67b87510ee63d5e502372e"
          "53082f03e9a11c1e351de539cedf85d8dff87de9d003cb9f92243541541a000");

      // Verify signature (pubkey & hash & signature)
      expect(
        pbkey0.verify(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature],
          publicKeys: [pbkey0.data],
        );

        final output = IoTeX.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), ExpectedTx0);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = IoTeX.SigningInput.fromBuffer(inputData);
        expect(
          hex(TWPrivateKey.createWithData(privateKey0)
              .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1)
              .data),
          hex(pubKey0),
        );
        signingInput.privateKey = prkey0.data;
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), ExpectedTx0);
      }

      {
        // more signatures
        final signingInput = IoTeX.SigningInput.fromBuffer(inputData);
        expect(
          hex(TWPrivateKey.createWithData(privateKey1)
              .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1)
              .data),
          hex(pubKey1),
        );
        signingInput.privateKey = prkey1.data;
        final output = IoTeX.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), ExpectedTx1);
      }

      {
        // Negative: invalid public key
        final publicKeyBlake =
            parse_hex("6641abedacf9483b793afe1718689cc9420bbb1c");
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature],
          publicKeys: [publicKeyBlake],
        );
        expect(outputData.isEmpty, true);
      }

      {
        // Negative: not enough signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [],
          publicKeys: [pbkey0.data],
        );

        final output = IoTeX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
        expect(output.errorMessage, 'empty signatures or publickeys');
      }

      {
        // Negative: not enough publicKey
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature],
          publicKeys: [],
        );

        final output = IoTeX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
        expect(output.errorMessage, 'empty signatures or publickeys');
      }

      {
        // Negative: not one to on
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [signature],
          publicKeys: [pbkey0.data, pbkey1.data],
        );

        final output = IoTeX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
        expect(output.errorMessage,
            'signatures and publickeys size can only be one');
      }
    });
  });
}
