part of '../../wallet_core_bindings.dart';

/// [TWGroestlcoinAddress] interface.
abstract class TWGroestlcoinAddressInterface {
  int createWithString(int string);

  int createWithPublicKey(int publicKey, int prefix);

  bool equal(int lhs, int rhs);

  bool isValidString(int string);

  int description(int pointer);

  void delete(int pointer);
}
