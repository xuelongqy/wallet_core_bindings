part of '../../wallet_core_bindings.dart';

/// [TWAnyAddress] interface.
abstract class TWAnyAddressInterface {
  int createWithString(int string, int coin);

  int createBech32(int string, int coin, int hrp);
  int createSS58(int string, int coin, int ss58Prefix);
  int createWithPublicKey(int publicKey, int coin);
  int createWithPublicKeyDerivation(int publicKey, int coin, int derivation);
  int createBech32WithPublicKey(int publicKey, int coin, int hrp);
  int createSS58WithPublicKey(int publicKey, int coin, int ss58Prefix);
  int createWithPublicKeyFilecoinAddressType(int publicKey, int filecoinAddressType);
  int createWithPublicKeyFiroAddressType(int publicKey, int firoAddressType);
  bool equal(int lhs, int rhs);
  int description(int pointer);
  int coin(int pointer);
  int data(int pointer);
  bool isValid(int string, int coin);
  bool isValidBech32(int string, int coin, int hrp);
  bool isValidSS58(int string, int coin, int ss58Prefix);

  void delete(int pointer);
}
