part of '../../wallet_core_bindings.dart';

/// [TWCoinType] interface.
abstract class TWCoinTypeInterface {
  int blockchain(int coin);

  int purpose(int coin);

  int curve(int coin);

  int xpubVersion(int coin);

  int xprvVersion(int coin);

  bool validate(int coin, int address);

  int derivationPath(int coin);

  int derivationPathWithDerivation(int coin, int derivation);

  int deriveAddress(int coin, int privateKey);

  int deriveAddressFromPublicKey(int coin, int publicKey);

  int deriveAddressFromPublicKeyAndDerivation(
      int coin, int publicKey, int derivationPath);

  int hrp(int coin);

  int p2pkhPrefix(int coin);

  int p2shPrefix(int coin);

  int staticPrefix(int coin);

  int chainId(int coin);

  int slip44Id(int coin);

  int ss58Prefix(int coin);

  int publicKeyType(int coin);
}
