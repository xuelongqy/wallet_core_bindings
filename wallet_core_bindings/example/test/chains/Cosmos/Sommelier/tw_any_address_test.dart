import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gSommelierAddr = "somm1mry47pkga5tdswtluy0m8teslpalkdq0jalzdl";
const gSommelierHrp = "somm";

void main() {
  initTest();
  group('TWSommelierAnyAddress', () {
    test('AllSommelierAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gSommelierHrp,
        coinType: TWCoinType.Sommelier,
        address: gSommelierAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
