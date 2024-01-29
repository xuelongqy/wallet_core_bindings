import 'package:test/test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

void main() {
  group(TWAccount, () {
    test('Create', () {
      final addressAdd = "bc1qturc268v0f2srjh4r2zu4t6zk4gdutqd5a6zny";
      final coin = TWCoinType.TWCoinTypeBitcoin;
      final derivationPath = "m/84'/0'/0'/0/0";
      final extPubKeyAdd =
          "zpub6qbsWdbcKW9sC6shTKK4VEhfWvDCoWpfLnnVfYKHLHt31wKYUwH3aFDz4WLjZvjHZ5W4qVEyk37cRwzTbfrrT1Gnu8SgXawASnkdQ994atn";
      final pubKey =
          "02df6fc590ab3101bbe0bb5765cbaeab9b5dcfe09ac9315d707047cbd13bc7e006";

      final account = TWAccount(
        address: addressAdd,
        coin: coin,
        derivation: TWDerivation.TWDerivationDefault,
        derivationPath: derivationPath,
        extendedPublicKey: extPubKeyAdd,
        publicKey: pubKey,
      );

      expect(account.address, addressAdd);
      expect(account.coin, coin);
      expect(account.derivation, TWDerivation.TWDerivationDefault);
      expect(account.derivationPath, derivationPath);
      expect(account.extendedPublicKey, extPubKeyAdd);
      expect(account.publicKey, pubKey);
    });
  });
}
