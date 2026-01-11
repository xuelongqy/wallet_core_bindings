import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gCrescentAddr = "cre1mry47pkga5tdswtluy0m8teslpalkdq06frtfc";
const gCrescentHrp = "cre";

void main() {
  initTest();
  group('TWCrescentAnyAddress', () {
    test('AllCrescentAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gCrescentHrp,
        coinType: TWCoinType.Crescent,
        address: gCrescentAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
