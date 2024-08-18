part of '../../wallet_core_bindings.dart';

/// [TWTONMessageSigner] interface.
abstract class TWTONMessageSignerInterface {
  int signMessage(int privateKey, int message);
}
