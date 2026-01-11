part of '../../wallet_core_bindings.dart';

/// [TWSegwitAddress] interface.
abstract class TWSegwitAddressInterface {
  int createWithString(int string);

  int createWithPublicKey(int hrp, int publicKey);

  bool equal(int lhs, int rhs);

  bool isValidString(int string);

  int description(int pointer);

  int hrp(int pointer);

  int witnessVersion(int pointer);

  int witnessProgram(int pointer);

  void delete(int pointer);
}
