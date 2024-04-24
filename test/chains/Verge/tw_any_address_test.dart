import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../../utils.dart';

void main() {
  group('TWVerge', () {
    const coin = TWCoinType.TWCoinTypeVerge;

    test('Address', () {
      final string = 'DRyNFvJaybnF22UfMS6NR1Qav3mqxPj86E';
      final address = TWAnyAddress(string, coin);
      final string2 = address.description;
      expect(string, string2);
      final keyHash = address.data;
      expectHex(keyHash, 'e4839a523f120882d11eb3dda13a18e11fdcbd4a');
    });
  });
}
