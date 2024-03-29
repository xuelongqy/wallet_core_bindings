import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gNativeEvmosAddr = "evmos14py36sx57ud82t9yrks9z6hdsrpn5x6k0r05np";
final gNativeEvmosHrp = "evmos";

void main() {
  group('TWNativeEvmosAnyAddress', () {
    test('AllNativeEvmosAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gNativeEvmosHrp,
        coinType: TWCoinType.TWCoinTypeNativeEvmos,
        address: gNativeEvmosAddr,
        standaloneChain: false,
        publicKeyType: TWPublicKeyType.TWPublicKeyTypeSECP256k1Extended,
        privKey:
            "8d2a3bd62d300a148c89dc8635f87b7a24a951bd1c4e78675fe40e1a640d46ed",
        publicKey:
            "04868e7e1634417db2adfd9fe38205bfa0fea01898a7fd30565d13f7056a37c065211845f6e553524c2c1611af9712ac02b7a3b439c9f0cfcadfd81a2c86cc0ab8",
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
