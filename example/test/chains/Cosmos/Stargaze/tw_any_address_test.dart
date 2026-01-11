import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gStarsAddr = "stars1mry47pkga5tdswtluy0m8teslpalkdq02a8nhy";
const gStarsHrp = "stars";

void main() {
  initTest();
  group('TWStargazeAnyAddress', () {
    test('AllStargazeAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gStarsHrp,
        coinType: TWCoinType.Stargaze,
        address: gStarsAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
