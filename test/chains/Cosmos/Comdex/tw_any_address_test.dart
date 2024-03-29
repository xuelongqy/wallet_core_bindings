import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gComdexAddr = "comdex1mry47pkga5tdswtluy0m8teslpalkdq0ewjv9z";
final gComdexHrp = "comdex";

void main() {
  group('TWComdexAnyAddress', () {
    test('AllComdexAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gComdexHrp,
        coinType: TWCoinType.TWCoinTypeComdex,
        address: gComdexAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
