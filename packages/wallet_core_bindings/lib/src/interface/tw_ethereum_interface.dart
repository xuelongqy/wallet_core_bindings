part of '../../wallet_core_bindings.dart';

/// [TWEthereum] interface.
abstract class TWEthereumInterface {
  int addressChecksummed(int address);
  int eip2645GetPath(int ethAddress, int layer, int application, int index);
  int eip1014Create2Address(int from, int salt, int initCodeHash);
  int eip1967ProxyInitCode(int logicAddress, int data);
}
