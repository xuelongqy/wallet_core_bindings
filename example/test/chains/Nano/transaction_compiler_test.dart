import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Nano.pb.dart' as Nano;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

const kPrivateKey =
    "173c40e97fe2afcd24187e74f6b603cb949a5365e72fbdd065a6b165e2189e34";
const kRepOfficial1 =
    "xrb_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4";
const kRepNanode =
    "xrb_1nanode8ngaakzbck8smq6ru9bethqwyehomf79sae1k7xd47dkidjqzffeg";

void main() {
  initTest();
  group('NanoCompiler', () {
    const coin = TWCoinType.Nano;

    test('CompileWithSignatures', () {
      /// Step 1 : Prepare transaction input(protobuf)
      final privateKey = TWPrivateKey.createWithHexString(kPrivateKey);
      final publicKey = privateKey.getPublicKeyEd25519Blake2b();
      final linkBlock = parse_hex(
          "491fca2c69a84607d374aaf1f6acd3ce70744c5be0721b5ed394653e85233507");

      final input = Nano.SigningInput(
        publicKey: publicKey.data,
        linkBlock: linkBlock,
        representative: kRepOfficial1,
        balance: '96242336390000000000000000000',
      );

      final txInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, txInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      const ExpectedPreImageHash =
          "f9a323153daefe041efb94d69b9669c882c935530ed953bbe8a665dfedda9696";
      expect(ExpectedPreImageHash, hex(preImageHash));
      // Verify signature (pubkey & hash & signature)
      final signature = parse_hex(
          "d247f6b90383b24e612569c75a12f11242f6e03b4914eadc7d941577dcf54a3a7cb7f0a4aba4246a40d9ebb5ee1e00b4a0a834ad5a1e7bef24e11f62b95a9e09");
      expect(
        publicKey.verify(signature, Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3 : Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      const ExpectedOutJson =
          "{\"account\":\"nano_1bhbsc9yuh15anq3owu1izw1nk7bhhqefrkhfo954fyt8dk1q911buk1kk4c\","
          "\"balance\":\"96242336390000000000000000000\","
          "\"link\":\"491fca2c69a84607d374aaf1f6acd3ce70744c5be0721b5ed394653e85233507\","
          "\"link_as_account\":\"nano_1kazsap8mc481zbqbcqjytpf9mmigj87qr5k5fhf97579t4k8fa94octjx6d\","
          "\"previous\":\"0000000000000000000000000000000000000000000000000000000000000000\","
          "\"representative\":\"nano_3arg3asgtigae3xckabaaewkx3bzsh7nwz7jkmjos79ihyaxwphhm6qgjps4\","
          "\"signature\":\"d247f6b90383b24e612569c75a12f11242f6e03b4914eadc7d941577dcf54a3a7cb7f0a4aba4246a40d9ebb5ee1e00b4a0a834ad5a1e7bef24e11f62b95a9e09\","
          "\"type\":\"state\"}";
      {
        final output = Nano.SigningOutput.fromBuffer(outputData);
        expect(signature, output.signature);
        expect(ExpectedPreImageHash, hex(output.blockHash));
        expect(output.json, ExpectedOutJson);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = Nano.SigningInput.fromBuffer(txInputData);
        signingInput.privateKey = privateKey.data;

        final output = Nano.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.json, ExpectedOutJson);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Nano.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Nano.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
