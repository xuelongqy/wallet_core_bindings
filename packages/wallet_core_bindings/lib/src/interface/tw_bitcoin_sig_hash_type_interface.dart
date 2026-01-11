part of '../../wallet_core_bindings.dart';

/// [TWBitcoinSigHashType] interface.
abstract class TWBitcoinSigHashTypeInterface {
  bool isSingle(int type);

  bool isNone(int type);
}
