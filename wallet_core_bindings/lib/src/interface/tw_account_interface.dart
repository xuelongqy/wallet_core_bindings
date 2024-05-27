part of '../../wallet_core_bindings.dart';

/// [TWAccount] interface.
abstract class TWAccountInterface {
  int create(int address, int coin, int derivation, int derivationPath,
      int publicKey, int extendedPublicKey);

  int address(int pointer);

  int coin(int pointer);

  int derivation(int pointer);

  int derivationPath(int pointer);

  int publicKey(int pointer);

  int extendedPublicKey(int pointer);

  void delete(int pointer);
}
