import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gUmeeAddr = "umee1mry47pkga5tdswtluy0m8teslpalkdq0vhd3c8";
final gUmeeHrp = "umee";

void main() {
  group('TWUmeeAnyAddress', () {
    test('AllUmeeAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gUmeeHrp,
        coinType: TWCoinType.TWCoinTypeUmee,
        address: gUmeeAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
