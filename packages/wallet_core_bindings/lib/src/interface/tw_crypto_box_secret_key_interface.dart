part of '../../wallet_core_bindings.dart';

/// [TWCryptoBoxSecretKey] interface.
abstract class TWCryptoBoxSecretKeyInterface {
  bool isValid(int data);

  int create();

  int createWithData(int data);

  void delete(int pointer);

  int getPublicKey(int pointer);

  int date(int pointer);
}
