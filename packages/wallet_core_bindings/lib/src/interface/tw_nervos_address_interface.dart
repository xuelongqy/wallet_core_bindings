part of '../../wallet_core_bindings.dart';

/// [TWNervosAddress] interface.
abstract class TWNervosAddressInterface {
  int createWithString(int string);

  bool equal(int lhs, int rhs);

  bool isValidString(int string);

  int description(int pointer);

  int codeHash(int pointer);

  int hashType(int pointer);

  int args(int pointer);

  void delete(int pointer);
}
