import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gQuasarAddr = "quasar1mry47pkga5tdswtluy0m8teslpalkdq0sz2n3s";
const gQuasarHrp = "quasar";

void main() {
  initTest();
  group('TWQuasarAnyAddress', () {
    test('AllQuasarAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gQuasarHrp,
        coinType: TWCoinType.Quasar,
        address: gQuasarAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
