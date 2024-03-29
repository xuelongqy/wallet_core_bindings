import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gOsmosisAddr = "osmo1mry47pkga5tdswtluy0m8teslpalkdq0k6r728";
final gOsmosisHrp = "osmo";

void main() {
  group('TWOsmosisAnyAddress', () {
    test('AllOsmosisAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gOsmosisHrp,
        coinType: TWCoinType.TWCoinTypeOsmosis,
        address: gOsmosisAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
