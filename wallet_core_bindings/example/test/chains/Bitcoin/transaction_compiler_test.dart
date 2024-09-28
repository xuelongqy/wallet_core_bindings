import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Bitcoin.pb.dart' as Bitcoin;
import 'package:wallet_core_bindings/proto/BitcoinV2.pb.dart' as BitcoinV2;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

class UtxoInfo {
  final Uint8List revUtxoHash;
  final Uint8List publicKey;
  final int amount;
  final int index;

  const UtxoInfo(this.revUtxoHash, this.publicKey, this.amount, this.index);
}

// Signature infos, indexed by pubkeyhash+hash
class SignatureInfo {
  final Uint8List signature;
  final Uint8List publicKey;

  const SignatureInfo(this.signature, this.publicKey);
}

const ONE_BTC = 100000000;

void main() {
  initTest();
  group('BitcoinCompiler', () {
    test('CompileWithSignatures', () {
      // Test external signining with a Bircoin transaction with 3 input UTXOs, all used, but only
      // using 2 public keys. Three signatures are neeeded.  This illustrates that order of
      // UTXOs/hashes is not always the same.

      final revUtxoHash0 = parse_hex(
          "07c42b969286be06fae38528c85f0a1ce508d4df837eb5ac4cf5f2a7a9d65fa8");
      final revUtxoHash1 = parse_hex(
          "d6892a5aa54e3b8fe430efd23f49a8950733aaa9d7c915d9989179f48dd1905e");
      final revUtxoHash2 = parse_hex(
          "6021efcf7555f90627364339fc921139dd40a06ccb2cb2a2a4f8f4ea7a2dc74d");
      final inPubKey0 = parse_hex(
          "024bc2a31265153f07e70e0bab08724e6b85e217f8cd628ceb62974247bb493382");
      final inPubKey1 = parse_hex(
          "0217142f69535e4dad0dc7060df645c55a174cc1bfa5b9eb2e59aad2ae96072dfc");
      final inPubKeyHash0 =
          parse_hex("bd92088bb7e82d611a9b94fbb74a0908152b784f");
      final inPubKeyHash1 =
          parse_hex("6641abedacf9483b793afe1718689cc9420bbb1c");

      final utxoInfos = [
        // first
        UtxoInfo(revUtxoHash0, inPubKey0, 600000, 0),
        // second UTXO, with same pubkey
        UtxoInfo(revUtxoHash1, inPubKey0, 500000, 1),
        // third UTXO, with different pubkey
        UtxoInfo(revUtxoHash2, inPubKey1, 400000, 0),
      ];

      final signatureInfos = {
        '${hex(inPubKeyHash0)}+a296bead4172007be69b21971a790e076388666c162a9505698415f1b003ebd7':
            SignatureInfo(
                parse_hex(
                    "304402201857bc6e6e48b46046a4bd204136fc77e24c240943fb5a1f0e86387aae59b349022"
                    "00a7f31478784e51c49f46ef072745a4f263d7efdbc9c6784aa2571ff4f6f2a40"),
                inPubKey0),
        '${hex(inPubKeyHash1)}+505f527f00e15fcc5a2d2416c9970beb57dfdfaca99e572a01f143b24dd8fab6':
            SignatureInfo(
                parse_hex(
                    "3044022041294880caa09bb1b653775310fcdd1458da6b8e7d7fae34e37966414fe11582022"
                    "0646397c9d2513edc5974ecc336e9b287de0cdf071c366f3b3dc3ff309213e4e4"),
                inPubKey1),
        '${hex(inPubKeyHash0)}+60ed6e9371e5ddc72fd88e46a12cb2f68516ebd307c0fd31b1b55cf767272101':
            SignatureInfo(
                parse_hex(
                    "30440220764e3d5b3971c4b3e70b23fb700a7462a6fe519d9830e863a1f8388c402ad0b1022"
                    "07e777f7972c636961f92375a2774af3b7a2a04190251bbcb31d19c70927952dc"),
                inPubKey0),
      };

      const coin = TWCoinType.Bitcoin;
      const ownAddress = "bc1qhkfq3zahaqkkzx5mjnamwjsfpq2jk7z00ppggv";

      // Setup input for Plan
      final signingInput = Bitcoin.SigningInput(
        coinType: coin.coin,
        hashType: TWBitcoinSigHashType.All.type,
        amount: $fixnum.Int64(1200000),
        useMaxAmount: false,
        byteFee: $fixnum.Int64(1),
        toAddress: 'bc1q2dsdlq3343vk29runkgv4yc292hmq53jedfjmp',
        changeAddress: ownAddress,
      );

      // process UTXOs
      int count = 0;
      for (final u in utxoInfos) {
        final publicKey = TWPublicKey.createWithData(
          u.publicKey,
          TWPublicKeyType.SECP256k1,
        );
        final address = TWSegwitAddress.createWithPublicKey(
          TWHRP.forString('bc'),
          publicKey,
        );
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
          expect(hex(utxoScript.data),
              '0014bd92088bb7e82d611a9b94fbb74a0908152b784f');
        }
        if (count == 1) {
          expect(hex(utxoScript.data),
              '0014bd92088bb7e82d611a9b94fbb74a0908152b784f');
        }
        if (count == 2) {
          expect(hex(utxoScript.data),
              '00146641abedacf9483b793afe1718689cc9420bbb1c');
        }

        final keyHash = utxoScript.matchPayToWitnessPublicKeyHash()!;
        if (count == 0) {
          expect(hex(keyHash), hex(inPubKeyHash0));
        }
        if (count == 1) {
          expect(hex(keyHash), hex(inPubKeyHash0));
        }
        if (count == 2) {
          expect(hex(keyHash), hex(inPubKeyHash1));
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
        signingInput.scripts[hex(keyHash)] = redeemScript.data;

        final utxo = Bitcoin.UnspentTransaction(
          script: utxoScript.data,
          amount: $fixnum.Int64(u.amount),
          outPoint: Bitcoin.OutPoint(
            hash: u.revUtxoHash,
            index: u.index,
            sequence: UINT32_MAX,
          ),
        );
        signingInput.utxo.add(utxo);

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
      expectHexBytes(plan.utxos[0].outPoint.hash, revUtxoHash2);
      expectHexBytes(plan.utxos[1].outPoint.hash, revUtxoHash1);
      expectHexBytes(plan.utxos[2].outPoint.hash, revUtxoHash0);

      // Extend input with accepted plan
      signingInput.plan = plan;

      // Serialize input
      final txInputData = signingInput.writeToBuffer();
      expect(txInputData.isNotEmpty, true);

      /// Step 2: Obtain preimage hashes
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          Bitcoin.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      expectHex(preSigningOutput.hashPublicKeys[0].dataHash,
          '505f527f00e15fcc5a2d2416c9970beb57dfdfaca99e572a01f143b24dd8fab6');
      expectHex(preSigningOutput.hashPublicKeys[1].dataHash,
          'a296bead4172007be69b21971a790e076388666c162a9505698415f1b003ebd7');
      expectHex(preSigningOutput.hashPublicKeys[2].dataHash,
          '60ed6e9371e5ddc72fd88e46a12cb2f68516ebd307c0fd31b1b55cf767272101');
      expectHexBytes(
          preSigningOutput.hashPublicKeys[0].publicKeyHash, inPubKeyHash1);
      expectHexBytes(
          preSigningOutput.hashPublicKeys[1].publicKeyHash, inPubKeyHash0);
      expectHexBytes(
          preSigningOutput.hashPublicKeys[2].publicKeyHash, inPubKeyHash0);

      // Simulate signatures, normally obtained from signature server.
      final signatureVec = <Uint8List>[];
      final pubkeyVec = <Uint8List>[];
      for (final h in preSigningOutput.hashPublicKeys) {
        final preImageHash = h.dataHash;
        final pubkeyhash = h.publicKeyHash;

        final key = '${hex(pubkeyhash)}+${hex(preImageHash)}';
        final sigInfo = signatureInfos[key];
        expect(sigInfo != null, true);
        final publicKeyData = sigInfo!.publicKey;
        final publicKey = TWPublicKey.createWithData(
            publicKeyData, TWPublicKeyType.SECP256k1);
        final signature = sigInfo.signature;

        signatureVec.add(signature);
        pubkeyVec.add(publicKeyData);
        expect(
          publicKey.verifyAsDER(signature, Uint8List.fromList(preImageHash)),
          true,
        );
      }

      /// Step 3: Compile transaction info
      final compileWithSignatures = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: signatureVec,
        publicKeys: pubkeyVec,
      );

      const ExpectedTx =
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
        expect(compileWithSignatures.length, 786);
        final output = Bitcoin.SigningOutput.fromBuffer(compileWithSignatures);

        expect(output.encoded.length, 518);
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final input = Bitcoin.SigningInput.fromBuffer(txInputData);

        // 2 private keys are needed (despite >2 UTXOs)
        final key0 = parse_hex(
            "4646464646464646464646464646464646464646464646464646464646464646");
        final key1 = parse_hex(
            "7878787878787878787878787878787878787878787878787878787878787878");
        expectHexBytes(
          TWPrivateKey.createWithData(key0)
              .getPublicKeyByType(TWPublicKeyType.SECP256k1)
              .data,
          inPubKey0,
        );
        expectHexBytes(
          TWPrivateKey.createWithData(key1)
              .getPublicKeyByType(TWPublicKeyType.SECP256k1)
              .data,
          inPubKey1,
        );
        input.privateKey.addAll([key0, key1]);

        final output = Bitcoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));

        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Negative: not enough signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signatureVec[0]],
          publicKeys: pubkeyVec,
        );
        expect(outputData.length != 1, true);

        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      {
        // Negative: invalid public key
        final publicKeyBlake = parse_hex(
            "b689ab808542e13f3d2ec56fe1efe43a1660dcadc73ce489fde7df98dd8ce5d9");
        expectWasmWithException(
          () => TWTransactionCompiler.compileWithSignatures(
            coin: coin,
            txInputData: txInputData,
            signatures: signatureVec,
            publicKeys: [pubkeyVec[0], pubkeyVec[1], publicKeyBlake],
          ).length,
          0,
        );
      }

      {
        // Negative: wrong signature (formally valid)
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [
            parse_hex(
                "415502201857bc6e6e48b46046a4bd204136fc77e24c240943fb5a1f0e86387aae59b349022"
                "00a7f31478784e51c49f46ef072745a4f263d7efdbc9c6784aa2571ff4f6f3b51"),
            signatureVec[1],
            signatureVec[2]
          ],
          publicKeys: pubkeyVec,
        );
        expect(outputData.length, 2);

        final output = Bitcoin.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_signing);
      }
    });

    test('CompileWithSignaturesV2', () {
      final alicePrivateKey = TWPrivateKey.createWithHexString(
          '56429688a1a6b00b90ccd22a0de0a376b6569d8684022ae92229a28478bfb657');
      final alicePublicKey =
          alicePrivateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final bobPublicKey = parse_hex(
          "037ed9a436e11ec4947ac4b7823787e24ba73180f1edd2857bff19c9f4d62b65bf");

      final txid0 = Uint8List.fromList(parse_hex(
              "1e1cdc48aa990d7e154a161d5b5f1cad737742e97d2712ab188027bb42e6e47b")
          .reversed
          .toList());

      final input = BitcoinV2.SigningInput(
        chainInfo: BitcoinV2.ChainInfo(
          p2pkhPrefix: 0,
          p2shPrefix: 5,
        ),
        publicKeys: [alicePublicKey.data],
        builder: BitcoinV2.TransactionBuilder(
          inputs: [
            BitcoinV2.Input(
              outPoint: BitcoinV2.OutPoint(
                hash: txid0,
                vout: 0,
              ),
              value: $fixnum.Int64(ONE_BTC * 50),
              sighashType: TWBitcoinSigHashType.All.type,
              // Set the Alice public key as the owner of the P2PKH input.
              scriptBuilder: BitcoinV2.Input_InputBuilder(
                p2pkh: BitcoinV2.PublicKeyOrHash(
                  pubkey: alicePublicKey.data,
                ),
              ),
            ),
          ],
          outputs: [
            BitcoinV2.Output(
              value: $fixnum.Int64(ONE_BTC * 50 - 1000000),
              // Set the Bob public key as the receiver of the P2PKH output.
              builder: BitcoinV2.Output_OutputBuilder(
                p2pkh: BitcoinV2.PublicKeyOrHash(
                  pubkey: bobPublicKey,
                ),
              ),
            ),
          ],
          version: BitcoinV2.TransactionVersion.V2,
          inputSelector: BitcoinV2.InputSelector.UseAll,
          fixedDustThreshold: $fixnum.Int64(546),
        ),
      );
      final inputLegacy = Bitcoin.SigningInput(
        signingV2: input,
      );

      final inputLegacyData = inputLegacy.writeToBuffer();

      // Step 2: Obtain preimage hashes
      final preOutputData = TWTransactionCompiler.preImageHashes(
          TWCoinType.Bitcoin, inputLegacyData);
      final preOutput = Bitcoin.PreSigningOutput.fromBuffer(preOutputData);

      expect(preOutput.error, Common.SigningError.OK);
      expect(preOutput.hasPreSigningResultV2(), true);
      expect(preOutput.preSigningResultV2.error, Common.SigningError.OK);

      final sighashes = preOutput.preSigningResultV2.sighashes;
      expect(sighashes.length, 1);
      final sighash0 = sighashes.first;
      expect(sighash0.publicKey, alicePublicKey.data);
      expectHex(sighash0.sighash,
          '6a0e072da66b141fdb448323d54765cafcaf084a06d2fa13c8aed0c694e50d18');

      // Step 3: Simulate signature, normally obtained from signature server
      final sig0 = alicePrivateKey.sign(
          Uint8List.fromList(sighash0.sighash), TWCurve.SECP256k1);
      expectHex(sig0,
          '78eda020d4b86fcb3af78ef919912e6d79b81164dbbb0b0b96da6ac58a2de4b11a5fd8d48734d5a02371c4b5ee551a69dca3842edbf577d863cf8ae9fdbbd45900');

      // Step 4: Compile transaction info
      final signatures = [sig0];
      final publicKeys = [alicePublicKey.data];
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: TWCoinType.Bitcoin,
        txInputData: inputLegacyData,
        signatures: signatures,
        publicKeys: publicKeys,
      );
      final output = Bitcoin.SigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expect(output.hasSigningResultV2(), true);
      final outputV2 = output.signingResultV2;
      expect(outputV2.error, Common.SigningError.OK);
      expectHex(outputV2.encoded,
          '02000000017be4e642bb278018ab12277de9427773ad1c5f5b1d164a157e0d99aa48dc1c1e000000006a473044022078eda020d4b86fcb3af78ef919912e6d79b81164dbbb0b0b96da6ac58a2de4b102201a5fd8d48734d5a02371c4b5ee551a69dca3842edbf577d863cf8ae9fdbbd4590121036666dd712e05a487916384bfcd5973eb53e8038eccbbf97f7eed775b87389536ffffffff01c0aff629010000001976a9145eaaa4f458f9158f86afcba08dd7448d27045e3d88ac00000000');
      expectHex(outputV2.txid,
          'c19f410bf1d70864220e93bca20f836aaaf8cdde84a46692616e9f4480d54885');
    });
  });
}
