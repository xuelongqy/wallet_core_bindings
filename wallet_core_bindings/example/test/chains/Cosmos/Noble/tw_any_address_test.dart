import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gNobleAddr = "noble1mry47pkga5tdswtluy0m8teslpalkdq0kz9xym";
const gNobleHrp = "noble";

void main() {
  initTest();
  group('TWNobleAnyAddress', () {
    test('AllNobleAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gNobleHrp,
        coinType: TWCoinType.Noble,
        address: gNobleAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
