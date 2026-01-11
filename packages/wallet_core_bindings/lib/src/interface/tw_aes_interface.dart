part of '../../wallet_core_bindings.dart';

/// [TWAES] interface.
abstract class TWAESInterface {
  int encryptCBC(int key, int data, int iv, int mode);

  int decryptCBC(int key, int data, int iv, int mode);

  int encryptCTR(int key, int data, int iv);

  int decryptCTR(int key, int data, int iv);
}
