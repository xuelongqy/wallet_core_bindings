import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gKujiraAddr = "kujira1mry47pkga5tdswtluy0m8teslpalkdq00fjk3l";
const gKujiraHrp = "kujira";

void main() {
  initTest();
  group('TWKujiraAnyAddress', () {
    test('AllKujiraAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gKujiraHrp,
        coinType: TWCoinType.Kujira,
        address: gKujiraAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
