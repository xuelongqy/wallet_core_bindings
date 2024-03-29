import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gStarsAddr = "stars1mry47pkga5tdswtluy0m8teslpalkdq02a8nhy";
final gStarsHrp = "stars";

void main() {
  group('TWStargazeAnyAddress', () {
    test('AllStargazeAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gStarsHrp,
        coinType: TWCoinType.TWCoinTypeStargaze,
        address: gStarsAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
