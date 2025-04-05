part of '../../wallet_core_bindings.dart';

/// [TWBarz] interface.
abstract class TWBarzInterface {
  int getCounterfactualAddress(int input);

  int getInitCode(int factory, int publicKey, int verificationFacet, int salt);

  int getFormattedSignature(
      int signature, int challenge, int authenticatorData, int clientDataJSON);

  int getPrefixedMsgHash(int msgHash, int barzAddress, int chainId);

  int getDiamondCutCode(int input);

  int getAuthorizationHash(int chainId, int contractAddress, int nonce);

  int signAuthorization(
      int chainId, int contractAddress, int nonce, int privateKey);

  int getEncodedHash(
      int chainId,
      int codeAddress,
      int codeName,
      int codeVersion,
      int typeHash,
      int domainSeparatorHash,
      int sender,
      int userOpHash);

  int getSignedHash(int hash, int privateKey);
}
