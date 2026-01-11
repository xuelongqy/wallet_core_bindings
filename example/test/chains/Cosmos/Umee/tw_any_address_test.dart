import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gUmeeAddr = "umee1mry47pkga5tdswtluy0m8teslpalkdq0vhd3c8";
const gUmeeHrp = "umee";

void main() {
  initTest();
  group('TWUmeeAnyAddress', () {
    test('AllUmeeAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gUmeeHrp,
        coinType: TWCoinType.Umee,
        address: gUmeeAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
