import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../cosmos_test_helpers.dart';

final gAgoricAddr = "agoric1wu32wujsvz290sasq308fswznx77nk9k0cxqwg";
final gAgoricHrp = "agoric";

void main() {
  group('TWAgoricAnyAddress', () {
    test('AllAgoricAddressTests', () {
      final parameters = CosmosAddressParameters(
        hrp: gAgoricHrp,
        coinType: TWCoinType.TWCoinTypeAgoric,
        address: gAgoricAddr,
        privKey:
            '9457d0a4b7bdfe23528af07603af0f7d0ac0c510526da7721abefdc3948461f6',
        publicKey:
            '03602731bc2f787eec358c1ba8ddb8e7c7720f56a0406b8d16e20c93b822953960',
      );
      TWCosmosTests.TestCosmosAddressParameters(parameters);
    });
  });
}
