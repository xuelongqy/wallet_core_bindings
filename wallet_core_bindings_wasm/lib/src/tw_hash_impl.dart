part of '../wallet_core_bindings_wasm.dart';

/// Wasm implementation for [TWHash].
class TWHashImpl extends TWHashInterface {
  final WasmInstance wasm;

  TWHashImpl(this.wasm);

  @override
  int blake256(int data) {
    final func = wasm.getFunction('TWHashBlake256')!;
    return func([data]).first as int;
  }

  @override
  int blake256Blake256(int data) {
    final func = wasm.getFunction('TWHashBlake256Blake256')!;
    return func([data]).first as int;
  }

  @override
  int blake256RIPEMD(int data) {
    final func = wasm.getFunction('TWHashBlake256RIPEMD')!;
    return func([data]).first as int;
  }

  @override
  int blake2b(int data, int size) {
    final func = wasm.getFunction('TWHashBlake2b')!;
    return func([data, size]).first as int;
  }

  @override
  int blake2bPersonal(int data, int personal, int outlen) {
    final func = wasm.getFunction('TWHashBlake2bPersonal')!;
    return func([data, personal, outlen]).first as int;
  }

  @override
  int groestl512(int data) {
    final func = wasm.getFunction('TWHashGroestl512')!;
    return func([data]).first as int;
  }

  @override
  int groestl512Groestl512(int data) {
    final func = wasm.getFunction('TWHashGroestl512Groestl512')!;
    return func([data]).first as int;
  }

  @override
  int keccak256(int data) {
    final func = wasm.getFunction('TWHashKeccak256')!;
    return func([data]).first as int;
  }

  @override
  int keccak512(int data) {
    final func = wasm.getFunction('TWHashKeccak512')!;
    return func([data]).first as int;
  }

  @override
  int ripemd(int data) {
    final func = wasm.getFunction('TWHashRIPEMD')!;
    return func([data]).first as int;
  }

  @override
  int sha1(int data) {
    final func = wasm.getFunction('TWHashSHA1')!;
    return func([data]).first as int;
  }

  @override
  int sha256(int data) {
    final func = wasm.getFunction('TWHashSHA256')!;
    return func([data]).first as int;
  }

  @override
  int sha256RIPEMD(int data) {
    final func = wasm.getFunction('TWHashSHA256RIPEMD')!;
    return func([data]).first as int;
  }

  @override
  int sha256SHA256(int data) {
    final func = wasm.getFunction('TWHashSHA256SHA256')!;
    return func([data]).first as int;
  }

  @override
  int sha3_256(int data) {
    final func = wasm.getFunction('TWHashSHA3_256')!;
    return func([data]).first as int;
  }

  @override
  int sha3_256RIPEMD(int data) {
    final func = wasm.getFunction('TWHashSHA3_256RIPEMD')!;
    return func([data]).first as int;
  }

  @override
  int sha3_512(int data) {
    final func = wasm.getFunction('TWHashSHA3_512')!;
    return func([data]).first as int;
  }

  @override
  int sha512(int data) {
    final func = wasm.getFunction('TWHashSHA512')!;
    return func([data]).first as int;
  }

  @override
  int sha512_256(int data) {
    final func = wasm.getFunction('TWHashSHA512_256')!;
    return func([data]).first as int;
  }
}
