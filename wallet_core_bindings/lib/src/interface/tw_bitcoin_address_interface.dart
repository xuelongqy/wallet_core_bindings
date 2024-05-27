part of '../../wallet_core_bindings.dart';

/// [TWBitcoinAddress] interface.
abstract class TWBitcoinAddressInterface {
  int createWithString(int string);

  int createWithData(int data);

  int createWithPublicKey(int publicKye, int prefix);

  bool equal(int lhs, int rhs);

  bool isValid(int data);

  bool isValidString(int string);

  int description(int pointer);

  int prefix(int pointer);

  int keyHash(int pointer);

  void delete(int pointer);
}
