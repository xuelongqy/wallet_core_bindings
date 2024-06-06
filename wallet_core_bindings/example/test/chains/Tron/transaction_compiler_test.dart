import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Tron.pb.dart' as Tron;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('TronCompiler', () {
    const coin = TWCoinType.Tron;

    test('CompileWithSignatures', () {
      final privateKey = TWPrivateKey.createWithHexString(
          '2d8f68944bdbfbc0769542fba8fc2d2a3de67393334471624364c7006da2aa54');
      final publicKey =
          privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1Extended);

      /// Step 1: Prepare transaction input (protobuf)
      final input = Tron.SigningInput(
        transaction: Tron.Transaction(
          transferAsset: Tron.TransferAssetContract(
            ownerAddress: 'TJRyWwFs9wTFGZg3JbrVriFbNfCug5tDeC',
            toAddress: 'THTR75o8xXAgCTQqpiot2AFRAjvW1tSbVV',
            amount: $fixnum.Int64(4),
            assetName: '1000959',
          ),
          timestamp: $fixnum.Int64(1539295479000),
          expiration: $fixnum.Int64(1541890116000 + 10 * 60 * 60 * 1000),
          blockHeader: Tron.BlockHeader(
            timestamp: $fixnum.Int64(1541890116000),
            txTrieRoot: parse_hex(
                "845ab51bf63c2c21ee71a4dc0ac3781619f07a7cd05e1e0bd8ba828979332ffa"),
            parentHash: parse_hex(
                "00000000003cb800a7e69e9144e3d16f0cf33f33a95c7ce274097822c67243c1"),
            number: $fixnum.Int64(3979265),
            witnessAddress:
                parse_hex("41b487cdc02de90f15ac89a68c82f44cbfe3d915ea"),
            version: 3,
          ),
        ),
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashesData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashesData);
      expect(preSigningOutput.error, Common.SigningError.OK);
      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '546a3d07164c624809cf4e564a083a7a7974bb3c4eff6bb3e278b0ca21083fcb');
      final signature = parse_hex(
          "77f5eabde31e739d34a66914540f1756981dc7d782c9656f5e14e53b59a15371603"
          "a183aa12124adeee7991bf55acc8e488a6ca04fb393b1a8ac16610eeafdfc00");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature, Uint8List.fromList(preSigningOutput.dataHash)),
        true,
      );

      /// Step 3: Compile transaction info
      const tx =
          "{\"raw_data\":{\"contract\":[{\"parameter\":{\"type_url\":\"type.googleapis.com/"
          "protocol.TransferAssetContract\",\"value\":{\"amount\":4,\"asset_name\":"
          "\"31303030393539\",\"owner_address\":\"415cd0fb0ab3ce40f3051414c604b27756e69e43db\",\"to_"
          "address\":\"41521ea197907927725ef36d70f25f850d1659c7c7\"}},\"type\":"
          "\"TransferAssetContract\"}],\"expiration\":1541926116000,\"ref_block_bytes\":\"b801\","
          "\"ref_block_hash\":\"0e2bc08d550f5f58\",\"timestamp\":1539295479000},\"signature\":["
          "\"77f5eabde31e739d34a66914540f1756981dc7d782c9656f5e14e53b59a15371603a183aa12124adeee7991b"
          "f55acc8e488a6ca04fb393b1a8ac16610eeafdfc00\"],\"txID\":"
          "\"546a3d07164c624809cf4e564a083a7a7974bb3c4eff6bb3e278b0ca21083fcb\"}";
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );

      {
        final output = Tron.SigningOutput.fromBuffer(outputData);

        expect(output.json, tx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Tron.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = privateKey.data;

        final output = Tron.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.json, tx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Tron.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }
    });
  });
}
