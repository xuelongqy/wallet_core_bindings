import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/FIO.pb.dart' as FIO;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  initTest();
  group('TWFIO', () {
    const coin = TWCoinType.FIO;

    test('CompileWithSignatures', () {
      final chainId = parse_hex(
          "4e46572250454b796d7296eec9e8896327ea82dd40f2cd74cf1b1d8ba90bcd77");
      // 5KEDWtAUJcFX6Vz38WXsAQAv2geNqT7UaZC8gYu9kTuryr3qkri FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf
      final privateKey = TWPrivateKey.createWithHexString(
          'ba0828d5734b65e3bcc2c51c93dfc26dd71bd666cc0273adee77d73d9a322035');
      final pubKeyA = privateKey.getPublicKeyByType(TWPublicKeyType.SECP256k1);
      final addrA = TWAnyAddress.createWithPublicKey(pubKeyA, TWCoinType.FIO);

      /// Step 1: Prepare transaction input (protobuf)
      final input = FIO.SigningInput(
        expiry: 1579790000,
        tpid: 'rewards@wallet',
        ownerPublicKey: addrA.description,
        chainParams: FIO.ChainParams(
          chainId: chainId,
          headBlockNumber: $fixnum.Int64(50000),
          refBlockPrefix: $fixnum.Int64(4000123456),
        ),
        action: FIO.Action(
          transferMessage: FIO.Action_Transfer(
            amount: $fixnum.Int64(1000000000),
            fee: $fixnum.Int64(250000000),
            payeePublicKey:
                'FIO7uMZoeei5HtXAD24C4yCkpWWbf24bjYtrRNjWdmGCXHZccwuiE',
          ),
        ),
      );

      final inputStrData = input.writeToBuffer();

      /// Step 2: Obtain preimage hash
      final preImageHashData =
          TWTransactionCompiler.preImageHashes(coin, inputStrData);
      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashData);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = preSigningOutput.data;
      final preImageHash = preSigningOutput.dataHash;

      const expectedPreImage =
          "4e46572250454b796d7296eec9e8896327ea82dd40f2cd74cf1b1d8ba90bcd77b0ae295e50c3400a6dee00000000010000980ad20ca85be0e1d195ba85e7cd01102b2f46fca756b200000000a8ed32325d3546494f37754d5a6f6565693548745841443234433479436b70575762663234626a597472524e6a57646d474358485a63637775694500ca9a3b0000000080b2e60e00000000102b2f46fca756b20e726577617264734077616c6c6574000000000000000000000000000000000000000000000000000000000000000000";
      const expectedPreImageHash =
          "6a82a57fb9bfc43918aa757d6094ba71fa2c7ece1691c4b8551a0607273771d7";
      expectHex(preImage, expectedPreImage);
      expectHex(preImageHash, expectedPreImageHash);

      // create signature
      final signature = parse_hex(
          '1f6ccee1f4cd188cc8aefa63f8fda8c90c0493ca1504806d3a26a7300a9687bb701f188337bc9a32f01ee0c2ecf030aee197b050460d72f7272cc6ce36ef14c95b');
      const sigStr =
          'SIG_K1_K9VRCnvaTYN7vgcoVKVXgyJTdKUGV8hLXgFLoEbvqAcFxy7DXQ1rSnAfEuabi4ATkgmvnpaSBdVFN7TBtM1wrbZYqeJQw9';

      // Verify signature (pubkey & hash & signature)
      const ExpectedTx =
          '{"compression":"none","packed_context_free_data":"","packed_trx":"b0ae295e50c3400a6dee00000000010000980ad20ca85be0e1d195ba85e7cd01102b2f46fca756b200000000a8ed32325d3546494f37754d5a6f6565693548745841443234433479436b70575762663234626a597472524e6a57646d474358485a63637775694500ca9a3b0000000080b2e60e00000000102b2f46fca756b20e726577617264734077616c6c657400","signatures":["SIG_K1_K9VRCnvaTYN7vgcoVKVXgyJTdKUGV8hLXgFLoEbvqAcFxy7DXQ1rSnAfEuabi4ATkgmvnpaSBdVFN7TBtM1wrbZYqeJQw9"]}';

      /// Step 3: Compile transaction info
      {
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputStrData,
          signatures: [signature],
          publicKeys: [pubKeyA.data],
        );

        final output = FIO.SigningOutput.fromBuffer(outputData);
        expect(ExpectedTx, output.json);
        expect(output.actionName, 'trnsfiopubky');
      }

      {
        // Double check: check if simple signature process gives the same result. Note that private
        // keys were not used anywhere up to this point.
        final signingInput = FIO.SigningInput.fromBuffer(inputStrData);
        signingInput.privateKey = privateKey.data;
        final output = FIO.SigningOutput.fromBuffer(
            TWAnySigner.sign(signingInput.writeToBuffer(), coin));

        expect(output.json, ExpectedTx);
      }

      {
        // Negative: not enough signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputStrData,
          signatures: [],
          publicKeys: [pubKeyA.data],
        );

        final output = FIO.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
        expect(output.errorMessage, 'empty signatures or publickeys');
      }

      {
        // Negative: not enough publicKey
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputStrData,
          signatures: [Uint8List.fromList(sigStr.codeUnits)],
          publicKeys: [],
        );

        final output = FIO.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
        expect(output.errorMessage, 'empty signatures or publickeys');
      }

      {
        // Negative: not one to one
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: inputStrData,
          signatures: [Uint8List.fromList(sigStr.codeUnits)],
          publicKeys: [
            pubKeyA.data,
            pubKeyA.data,
          ],
        );

        final output = FIO.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
        expect(output.errorMessage,
            'signatures and publickeys size can only be one');
      }
    });
  });
}
