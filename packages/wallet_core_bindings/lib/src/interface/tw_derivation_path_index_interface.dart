part of '../../wallet_core_bindings.dart';

/// [TWDerivationPathIndex] interface.
abstract class TWDerivationPathIndexInterface {
  int create(int value, bool hardened);

  int value(int pointer);

  bool hardened(int pointer);

  int description(int pointer);

  void delete(int pointer);
}
