import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gCoreumAddr = "core1a5nvz6smgsph9gephguyhn30fmzrpaxrvvdjun";
const gCoreumHrp = "core";

void main() {
  initTest();
  group('TWCoreumAnyAddress', () {
    test('AllCoreumAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gCoreumHrp,
        coinType: TWCoinType.Coreum,
        address: gCoreumAddr,
        privKey:
            "56e5e45bf33a779527ec670b5336f6bc78efbe0e3bf1f004e7250673a82a3431",
        publicKey:
            "0345d8d927b955c3cd468d12b5bc634c7919ee4777e578439af6314cf04b2ff114",
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
