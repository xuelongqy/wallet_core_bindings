import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Filecoin.pb.dart' as Filecoin;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;

import '../../utils.dart';

void main() {
  group('FilecoinCompiler', () {
    const coin = TWCoinType.TWCoinTypeFilecoin;

    test('CompileWithSignatures', () {
      /// Step 1: Prepare transaction input (protobuf)
      final privateKey = parse_hex(
          "1d969865e189957b9824bd34f26d5cbf357fda1a6d844cbf0c9ab1ed93fa7dbe");
      final key = TWPrivateKey.createWithData(privateKey);
      final publicKey = key
          .getPublicKeyByType(TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended);
      final toAddress =
          "f3um6uo3qt5of54xjbx3hsxbw5mbsc6auxzrvfxekn5bv3duewqyn2tg5rhrlx73qahzzpkhuj7a34iq7oifsq";
      int nonce = 2;
      // 600 FIL
      // auto value = parse_hex("2086ac351052600000");
      final value =
          BigInt.from(600) * BigInt.from(1000000000) * BigInt.from(1000000000);
      final gasLimit = 1000;
      // auto gasFeeCap = parse_hex("25f273933db5700000");
      final gasFeeCap =
          BigInt.from(700) * BigInt.from(1000000000) * BigInt.from(1000000000);
      // auto gasPremium = parse_hex("2b5e3af16b18800000");
      final gasPremium =
          BigInt.from(800) * BigInt.from(1000000000) * BigInt.from(1000000000);

      final input = Filecoin.SigningInput(
        privateKey: privateKey,
        to: toAddress,
        nonce: $fixnum.Int64(nonce),
        value: bigIntToBytes(value),
        gasLimit: $fixnum.Int64(gasLimit),
        gasFeeCap: bigIntToBytes(gasFeeCap),
        gasPremium: bigIntToBytes(gasPremium),
        publicKey: publicKey.data,
      );

      final txInputData = input.writeToBuffer();
      final preImageHashes =
          TWTransactionCompiler.preImageHashes(coin, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = preSigningOutput.dataHash;
      expectHex(preImageHash,
          '8368c0f622b2c529c7fa147d75aa02aaa7fc13fc4847d4dc57e7a5c59048aafe');

      // Simulate signature, normally obtained from signature server
      final signature =
          key.sign(Uint8List.fromList(preImageHash), TWCurve.TWCurveSECP256k1);

      /// Step 3: Compile transaction info
      var outputData = TWTransactionCompiler.compileWithSignatures(
        coin: coin,
        txInputData: txInputData,
        signatures: [signature],
        publicKeys: [publicKey.data],
      );

      const ExpectedTx =
          '{"Message":{"From":"f1z4a36sc7mfbv4z3qwutblp2flycdui3baffytbq","GasFeeCap":"700000000000000000000","GasLimit":1000,"GasPremium":"800000000000000000000","Method":0,"Nonce":2,"To":"f3um6uo3qt5of54xjbx3hsxbw5mbsc6auxzrvfxekn5bv3duewqyn2tg5rhrlx73qahzzpkhuj7a34iq7oifsq","Value":"600000000000000000000"},"Signature":{"Data":"jMRu+OZ/lfppgmqSfGsntFrRLWZnUg3ZYmJTTRLsVt4V1310vR3VKGJpaE6S4sNvDOE6sEgmN9YmfTkPVK2qMgE=","Type":1}}';
      {
        final output = Filecoin.SigningOutput.fromBuffer(outputData);

        expect(output.json, ExpectedTx);
      }

      // double check
      {
        final output = Filecoin.SigningOutput.fromBuffer(
            TWAnySigner.sign(input.writeToBuffer(), coin));

        expect(output.json, ExpectedTx);
      }

      {
        // Negative: inconsistent signatures & publicKeys
        outputData = TWTransactionCompiler.compileWithSignatures(
          coin: coin,
          txInputData: txInputData,
          signatures: [signature, signature],
          publicKeys: [publicKey.data],
        );
        final output = Filecoin.SigningOutput.fromBuffer(outputData);
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
        final output = Filecoin.SigningOutput.fromBuffer(outputData);
        expect(output.json.isEmpty, true);
        expect(output.error, Common.SigningError.Error_invalid_params);
      }
    });
  });
}
