import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('VergeCompiler', () {
    const coin = TWCoinType.Verge;

    test('CompileWithSignatures', () {
      // tx on mainnet
      // https://verge-blockchain.info/tx/21314157b60ddacb842d2a749429c4112724b7a078adb9e77ba502ea2dd7c230
      const amount = 9999995000000;
      const fee = 120850;
      const toAddress = "DQZboqURLgrBzBz4Kfbs3yV6fZ3DrNFRjQ";

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.value,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'DCUWt5ctZcPdPMYPV2o1xK1kqv7jNwxu4h',
        coinType: coin.value,
        time: 1584059579,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "ee839754c8e93d620cbec9a1c51e7b69016d00839741b03af2c039852d941212")
                  .reversed
                  .toList(),
              index: 1,
              sequence: 4294967295,
            ),
            amount: $fixnum.Int64(20000000000000),
            script:
                parse_hex("76a91479471b92b3c94b37544fff430556043d9acd53b188ac"),
          ),
        ],
      );

      expect(input.utxo.length, 1);

      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(10000004879150);

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
        'f7498449e2b8d33d4ff00c72b05c820e5262f43360d9f38455dcfd8f6425c9b2',
      );

      expect(
        hex(preSigningOutput.hashPublicKeys[0].publicKeyHash),
        '79471b92b3c94b37544fff430556043d9acd53b1',
      );

      const publicKeyHex =
          "02b2655122379a375a47e7a204a9dc4572cec5dbe4db4c51fea0c9fa03061fdb0b";
      final publicKey = TWPublicKey.createWithHexString(
          publicKeyHex, TWPublicKeyType.SECP256k1);
      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      final signature = parse_hex(
          "3044022039e18d10ab4793d0564cfa675286d2ffd016b8f936c696fd3b72267b621dcd400220653d4761be6b12261629c4240033a08d9767a5f16851dc91a190c8a8d25ecbe0");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verifyAsDER(signature, Uint8List.fromList(preImageHash)),
        true,
      );

      // Simulate signatures, normally obtained from signature server.
      final signatures = [signature];
      final publicKeys = [publicKey.data];

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatures,
        publicKeys: publicKeys,
      );

      const ExpectedTx =
          "01000000bbd46a5e011212942d8539c0f23ab0419783006d01697b1ec5a1c9be0c623de9c8549783ee010000006a473044022039e18d10ab4793d0564cfa675286d2ffd016b8f936c696fd3b72267b621dcd400220653d4761be6b12261629c4240033a08d9767a5f16851dc91a190c8a8d25ecbe0012102b2655122379a375a47e7a204a9dc4572cec5dbe4db4c51fea0c9fa03061fdb0bffffffff02c054264e180900001976a914d50cce1f1449ac5630a0a731cbfcf7d7208a6e7d88ac2e13bd4e180900001976a91450751a6dc46f7068ac3c6350f6a85f7c20fd5e2988ac00000000";

      Bitcoin.SigningOutput output;
      {
        output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), ExpectedTx);
      }

      {
        // Negative: not enough signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: publicKeys,
        );
        output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: empty signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
