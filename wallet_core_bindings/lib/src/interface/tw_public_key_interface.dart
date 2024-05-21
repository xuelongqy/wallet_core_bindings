part of '../../wallet_core_bindings.dart';

/// [TWPublicKey] interface.
abstract class TWPublicKeyInterface {
  int createWithData(int data, int type);

  int recover(int signature, int message);

  int data(int pointer);

  bool isValid(int data, int type);

  bool isCompressed(int pointer);

  int compressed(int from);

  int uncompressed(int from);

  bool verify(int pointer, int signature, int message);

  bool verifyAsDER(int pointer, int signature, int message);

  bool verifyZilliqaSchnorr(int pointer, int signature, int message);

  int type(int pointer);

  int description(int pointer);

  void delete(int pointer);
}
