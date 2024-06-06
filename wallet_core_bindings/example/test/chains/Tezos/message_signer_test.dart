import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('TezosMessageSigner', () {
    const coin = TWCoinType.Tezos;

    test('inputToPayload', () {
      final payload = TWTezosMessageSigner.inputToPayload(
          'Tezos Signed Message: testUrl 2023-02-08T10:36:18.454Z Hello World');
      expect(payload,
          '05010000004254657a6f73205369676e6564204d6573736167653a207465737455726c20323032332d30322d30385431303a33363a31382e3435345a2048656c6c6f20576f726c64');
    });

    test('formatMessage', () {
      final formatMessage =
          TWTezosMessageSigner.formatMessage("Hello World", "testUrl");
      final regex = RegExp(
          'Tezos Signed Message: \\S+ \\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z .+');
      expect(regex.hasMatch(formatMessage), true);
    });

    test('SignMessage', () {
      final payload = TWTezosMessageSigner.inputToPayload(
          'Tezos Signed Message: testUrl 2023-02-08T10:36:18.454Z Hello World');
      final privKey = TWPrivateKey.createWithHexString(
          '91b4fb8d7348db2e7de2693f58ce1cceb966fa960739adac1d9dba2cbaa0940a');
      final result = TWTezosMessageSigner.signMessage(privKey, payload);
      const expected =
          "edsigu3se2fcEJUCm1aqxjzbHdf7Wsugr4mLaA9YM2UVZ9Yy5meGv87VqHN3mmDeRwApTj1JKDaYjqmLZifSFdWCqBoghqaowwJ";
      expect(result, expected);
      expect(
        TWTezosMessageSigner.verifyMessage(
          pubKey: privKey.getPublicKeyEd25519(),
          message: payload,
          signature: result,
        ),
        true,
      );
    });

    test('formatMessage2', () {
      const message = "Hello World";
      const dappUrl = "testUrl";
      final formattedMsg = TWTezosMessageSigner.formatMessage(message, dappUrl);
      final regex = RegExp(
          'Tezos Signed Message: \\S+ \\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z .+');
      expect(regex.hasMatch(formattedMsg), true);
    });

    test('inputToPayload2', () {
      const message =
          'Tezos Signed Message: testUrl 2023-02-08T10:36:18.454Z Hello World';
      const expected =
          '05010000004254657a6f73205369676e6564204d6573736167653a207465737455726c20323032332d30322d30385431303a33363a31382e3435345a2048656c6c6f20576f726c64';
      final payload = TWTezosMessageSigner.inputToPayload(message);
      expect(payload, expected);
    });

    test('SignAndVerify', () {
      const privKeyData =
          "91b4fb8d7348db2e7de2693f58ce1cceb966fa960739adac1d9dba2cbaa0940a";
      final privateKey = TWPrivateKey.createWithHexString(privKeyData);
      const message =
          '05010000004254657a6f73205369676e6564204d6573736167653a207465737455726c20323032332d30322d30385431303a33363a31382e3435345a2048656c6c6f20576f726c64';

      final pubKey = privateKey.getPublicKey(coin);
      final signature = TWTezosMessageSigner.signMessage(privateKey, message);
      expect(signature,
          'edsigu3se2fcEJUCm1aqxjzbHdf7Wsugr4mLaA9YM2UVZ9Yy5meGv87VqHN3mmDeRwApTj1JKDaYjqmLZifSFdWCqBoghqaowwJ');
      expect(
        TWTezosMessageSigner.verifyMessage(
          pubKey: pubKey,
          message: message,
          signature: signature,
        ),
        true,
      );
    });
  });
}
