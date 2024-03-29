import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gKujiraAddr = "kujira1mry47pkga5tdswtluy0m8teslpalkdq00fjk3l";
final gKujiraHrp = "kujira";

void main() {
  group('TWKujiraAnyAddress', () {
    test('AllKujiraAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gKujiraHrp,
        coinType: TWCoinType.TWCoinTypeKujira,
        address: gKujiraAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
