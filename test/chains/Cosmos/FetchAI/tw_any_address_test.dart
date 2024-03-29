import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gFetchAIAddr = "fetch1mry47pkga5tdswtluy0m8teslpalkdq0due27z";
final gFetchAIHrp = "fetch";

void main() {
  group('TWFetchAIAnyAddress', () {
    test('AllFetchAIAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gFetchAIHrp,
        coinType: TWCoinType.TWCoinTypeFetchAI,
        address: gFetchAIAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
