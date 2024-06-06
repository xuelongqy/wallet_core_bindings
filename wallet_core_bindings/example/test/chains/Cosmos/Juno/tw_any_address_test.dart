import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gJunoAddr = "juno1mry47pkga5tdswtluy0m8teslpalkdq0gnn4mf";
const gJunoHrp = "juno";

void main() {
  initTest();
  group('TWJunoAnyAddress', () {
    test('AllJunoAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gJunoHrp,
        coinType: TWCoinType.Juno,
        address: gJunoAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
