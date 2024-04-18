import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/MultiversX.pb.dart' as MultiversX;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';
import 'address_test.dart';

void main() {
  const coin = TWCoinType.TWCoinTypeMultiversX;

  group('MultiversXCompiler', () {
    test('CompileGenericActionWithSignatures', () {
      // txHash 2d3d69707de60e93868a417353c8ecbc6b717e09e384f1a27100287067a5f970 on testnet
      /// Step 1: Prepare transaction input (protobuf)
      final input = MultiversX.SigningInput(
        genericAction: MultiversX.GenericAction(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(2383),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          value: '1',
          data: 'foo',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(11100000),
        chainId: 'T',
      );

      final localInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, localInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final publicKey = privateKey.getPublicKeyEd25519();
      final signature = parse_hex(
          "4f0eb7dca9177f1849bc98b856ab4b3238a666abb3369b4fc0faba429b5c91c46b06893e841a8f411aa199c78cc456514abe39948108baf83a7be0b3fae9d70a");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: localInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final ExpectedTx =
          "7b226e6f6e6365223a323338332c2276616c7565223a2231222c227265636569766572223a22657264317370796176773039353676713638786a38793474656e6a7071327764356139703263366a3867737a377a7479726e7078727275717a7536366a78222c2273656e646572223a2265726431717975357774686c647a72387778356339756367386b6a616767306a6673353373386e72337a707a336879706566736464387373796372367468222c226761735072696365223a313030303030303030302c226761734c696d6974223a31313130303030302c2264617461223a225a6d3976222c22636861696e4944223a2254222c2276657273696f6e223a312c227369676e6174757265223a223466306562376463613931373766313834396263393862383536616234623332333861363636616262333336396234666330666162613432396235633931633436623036383933653834316138663431316161313939633738636334353635313461626533393934383130386261663833613762653062336661653964373061227d";

      {
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded.codeUnits), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = MultiversX.SigningInput.fromBuffer(localInputData);
        signingInput.privateKey = privateKey.data;

        final output = MultiversX.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded.codeUnits), ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: localInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: localInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });

    test('CompileEGLDTransferWithSignatures', () {
      // txHash a4dd60099bb2cd14b57f3feb54d868d64dfe1b74d8ad90d8bd0668b96ead13af on testnet
      /// Step 1: Prepare transaction input (protobuf)
      final input = MultiversX.SigningInput(
        egldTransfer: MultiversX.EGLDTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(2418),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          amount: '1',
          data: 'foo',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(11100000),
        chainId: 'T',
      );

      final localInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, localInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final publicKey = privateKey.getPublicKeyEd25519();
      final signature = parse_hex(
          "e55ad0642c7d47806410c12b1c93eb6250ccb76f711bbf82c5963bf59b5cdfe291d8b083b75de526f20457eede0c8a1dacf65c2c0034d47560c3bab5319c4006");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: localInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final ExpectedTx =
          "7b226e6f6e6365223a323431382c2276616c7565223a2231222c227265636569766572223a22657264317370796176773039353676713638786a38793474656e6a7071327764356139703263366a3867737a377a7479726e7078727275717a7536366a78222c2273656e646572223a2265726431717975357774686c647a72387778356339756367386b6a616767306a6673353373386e72337a707a336879706566736464387373796372367468222c226761735072696365223a313030303030303030302c226761734c696d6974223a31313130303030302c2264617461223a225a6d3976222c22636861696e4944223a2254222c2276657273696f6e223a312c227369676e6174757265223a226535356164303634326337643437383036343130633132623163393365623632353063636237366637313162626638326335393633626635396235636466653239316438623038336237356465353236663230343537656564653063386131646163663635633263303033346434373536306333626162353331396334303036227d";

      {
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded.codeUnits), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = MultiversX.SigningInput.fromBuffer(localInputData);
        signingInput.privateKey = privateKey.data;

        final output = MultiversX.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded.codeUnits), ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: localInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: localInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });

    test('CompileESDTTransferWithSignatures', () {
      // txHash d399477c5d2784d55521fadb2692d447e3459c6a006b1720a3bd513c68dc6848 on testnet
      /// Step 1: Prepare transaction input (protobuf)
      final input = MultiversX.SigningInput(
        esdtTransfer: MultiversX.ESDTTransfer(
          accounts: MultiversX.Accounts(
            senderNonce: $fixnum.Int64(2529),
            sender: ALICE_BECH32,
            receiver: BOB_BECH32,
          ),
          amount: '100',
          tokenIdentifier: 'MBONDTEST-4ce053',
          version: 1,
        ),
        gasPrice: $fixnum.Int64(1000000000),
        gasLimit: $fixnum.Int64(11100000),
        chainId: 'T',
      );

      final localInputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, localInputData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;
      final privateKey = TWPrivateKey.createWithHexString(ALICE_SEED_HEX);
      final publicKey = privateKey.getPublicKeyEd25519();
      final signature = parse_hex(
          "99314010bca2251e52f3a8c2efae2f02b81cb27c83edbaf553e7fb771ffbe69e99ac6304bdc8477ff6727e6e6a47b3d5e17c5537859e21d06a81ec8d632ad100");
      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(
            signature: signature, message: Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: localInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );
      final ExpectedTx =
          "7b226e6f6e6365223a323532392c2276616c7565223a2230222c227265636569766572223a22657264317370796176773039353676713638786a38793474656e6a7071327764356139703263366a3867737a377a7479726e7078727275717a7536366a78222c2273656e646572223a2265726431717975357774686c647a72387778356339756367386b6a616767306a6673353373386e72337a707a336879706566736464387373796372367468222c226761735072696365223a313030303030303030302c226761734c696d6974223a31313130303030302c2264617461223a2252564e45564652795957357a5a6d56795144526b4e4449305a6a526c4e4451314e4451314e544d314e444a6b4d7a51324d7a59314d7a417a4e544d7a51445930222c22636861696e4944223a2254222c2276657273696f6e223a312c227369676e6174757265223a223939333134303130626361323235316535326633613863326566616532663032623831636232376338336564626166353533653766623737316666626536396539396163363330346264633834373766663637323765366536613437623364356531376335353337383539653231643036613831656338643633326164313030227d";

      {
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(hex(output.encoded.codeUnits), ExpectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = MultiversX.SigningInput.fromBuffer(localInputData);
        signingInput.privateKey = privateKey.data;

        final output = MultiversX.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded.codeUnits), ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: localInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        var outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: localInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = MultiversX.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
