part of '../../wallet_core_bindings.dart';

/// [TWCryptoBox] interface.
abstract class TWCryptoBoxInterface {
  int encryptEasy(int mySecret, int otherPubkey, int message);

  int decryptEasy(int mySecret, int otherPubkey, int encrypted);
}
