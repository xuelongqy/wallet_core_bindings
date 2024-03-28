import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gAkashAddr = "akash1mry47pkga5tdswtluy0m8teslpalkdq0n6af90";
final gAkashHrp = "akash";

void main() {
  group('TWAkashAnyAddress', () {
    test('AllAkashAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gAkashHrp,
        coinType: TWCoinType.TWCoinTypeAkash,
        address: gAkashAddr,
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
