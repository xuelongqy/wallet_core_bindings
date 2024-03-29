import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gSecretAddr = "secret1l0cjpuwu09hwu4wdds7pljn83346x2c90d8h0l";
final gSecretHrp = "secret";

void main() {
  group('TWSecretAnyAddress', () {
    test('AllSecretAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gSecretHrp,
        coinType: TWCoinType.TWCoinTypeSecret,
        address: gSecretAddr,
        privKey:
            "a054c9a67d81ada560ab6fda3310ebf5971e163ff2291ee736ca64b6a5af1ada",
        publicKey:
            "03967d2c6263c2d74d9c2fac3a024e2892a94497b64edb294ffab4042851f00b90",
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
