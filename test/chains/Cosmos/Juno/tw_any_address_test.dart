import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gJunoAddr = "juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf";
final gJunoHrp = "juno";

void main() {
  group('TWJunoAnyAddress', () {
    test('AllJunoAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gJunoHrp,
        coinType: TWCoinType.TWCoinTypeJuno,
        address: gJunoAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
