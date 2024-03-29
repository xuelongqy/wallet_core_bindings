import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gSeiAddr = "sei1mry47pkga5tdswtluy0m8teslpalkdq0ndpc65";
final gSeiHrp = "sei";

void main() {
  group('TWSeiAnyAddress', () {
    test('AllSeiAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gSeiHrp,
        coinType: TWCoinType.TWCoinTypeSei,
        address: gSeiAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
