part of '../../wallet_core_bindings.dart';

/// [TWNEARAccount] interface.
abstract class TWNEARAccountInterface {
  int createWithString(int string);

  int description(int pointer);

  void delete(int pointer);
}
