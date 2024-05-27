part of '../../wallet_core_bindings.dart';

/// [TWFIOAccount] interface.
abstract class TWFIOAccountInterface {
  int createWithString(int string);

  int description(int pointer);

  void delete(int pointer);
}
