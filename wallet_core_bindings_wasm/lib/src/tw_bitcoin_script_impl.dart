part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWBitcoinScript].
class TWBitcoinScriptImpl extends TWBitcoinScriptInterface {
  final WasmInstance wasm;

  TWBitcoinScriptImpl(this.wasm);

  @override
  int buildBRC20InscribeTransfer(int ticker, int amount, int pubkey) {
    final func = wasm.getFunction('TWBitcoinScriptBuildBRC20InscribeTransfer')!;
    return func([ticker, amount, pubkey]).first as int;
  }

  @override
  int buildOrdinalNftInscription(int mimeType, int payload, int pubkey) {
    final func = wasm.getFunction('TWBitcoinScriptBuildOrdinalNftInscription')!;
    return func([mimeType, payload, pubkey]).first as int;
  }

  @override
  int buildPayToPublicKey(int pubkey) {
    final func = wasm.getFunction('TWBitcoinScriptBuildPayToPublicKey')!;
    return func([pubkey]).first as int;
  }

  @override
  int buildPayToPublicKeyHash(int hash) {
    final func = wasm.getFunction('TWBitcoinScriptBuildPayToPublicKeyHash')!;
    return func([hash]).first as int;
  }

  @override
  int buildPayToScriptHash(int scriptHash) {
    final func = wasm.getFunction('TWBitcoinScriptBuildPayToScriptHash')!;
    return func([scriptHash]).first as int;
  }

  @override
  int buildPayToWitnessPubkeyHash(int hash) {
    final func =
        wasm.getFunction('TWBitcoinScriptBuildPayToWitnessPubkeyHash')!;
    return func([hash]).first as int;
  }

  @override
  int buildPayToWitnessScriptHash(int scriptHash) {
    final func =
        wasm.getFunction('TWBitcoinScriptBuildPayToWitnessScriptHash')!;
    return func([scriptHash]).first as int;
  }

  @override
  int create() {
    final func = wasm.getFunction('TWBitcoinScriptCreate')!;
    return func([]).first as int;
  }

  @override
  int createCopy(int script) {
    final func = wasm.getFunction('TWBitcoinScriptCreateCopy')!;
    return func([script]).first as int;
  }

  @override
  int createWithBytes(Uint8List bytes) {
    final func = wasm.getFunction('TWBitcoinScriptCreateWithBytes')!;
    final memory = wasm.getMemory('memory')!;
    final size = bytes.length;
    final bytesPointer = wasm.malloc(size);
    memory.view.setRange(bytesPointer, bytesPointer + size, bytes);
    final pointer = func([bytesPointer, bytes.length]).first as int;
    wasm.free(bytesPointer);
    return pointer;
  }

  @override
  int data(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptData')!;
    return func([pointer]).first as int;
  }

  @override
  void delete(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptDelete')!;
    func([pointer]);
  }

  @override
  int encode(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptEncode')!;
    return func([pointer]).first as int;
  }

  @override
  bool equal(int lhs, int rhs) {
    final func = wasm.getFunction('TWBitcoinScriptEqual')!;
    return func([lhs, rhs]).first as int != 0;
  }

  @override
  int hashTypeForCoin(int coin) {
    final func = wasm.getFunction('TWBitcoinScriptHashTypeForCoin')!;
    return func([coin]).first as int;
  }

  @override
  bool isPayToScriptHash(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptIsPayToScriptHash')!;
    return func([pointer]).first as int != 0;
  }

  @override
  bool isPayToWitnessPublicKeyHash(int pointer) {
    final func =
        wasm.getFunction('TWBitcoinScriptIsPayToWitnessPublicKeyHash')!;
    return func([pointer]).first as int != 0;
  }

  @override
  bool isPayToWitnessScriptHash(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptIsPayToWitnessScriptHash')!;
    return func([pointer]).first as int != 0;
  }

  @override
  bool isWitnessProgram(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptIsWitnessProgram')!;
    return func([pointer]).first as int != 0;
  }

  @override
  int lockScriptForAddress(int address, int coin) {
    final func = wasm.getFunction('TWBitcoinScriptLockScriptForAddress')!;
    return func([address, coin]).first as int;
  }

  @override
  int lockScriptForAddressReplay(
      int address, int coin, int blockHash, int blockHeight) {
    final func = wasm.getFunction('TWBitcoinScriptLockScriptForAddressReplay')!;
    return func([address, coin, blockHash, blockHeight]).first as int;
  }

  @override
  int matchPayToPubkey(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptMatchPayToPubkey')!;
    return func([pointer]).first as int;
  }

  @override
  int matchPayToPubkeyHash(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptMatchPayToPubkeyHash')!;
    return func([pointer]).first as int;
  }

  @override
  int matchPayToScriptHash(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptMatchPayToScriptHash')!;
    return func([pointer]).first as int;
  }

  @override
  int matchPayToWitnessPublicKeyHash(int pointer) {
    final func =
        wasm.getFunction('TWBitcoinScriptMatchPayToWitnessPublicKeyHash')!;
    return func([pointer]).first as int;
  }

  @override
  int matchPayToWitnessScriptHash(int pointer) {
    final func =
        wasm.getFunction('TWBitcoinScriptMatchPayToWitnessScriptHash')!;
    return func([pointer]).first as int;
  }

  @override
  int scriptHash(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptScriptHash')!;
    return func([pointer]).first as int;
  }

  @override
  int size(int pointer) {
    final func = wasm.getFunction('TWBitcoinScriptSize')!;
    return func([pointer]).first as int;
  }
}
