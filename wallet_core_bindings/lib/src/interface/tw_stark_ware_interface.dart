part of '../../wallet_core_bindings.dart';

/// [TWStarkWare] interface.
abstract class TWStarkWareInterface {
  int getStarkKeyFromSignature(int derivationPath, int signature);
}
