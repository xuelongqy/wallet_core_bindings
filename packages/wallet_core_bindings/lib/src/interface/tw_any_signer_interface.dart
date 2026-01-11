part of '../../wallet_core_bindings.dart';

/// [TWAnySigner] interface.
abstract class TWAnySignerInterface {
  int sign(int input, int coin);

  int signJSON(int input, int key, int coin);

  bool supportsJSON(int coin);

  int plan(int input, int coin);
}
