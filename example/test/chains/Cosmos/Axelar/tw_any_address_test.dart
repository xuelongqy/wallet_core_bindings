import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gAkashAddr = "akash1mry47pkga5tdswtluy0m8teslpalkdq0n6af90";
const gAkashHrp = "akash";

void main() {
  initTest();
  group('TWAkashAnyAddress', () {
    test('AllAkashAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gAkashHrp,
        coinType: TWCoinType.Akash,
        address: gAkashAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
