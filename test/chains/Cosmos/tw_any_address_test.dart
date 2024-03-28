import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import 'cosmos_test_helpers.dart';

const gAtomAddr = "cosmos1mry47pkga5tdswtluy0m8teslpalkdq07pswu4";
const gAtomHrp = "cosmos";

void main() {
  group('TWAtomAnyAddress', () {
    const coin = TWCoinType.TWCoinTypeCosmos;

    test('AllAtomAddressTests', () {
      final parameters = CosmosAddressParameters(
          hrp: gAtomHrp, coinType: coin, address: gAtomAddr);
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
