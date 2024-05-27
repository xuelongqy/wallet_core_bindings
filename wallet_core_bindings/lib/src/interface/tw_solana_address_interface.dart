part of '../../wallet_core_bindings.dart';

/// [TWSolanaAddress] interface.
abstract class TWSolanaAddressInterface {
  int createWithString(int string);

  int createWithPublicKey(int hrp, int publicKey);

  int defaultTokenAddress(int pointer, int tokenMintAddress);

  int description(int pointer);

  void delete(int pointer);
}
