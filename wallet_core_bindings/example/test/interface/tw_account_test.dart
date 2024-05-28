import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import '../utils.dart';

void main() {
  initTest();

  group(TWAccount, () {
    test('Create', () {
      const addressAdd = "bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny";
      const coin = TWCoinType.Bitcoin;
      const derivationPath = "m/84'/0'/0'/0/0";
      const extPubKeyAdd =
          "zpub6qbsWdbcKW9sC6shTKK4VEhfWvDCoWpfLnnVfYKHLHt31wKYUwH3aFDz4WLjZvjHZ5W4qVEyk37cRwzTbfrrT1Gnu8SgXawASnkdQ994atn";
      const pubKey =
          "02df6fc590ab3101bbe0bb5765cbaeab9b5dcfe09ac9315d707047cbd13bc7e006";

      final account = TWAccount(
        address: addressAdd,
        coin: coin,
        derivation: TWDerivation.Default,
        derivationPath: derivationPath,
        extendedPublicKey: extPubKeyAdd,
        publicKey: pubKey,
      );

      expect(account.address, addressAdd);
      expect(account.coin, coin);
      expect(account.derivation, TWDerivation.Default);
      expect(account.derivationPath, derivationPath);
      expect(account.extendedPublicKey, extPubKeyAdd);
      expect(account.publicKey, pubKey);
    });
  });
}
