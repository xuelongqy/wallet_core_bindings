part of '../../wallet_core_bindings.dart';

/// [TWEthereum] interface.
abstract class TWEthereumInterface {
  int eip2645GetPath(int ethAddress, int layer, int application, int index);
}
