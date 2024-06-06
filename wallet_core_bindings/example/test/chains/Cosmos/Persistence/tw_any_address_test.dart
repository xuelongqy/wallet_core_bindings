import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gPersistenceAddr = "persistence1mry47pkga5tdswtluy0m8teslpalkdq0sdkaj3";
const gPersistenceHrp = "persistence";

void main() {
  initTest();
  group('TWPersistenceAnyAddress', () {
    test('AllPersistenceAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gPersistenceHrp,
        coinType: TWCoinType.Persistence,
        address: gPersistenceAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
