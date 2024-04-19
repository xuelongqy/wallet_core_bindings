import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  group('NeblCompiler', () {
    const coin = TWCoinType.TWCoinTypeNebl;

    test('CompileWithSignatures', () {
      // tx on mainnet
      // https://Nebl-blockchain.info/tx/21314157b60ddacb842d2a749429c4112724b7a078adb9e77ba502ea2dd7c230

      final amount = 100000000;
      final fee = 226;
      final toAddress = "NRrKgiZfT7jUdS3geoEBproA7hzZnDQAdr";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc',
        coinType: coin,
        time: 1584059579,
      );

      final txHash0 = parse_hex(
              "ee839754c8e93d620cbec9a1c51e7b69016d00839741b03af2c039852d941212")
          .reversed
          .toList();

      input.utxo.add(Bitcoin.UnspentTransaction(
        outPoint: Bitcoin.OutPoint(
          hash: txHash0,
          index: 1,
          sequence: 4294967295,
        ),
        amount: $fixnum.Int64(20000000000000),
      ));

      final script0 = TWBitcoinScript.lockScriptForAddress(
          'NboLGGKWtK5eXzaah5GVpXju9jCcoMi4cc', coin);
      expect(hex(script0.data),
          '76a914ae40b2142aba5ddd10f74d9440bfda8a36cbad5b88ac');
      input.utxo[0].script = script0.data;

      final utxoKey0 = TWPrivateKey.createWithHexString(
          '4222aae79af41eade7b07ce6fd44d926ea8e3f95e51a06e85f8bdec89680cbd9');
      input.privateKey.add(utxoKey0.data);

      expect(input.utxo.length, 1);
      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(19999899999774);

      // Extend input with accepted plan
      input.plan = plan;

      // Serialize input
      final txInputData = input.writeToBuffer();
      expect(txInputData.isNotEmpty, true);

      /// Step 2: Obtain preimage hashes
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);

      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(
        hex(preSigningOutput.hashPublicKeys[0].dataHash),
        'e7d7c67a125a506d46fa75f86a575360239d301a19621f9f231c46d889fe1a3b',
      );

      expect(
        hex(preSigningOutput.hashPublicKeys[0].publicKeyHash),
        'ae40b2142aba5ddd10f74d9440bfda8a36cbad5b',
      );

      final publicKeyHex =
          "03787a4c5ff72dce6d97f9b6360dc302b2d8a833e8c570dcc124a96e5f564bb524";
      final publicKey = TWPublicKey.createWithHexString(
        publicKeyHex,
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );

      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      final signature = parse_hex(
          "3045022100a2dd4cbc8516a7b19516bce90fde7a3c4836c1277ddc61ca80d27d5711bcefc302200e049a3c2bdfd7ebacb7be48914a7cad8ea0db0695fb28ab645acdb12c413cb3");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verifyAsDER(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      // Simulate signatures, normally obtained from signature server.
      final signatureVec = [signature];
      final pubkeyVec = [publicKey.data];

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatureVec,
        publicKeys: pubkeyVec,
      );

      final ExpectedTx =
          "01000000bbd46a5e011212942d8539c0f23ab0419783006d01697b1ec5a1c9be0c623de9c8549783ee010000006b483045022100a2dd4cbc8516a7b19516bce90fde7a3c4836c1277ddc61ca80d27d5711bcefc302200e049a3c2bdfd7ebacb7be48914a7cad8ea0db0695fb28ab645acdb12c413cb3012103787a4c5ff72dce6d97f9b6360dc302b2d8a833e8c570dcc124a96e5f564bb524ffffffff0200e1f505000000001976a914412033ed457c72ca70bab5fbfdc03256bd2ce07d88ac1e5eef96301200001976a914ae40b2142aba5ddd10f74d9440bfda8a36cbad5b88ac00000000";
      {
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), ExpectedTx);
      }

      {
        // Negative: not enough signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: pubkeyVec,
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: not enough signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
