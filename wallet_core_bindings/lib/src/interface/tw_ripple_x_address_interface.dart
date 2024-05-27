part of '../../wallet_core_bindings.dart';

/// [TWRippleXAddress] interface.
abstract class TWRippleXAddressInterface {
  int createWithString(int string);

  int createWithPublicKey(int publicKey, int tag);

  bool equal(int lhs, int rhs);

  bool isValidString(int string);

  int description(int pointer);

  int tag(int pointer);

  void delete(int pointer);
}
