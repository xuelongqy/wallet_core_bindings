import 'dart:typed_data';

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/NEO.pb.dart' as NEO;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('NEOCompiler', () {
    const coin = TWCoinType.NEO;

    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      const neoAssetId =
          "9b7cffdaa674beae0f930ebe6085af9093e5fe56b34a5c220ccdcf6efc336fc5";
      const gasAssetId =
          "e72d286979ee6cb1b7e65dfddfb2e384100b8d148e7758de42e4168b71792c60";

      final privateKey = TWPrivateKey.createWithHexString(
          'F18B2F726000E86B4950EBEA7BFF151F69635951BC4A31C44F28EE6AF7AEC128');
      final publicKey = privateKey.getPublicKey(coin);
      final input = NEO.SigningInput(
        gasAssetId: gasAssetId,
        gasChangeAddress: 'AdtSLMBqACP4jv8tRWwyweXGpyGG46eMXV',
        inputs: [
          NEO.TransactionInput(
            prevHash: parse_hex(
                    "9c85b39cd5677e2bfd6bf8a711e8da93a2f1d172b2a52c6ca87757a4bccc24de")
                .reversed
                .toList(),
            prevIndex: 1,
            assetId: neoAssetId,
            value: $fixnum.Int64(89300000000),
          ),
        ],
        outputs: [
          NEO.TransactionOutput(
            assetId: neoAssetId,
            toAddress: 'Ad9A1xPbuA5YBFr1XPznDwBwQzdckAjCev',
            changeAddress: 'AdtSLMBqACP4jv8tRWwyweXGpyGG46eMXV',
            amount: $fixnum.Int64(100000000),
          ),
        ],
      );

      final inputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, inputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          '7fd5629cfc7cb0f8f01f15fc6d8b37ed1240c4f818d0b397bac65266aa6466da');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = publicKey.data;
      final signature = parse_hex(
          "5046619c8e20e1fdeec92ce95f3019f6e7cc057294eb16b2d5e55c105bf32eb27e1fc01c18585762"
          "28f1fef8c0945a8ad69688e52a4ed19f5b85f5eff7e961d7");

      // uncomment when nist256p1 Rust implementation is enabled.
      // const auto signature =
      //     parse_hex("5046619c8e20e1fdeec92ce95f3019f6e7cc057294eb16b2d5e55c105bf32eb281e03fe2e7a7a89e"
      //               "d70e01073f6ba574e65071c87cc8cce59833d4d30479c37a");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(signature, Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      const expectedTx =
          "800000019c85b39cd5677e2bfd6bf8a711e8da93a2f1d172b2a52c6ca87757a4bccc24de0100029b7cffdaa674"
          "beae0f930ebe6085af9093e5fe56b34a5c220ccdcf6efc336fc500e1f50500000000ea610aa6db39bd8c8556c9"
          "569d94b5e5a5d0ad199b7cffdaa674beae0f930ebe6085af9093e5fe56b34a5c220ccdcf6efc336fc500fcbbc4"
          "14000000f2908c7efc0c9e43ffa7e79170ba37e501e1b4ac0141405046619c8e20e1fdeec92ce95f3019f6e7cc"
          "057294eb16b2d5e55c105bf32eb27e1fc01c1858576228f1fef8c0945a8ad69688e52a4ed19f5b85f5eff7e961"
          "d7232102a41c2aea8568864b106553729d32b1317ec463aa23e7a3521455d95992e17a7aac";
      // uncomment when nist256p1 Rust implementation is enabled.
      // auto expectedTx =
      //     "800000019c85b39cd5677e2bfd6bf8a711e8da93a2f1d172b2a52c6ca87757a4bccc24de0100029b7cffdaa674"
      //     "beae0f930ebe6085af9093e5fe56b34a5c220ccdcf6efc336fc500e1f50500000000ea610aa6db39bd8c8556c9"
      //     "569d94b5e5a5d0ad199b7cffdaa674beae0f930ebe6085af9093e5fe56b34a5c220ccdcf6efc336fc500fcbbc4"
      //     "14000000f2908c7efc0c9e43ffa7e79170ba37e501e1b4ac0141405046619c8e20e1fdeec92ce95f3019f6e7cc"
      //     "057294eb16b2d5e55c105bf32eb281e03fe2e7a7a89ed70e01073f6ba574e65071c87cc8cce59833d4d30479c3"
      //     "7a232102a41c2aea8568864b106553729d32b1317ec463aa23e7a3521455d95992e17a7aac";

      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );

      {
        final output = NEO.SigningOutput.fromBuffer(outputData);

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = NEO.SigningInput.fromBuffer(inputData);
        signingInput.privateKey = privateKey.data;

        final output = NEO.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(hex(output.encoded), expectedTx);
      }

      {
        // Negative: empty signatures
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputData,
          signatures: [],
          publicKeys: [],
        );
        final output = NEO.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });

    test('Nep5TokenCompileWithSignatures', () {
      // tx on mainnet
      // https://neoscan.io/transaction/6368FC6127DD7FAA3B7548CA97162D5BE18D4B2FA0046A79853E5864318E19B8

      /// Step 1: Prepare transaction input (protobuf)
      const assetId = "f56c89be8bfcdec617e2402b5c3fd5b6d71b820d";
      const gasAssetId =
          "e72d286979ee6cb1b7e65dfddfb2e384100b8d148e7758de42e4168b71792c60";

      final publicKey = TWPublicKey.createWithHexString(
        '030ab39b99d8675cd9bd90aaec37cba964297cc817078d33e508ab11f1d245c068',
        coin.publicKeyType,
      );
      final input = NEO.SigningInput(
        gasAssetId: gasAssetId,
        gasChangeAddress: 'AJzoeKrj7RHMwSrPQDPdv61ciVEYpmhkjk',
        inputs: [
          NEO.TransactionInput(
            prevHash: parse_hex(
                "f231ee7b5097d912a22fe7cb6b7417490d2ddde200e3c57042be5abcdf6f974c"),
            prevIndex: 0,
            assetId: gasAssetId,
            value: $fixnum.Int64(7011673),
          ),
        ],
        outputs: [
          NEO.TransactionOutput(
            assetId: gasAssetId,
            toAddress: 'AJzoeKrj7RHMwSrPQDPdv61ciVEYpmhkjk',
            changeAddress: 'AJzoeKrj7RHMwSrPQDPdv61ciVEYpmhkjk',
            amount: $fixnum.Int64(6911673),
          ),
        ],
      );

      // set nep5 transfer
      input.transaction = NEO.Transaction(
        nep5Transfer: NEO.Transaction_Nep5Transfer(
          assetId: assetId,
          from: 'AJzoeKrj7RHMwSrPQDPdv61ciVEYpmhkjk',
          to: 'AeRsDBqPiGKZhzNtL2vWhXbXGccJLCGrbJ',
          amount: intToBytes(110000000),
          scriptWithRet: true,
        ),
      );

      input.fee = $fixnum.Int64(100000);

      // Plan
      final plan = NEO.TransactionPlan.fromBuffer(
          TWAnySigner.plan(input.writeToBuffer(), coin));

      expect(plan.error, Common.SigningError.OK);

      plan.attributes.add(NEO.TransactionAttributePlan(
        usage: 0xf0,
        data: parse_hex('f15508a6ea4e15e8'),
      ));

      plan.attributes.add(NEO.TransactionAttributePlan(
        usage: 0x20,
        data: parse_hex('235a717ed7ed18a43de47499c3d05b8d4a4bcf3a'),
      ));

      input.plan = plan;

      final inputData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, inputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expect(hex(preImageHash),
          'd301bc00e59a1c92741a31955714c76689f627dcb9d7ec176435f269a981159c');

      // Simulate signature, normally obtained from signature server
      final publicKeyData = publicKey.data;
      final signature = parse_hex(
          "8b707d23f84d39ddaad7da100e2d8b657ef6c0858c6c09edc029f441f28e49ff6af994ba7ad180f90e12dd9d7828f8f28785ae5079ed9a52bb5ddd3bcce1b189");

      // Verify signature (pubkey & hash & signature)
      expect(
        publicKey.verify(signature, Uint8List.fromList(preImageHash)),
        true,
      );

      /// Step 3: Compile transaction info
      const expectedTx =
          "d101510480778e0614f88235a26e55cce0747ee827f39fd8167849672b14235a717ed7ed18a43de47499c3d05b8d4a4bcf3a53c1087472616e7366657267f56c89be8bfcdec617e2402b5c3fd5b6d71b820df166000000000000000002f008f15508a6ea4e15e820235a717ed7ed18a43de47499c3d05b8d4a4bcf3a014c976fdfbc5abe4270c5e300e2dd2d0d4917746bcbe72fa212d997507bee31f2000001e72d286979ee6cb1b7e65dfddfb2e384100b8d148e7758de42e4168b71792c60b976690000000000235a717ed7ed18a43de47499c3d05b8d4a4bcf3a0141408b707d23f84d39ddaad7da100e2d8b657ef6c0858c6c09edc029f441f28e49ff6af994ba7ad180f90e12dd9d7828f8f28785ae5079ed9a52bb5ddd3bcce1b1892321030ab39b99d8675cd9bd90aaec37cba964297cc817078d33e508ab11f1d245c068ac";

      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: inputData,
        signatures: [signature],
        publicKeys: [publicKeyData],
      );

      {
        final output = NEO.SigningOutput.fromBuffer(outputData);

        expect(hex(output.encoded), expectedTx);
      }
    });
  });
}
