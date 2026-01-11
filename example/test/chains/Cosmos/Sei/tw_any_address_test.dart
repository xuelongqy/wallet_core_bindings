import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gSeiAddr = "sei1mry47pkga5tdswtluy0m8teslpalkdq0ndpc65";
const gSeiHrp = "sei";

void main() {
  initTest();
  group('TWSeiAnyAddress', () {
    test('AllSeiAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gSeiHrp,
        coinType: TWCoinType.Sei,
        address: gSeiAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
