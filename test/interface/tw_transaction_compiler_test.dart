import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Binance.pb.dart' as Binance;
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../utils.dart';

class UtxoInfo {
  final Uint8List revUtxoHash;
  final Uint8List publicKey;
  final int amount;
  final int index;

  UtxoInfo({
    required this.revUtxoHash,
    required this.publicKey,
    required this.amount,
    required this.index,
  });
}

void main() {
  group(TWTransactionCompiler, () {
    test('ExternalSignatureSignBinance', () {
      /// Step 1: Prepare transaction input (protobuf)
      final coin = TWCoinType.TWCoinTypeBinance;
      // bnb1grpf0955h0ykzq3ar5nmum7y6gdfl6lxfn46h2
      final fromAddressData =
          TWData.createWithHexString('40c2979694bbc961023d1d27be6fc4d21a9febe6')
              .bytes()!
              .toList();
      // bnb1hlly02l6ahjsgxw9wlcswnlwdhg4xhx38yxpd5
      final toAddressData =
          TWData.createWithHexString('bffe47abfaede50419c577f1074fee6dd1535cd1')
              .bytes()!
              .toList();

      final txInput = Binance.SigningInput(
        chainId: 'Binance-Chain-Nile',
        sendOrder: Binance.SendOrder(
          inputs: [
            Binance.SendOrder_Input(
              address: fromAddressData,
              coins: [
                Binance.SendOrder_Token(
                  denom: 'BNB',
                  amount: $fixnum.Int64(1),
                ),
              ],
            ),
          ],
          outputs: [
            Binance.SendOrder_Output(
              address: toAddressData,
              coins: [
                Binance.SendOrder_Token(
                  denom: 'BNB',
                  amount: $fixnum.Int64(1),
                ),
              ],
            ),
          ],
        ),
      );

      final txInputData = txInput.writeToBuffer();

      {
        // Check, by parsing
        expect(txInputData.length, 88);
        final input = Binance.SigningInput.fromBuffer(txInputData);
        expect(input.chainId, 'Binance-Chain-Nile');
        expect(input.hasSendOrder(), true);
        expect(input.sendOrder.inputs.length, 1);
        expectHex(
          Uint8List.fromList(input.sendOrder.inputs.first.address),
          '40c2979694bbc961023d1d27be6fc4d21a9febe6',
        );
      }

      /// Step 2: Obtain preimage hash
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHashData = Uint8List.fromList(preSigningOutput.dataHash);

      expectHex(preImageHashData,
          '3f3fece9059e714d303a9a1496ddade8f2c38fa78fc4cc2e505c5dbb0ea678d1');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = TWData.createWithHexString(
              '026a35920088d98c3888ca68c53dfc93f4564602606cbb87f0fe5ee533db38e502')
          .bytes()!;
      final publicKey = TWPublicKey.createWithData(
          data: publicKeyData, type: TWPublicKeyType.TWPublicKeyTypeSECP256k1);
      final signature = TWData.createWithHexString(
              '1b1181faec30b60a2ddaa2804c253cf264c69180ec31814929b5de62088c0c5a45e8a816d1208fc5366bb8b041781a6771248550d04094c3d7a504f9e8310679')
          .bytes()!;

      // Verify signature (pubkey & hash & signature)
      {
        expect(
            publicKey.verify(signature: signature, message: preImageHashData),
            true);
      }

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: TWDataVector.createWithData(signature),
        publicKeys: TWDataVector.createWithData(publicKeyData),
      );

      final ExpectedTx =
          'b801f0625dee0a462a2c87fa0a1f0a1440c2979694bbc961023d1d27be6fc4d21a9febe612070a03424e421001121f0a14bffe47abfaede50419c577f1074fee6dd1535cd112070a03424e421001126a0a26eb5ae98721026a35920088d98c3888ca68c53dfc93f4564602606cbb87f0fe5ee533db38e50212401b1181faec30b60a2ddaa2804c253cf264c69180ec31814929b5de62088c0c5a45e8a816d1208fc5366bb8b041781a6771248550d04094c3d7a504f9e8310679';
      {
        final output = Binance.SigningOutput.fromBuffer(outputData);
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final input = Binance.SigningInput.fromBuffer(txInputData);
        final key = TWData.createWithHexString(
                '95949f757db1f57ca94a5dff23314accbe7abee89597bf6a3c7382c84d7eb832')
            .bytes()!;
        input.privateKey = key.toList();

        final output = Binance.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin).toList());
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }
    });

    test('ExternalSignatureSignEthereum', () {
      /// Step 1: Prepare transaction input (protobuf)
      const coin = TWCoinType.TWCoinTypeEthereum;
      final signingInput = Ethereum.SigningInput(
        nonce: intToBytes(11),
        chainId: intToBytes(1),
        gasPrice: bigIntStringToBytes('20000000000'),
        gasLimit: bigIntStringToBytes('21000'),
        txMode: Ethereum.TransactionMode.Legacy,
        toAddress: '0x3535353535353535353535353535353535353535',
        transaction: Ethereum.Transaction(
          transfer: Ethereum.Transaction_Transfer(
            amount: bigIntStringToBytes('1000000000000000000'),
          ),
        ),
      );

      // Serialize back, this shows how to serialize SigningInput protobuf to byte array
      final txInputDataData = signingInput.writeToBuffer();
      // expect(txInputDataData.length, 75);

      /// Step 2: Obtain preimage hash
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputDataData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHashData = Uint8List.fromList(preSigningOutput.dataHash);
      expectHex(preImageHashData,
          '15e180a6274b2f6a572b9b51823fce25ef39576d10188ecdcd7de44526c47217');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = TWData.createWithHexString(
              '044bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382ce28cab79ad7119ee1ad3ebcdb98a16805211530ecc6cfefa1b88e6dff99232a')
          .bytes()!;
      final publicKey = TWPublicKey(
        data: publicKeyData,
        type: TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended,
      );
      final signature = TWData.createWithHexString(
              '360a84fb41ad07f07c845fedc34cde728421803ebbaae392fc39c116b29fc07b53bd9d1376e15a191d844db458893b928f3efbfee90c9febf51ab84c9796677900')
          .bytes()!;

      // Verify signature (pubkey & hash & signature)
      {
        expect(
          publicKey.verify(signature: signature, message: preImageHashData),
          true,
        );
      }

      // Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputDataData,
        signatures: TWDataVector.createWithData(signature),
        publicKeys: TWDataVector.createWithData(publicKeyData),
      );

      final ExpectedTx =
          'f86c0b8504a817c800825208943535353535353535353535353535353535353535880de0b6b3a76400008025a0360a84fb41ad07f07c845fedc34cde728421803ebbaae392fc39c116b29fc07ba053bd9d1376e15a191d844db458893b928f3efbfee90c9febf51ab84c97966779';
      {
        expect(outputData.length, 217);
        final output = Ethereum.SigningOutput.fromBuffer(outputData);

        expect(output.encoded.length, 110);
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final input = Ethereum.SigningInput.fromBuffer(txInputDataData);
        final key = TWData.createWithHexString(
                '4646464646464646464646464646464646464646464646464646464646464646')
            .bytes()!;
        input.privateKey = key.toList();

        final output = Ethereum.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin).toList());

        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }
    });

    test('ExternalSignatureSignBitcoin', () {
      // Test external signining with a Bitcoin transaction with 3 input UTXOs, all used, but only using 2 public keys.
      // Three signatures are neeeded.  This illustrates that order of UTXOs/hashes is not always the same.
      final revUtxoHash0 = TWData.createWithHexString(
              "07c42b969286be06fae38528c85f0a1ce508d4df837eb5ac4cf5f2a7a9d65fa8")
          .bytes()!;
      final revUtxoHash1 = TWData.createWithHexString(
              "d6892a5aa54e3b8fe430efd23f49a8950733aaa9d7c915d9989179f48dd1905e")
          .bytes()!;
      final revUtxoHash2 = TWData.createWithHexString(
              "6021efcf7555f90627364339fc921139dd40a06ccb2cb2a2a4f8f4ea7a2dc74d")
          .bytes()!;
      final inPubKey0 = TWData.createWithHexString(
              "024bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382")
          .bytes()!;
      final inPubKey1 = TWData.createWithHexString(
              "0217142f69535e4dad0dc7060df645c55a174cc1bfa5b9eb2e59aad2ae96072dfc")
          .bytes()!;
      final inPubKeyHash0 =
          TWData.createWithHexString("bd92088bb7e82d611a9b94fbb74a0908152b784f")
              .bytes()!;
      final inPubKeyHash1 =
          TWData.createWithHexString("6641abedacf9483b793afe1718689cc9420bbb1c")
              .bytes()!;

      // Input UTXO infos
    });
  });
}
