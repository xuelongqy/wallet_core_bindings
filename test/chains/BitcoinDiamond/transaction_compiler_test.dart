import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('BitcoinDiamondCompiler', () {
    final coin = TWCoinType.TWCoinTypeBitcoinDiamond;

    test('CompileWithSignatures', () {
      // tx on mainnet
      // http://explorer.btcd.io/#/tx?tx=6f8db2317c0940ff97c461e5e9b89692c6c1fded15fb30ae8b9cc2429ce43f66

      final amount = 196007725;
      final fee = 1014;
      final toAddress = '39mKL9gxk29f2RiofywHYRDmgXPv1ur8uC';

      final toScript = TWBitcoinScript.lockScriptForAddress(toAddress, coin);
      expectHex(
          toScript.data, 'a914589133651fd11901381ecb4d3beef58bc28ba2e787');

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: '15ehpdrZqfZ5rj2e4T4hZKMi3kA8qdSyQu',
        coinType: coin,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "6ce528c1192a9be648dd8c960695a15454c4c77b5a1dd5c8a5a208e6ae7e0ca8")
                  .reversed
                  .toList(),
              index: 0,
              sequence: UINT32_MAX,
            ),
            amount: $fixnum.Int64(501008739),
          ),
        ],
      );

      final utxoAddr0 = "15ehpdrZqfZ5rj2e4T4hZKMi3kA8qdSyQu";
      final script0 = TWBitcoinScript.lockScriptForAddress(utxoAddr0, coin);
      expectHex(
          script0.data, '76a9143301f83977102415e34cccd5ca15136a3dba87d588ac');
      input.utxo[0].script = script0.data;
      expect(input.utxo.length, 1);

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));
      plan.amount = $fixnum.Int64(amount);
      plan.fee = $fixnum.Int64(fee);
      plan.change = $fixnum.Int64(305000000);
      final preBlockHash = parse_hex(
              "840980d100724999ea20e8b14ddd5ea5e37e2beacb9157a17fe87d0854bc7e6f")
          .reversed
          .toList();
      plan.preblockhash = preBlockHash;

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
      expectHex(preSigningOutput.hashPublicKeys[0].dataHash,
          '13565ac8d1d5a8a721417e0391cd13ea1a212b51b9d6bba093babaa203ed9d74');

      expectHex(preSigningOutput.hashPublicKeys[0].publicKeyHash,
          '3301f83977102415e34cccd5ca15136a3dba87d5');

      final publicKeyHex =
          "02f65e76c2a7c239bd6c8b18dc10b71d463b96c0b0d827c97345e6bbe8ee8f2ddc";
      final publicKey = TWPublicKey.createWithHexString(
          publicKeyHex, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      final signature = parse_hex(
          "3045022100e2c048cdf844c77275ac92cc27cfc357155d42d9a82d5d22f62247dce7681467022052c57d744a2ea91970b14e8863efdbcb3fb91f6448c027c25a8e86b752acb5ce");

      // Verify signature (pubkey & hash & signature)
      expect(
          publicKey.verifyAsDER(
              signature: signature, message: Uint8List.fromList(preImageHash)),
          true);

      // Simulate signatures, normally obtained from signature server.
      final signatureVec = [signature];
      final pubkeyVec = [publicKey.data];

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatureVec,
        publicKeys: pubkeyVec,
      );

      final ExpectedTx =
          '0c0000006f7ebc54087de87fa15791cbea2b7ee3a55edd4db1e820ea99497200d180098401a80c7eaee608a2a5c8d51d5a7bc7c45454a19506968cdd48e69b2a19c128e56c000000006b483045022100e2c048cdf844c77275ac92cc27cfc357155d42d9a82d5d22f62247dce7681467022052c57d744a2ea91970b14e8863efdbcb3fb91f6448c027c25a8e86b752acb5ce012102f65e76c2a7c239bd6c8b18dc10b71d463b96c0b0d827c97345e6bbe8ee8f2ddcffffffff022dd7ae0b0000000017a914589133651fd11901381ecb4d3beef58bc28ba2e78740ee2d12000000001976a9143301f83977102415e34cccd5ca15136a3dba87d588ac00000000';
      {
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Negative: not enough signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: pubkeyVec,
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: invalid public key
        final publicKeyBlake = parse_hex(
            "b689ab808542e13f3d2ec56fe1efe43a1660dcadc73ce489fde7df98dd8ce5d9");
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: signatureVec,
          publicKeys: [publicKeyBlake],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.OK);
      }

      {
        // Negative: wrong signature (formally valid)
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [
            parse_hex(
                "415502201857bc6e6e48b46046a4bd204136fc77e24c240943fb5a1f0e86387aae59b349022"
                "00a7f31478784e51c49f46ef072745a4f263d7efdbc9c6784aa2571ff4f6f3b51")
          ],
          publicKeys: pubkeyVec,
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_signing);
      }
    });
  });
}
