import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Ontology.pb.dart' as Ontology;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('OntologyCompiler', () {
    const coin = TWCoinType.TWCoinTypeOntology;

    test('CompileWithSignatures', () {
      /// Prepare transaction input (protobuf)
      final input = Ontology.SigningInput(
        method: 'transfer',
        ownerAddress: 'AaCTzuhEr6essEEKnSTuxD2GJkmGc4nuJp',
        toAddress: 'AWBzyqpXcSpgrWyzR6qzUGWc9ZoYT3Bsvk',
        payerAddress: 'AaCTzuhEr6essEEKnSTuxD2GJkmGc4nuJp',
        amount: $fixnum.Int64(1),
        gasPrice: $fixnum.Int64(3500),
        gasLimit: $fixnum.Int64(20000),
        nonce: 1,
      );

      /// Obtain preimage hash and check it
      input.contract = 'ONT';
      final ontTxInputData = input.writeToBuffer();
      final ontPreImageHashes =
          TWTransactionCompiler.preImageHashes(coin, ontTxInputData);
      final outPreOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(ontPreImageHashes);
      final ontPreImageHash = outPreOutput.dataHash;

      input.contract = 'ONG';
      final ongTxInputData = input.writeToBuffer();
      final ongPreImageHashes =
          TWTransactionCompiler.preImageHashes(coin, ongTxInputData);
      final ongPreOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(ongPreImageHashes);
      final ongPreImageHash = ongPreOutput.dataHash;

      {
        expect(
          hex(ontPreImageHash),
          'd3770eb50f1fcddc17ac9d59f1b7e69c4916dbbe4c484cc6ba27dd0792aeb943',
        );
        expect(
          hex(ongPreImageHash),
          '788066583071cfd05a4a10e5b897b9b81d2363c16fd98128ddc81891535567af',
        );
      }

      // Simulate signature, normally obtained from signature server
      final publicKeyData = parse_hex(
          "038ea73c590f48c7d5a8ba544a928a0c8fb206aab60688793a054db9823602765a");
      final publicKey = TWPublicKey.createWithData(
        publicKeyData,
        TWPublicKeyType.TWPublicKeyTypeNIST256p1,
      );
      final ontSignature = parse_hex(
          "b1678dfcda9b9b468d9a97a5b3021a680814180ca08cd17d9e3a9cf512b05a3b286fed9b8f635718"
          "c0aabddc9fc1acfbc48561577e35ef92ee97d7fa86e14f47");
      final ongSignature = parse_hex(
          "d90c4d76e9d07d3e5c00e4a8768ce09ca66be05cfb7f48ad02632b4f08fcaa6f4e3f6f52eb4278c1"
          "579065e54ea5e696b7711f071298576fa7050b21ae614bbe");

      // Verify signature (pubkey & hash & signature)
      {
        expect(
          publicKey.verify(
              signature: ontSignature,
              message: Uint8List.fromList(ontPreImageHash)),
          true,
        );
        expect(
          publicKey.verify(
              signature: ongSignature,
              message: Uint8List.fromList(ongPreImageHash)),
          true,
        );
      }

      /// Compile transaction info
      final ontOutputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: ontTxInputData,
        signatures: [ontSignature],
        publicKeys: [publicKeyData],
      );
      final ongOutputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: ongTxInputData,
        signatures: [ongSignature],
        publicKeys: [publicKeyData],
      );
      final ontOutput = Ontology.SigningOutput.fromBuffer(ontOutputData);
      final ongOutput = Ontology.SigningOutput.fromBuffer(ongOutputData);
      final ontExpectedTx =
          "00d101000000ac0d000000000000204e000000000000ca18ec37ac94f19588926a5302ded54cd909a76e7100c6"
          "6b14ca18ec37ac94f19588926a5302ded54cd909a76e6a7cc8149e21dda3257e18eb033d9451dda1d9ac8bcfa4"
          "776a7cc8516a7cc86c51c1087472616e736665721400000000000000000000000000000000000000010068164f"
          "6e746f6c6f67792e4e61746976652e496e766f6b6500014140b1678dfcda9b9b468d9a97a5b3021a680814180c"
          "a08cd17d9e3a9cf512b05a3b286fed9b8f635718c0aabddc9fc1acfbc48561577e35ef92ee97d7fa86e14f4723"
          "21038ea73c590f48c7d5a8ba544a928a0c8fb206aab60688793a054db9823602765aac";
      final ongExpectedTx =
          "00d101000000ac0d000000000000204e000000000000ca18ec37ac94f19588926a5302ded54cd909a76e7100c6"
          "6b14ca18ec37ac94f19588926a5302ded54cd909a76e6a7cc8149e21dda3257e18eb033d9451dda1d9ac8bcfa4"
          "776a7cc8516a7cc86c51c1087472616e736665721400000000000000000000000000000000000000020068164f"
          "6e746f6c6f67792e4e61746976652e496e766f6b6500014140d90c4d76e9d07d3e5c00e4a8768ce09ca66be05c"
          "fb7f48ad02632b4f08fcaa6f4e3f6f52eb4278c1579065e54ea5e696b7711f071298576fa7050b21ae614bbe23"
          "21038ea73c590f48c7d5a8ba544a928a0c8fb206aab60688793a054db9823602765aac";

      {
        expect(hex(ontOutput.encoded), ontExpectedTx);
        expect(hex(ongOutput.encoded), ongExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: ontTxInputData,
          signatures: [ontSignature, ongSignature],
          publicKeys: [publicKey.data],
        );
        final output = Ontology.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_signatures_count);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: ontTxInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Ontology.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }

      // OEP4Token transfer test case
      input.method = 'transfer';
      input.contract = '2f34b28eb98a1dd901d303f5294c87546fb37fe7';
      input.ownerAddress = 'Aa8QcHJ8tbRXyjpG6FHo7TysjKXxkd1Yf2';
      input.toAddress = 'ARR6PsaBwRttzCmyxCMhL7NmFk1LqExD7L';
      input.payerAddress = 'Aa8QcHJ8tbRXyjpG6FHo7TysjKXxkd1Yf2';
      input.amount = $fixnum.Int64(1000);
      input.gasPrice = $fixnum.Int64(2500);
      input.gasLimit = $fixnum.Int64(20000);
      input.nonce = 1;

      final oepTxInputData = input.writeToBuffer();
      final oepPreImageHashes =
          TWTransactionCompiler.preImageHashes(coin, oepTxInputData);
      final oepPreOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(oepPreImageHashes);
      final oepPreImageHash = oepPreOutput.dataHash;
      expect(hex(oepPreImageHash),
          '5be4a3be92a49ce2af800c94c7c44eeb8cd345c25541f63e545edc06bd72c0ed');

      final oepPublicKeyData = parse_hex(
          "03932a08085b4bd7adcf8915f805ab35ad51f58ebbd09783b01bb4c44e503444f9");
      final oepPublicKey = TWPublicKey.createWithData(
          oepPublicKeyData, TWPublicKeyType.TWPublicKeyTypeNIST256p1);
      final oepSignature = parse_hex(
          "55aff2726c5e17dd6a6bbdaf5200442f4c9890a0cc044fb13d4a09918893dce261bb14eec2f578b590ed5c925f66bcfeddf794bee6a014c65e049f544953cb09");
      expect(
        oepPublicKey.verify(
            signature: oepSignature,
            message: Uint8List.fromList(oepPreImageHash)),
        true,
      );

      final oepOutputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: oepTxInputData,
        signatures: [oepSignature],
        publicKeys: [oepPublicKeyData],
      );
      final oepOutput = Ontology.SigningOutput.fromBuffer(oepOutputData);
      final oepExpectedTx =
          "00d101000000c409000000000000204e000000000000c9546dcef4038ce3b64e79d079b3c97a8931c7174d02e8"
          "031469c329fbb30a490979ea1a6f0b6a3a91235f6bd714c9546dcef4038ce3b64e79d079b3c97a8931c71753c1"
          "087472616e7366657267e77fb36f54874c29f503d301d91d8ab98eb2342f0001414055aff2726c5e17dd6a6bbd"
          "af5200442f4c9890a0cc044fb13d4a09918893dce261bb14eec2f578b590ed5c925f66bcfeddf794bee6a014c6"
          "5e049f544953cb09232103932a08085b4bd7adcf8915f805ab35ad51f58ebbd09783b01bb4c44e503444f9ac";
      expect(hex(oepOutput.encoded), oepExpectedTx);
    });
  });
}
