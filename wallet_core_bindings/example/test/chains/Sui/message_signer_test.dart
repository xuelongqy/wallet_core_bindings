import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Sui.pb.dart' as Sui;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;
import 'package:wallet_core_bindings/proto/TransactionCompiler.pb.dart'
    as TxCompiler;

import '../../utils.dart';

void main() {
  initTest();
  group('SuiMessageSigner', () {
    const coin = TWCoinType.Sui;

    test('Sign', () {
      final privateKey = parse_hex(
          "44f480ca27711895586074a14c552e58cc52e66a58edb6c58cf9b9b7295d4a2d");
      const message = "Hello world";

      final input = Sui.MessageSigningInput(
        privateKey: privateKey,
        message: message,
      );

      final inputData = input.writeToBuffer();

      final output = Sui.MessageSigningOutput.fromBuffer(
          TWMessageSigner.sign(coin, inputData));

      expect(output.error, Common.SigningError.OK);
      expect(
        output.signature,
        'ABUNBl59ILPhyGpdgWpXJIQtEIMidR27As1771Hn7j9wVR/5IetQslRPMBrUC2THM+yGHw7h2N/Mr/0DMOpXLQ7ubWGon8j5kJWFqZa7DSsqxpriO1rPOaGfMmMSOboG+Q==',
      );
    });

    test('Verify', () {
      final publicKey = parse_hex(
          "ee6d61a89fc8f9909585a996bb0d2b2ac69ae23b5acf39a19f32631239ba06f9");
      const message = "Hello world";
      const signature =
          "ABUNBl59ILPhyGpdgWpXJIQtEIMidR27As1771Hn7j9wVR/5IetQslRPMBrUC2THM+yGHw7h2N/Mr/0DMOpXLQ7ubWGon8j5kJWFqZa7DSsqxpriO1rPOaGfMmMSOboG+Q==";

      final input = Sui.MessageVerifyingInput(
        publicKey: publicKey,
        message: message,
        signature: signature,
      );

      final inputData = input.writeToBuffer();

      expect(TWMessageSigner.verify(coin, inputData), true);
    });

    test('PreImageHashes', () {
      final publicKey = parse_hex(
          "ee6d61a89fc8f9909585a996bb0d2b2ac69ae23b5acf39a19f32631239ba06f9");
      const message = "Hello world";
      const signature =
          "ABUNBl59ILPhyGpdgWpXJIQtEIMidR27As1771Hn7j9wVR/5IetQslRPMBrUC2THM+yGHw7h2N/Mr/0DMOpXLQ7ubWGon8j5kJWFqZa7DSsqxpriO1rPOaGfMmMSOboG+Q==";

      final input = Sui.MessageSigningInput(
        privateKey: parse_hex(
            "44f480ca27711895586074a14c552e58cc52e66a58edb6c58cf9b9b7295d4a2d"),
        message: message,
      );

      final inputData = input.writeToBuffer();
      final outputData = TWMessageSigner.preImageHashes(coin, inputData);

      final output = TxCompiler.PreSigningOutput.fromBuffer(outputData);

      expect(output.error, Common.SigningError.OK);
      expectHex(output.data,
          '6b27c39ed22f5346dbce4eca17640e1d139012768746aaa42eafe103f2f9ede2');
      expectHex(output.dataHash,
          '6b27c39ed22f5346dbce4eca17640e1d139012768746aaa42eafe103f2f9ede2');
    });
  });
}
