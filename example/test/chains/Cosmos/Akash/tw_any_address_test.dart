import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gAxelarAddr = "axelar1mry47pkga5tdswtluy0m8teslpalkdq060xxh5";
const gAxelarHrp = "axelar";

void main() {
  initTest();
  group('TWAxelarAnyAddress', () {
    test('AllAxelarAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gAxelarHrp,
        coinType: TWCoinType.Axelar,
        address: gAxelarAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
