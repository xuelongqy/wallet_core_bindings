import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Stellar.pb.dart' as Stellar;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('StellarCompiler', () {
    const coin = TWCoinType.Stellar;

    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      final privateKey = TWPrivateKey.createWithHexString(
          '59a313f46ef1c23a9e4f71cea10fc0c56a2a6bb8a4b9ea3d5348823e5a478722');
      final publicKey = privateKey.getPublicKey(coin);

      final input = Stellar.SigningInput(
        passphrase: TWStellarPassphrase_Stellar,
        account: 'GAE2SZV4VLGBAPRYRFV2VY7YYLYGYIP5I7OU7BSP6DJT7GAZ35OKFDYI',
        fee: 1000,
        sequence: $fixnum.Int64(2),
        opPayment: Stellar.OperationPayment(
          destination:
              'GDCYBNRRPIHLHG7X7TKPUPAZ7WVUXCN3VO7WCCK64RIFV5XM5V5K4A52',
          amount: $fixnum.Int64(10000000),
        ),
        memoText: Stellar.MemoText(
          text: 'Hello, world!',
        ),
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '1e8786a0162630b2393e0f6c51f16a2d7860715023cb19bf25cad14490b1f8f3');

      final signature = parse_hex(
          "5042574491827aaccbce1e2964c05098caba06194beb35e595aabfec9f788516a83"
          "3f755f18144f4a2eedb3123d180f44e7c16037d00857c5c5b7033ebac2c01");

      /// Step 3: Compile transaction info
      const tx = "AAAAAAmpZryqzBA+OIlrquP4wvBsIf1H3U+GT/"
          "DTP5gZ31yiAAAD6AAAAAAAAAACAAAAAAAAAAEAAAANSGVsbG8sIHdvcmxkIQAAAAAAAAEAAAAAAAAA"
          "AQAAAADFgLYxeg6zm/"
          "f81Po8Gf2rS4m7q79hCV7kUFr27O16rgAAAAAAAAAAAJiWgAAAAAAAAAABGd9cogAAAEBQQldEkYJ6"
          "rMvOHilkwFCYyroGGUvrNeWVqr/sn3iFFqgz91XxgUT0ou7bMSPRgPROfBYDfQCFfFxbcDPrrCwB";
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [],
      );

      {
        final output = Stellar.SigningOutput.fromBuffer(outputData);
        expect(output.signature, tx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Stellar.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = privateKey.data;

        final output = Stellar.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.signature, tx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [],
        );
        final output = Stellar.SigningOutput.fromBuffer(outputData);
        expect(output.signature.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}
