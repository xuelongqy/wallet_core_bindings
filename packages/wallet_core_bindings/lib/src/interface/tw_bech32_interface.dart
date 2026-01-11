part of '../../wallet_core_bindings.dart';

/// [TWBech32] interface.
abstract class TWBech32Interface {
  int encode(int hrp, int data);

  int decode(int string);

  int encodeM(int hrp, int data);

  int decodeM(int string);
}
