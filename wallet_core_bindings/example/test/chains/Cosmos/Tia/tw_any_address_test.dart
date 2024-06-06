import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gTiaAddr = "celestia1mry47pkga5tdswtluy0m8teslpalkdq00tp7xc";
const gTiaHrp = "celestia";

void main() {
  initTest();
  group('TWTiaAnyAddress', () {
    test('AllTiaAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gTiaHrp,
        coinType: TWCoinType.Tia,
        address: gTiaAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
