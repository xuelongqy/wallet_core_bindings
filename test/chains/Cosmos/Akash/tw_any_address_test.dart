import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gAxelarAddr = "axelar1mry47pkga5tdswtluy0m8teslpalkdq060xxh5";
final gAxelarHrp = "axelar";

void main() {
  group('TWAxelarAnyAddress', () {
    test('AllAxelarAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gAxelarHrp,
        coinType: TWCoinType.TWCoinTypeAxelar,
        address: gAxelarAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}