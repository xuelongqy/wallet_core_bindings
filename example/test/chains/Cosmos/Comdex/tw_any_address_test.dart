import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gComdexAddr = "comdex1mry47pkga5tdswtluy0m8teslpalkdq0ewjv9z";
const gComdexHrp = "comdex";

void main() {
  initTest();
  group('TWComdexAnyAddress', () {
    test('AllComdexAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gComdexHrp,
        coinType: TWCoinType.Comdex,
        address: gComdexAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
