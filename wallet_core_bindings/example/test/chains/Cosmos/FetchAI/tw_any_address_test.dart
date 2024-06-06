import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gFetchAIAddr = "fetch1mry47pkga5tdswtluy0m8teslpalkdq0due27z";
const gFetchAIHrp = "fetch";

void main() {
  initTest();
  group('TWFetchAIAnyAddress', () {
    test('AllFetchAIAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gFetchAIHrp,
        coinType: TWCoinType.FetchAI,
        address: gFetchAIAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
