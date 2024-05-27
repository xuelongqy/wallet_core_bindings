part of '../../wallet_core_bindings.dart';

/// [TWBarz] interface.
abstract class TWBarzInterface {
  int getCounterfactualAddress(int input);

  int getInitCode(int factory, int publicKey, int verificationFacet, int salt);

  int getFormattedSignature(
      int signature, int challenge, int authenticatorData, int clientDataJSON);

  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId);

  int getDiamondCutCode(int input);
}
