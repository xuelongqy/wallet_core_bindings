import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gSommelierAddr = "somm1mry47pkga5tdswtluy0m8teslpalkdq0jalzdl";
final gSommelierHrp = "somm";

void main() {
  group('TWSommelierAnyAddress', () {
    test('AllSommelierAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gSommelierHrp,
        coinType: TWCoinType.TWCoinTypeSommelier,
        address: gSommelierAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
