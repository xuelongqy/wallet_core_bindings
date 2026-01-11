import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gMarsAddr = "mars1mry47pkga5tdswtluy0m8teslpalkdq0rufhfw";
const gMarsHrp = "mars";

void main() {
  initTest();
  group('TWKujiraAnyAddress', () {
    test('AllKujiraAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gMarsHrp,
        coinType: TWCoinType.Mars,
        address: gMarsAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
