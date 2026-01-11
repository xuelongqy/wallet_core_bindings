import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Theta.pb.dart' as Theta;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('ThetaCompiler', () {
    const coin = TWCoinType.Theta;

    test('CompileWithSignatures', () {
      final pkFrom = TWPrivateKey.createWithHexString(
          "93a90ea508331dfdf27fb79757d4250b4e84954927ba0073cd67454ac432c737");
      final publicKey =
          pkFrom.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);

      final input = Theta.SigningInput(
        chainId: 'privatenet',
        toAddress: '0x9F1233798E905E173560071255140b4A8aBd3Ec6',
        thetaAmount: intToBytes(10),
        tfuelAmount: intToBytes(20),
        fee: intToBytes(1000000000000),
        sequence: $fixnum.Int64(1),
        publicKey: publicKey.data,
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(hex(preSigningOutput.dataHash),
          '2dc419e9919e65f129453419dc72a6bee99b2281dfddf754807a5c212ae35678');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = publicKey.data;
      final signature = parse_hex(
          "5190868498d587d074d57298f41853d0109d997f15ddf617f471eb8cbb7fff267cb8fe9134ccdef0"
          "53ec7cabd18070325c9c436efe1abbacd14eb7561d3fc10501");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
          signature,
          Uint8List.fromList(preSigningOutput.dataHash),
        ),
        true,
      );

      /// Step 3: Compile transaction info
      const expectedTx =
          "02f887c78085e8d4a51000f863f861942e833968e5bb786ae419c4d13189fb081cc43babc70a"
          "85e8d4a5101401b8415190868498d587d074d57298f41853d0109d997f15ddf617f471eb8cbb"
          "7fff267cb8fe9134ccdef053ec7cabd18070325c9c436efe1abbacd14eb7561d3fc10501d9d8"
          "949f1233798e905e173560071255140b4a8abd3ec6c20a14";

      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );

      {
        final output = Theta.SigningOutput.fromBuffer(outputData);

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Theta.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = pkFrom.data;

        final output = Theta.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKeyData],
        );
        final output = Theta.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }
    });
  });
}
