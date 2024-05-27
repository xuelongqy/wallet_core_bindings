part of '../../wallet_core_bindings.dart';

/// [TWDerivationPath] interface.
abstract class TWDerivationPathInterface {
  int create(int purpose, int coin, int account, int change, int address);

  int createWithString(int string);

  int createWithPublicKey(int publicKey, int coin);

  int indexAt(int pointer, int index);

  int indicesCount(int pointer);

  int purpose(int pointer);

  int coin(int pointer);

  int account(int pointer);

  int change(int pointer);

  int address(int pointer);

  int description(int pointer);

  void delete(int pointer);
}
