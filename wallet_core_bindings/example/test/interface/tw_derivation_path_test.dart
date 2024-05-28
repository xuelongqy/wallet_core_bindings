import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();

  group(TWDerivationPath, () {
    test('CreateWithString', () {
      const derivationPath = "m/84'/1'/2'/3/4";

      final path = TWDerivationPath.createWithString(derivationPath);

      expect(5, path.indicesCount);
      expect(TWPurpose.BIP84.purpose, path.purpose);
      expect(1, path.coin);
      expect(2, path.account);
      expect(3, path.change);
      expect(4, path.address);
      expect(path.description, derivationPath);

      final index0 = path.indexAt(0);
      final index3 = path.indexAt(3);

      expect(0, path.indexAt(10).pointer);
      expect(TWPurpose.BIP84.purpose, index0.value);
      expect(index0.hardened, true);

      expect(3, index3.value);
      expect(index3.hardened, false);
      expect(index0.description, "84'");

      final path2 = TWDerivationPath.createWithString("m/44'/501'");

      expect(2, path2.indicesCount);
      expect(TWPurpose.BIP44.purpose, path2.purpose);
      expect(501, path2.coin);
      expect(0, path2.account);
      expect(0, path2.change);
      expect(0, path2.address);
    });

    test('CreateWithCoin', () {
      final path = TWDerivationPath(
        purpose: TWPurpose.BIP44.purpose,
        coin: 60,
        account: 0,
        change: 0,
        address: 0,
      );

      expect(5, path.indicesCount);
      expect(TWPurpose.BIP44.purpose, path.purpose);
      expect(60, path.coin);
      expect(0, path.account);
      expect(0, path.change);
      expect(0, path.address);
      expect(path.description, "m/44'/60'/0'/0/0");

      final index = TWDerivationPathIndex(44, true);
      final description = index.description;
      expect(description, "44'");
    });
  });
}
