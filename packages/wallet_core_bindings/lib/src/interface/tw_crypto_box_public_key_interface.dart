part of '../../wallet_core_bindings.dart';

/// [TWCryptoBoxPublicKey] interface.
abstract class TWCryptoBoxPublicKeyInterface {
  bool isValid(int data);

  int createWithData(int data);

  void delete(int pointer);

  int date(int pointer);
}
