import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gNobleAddr = "noble1mry47pkga5tdswtluy0m8teslpalkdq0kz9xym";
final gNobleHrp = "noble";

void main() {
  group('TWNobleAnyAddress', () {
    test('AllNobleAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gNobleHrp,
        coinType: TWCoinType.TWCoinTypeNoble,
        address: gNobleAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
