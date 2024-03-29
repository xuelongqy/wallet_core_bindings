import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gStrideAddr = "stride1mry47pkga5tdswtluy0m8teslpalkdq0a2sjge";
final gStrideHrp = "stride";

void main() {
  group('TWStrideAnyAddress', () {
    test('AllStrideAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gStrideHrp,
        coinType: TWCoinType.TWCoinTypeStride,
        address: gStrideAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
