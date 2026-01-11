import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import 'cosmos_test_helpers.dart';

import '../../utils.dart';

const gAtomAddr = "cosmos1mry47pkga5tdswtluy0m8teslpalkdq07pswu4";
const gAtomHrp = "cosmos";

void main() {
  initTest();
  group('TWAtomAnyAddress', () {
    const coin = TWCoinType.Cosmos;

    test('AllAtomAddressTests', () {
      final parameters = CosmosAddressParameters(
          hrp: gAtomHrp, coinType: coin, address: gAtomAddr);
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
