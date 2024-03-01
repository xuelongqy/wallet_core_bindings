import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Aion.pb.dart' as Aion;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TransactionCompiler;

import '../../utils.dart';

void main() {
  group('AionCompiler', () {
    test('CompileWithSignatures', () {
      final privateKey = TWData.createWithHexString(
              'db33ffdf82c7ba903daf68d961d3c23c20471a8ce6b408e52d579fd8add80cc9')
          .bytes()!;
      final key = TWPrivateKey.createWithData(privateKey);
      final publicKey =
          key.getPublicKey(TWPublicKeyType.TWPublicKeyTypeED25519);

      final input = Aion.SigningInput(
        toAddress:
            '0xa082c3de528b7807dc27ad66debb16d4cfe4054209398cee619dd95955063d1e',
        amount: intToBytes(10000),
        gasPrice: bigIntStringToBytes('20000000000'),
        gasLimit: intToBytes(21000),
        nonce: intToBytes(9),
        timestamp: $fixnum.Int64(155157377101),
        privateKey: privateKey,
      );

      final txInputData = input.writeToBuffer();
      final preImageHashes = TWTransactionCompiler.preImageHashes(
          TWCoinType.TWCoinTypeAion, txInputData);

      final preSigningOutput =
          TransactionCompiler.PreSigningOutput.fromBuffer(preImageHashes);
      expect(preSigningOutput.error, Common.SigningError.OK);

      final preImageHash = Uint8List.fromList(preSigningOutput.dataHash);
      expectHex(preImageHash,
          'd4423fe7d233b85c1bf5b1120ec03842e572fb25f3755f7a20bc83addc8c4d85');

      // Simulate signature, normally obtained from signature server
      final signature = key.sign(preImageHash, TWCurve.TWCurveED25519);

      /// Step 3: Compile transaction info
      final outputData = TWTransactionCompiler.compileWithSignatures(
        coin: TWCoinType.TWCoinTypeAion,
        txInputData: txInputData,
        signatures: TWDataVector.createWithData(signature),
        publicKeys: TWDataVector.createWithData(privateKey),
      );

      const ExpectedTx =
          'f89b09a0a082c3de528b7807dc27ad66debb16d4cfe4054209398cee619dd95955063d1e8227108085242019b04d8252088800000004a817c80001b860a775daa30b33fda3091768f0561c8042ee23cb48a6a3e5d7e8248b13d04a48a7d3d3386742c2716031b79950cef5fcb49c079a5cab095c8b08915e126b9741389924ba2d5c00036a3b39c2a8562fa0800f1a13a566ce6e027274ce63a41dec07';
    });
  });
}
