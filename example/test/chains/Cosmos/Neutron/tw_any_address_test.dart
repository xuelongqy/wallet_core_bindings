import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gNeutronAddr = "neutron1mry47pkga5tdswtluy0m8teslpalkdq067evxj";
const gNeutronHrp = "neutron";

void main() {
  initTest();
  group('TWNeutronAnyAddress', () {
    test('AllNeutronAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gNeutronHrp,
        coinType: TWCoinType.Neutron,
        address: gNeutronAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
