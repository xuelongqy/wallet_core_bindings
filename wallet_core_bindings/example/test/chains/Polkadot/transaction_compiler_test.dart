import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Polkadot.pb.dart' as Polkadot;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('PolkadotCompiler', () {
    const coin = TWCoinType.Polkadot;

    test('CompileWithSignatures', () {
      /// Prepare transaction input (protobuf)
      final input = Polkadot.SigningInput(
        blockHash: parse_hex(
            "40cee3c3b7f8422f4c512e9ebebdeeff1c28e81cc678ee4864d945d641e05f9b"),
        genesisHash: parse_hex(
            "91b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c3"),
        nonce: $fixnum.Int64(0),
        specVersion: 25,
        transactionVersion: 5,
        network: coin.ss58Prefix,
      );

      input.era = Polkadot.Era(
        blockNumber: $fixnum.Int64(5898150),
        period: $fixnum.Int64(10000),
      );

      input.balanceCall = Polkadot.Balance(
        transfer: Polkadot.Balance_Transfer(
          value: parse_hex("210fdc0c00"),
          toAddress: '15JWiQUmczAFU3hrZrD2gDyuJdL2BbFaX9yngivb1UWiBJWA',
        ),
      );

      final txInputData = input.writeToBuffer();
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      final preImageHash = preOutput.dataHash;

      {
        expect(
          hex(preImageHash),
          '0500be4c21aa92dcba057e9b719ce1de970f774f064c09b13a3ea3009affb8cb5ec707000cdc0f219dfe0000190000000500000091b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c340cee3c3b7f8422f4c512e9ebebdeeff1c28e81cc678ee4864d945d641e05f9b',
        );
      }

      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "d84accbb64934815506288fafbfc7d275e64aa4e3cd9c5392db6e83b13256bf3");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.ED25519,
      );
      final signature = parse_hex(
          "fb43727477caaa12542b9060856816d42eedef6ebf2e98e4f8dff4355fe384751925833c4a26b2fed1707aebe655cb3317504a61ee59697c086f7baa6ca06a09");

      // Verify signature (pubkey & hash & signature)
      {
        expect(
          publicKey.verify(signature, Uint8List.fromList(preImageHash)),
          true,
        );
      }

      const expectedTx =
          "390284d84accbb64934815506288fafbfc7d275e64aa4e3cd9c5392db6e83b13256bf300fb43727477caaa12542b9060856816d42eedef6ebf2e98e4f8dff4355fe384751925833c4a26b2fed1707aebe655cb3317504a61ee59697c086f7baa6ca06a099dfe00000500be4c21aa92dcba057e9b719ce1de970f774f064c09b13a3ea3009affb8cb5ec707000cdc0f21";
      {
        /// Compile transaction info
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature],
          publicKeys: [publicKeyData],
        );
        final output = Polkadot.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded), expectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKeyData],
        );
        final output = Polkadot.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Polkadot.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }
    });
  });
}
