import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

import '../../../utils.dart';

const gNativeInjectiveAddr = "inj14py36sx57ud82t9yrks9z6hdsrpn5x6k8tf7m3";
const gNativeInjectiveHrp = "inj";

void main() {
  initTest();
  group('TWNativeInjectiveAnyAddress', () {
    test('AllNativeInjectiveAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gNativeInjectiveHrp,
        coinType: TWCoinType.NativeInjective,
        address: gNativeInjectiveAddr,
        standaloneChain: false,
        publicKeyType: TWPublicKeyType.SECP256k1Extended,
        privKey:
            "8d2a3bd62d300a148c89dc8635f87b7a24a951bd1c4e78675fe40e1a640d46ed",
        publicKey:
            "04868e7e1634417db2adfd9fe38205bfa0fea01898a7fd30565d13f7056a37c065211845f6e553524c2c1611af9712ac02b7a3b439c9f0cfcadfd81a2c86cc0ab8",
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
