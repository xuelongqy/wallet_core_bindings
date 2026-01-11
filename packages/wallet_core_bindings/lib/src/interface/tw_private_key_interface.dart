part of '../../wallet_core_bindings.dart';

/// [TWPrivateKey] interface.
abstract class TWPrivateKeyInterface {
  int create();

  int createWithData(int data);

  int createCopy(int key);

  bool isValid(int data, int curve);

  int data(int pointer);

  int getPublicKey(int pointer, int coinType);

  int getPublicKeyByType(int pointer, int pubkeyType);

  int getPublicKeySecp256k1(int pointer, bool compressed);

  int getPublicKeyNist256p1(int pointer);

  int getPublicKeyEd25519(int pointer);

  int getPublicKeyEd25519Blake2b(int pointer);

  int getPublicKeyEd25519Cardano(int pointer);

  int getPublicKeyCurve25519(int pointer);

  int sign(int pointer, int digest, int curve);

  int signAsDER(int pointer, int digest);

  int signZilliqaSchnorr(int pointer, int message);

  void delete(int pointer);
}
