import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gStrideAddr = "stride1mry47pkga5tdswtluy0m8teslpalkdq0a2sjge";
const gStrideHrp = "stride";

void main() {
  initTest();
  group('TWStrideAnyAddress', () {
    test('AllStrideAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gStrideHrp,
        coinType: TWCoinType.Stride,
        address: gStrideAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
