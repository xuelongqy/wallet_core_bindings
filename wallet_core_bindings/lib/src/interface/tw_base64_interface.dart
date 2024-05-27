part of '../../wallet_core_bindings.dart';

/// [TWBase64] interface.
abstract class TWBase64Interface {
  int encode(int data);

  int encodeUrl(int data);

  int decode(int string);

  int decodeUrl(int string);
}
