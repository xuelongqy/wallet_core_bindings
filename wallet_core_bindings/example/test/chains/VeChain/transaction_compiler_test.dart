import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/VeChain.pb.dart' as VeChain;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('TronCompiler', () {
    const coin = TWCoinType.VeChain;

    test('CompileWithSignatures', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '0x4646464646464646464646464646464646464646464646464646464646464646');
      final publicKey = privateKey.getPublicKey(coin);

      /// Step 1: Prepare transaction input (protobuf)
      final input = VeChain.SigningInput(
        privateKey: privateKey.data,
        chainTag: 1,
        blockRef: $fixnum.Int64(1),
        expiration: 1,
        gasPriceCoef: 0,
        gas: $fixnum.Int64(21000),
        nonce: $fixnum.Int64(1),
        clauses: [
          VeChain.Clause(
            to: '0x3535353535353535353535353535353535353535',
            value: parse_hex("31303030"), // 1000
          ),
        ],
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImage),
          'e7010101dcdb943535353535353535353535353535353535353535843130303080808252088001c0');
      expect(hex(preImageHash),
          'a1b8ef3af3d8c74e97ac6cd732916a8f4c38c0905c8b70d2fa598edf1f62ea04');

      /// Step 3: Sign
      Uint8List signature;
      {
        final output = VeChain.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));
        expect(
          hex(output.encoded),
          "f86a010101dcdb943535353535353535353535353535353535353535843130303080808252088001c0b8"
          "41bf8edf9600e645b5abd677cb52f585e7f655d1361075d511b37f707a9f31da6702d28739933b264527"
          "a1d05b046f5b74044b88c30c3f5a09d616bd7a4af4901601",
        );

        signature = Uint8List.fromList(output.signature);

        /// Step 4: Verify signature
        expect(
          publicKey.verify(signature, Uint8List.fromList(preImageHash)),
          true,
        );
      }

      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature],
          publicKeys: [publicKey.data],
        );

        final output = VeChain.SigningOutput.fromBuffer(outputData);
        expect(
          hex(output.encoded),
          "f86a010101dcdb943535353535353535353535353535353535353535843130303080808252088001c0b8"
          "41bf8edf9600e645b5abd677cb52f585e7f655d1361075d511b37f707a9f31da6702d28739933b264527"
          "a1d05b046f5b74044b88c30c3f5a09d616bd7a4af4901601",
        );
      }

      {
        // Negative: more than one signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );

        final output = VeChain.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }
    });
  });
}
