import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Solana.pb.dart' as Solana;
import 'package:wallet_core_bindings/proto/Common.pb.dart' as Common;

import '../../utils.dart';

void main() {
  initTest();
  group('SolanaMessageSigner', () {
    const coin = TWCoinType.Solana;

    test('Sign', () {
      final privateKey = parse_hex(
          "44f480ca27711895586074a14c552e58cc52e66a58edb6c58cf9b9b7295d4a2d");
      const message = "Hello world";

      final input = Solana.MessageSigningInput(
        privateKey: privateKey,
        message: message,
      );

      final output = Solana.MessageSigningOutput.fromBuffer(
        TWMessageSigner.sign(
          coin,
          input.writeToBuffer(),
        ),
      );

      expect(output.error, Common.SigningError.OK);
      expect(
        output.signature,
        '2iBZ6zrQRKHcbD8NWmm552gU5vGvh1dk3XV4jxnyEdRKm8up8AeQk1GFr9pJokSmchw7i9gMtNyFBdDt8tBxM1cG',
      );
    });

    test('Verify', () {
      final publicKey = parse_hex(
          "ee6d61a89fc8f9909585a996bb0d2b2ac69ae23b5acf39a19f32631239ba06f9");
      const message = "Hello world";
      const signature =
          "2iBZ6zrQRKHcbD8NWmm552gU5vGvh1dk3XV4jxnyEdRKm8up8AeQk1GFr9pJokSmchw7i9gMtNyFBdDt8tBxM1cG";

      final input = Solana.MessageVerifyingInput(
        publicKey: publicKey,
        message: message,
        signature: signature,
      );

      expect(
        TWMessageSigner.verify(
          coin,
          input.writeToBuffer(),
        ),
        true,
      );
    });
  });
}
