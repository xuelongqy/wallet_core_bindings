import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Binance.pb.dart' as Binance;
import 'package:wallet_core_bindings/proto/Ethereum.pb.dart' as Ethereum;
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;
import 'package:wallet_core_bindings/proto/NULS.pb.dart' as NULS;
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

class SignatureInfo {
  final Uint8List signature;
  final Uint8List publicKey;

  SignatureInfo({
    required this.signature,
    required this.publicKey,
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
          publicKeyData, TWPublicKeyType.TWPublicKeyTypeSECP256k1);
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
        signatures: [signature],
        publicKeys: [publicKeyData],
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
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended,
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
        signatures: [signature],
        publicKeys: [publicKeyData],
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
      final utxoInfos = [
        UtxoInfo(
            revUtxoHash: revUtxoHash0,
            publicKey: inPubKey0,
            amount: 600000,
            index: 0),
        UtxoInfo(
            revUtxoHash: revUtxoHash1,
            publicKey: inPubKey0,
            amount: 500000,
            index: 1),
        UtxoInfo(
            revUtxoHash: revUtxoHash2,
            publicKey: inPubKey1,
            amount: 400000,
            index: 0),
      ];
      final signatureInfos = {
        '${TWString.createWithHexBytes(inPubKeyHash0).value}+a296bead4172007be69b21971a790e076388666c162a9505698415f1b003ebd7':
            SignatureInfo(
          signature: TWData.createWithHexString(
                  '304402201857bc6e6e48b46046a4bd204136fc77e24c240943fb5a1f0e86387aae59b34902200a7f31478784e51c49f46ef072745a4f263d7efdbc9c6784aa2571ff4f6f2a40')
              .bytes()!,
          publicKey: inPubKey0,
        ),
        '${TWString.createWithHexBytes(inPubKeyHash1).value}+505f527f00e15fcc5a2d2416c9970beb57dfdfaca99e572a01f143b24dd8fab6':
            SignatureInfo(
          signature: TWData.createWithHexString(
                  '3044022041294880caa09bb1b653775310fcdd1458da6b8e7d7fae34e37966414fe115820220646397c9d2513edc5974ecc336e9b287de0cdf071c366f3b3dc3ff309213e4e4')
              .bytes()!,
          publicKey: inPubKey1,
        ),
        '${TWString.createWithHexBytes(inPubKeyHash0).value}+60ed6e9371e5ddc72fd88e46a12cb2f68516ebd307c0fd31b1b55cf767272101':
            SignatureInfo(
          signature: TWData.createWithHexString(
                  '30440220764e3d5b3971c4b3e70b23fb700a7462a6fe519d9830e863a1f8388c402ad0b102207e777f7972c636961f92375a2774af3b7a2a04190251bbcb31d19c70927952dc')
              .bytes()!,
          publicKey: inPubKey0,
        ),
      };

      final coin = TWCoinType.TWCoinTypeBitcoin;
      final ownAddress = 'bc1qhkfq3zahaqkkzx5mjnamwjsfpq2jk7z00ppggv';

      // Setup input for Plan
      final signingInput = Bitcoin.SigningInput(
        coinType: coin,
        hashType: TWBitcoinSigHashType.TWBitcoinSigHashTypeAll,
        amount: $fixnum.Int64(1200000),
        useMaxAmount: false,
        byteFee: $fixnum.Int64(1),
        toAddress: 'bc1q2dsdlq3343vk29runkgv4yc292hmq53jedfjmp',
        changeAddress: ownAddress,
        utxo: [],
        scripts: {},
      );

      // process UTXOs
      int count = 0;
      for (final u in utxoInfos) {
        final publicKey = TWPublicKey(
          u.publicKey,
          TWPublicKeyType.TWPublicKeyTypeSECP256k1,
        );
        final address =
            TWSegwitAddress.createWithPublicKey(TWHRP.TWHRPBitcoin, publicKey);
        if (count == 0) {
          expect(address.description, ownAddress);
        }
        if (count == 1) {
          expect(address.description, ownAddress);
        }
        if (count == 2) {
          expect(address.description,
              'bc1qveq6hmdvl9yrk7f6lct3s6yue9pqhwcuxedggg');
        }

        final utxoScript =
            TWBitcoinScript.lockScriptForAddress(address.description, coin);
        if (count == 0) {
          expectHex(
              utxoScript.data, '0014bd92088bb7e82d611a9b94fbb74a0908152b784f');
        }
        if (count == 1) {
          expectHex(
              utxoScript.data, '0014bd92088bb7e82d611a9b94fbb74a0908152b784f');
        }
        if (count == 2) {
          expectHex(
              utxoScript.data, '00146641abedacf9483b793afe1718689cc9420bbb1c');
        }

        final keyHash = utxoScript.matchPayToWitnessPublicKeyHash()!;
        if (count == 0) {
          expect(keyHash, inPubKeyHash0);
        }
        if (count == 1) {
          expect(keyHash, inPubKeyHash0);
        }
        if (count == 2) {
          expect(keyHash, inPubKeyHash1);
        }

        final redeemScript = TWBitcoinScript.buildPayToPublicKeyHash(keyHash);
        if (count == 0) {
          expectHex(redeemScript.data,
              '76a914bd92088bb7e82d611a9b94fbb74a0908152b784f88ac');
        }
        if (count == 1) {
          expectHex(redeemScript.data,
              '76a914bd92088bb7e82d611a9b94fbb74a0908152b784f88ac');
        }
        if (count == 2) {
          expectHex(redeemScript.data,
              '76a9146641abedacf9483b793afe1718689cc9420bbb1c88ac');
        }

        signingInput.scripts[TWString.createWithHexBytes(keyHash).value!] =
            redeemScript.data;

        signingInput.utxo.add(Bitcoin.UnspentTransaction(
          script: utxoScript.data,
          outPoint: Bitcoin.OutPoint(
            hash: u.revUtxoHash,
            index: u.index,
            sequence: 0xffffffff,
          ),
          amount: $fixnum.Int64(u.amount),
        ));

        ++count;
      }
      expect(count, 3);
      expect(signingInput.utxo.length, 3);

      // Plan
      final plan = Bitcoin.TransactionPlan.fromBuffer(
          TWAnySigner.plan(signingInput.writeToBuffer(), coin));

      // Plan is checked, assume it is accepted
      expect(plan.amount.toInt(), 1200000);
      expect(plan.fee.toInt(), 277);
      expect(plan.change.toInt(), 299723);
      expect(plan.utxos.length, 3);
      // Note that UTXOs happen to be in reverse order compared to the input
      expectHexBytes(
          Uint8List.fromList(plan.utxos[0].outPoint.hash), revUtxoHash2);
      expectHexBytes(
          Uint8List.fromList(plan.utxos[1].outPoint.hash), revUtxoHash1);
      expectHexBytes(
          Uint8List.fromList(plan.utxos[2].outPoint.hash), revUtxoHash0);

      // Extend input with accepted plan
      signingInput.plan = plan;

      // Serialize signingInput
      final txInputData = signingInput.writeToBuffer();

      /// Step 2: Obtain preimage hashes
      final preImageHash =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preOutput = Bitcoin.PreSigningOutput.fromBuffer(preImageHash);
      expect(preOutput.hashPublicKeys.length, 3);
      final hashes = preOutput.hashPublicKeys;
      expectHex(Uint8List.fromList(hashes[0].dataHash),
          '505f527f00e15fcc5a2d2416c9970beb57dfdfaca99e572a01f143b24dd8fab6');
      expectHex(Uint8List.fromList(hashes[1].dataHash),
          'a296bead4172007be69b21971a790e076388666c162a9505698415f1b003ebd7');
      expectHex(Uint8List.fromList(hashes[2].dataHash),
          '60ed6e9371e5ddc72fd88e46a12cb2f68516ebd307c0fd31b1b55cf767272101');
      expectHexBytes(
          Uint8List.fromList(hashes[0].publicKeyHash), inPubKeyHash1);
      expectHexBytes(
          Uint8List.fromList(hashes[1].publicKeyHash), inPubKeyHash0);
      expectHexBytes(
          Uint8List.fromList(hashes[2].publicKeyHash), inPubKeyHash0);

      // Simulate signatures, normally obtained from signature server.
      final signatureVec = <Uint8List>[];
      final pubkeyVec = <Uint8List>[];
      for (final h in hashes) {
        final preImageHash_ = Uint8List.fromList(h.dataHash);
        final pubkeyHash = Uint8List.fromList(h.publicKeyHash);

        final key =
            '${TWString.createWithHexBytes(pubkeyHash).value}+${TWString.createWithHexBytes(preImageHash_).value}';
        final sigInfoFind = signatureInfos[key]!;
        final publicKeyData = sigInfoFind.publicKey;
        final publicKey = TWPublicKey(
          publicKeyData,
          TWPublicKeyType.TWPublicKeyTypeSECP256k1,
        );
        final signature = sigInfoFind.signature;
        signatureVec.add(signature);
        pubkeyVec.add(publicKeyData);
        // Verify signature (pubkey & hash & signature)
        expect(
            publicKey.verifyAsDER(signature: signature, message: preImageHash_),
            true);
      }

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatureVec,
        publicKeys: pubkeyVec,
      );

      final ExpectedTx =
          "010000000001036021efcf7555f90627364339fc921139dd40a06ccb2cb2a2a4f8f4ea7a2dc74d0000000000ff"
          "ffffffd6892a5aa54e3b8fe430efd23f49a8950733aaa9d7c915d9989179f48dd1905e0100000000ffffffff07"
          "c42b969286be06fae38528c85f0a1ce508d4df837eb5ac4cf5f2a7a9d65fa80000000000ffffffff02804f1200"
          "000000001600145360df8231ac5965147c9d90ca930a2aafb05232cb92040000000000160014bd92088bb7e82d"
          "611a9b94fbb74a0908152b784f02473044022041294880caa09bb1b653775310fcdd1458da6b8e7d7fae34e379"
          "66414fe115820220646397c9d2513edc5974ecc336e9b287de0cdf071c366f3b3dc3ff309213e4e40121021714"
          "2f69535e4dad0dc7060df645c55a174cc1bfa5b9eb2e59aad2ae96072dfc0247304402201857bc6e6e48b46046"
          "a4bd204136fc77e24c240943fb5a1f0e86387aae59b34902200a7f31478784e51c49f46ef072745a4f263d7efd"
          "bc9c6784aa2571ff4f6f2a400121024bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb49"
          "3382024730440220764e3d5b3971c4b3e70b23fb700a7462a6fe519d9830e863a1f8388c402ad0b102207e777f"
          "7972c636961f92375a2774af3b7a2a04190251bbcb31d19c70927952dc0121024bc2a31265153f07e70e0bab08"
          "724e6b85e217f8cd628ceb62974247bb49338200000000";
      {
        expect(outputData.length, 786);
        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 518);
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private keys were not used anywhere up to this point.
        final input = Bitcoin.SigningInput.fromBuffer(txInputData);

        // 2 private keys are needed (despite >2 UTXOs)
        final key0 = TWData.createWithHexString(
                '4646464646464646464646464646464646464646464646464646464646464646')
            .bytes()!;
        final key1 = TWData.createWithHexString(
                '7878787878787878787878787878787878787878787878787878787878787878')
            .bytes()!;
        expectHexBytes(
            TWPrivateKey.createWithData(key0)
                .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1)
                .data,
            inPubKey0);
        expectHexBytes(
            TWPrivateKey.createWithData(key1)
                .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1)
                .data,
            inPubKey1);
        input.privateKey.add(key0);
        input.privateKey.add(key1);

        final output = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin).toList());
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }
    });

    test('ExternalSignatureSignSolana', () {
      final coin = TWCoinType.TWCoinTypeSolana;

      /// Step 1: Prepare transaction input (protobuf)
      final recipient = '3UVYmECPPMZSCqWKfENfuoTv51fTDTWicX9xmBD2euKe';
      final sender = 'sp6VUqq1nDEuU83bU2hstmEYrJNipJYpwS7gZ7Jv7ZH';
      final input = Solana.SigningInput(
        sender: sender,
        recentBlockhash: 'TPJFTN4CjBn12HiBfAbGUhpD9zGvRSm2RcheFRA4Fyv',
        transferTransaction: Solana.Transfer(
          recipient: recipient,
          value: $fixnum.Int64(1000),
        ),
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          Solana.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      expect(preSigningOutput.signers.length, 1);
      final signer = preSigningOutput.signers[0];
      expect(String.fromCharCodes(signer), sender);
      final preImageHash = Uint8List.fromList(preSigningOutput.data);
      expectHex(
        preImageHash,
        "010001030d044a62d0a4dfe5a037a15b59fa4d4d0d3ab81103a2c10a6da08a4d058611c024c255a8bc3e"
        "8496217a2cd2a1894b9b9dcace04fcd9c0d599acdaaea40a1b6100000000000000000000000000000000"
        "0000000000000000000000000000000006c25012cc11a599a45b3b2f7f8a7c65b0547fa0bb67170d7a0c"
        "d1eda4e2c9e501020200010c02000000e803000000000000",
      );

      // Simulate signature, normally obtained from signature server
      final publicKeyData = TWData.createWithHexString(
              '0d044a62d0a4dfe5a037a15b59fa4d4d0d3ab81103a2c10a6da08a4d058611c0')
          .bytes()!;
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeED25519,
      );
      final signature = TWData.createWithHexString(
              "a8c610697087eaf8a34b3facbe06f8e9bb9603bb03270dad021ffcd2fc37b6e9efcdcb78b227401f"
              "000eb9231c67685240890962e44a17fd27fc2ff7b971df03")
          .bytes()!;

      // Verify signature (pubkey & hash & signature)
      expect(
          publicKey.verify(signature: signature, message: preImageHash), true);

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );

      final ExpectedTx =
          "5bWxVCP5fuzkKSGby9hnsLranszQJR2evJGTfBrpDQ4rJceW1WxKNrWqVPBsN2QCAGmE6W7VaYkyWjv39HhGrr1Ne2"
          "QSUuHZdyyn7hK4pxzLPMgPG8fY1XvXdppWMaKMLmhriLkckzGKJMaE3pWBRFBKzigXY28714uUNndb7S9hVakxa59h"
          "rLph39CMgAkcj6b8KYvJEkb1YdYytHSZNGi4kVVTNqiicNgPdf1gmG6qz9zVtnqj9JtaD2efdS8qxsKnvNWSgb8Xxb"
          "T6dwyp7msUUi7d27cYaPTpK";

      {
        final output = Solana.SigningOutput.fromBuffer(outputData);
        expect(output.encoded, ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Solana.SigningInput.fromBuffer(txInputData);
        final key = TWData.createWithHexString(
                '044014463e2ee3cc9c67a6f191dbac82288eb1d5c1111d21245bdc6a855082a1')
            .bytes()!;
        signingInput.privateKey = key;

        final output = Solana.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin).toList());
        expect(output.encoded, ExpectedTx);
      }
    });

    test('ExternalSignatureSignNULS', () {
      final coin = TWCoinType.TWCoinTypeNULS;

      /// Step 1: Prepare transaction input (protobuf)
      final form = 'NULSd6HgWabfcG6H7NDK2TJvtoU3wxY1YLKwJ';
      final to = 'NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe';
      final chainId = 1;
      final idassetsId = 1;
      final amount = 10000000;
      final balance = 100000000;
      final nonce = '0000000000000000';
      final input = NULS.SigningInput(
        from: form,
        to: to,
        amount: intToBytes(amount),
        chainId: chainId,
        idassetsId: idassetsId,
        nonce: nonce.codeUnits,
        balance: intToBytes(balance),
        timestamp: 1569228280,
      );
      final inputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, inputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = Uint8List.fromList(preSigningOutput.data);
      final preImageHash = Uint8List.fromList(preSigningOutput.dataHash);
      expectHex(
          preImage,
          "0200f885885d00008c01170100012c177a01a7afbe98e094007b99476534fb7926b701000100201d9a00"
          "000000000000000000000000000000000000000000000000000000000800000000000000000001170100"
          "01f05e7878971f3374515eabb6f16d75219d887312010001008096980000000000000000000000000000"
          "0000000000000000000000000000000000000000000000");
      expectHex(preImageHash,
          '8746b37cb4b443424d3093e8107c5dfd6c5318010bbffcc8e8ba7c1da60877fd');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = TWData.createWithHexString(
              '033c87a3d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0aff0ee045')
          .bytes()!;
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final signature = TWData.createWithHexString(
              "a5234269eab6fe8a1510dd0cb36070a03464b48856e1ef2681dbb79a5ec656f92961ac01d401a6f8"
              "49acc958c6c9653f49282f5a0916df036ea8766918bac19500")
          .bytes()!;
      // Verify signature (pubkey & hash & signature)
      expect(
          publicKey.verify(signature: signature, message: preImageHash), true);

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );

      final ExpectedTx =
          "0200f885885d00008c01170100012c177a01a7afbe98e094007b99476534fb7926b701000100201d9a00000000"
          "00000000000000000000000000000000000000000000000000080000000000000000000117010001f05e787897"
          "1f3374515eabb6f16d75219d887312010001008096980000000000000000000000000000000000000000000000"
          "00000000000000000000000000006a21033c87a3d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0a"
          "ff0ee045473045022100a5234269eab6fe8a1510dd0cb36070a03464b48856e1ef2681dbb79a5ec656f9022029"
          "61ac01d401a6f849acc958c6c9653f49282f5a0916df036ea8766918bac195";
      {
        expect(outputData.length, 259);
        final output = NULS.SigningOutput.fromBuffer(outputData);
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
        expect(output.encoded.length, 256);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final input = NULS.SigningInput.fromBuffer(inputData);
        final key = TWData.createWithHexString(
                '044014463e2ee3cc9c67a6f191dbac82288eb1d5c1111d21245bdc6a855082a1')
            .bytes()!;
        input.privateKey = key;

        final output = NULS.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin).toList());

        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }
    });

    test('ExternalSignatureSignNULSToken', () {
      final coin = TWCoinType.TWCoinTypeNULS;

      /// Step 1: Prepare transaction input (protobuf)
      final from = 'NULSd6HgWabfcG6H7NDK2TJvtoU3wxY1YLKwJ';
      final to = 'NULSd6Hgied7ym6qMEfVzZanMaa9qeqA6TZSe';
      final chainId = 9;
      final idassetsId = 1;
      final amount = 10000000;
      final balance = 100000000;
      final feePayerBalance = 100000000;
      final nonce = '0000000000000000';
      final input = NULS.SigningInput(
        from: from,
        to: to,
        amount: intToBytes(amount),
        chainId: chainId,
        idassetsId: idassetsId,
        nonce: nonce.codeUnits,
        balance: intToBytes(balance),
        feePayer: from,
        feePayerNonce: nonce.codeUnits,
        feePayerBalance: intToBytes(feePayerBalance),
        timestamp: 1569228280,
      );
      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = Uint8List.fromList(preSigningOutput.data);
      final preImageHash = Uint8List.fromList(preSigningOutput.dataHash);
      expectHex(
        preImage,
        "0200f885885d0000d202170100012c177a01a7afbe98e094007b99476534fb7926b70900010080969800000000"
        "0000000000000000000000000000000000000000000000000008000000000000000000170100012c177a01a7af"
        "be98e094007b99476534fb7926b701000100a08601000000000000000000000000000000000000000000000000"
        "0000000000080000000000000000000117010001f05e7878971f3374515eabb6f16d75219d8873120900010080"
        "969800000000000000000000000000000000000000000000000000000000000000000000000000",
      );
      expectHex(preImageHash,
          '9040642ce845b320453b2ccd6f80efc38fdf61ec8f0c12e0c16f6244ec2e0496');
      // Simulate signature, normally obtained from signature server
      final publicKeyData = TWData.createWithHexString(
              '033c87a3d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0aff0ee045')
          .bytes()!;
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeSECP256k1,
      );
      final signature = TWData.createWithHexString(
              "5ddea604c6cdfcf6cbe32f5873937641676ee5f9aee3c40aa9857c59aefedff25b77429cf62307d4"
              "3a6a79b4c106123e6232e3981032573770fe2726bf9fc07c00")
          .bytes()!;
      // Verify signature (pubkey & hash & signature)
      expect(
          publicKey.verify(signature: signature, message: preImageHash), true);

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );
      final ExpectedTx =
          "0200f885885d0000d202170100012c177a01a7afbe98e094007b99476534fb7926b70900010080969800000000"
          "0000000000000000000000000000000000000000000000000008000000000000000000170100012c177a01a7af"
          "be98e094007b99476534fb7926b701000100a08601000000000000000000000000000000000000000000000000"
          "0000000000080000000000000000000117010001f05e7878971f3374515eabb6f16d75219d8873120900010080"
          "9698000000000000000000000000000000000000000000000000000000000000000000000000006921033c87a3"
          "d9b812556b3034b6471cad5131a01e210c1d7ca06dd53b7d0aff0ee04546304402205ddea604c6cdfcf6cbe32f"
          "5873937641676ee5f9aee3c40aa9857c59aefedff202205b77429cf62307d43a6a79b4c106123e6232e3981032"
          "573770fe2726bf9fc07c";
      {
        expect(outputData.length, 328);
        final output = NULS.SigningOutput.fromBuffer(outputData);
        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
        expect(output.encoded.length, 325);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final input = NULS.SigningInput.fromBuffer(txInputData);
        final key = TWData.createWithHexString(
                '044014463e2ee3cc9c67a6f191dbac82288eb1d5c1111d21245bdc6a855082a1')
            .bytes()!;
        input.privateKey = key;

        final output = NULS.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin).toList());

        expectHex(Uint8List.fromList(output.encoded), ExpectedTx);
      }
    });
  });
}
