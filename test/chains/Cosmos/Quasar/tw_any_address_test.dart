import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gQuasarAddr = "quasar1mry47pkga5tdswtluy0m8teslpalkdq0sz2n3s";
final gQuasarHrp = "quasar";

void main() {
  group('TWQuasarAnyAddress', () {
    test('AllQuasarAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gQuasarHrp,
        coinType: TWCoinType.TWCoinTypeQuasar,
        address: gQuasarAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
