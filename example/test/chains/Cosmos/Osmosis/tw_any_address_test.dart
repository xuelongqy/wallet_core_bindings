import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gOsmosisAddr = "osmo1mry47pkga5tdswtluy0m8teslpalkdq0k6r728";
const gOsmosisHrp = "osmo";

void main() {
  initTest();
  group('TWOsmosisAnyAddress', () {
    test('AllOsmosisAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gOsmosisHrp,
        coinType: TWCoinType.Osmosis,
        address: gOsmosisAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
