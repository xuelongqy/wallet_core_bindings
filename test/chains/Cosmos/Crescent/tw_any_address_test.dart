import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gCrescentAddr = "cre1mry47pkga5tdswtluy0m8teslpalkdq06frtfc";
final gCrescentHrp = "cre";

void main() {
  group('TWCrescentAnyAddress', () {
    test('AllCrescentAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gCrescentHrp,
        coinType: TWCoinType.TWCoinTypeCrescent,
        address: gCrescentAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
