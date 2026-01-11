part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWBitcoinScript].
class TWBitcoinScriptImpl extends TWBitcoinScriptInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWBitcoinScriptImpl(this.bindings);

  @override
  int buildPayToPublicKey(int pubkey) {
    return bindings.TWBitcoinScriptBuildPayToPublicKey(
      Pointer.fromAddress(pubkey),
    ).address;
  }

  @override
  int buildPayToPublicKeyHash(int hash) {
    return bindings.TWBitcoinScriptBuildPayToPublicKeyHash(
      Pointer.fromAddress(hash),
    ).address;
  }

  @override
  int buildPayToScriptHash(int scriptHash) {
    return bindings.TWBitcoinScriptBuildPayToScriptHash(
      Pointer.fromAddress(scriptHash),
    ).address;
  }

  @override
  int buildPayToWitnessPubkeyHash(int hash) {
    return bindings.TWBitcoinScriptBuildPayToWitnessPubkeyHash(
      Pointer.fromAddress(hash),
    ).address;
  }

  @override
  int buildPayToWitnessScriptHash(int scriptHash) {
    return bindings.TWBitcoinScriptBuildPayToWitnessScriptHash(
      Pointer.fromAddress(scriptHash),
    ).address;
  }

  @override
  int create() {
    return bindings.TWBitcoinScriptCreate().address;
  }

  @override
  int createCopy(int script) {
    return bindings.TWBitcoinScriptCreateCopy(
      Pointer.fromAddress(script),
    ).address;
  }

  @override
  int createWithBytes(Uint8List bytes) {
    return bindings.TWBitcoinScriptCreateWithBytes(
      bytes.toNativeUint8(),
      bytes.length,
    ).address;
  }

  @override
  int data(int pointer) {
    return bindings.TWBitcoinScriptData(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  void delete(int pointer) {
    bindings.TWBitcoinScriptDelete(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int encode(int pointer) {
    return bindings.TWBitcoinScriptEncode(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  bool equal(int lhs, int rhs) {
    return bindings.TWBitcoinScriptEqual(
      Pointer.fromAddress(lhs),
      Pointer.fromAddress(rhs),
    );
  }

  @override
  int hashTypeForCoin(int coin) {
    return bindings.TWBitcoinScriptHashTypeForCoin(
      coin,
    );
  }

  @override
  bool isPayToScriptHash(int pointer) {
    return bindings.TWBitcoinScriptIsPayToScriptHash(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  bool isPayToWitnessPublicKeyHash(int pointer) {
    return bindings.TWBitcoinScriptIsPayToWitnessPublicKeyHash(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  bool isPayToWitnessScriptHash(int pointer) {
    return bindings.TWBitcoinScriptIsPayToWitnessScriptHash(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  bool isWitnessProgram(int pointer) {
    return bindings.TWBitcoinScriptIsWitnessProgram(
      Pointer.fromAddress(pointer),
    );
  }

  @override
  int lockScriptForAddress(int address, int coin) {
    return bindings.TWBitcoinScriptLockScriptForAddress(
      Pointer.fromAddress(address),
      coin,
    ).address;
  }

  @override
  int lockScriptForAddressReplay(
      int address, int coin, int blockHash, int blockHeight) {
    return bindings.TWBitcoinScriptLockScriptForAddressReplay(
      Pointer.fromAddress(address),
      coin,
      Pointer.fromAddress(blockHash),
      blockHeight,
    ).address;
  }

  @override
  int matchPayToPubkey(int pointer) {
    return bindings.TWBitcoinScriptMatchPayToPubkey(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int matchPayToPubkeyHash(int pointer) {
    return bindings.TWBitcoinScriptMatchPayToPubkeyHash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int matchPayToScriptHash(int pointer) {
    return bindings.TWBitcoinScriptMatchPayToScriptHash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int matchPayToWitnessPublicKeyHash(int pointer) {
    return bindings.TWBitcoinScriptMatchPayToWitnessPublicKeyHash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int matchPayToWitnessScriptHash(int pointer) {
    return bindings.TWBitcoinScriptMatchPayToWitnessScriptHash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int scriptHash(int pointer) {
    return bindings.TWBitcoinScriptScriptHash(
      Pointer.fromAddress(pointer),
    ).address;
  }

  @override
  int size(int pointer) {
    return bindings.TWBitcoinScriptSize(
      Pointer.fromAddress(pointer),
    );
  }
}
