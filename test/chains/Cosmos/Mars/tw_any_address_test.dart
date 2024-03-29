import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gMarsAddr = "mars1mry47pkga5tdswtluy0m8teslpalkdq0rufhfw";
final gMarsHrp = "mars";

void main() {
  group('TWKujiraAnyAddress', () {
    test('AllKujiraAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gMarsHrp,
        coinType: TWCoinType.TWCoinTypeMars,
        address: gMarsAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
