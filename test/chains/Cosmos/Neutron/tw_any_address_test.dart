import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gNeutronAddr = "neutron1mry47pkga5tdswtluy0m8teslpalkdq067evxj";
final gNeutronHrp = "neutron";

void main() {
  group('TWNeutronAnyAddress', () {
    test('AllNeutronAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gNeutronHrp,
        coinType: TWCoinType.TWCoinTypeNeutron,
        address: gNeutronAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
