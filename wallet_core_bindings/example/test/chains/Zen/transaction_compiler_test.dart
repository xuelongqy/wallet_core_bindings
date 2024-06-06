import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('TWAnySignerZen', () {
    const coin = TWCoinType.Zen;

    test('Sign', () {
      const amount = 200000;
      const toAddress = "znma8BydGx1p7SZ17g5JMMWXqSoRSE7BNdQ";

      final blockHash = parse_hex(
              "000000000396ef95695b498168964e1733aca9fe47bb4f9b2851dcd0ec0edad0")
          .reversed
          .toList();
      const blockHeight = 1163482;

      final sblockHash = parse_hex(
              "0000000002906dc9ef21c60d08cd03d192cba94de66095c63082d8e7e9436d40")
          .reversed
          .toList();
      const sblockHeight = 1163438;

      final input = Bitcoin.SigningInput(
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(amount),
        byteFee: $fixnum.Int64(1),
        toAddress: toAddress,
        changeAddress: 'zncug4MEDrunR5WgdWfGB1t9Bjp8RCpKxA6',
        coinType: coin.coin,
        lockTime: 1163772,
        utxo: [
          Bitcoin.UnspentTransaction(
            outPoint: Bitcoin.OutPoint(
              hash: parse_hex(
                      "89f799d7aaf17dbc619f5c68aa5a5ae55ceec779f9009203a87359217405f8d8")
                  .reversed
                  .toList(),
              index: 1,
              sequence: 4294967294,
            ),
            amount: $fixnum.Int64(1249057),
          ),
        ],
      );

      const utxoAddr0 = 'znj6M9EbCmU7UKN2zgAQ8j1GwUnr4QbZBYt';
      // build utxo scriptPubKey
      // check 89f799d7aaf17dbc619f5c68aa5a5ae55ceec779f9009203a87359217405f8d8,1
      final script0 = TWBitcoinScript.lockScriptForAddressReplay(
        address: utxoAddr0,
        coin: coin,
        blockHash: Uint8List.fromList(sblockHash),
        blockHeight: sblockHeight,
      );
      input.utxo[0].script = script0.data;

      Bitcoin.TransactionPlan plan;
      {
        plan = Bitcoin.TransactionPlan.fromBuffer(
            TWAnySigner.plan(input.writeToBuffer(), coin));

        expect(plan.fee.toInt(), 226);

        plan.preblockhash = blockHash;
        plan.preblockheight = $fixnum.Int64(blockHeight);
        plan.fee = $fixnum.Int64(302);
        plan.change = $fixnum.Int64(1249057) - plan.amount - plan.fee;

        input.plan = plan;
      }

      // build preimage
      final txInputData = input.writeToBuffer();
      expect(txInputData.isNotEmpty, true);

      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      expect(preImageHashes.isNotEmpty, true);

      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);
      expect(preSigningOutput.hashPublicKeys.length, 1);

      final preImageHash = preSigningOutput.hashPublicKeys[0].dataHash;
      expect(hex(preImageHash),
          '882e2e61e740ff3d5889995679bf3dcda1b872e0d93be23c89a4fd4e3837f200');

      // compile
      final publicKey = TWPublicKey.createWithHexString(
        '02806408d2f6d5095bb73e89f9edbe02fe81853f25c541d33da4422c6916c1d0e1',
        TWPublicKeyType.SECP256k1,
      );
      final signature = parse_hex(
          "3045022100b27a4d10a4c5e758c4a379ccf7050eae6d8d4dacf5c65894d024de5ab947d4640220194ffccb29c95fe0ae3fb91a40276536494102891c6c5a9aee6063106fa55d30");
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final signingOutput = Bitcoin.SigningOutput.fromBuffer(outputData);
      // txid: 0fc555f8e205e66576f760d99270eaa6d60480c0e816209b2058387b65c2a000
      expect(
        hex(signingOutput.encoded),
        '0100000001d8f80574215973a8039200f979c7ee5ce55a5aaa685c9f61bc7df1aad799f789010000006b483045022100b27a4d10a4c5e758c4a379ccf7050eae6d8d4dacf5c65894d024de5ab947d4640220194ffccb29c95fe0ae3fb91a40276536494102891c6c5a9aee6063106fa55d30012102806408d2f6d5095bb73e89f9edbe02fe81853f25c541d33da4422c6916c1d0e1feffffff02400d0300000000003f76a914e0b858909b6b2c14996658085ed907abd880d32d88ac20d0da0eecd0dc51289b4fbb47fea9ac33174e966881495b6995ef96030000000003dac011b4b3001000000000003f76a91481b1b83b2ae8a4cddd72750dc5252c4bddd4e57e88ac20d0da0eecd0dc51289b4fbb47fea9ac33174e966881495b6995ef96030000000003dac011b4fcc11100',
      );

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
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
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
