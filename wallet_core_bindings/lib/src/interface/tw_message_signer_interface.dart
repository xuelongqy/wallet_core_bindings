part of '../../wallet_core_bindings.dart';

/// [TWMessageSigner] interface.
abstract class TWMessageSignerInterface {
  int preImageHashes(int coin, int input);

  int sign(int coin, int input);

  bool verify(int coin, int input);
}
