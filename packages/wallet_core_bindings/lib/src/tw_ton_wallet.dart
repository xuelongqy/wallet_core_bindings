part of '../wallet_core_bindings.dart';

/// TON wallet operations.
class TWTONWallet {
  TWTONWallet._();

  /// Constructs a TON Wallet V4R2 stateInit encoded as BoC (BagOfCells) for the given `public_key`.
  ///
  /// \param [publicKey] wallet's public key.
  /// \param [workchain] TON workchain to which the wallet belongs. Usually, base chain is used (0).
  /// \param [walletId] wallet's ID allows to create multiple wallets for the same private key.
  /// \return A base64 encoded Bag Of Cells (BoC) StateInit. Null if invalid public key provided.
  static String buildV4R2StateInit({
    required TWPublicKey publicKey,
    required int workchain,
    required int walletId,
  }) {
    return TWString.fromPointer(_tonWalletImpl.buildV4R2StateInit(
      publicKey.pointer,
      workchain,
      walletId,
    )).value!;
  }
}
