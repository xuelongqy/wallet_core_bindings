import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ripple.pb.dart' as Ripple;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('RippleCompiler', () {
    const coin = TWCoinType.TWCoinTypeXRP;

    test('CompileRippleWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      final key = parse_hex(
          "acf1bbf6264e699da0cc65d17ac03fcca6ded1522d19529df7762db46097ff9f");
      final privateKey = TWPrivateKey.createWithData(key);
      final publicKey = privateKey
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1);

      final input = Ripple.SigningInput(
        opPayment: Ripple.OperationPayment(
          amount: $fixnum.Int64(1000000),
          destination: 'rNLpgsBTCwiaZAnHe2ZViAN1GcXZtYW6rg',
        ),
        fee: $fixnum.Int64(10),
        sequence: 75674534,
        lastLedgerSequence: 75674797,
        account: 'rGV1v1xw23PHcRn4Km4tF8R2mfh6yTZkcP',
        publicKey: publicKey.data,
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      final preImage = preSigningOutput.data;
      expect(hex(preImage),
          '535458001200002200000000240482b3a6201b0482b4ad6140000000000f424068400000000000000a7321027efc5f15071d2ae5e73ee09a0c17456c5d9170a41d67e3297c554829199be80b8114aa000c09c692ef1f82787e51e22833149941ea2083149232ef60695add51f0f84534cc4084e4fdfc698e');
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '86ef78df7a4aad29e6b3730f7965c1bd5ccd2439426cb738d7c494a64cfaf4af');
      // Simulate signature, normally obtained from signature server
      final signature = privateKey.signAsDER(Uint8List.fromList(preImageHash));
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verifyAsDER(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final ExpectedTx =
          '1200002200000000240482b3a6201b0482b4ad6140000000000f424068400000000000000a7321027efc5f15071d2ae5e73ee09a0c17456c5d9170a41d67e3297c554829199be80b74473045022100e1c746c3aeebc8278c627ee4c2ce5cae97e3856292c7fe5388f803920230a37b02207d2eccb76cd35dd379d6b24c2cabd786e62d34a564cf083e863176109c5b6bb48114aa000c09c692ef1f82787e51e22833149941ea2083149232ef60695add51f0f84534cc4084e4fdfc698e';

      {
        final output = Ripple.SigningOutput.fromBuffer(outputData);

        expect(hex(output.encoded), ExpectedTx);
        expect(output.error, Common.SigningError.OK);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Ripple.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = key;
        final output = Ripple.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), ExpectedTx);
      }

      {
        // Negative: not enough signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Ripple.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Ripple.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
