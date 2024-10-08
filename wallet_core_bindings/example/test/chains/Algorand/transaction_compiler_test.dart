import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Algorand.pb.dart' as Algorand;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('AlgorandCompiler', () {
    test('CompileWithSignatures', () {
      final privateKey = TWData.createWithHexString(
              'd5b43d706ef0cb641081d45a2ec213b5d8281f439f2425d1af54e2afdaabf55b')
          .bytes()!;
      final key = TWPrivateKey.createWithData(privateKey);
      final publicKey = key.getPublicKeyByType(TWPublicKeyType.ED25519);
      final note = TWData.createWithHexString('68656c6c6f').bytes()!;
      final genesisHash =
          TWBase64.decode('wGHE2Pwdvd7S12BL5FaOP20EGYesN73ktiC1qzkkit8=');

      final input = Algorand.SigningInput(
        transfer: Algorand.Transfer(
          toAddress:
              'CRLADAHJZEW2GFY2UPEHENLOGCUOU74WYSTUXQLVLJUJFHEUZOHYZNWYR4',
          amount: $fixnum.Int64(1000000000000),
        ),
        firstRound: $fixnum.Int64(1937767),
        lastRound: $fixnum.Int64(1938767),
        fee: $fixnum.Int64(263000),
        genesisId: 'mainnet-v1.0',
        genesisHash: genesisHash,
        note: note,
        privateKey: privateKey,
        publicKey: publicKey.data,
      );

      final txInputData = input.writeToBuffer();
      final preImageHashes = TWTransactionCompiler.preImageHashes(
          TWCoinType.Algorand, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImage = Uint8List.fromList(preSigningOutput.data);
      expectHex(preImage,
          '54588aa3616d74cf000000e8d4a51000a3666565ce00040358a26676ce001d9167a367656eac6d61696e6e65742d76312e30a26768c420c061c4d8fc1dbdded2d7604be4568e3f6d041987ac37bde4b620b5ab39248adfa26c76ce001d954fa46e6f7465c40568656c6c6fa3726376c42014560180e9c92da3171aa3c872356e30a8ea7f96c4a74bc1755a68929c94cb8fa3736e64c42061bf060efc02e2887dfffc8ed85268c8c091c013eedf315bc50794d02a8791ada474797065a3706179');

      // Simulate signature, normally obtained from signature server
      final signature = key.sign(preImage, TWCurve.ED25519);

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: TWCoinType.Algorand,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );

      const ExpectedTx =
          '82a3736967c440baa00062adcdcb5875e4435cdc6885d26bfe5308ab17983c0fda790b7103051fcb111554e5badfc0ac7edf7e1223a434342a9eeed5cdb047690827325051560ba374786e8aa3616d74cf000000e8d4a51000a3666565ce00040358a26676ce001d9167a367656eac6d61696e6e65742d76312e30a26768c420c061c4d8fc1dbdded2d7604be4568e3f6d041987ac37bde4b620b5ab39248adfa26c76ce001d954fa46e6f7465c40568656c6c6fa3726376c42014560180e9c92da3171aa3c872356e30a8ea7f96c4a74bc1755a68929c94cb8fa3736e64c42061bf060efc02e2887dfffc8ed85268c8c091c013eedf315bc50794d02a8791ada474797065a3706179';
      {
        final output = Algorand.SigningOutput.fromBuffer(outputData);
        expectHex(output.encoded, ExpectedTx);
      }

      // double check
      {
        final output = Algorand.SigningOutput.fromBuffer(
          TWAnySigner.sign(
            input.writeToBuffer(),
            TWCoinType.Algorand,
          ),
        );
        expectHex(output.encoded, ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: TWCoinType.Algorand,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Algorand.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_no_support_n2n);
      }

      {
        // Negative: empty signatures
        final outputData = TWTransactionCompiler.compileWithSignatures(
          coin: TWCoinType.Algorand,
          txInputData: txInputData,
          signatures: [],
          publicKeys: [],
        );
        final output = Algorand.SigningOutput.fromBuffer(outputData);
        expect(output.encoded.length, 0);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
