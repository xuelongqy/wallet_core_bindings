import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings/proto/Harmony.pb.dart' as Harmony;

import '../../utils.dart';

const coin = TWCoinType.Harmony;

const TEST_RECEIVER = "one129r9pj3sk0re76f7zs3qz92rggmdgjhtwge62k";

const LOCAL_NET = 0x2;

void main() {
  initTest();
  group('TWAnySignerHarmony', () {
    test('Sign', () {
      final input = Harmony.SigningInput(
        transactionMessage: Harmony.TransactionMessage(
          toAddress: TEST_RECEIVER,
          nonce: intToBytes(1),
          gasPrice: intToBytes(0),
          gasLimit: intToBytes(0x5208),
          fromShardId: intToBytes(0x1),
          toShardId: intToBytes(0x0),
          amount: bigIntToBytes(BigInt.parse('6bfc8da5ee8220000', radix: 16)),
        ),
        privateKey: parse_hex(
            "4edef2c24995d15b0e25cbd152fb0e2c05d3b79b9c2afd134e6f59f91bf99e48"),
        chainId: intToBytes(LOCAL_NET),
      );

      final output = Harmony.SigningOutput.fromBuffer(
          TWAnySigner.sign(input.writeToBuffer(), coin));

      const shouldBeV = "28";
      const shouldBeR =
          "84cc200aab11f5e1b2f7ece0d56ec67385ac50cefb6e3dc2a2f3e036ed575a5c";
      const shouldBeS =
          "643f18005b790cac8d8e7dc90e6147df0b83874b52db198864694ea28a79e6fc";

      expect(hex(output.v), shouldBeV);
      expect(hex(output.r), shouldBeR);
      expect(hex(output.s), shouldBeS);

      expect(hex(output.encoded),
          'f86a0180825208018094514650ca30b3c79f693e14220115434236d44aeb8906bfc8da5ee82200008028a084cc200aab11f5e1b2f7ece0d56ec67385ac50cefb6e3dc2a2f3e036ed575a5ca0643f18005b790cac8d8e7dc90e6147df0b83874b52db198864694ea28a79e6fc');
    });

    test('SignJSON', () {
      const jsonStr =
          '{"chainId":"Ag==","transactionMessage":{"nonce":"AQ==","gasPrice":"AA==","gasLimit":"Ugg=","toAddress":"one129r9pj3sk0re76f7zs3qz92rggmdgjhtwge62k","amount":"Br/I2l7oIgAA","fromShardId":"AQ==","toShardId":"AA=="}}';
      final key = parse_hex(
          '4edef2c24995d15b0e25cbd152fb0e2c05d3b79b9c2afd134e6f59f91bf99e48');
      final result = TWAnySigner.signJSON(json: jsonStr, key: key, coin: coin);

      expect(TWAnySigner.supportsJSON(coin), true);

      expect(result,
          'f86a0180825208018094514650ca30b3c79f693e14220115434236d44aeb8906bfc8da5ee82200008028a084cc200aab11f5e1b2f7ece0d56ec67385ac50cefb6e3dc2a2f3e036ed575a5ca0643f18005b790cac8d8e7dc90e6147df0b83874b52db198864694ea28a79e6fc');
    });
  });
}
