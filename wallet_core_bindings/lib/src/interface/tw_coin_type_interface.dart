part of '../../wallet_core_bindings.dart';

/// [TWCoinType] interface.
abstract class TWCoinTypeInterface {
  int blockchain(int coin);

  int purpose(int coin);

  int curve(int coin);

  int xpubVersion(int coin);

  int xprvVersion(int coin);

  bool validate(int coin, String address);

  String derivationPath(int coin);

  String derivationPathWithDerivation(int coin, int derivation);

  String deriveAddress(int coin, int privateKey);

  String deriveAddressFromPublicKey(int coin, int publicKey);

  String deriveAddressFromPublicKeyAndDerivation(
      int coin, int publicKey, int derivationPath);

  int hrp(int coin);

  int p2pkhPrefix(int coin);

  int p2shPrefix(int coin);

  int staticPrefix(int coin);

  String chainId(int coin);

  int slip44Id(int coin);

  int ss58Prefix(int coin);

  int publicKeyType(int coin);
}
