import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gCryptoorgAddr = "cro1tcfsr7m7d6jk6fpyety373m8c39ea2f8dmp830";
const gCryptoorgHrp = "cro";

void main() {
  initTest();
  group('TWCryptoorgAnyAddress', () {
    test('AllCryptoorgAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gCryptoorgHrp,
        coinType: TWCoinType.CryptoOrg,
        address: gCryptoorgAddr,
        privKey:
            "5469c1a88e67d6d490e647ac8d82d54c4a17b8f00d272b3b30fac2253339aa28",
        publicKey:
            "025824f188c340235910b15e5e35aea11cfc28eabfa7756da5585c08f74db437ef",
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
