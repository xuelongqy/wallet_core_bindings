part of '../../wallet_core_bindings.dart';

/// [TWBitcoinScript] interface.
abstract class TWBitcoinScriptInterface {
  int create();

  int createWithBytes(Uint8List bytes);

  int createCopy(int script);

  int buildPayToPublicKey(int pubkey);

  int buildPayToPublicKeyHash(int hash);

  int buildPayToScriptHash(int scriptHash);

  int buildPayToWitnessPubkeyHash(int hash);

  int buildPayToWitnessScriptHash(int scriptHash);

  int lockScriptForAddress(int address, int coin);

  int lockScriptForAddressReplay(
      int address, int coin, int blockHash, int blockHeight);

  int size(int pointer);

  int data(int pointer);

  int scriptHash(int pointer);

  bool isPayToScriptHash(int pointer);

  bool isPayToWitnessScriptHash(int pointer);

  bool isPayToWitnessPublicKeyHash(int pointer);

  bool isWitnessProgram(int pointer);

  bool equal(int lhs, int rhs);

  int matchPayToPubkey(int pointer);

  int matchPayToPubkeyHash(int pointer);

  int matchPayToScriptHash(int pointer);

  int matchPayToWitnessPublicKeyHash(int pointer);

  int matchPayToWitnessScriptHash(int pointer);

  int encode(int pointer);

  int buildBRC20InscribeTransfer(int ticker, int amount, int pubkey);

  int buildOrdinalNftInscription(int mimeType, int payload, int pubkey);

  int hashTypeForCoin(int coin);

  void delete(int pointer);
}
