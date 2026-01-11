part of '../../wallet_core_bindings.dart';

/// [TWBase32] interface.
abstract class TWBase32Interface {
  int decodeWithAlphabet(int string, int alphabet);

  int decode(int string);

  int encodeWithAlphabet(int data, int alphabet);

  int encode(int data);
}
