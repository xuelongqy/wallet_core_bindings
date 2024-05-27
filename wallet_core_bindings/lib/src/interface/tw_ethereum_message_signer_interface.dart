part of '../../wallet_core_bindings.dart';

/// [TWEthereumMessageSigner] interface.
abstract class TWEthereumMessageSignerInterface {
  int signTypedMessage(int privateKey, int messageJson);

  int signTypedMessageEip155(int privateKey, int messageJson, int chainId);

  int signMessage(int privateKey, int message);

  int signMessageImmutableX(int privateKey, int message);

  int signMessageEip155(int privateKey, int message, int chainId);

  bool verifyMessage(int pubKey, int message, int signature);
}
