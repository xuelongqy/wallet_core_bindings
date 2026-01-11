part of '../../wallet_core_bindings.dart';

/// [TWTONWallet] interface.
abstract class TWTONWalletInterface {
  int buildV4R2StateInit(int publicKey, int workchain, int walletId);
}
