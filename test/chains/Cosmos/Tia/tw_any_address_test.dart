import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gTiaAddr = "celestia1mry47pkga5tdswtluy0m8teslpalkdq00tp7xc";
final gTiaHrp = "celestia";

void main() {
  group('TWTiaAnyAddress', () {
    test('AllTiaAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gTiaHrp,
        coinType: TWCoinType.TWCoinTypeTia,
        address: gTiaAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
