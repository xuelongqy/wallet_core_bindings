import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gPersistenceAddr = "persistence1mry47pkga5tdswtluy0m8teslpalkdq0sdkaj3";
final gPersistenceHrp = "persistence";

void main() {
  group('TWPersistenceAnyAddress', () {
    test('AllPersistenceAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gPersistenceHrp,
        coinType: TWCoinType.TWCoinTypePersistence,
        address: gPersistenceAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
