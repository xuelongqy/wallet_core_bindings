import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  initTest();
  group('AeternityAddress', () {
    test('FromPublicKey', () {
      final publicKey = TWPublicKey.createWithData(
        TWData.createWithHexString(
                'ee93a4f66f8d16b819bb9beb9ffccdfcdc1412e87fee6a324c2a99a1e0e67148')
            .bytes()!,
        TWPublicKeyType.ED25519,
      );
      final address =
          TWAnyAddress.createWithPublicKey(publicKey, TWCoinType.Aeternity);
      expect(address.description,
          'ak_2p5878zbFhxnrm7meL7TmqwtvBaqcBddyp5eGzZbovZ5FeVfcw');
    });
  });
}
