part of '../wallet_core_bindings.dart';

class TWStarkWare {
  TWStarkWare._();

  /// Generates the private stark key at the given derivation path from a valid eth signature
  ///
  /// \param [derivationPath] non-null StarkEx Derivation path
  /// \param [signature] valid eth signature
  /// \return  The private key for the specified derivation path/signature
  static TWPrivateKey getStarkKeyFromSignature(
          TWDerivationPath derivationPath, String signature) =>
      TWPrivateKey.fromPointer(
        iTWBindings.TWStarkWareGetStarkKeyFromSignature(
          derivationPath.pointer,
          TWString(signature).pointer,
        ),
      );
}
