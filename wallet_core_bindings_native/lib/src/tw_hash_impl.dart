part of '../wallet_core_bindings_native.dart';

/// Native implementation for [TWHash].
class TWHashImpl extends TWHashInterface {
  final native_bindings.TrustWalletCoreBindings bindings;

  TWHashImpl(this.bindings);

  @override
  int blake256(int data) {
    return bindings.TWHashBlake256(Pointer.fromAddress(data)).address;
  }

  @override
  int blake256Blake256(int data) {
    return bindings.TWHashBlake256Blake256(Pointer.fromAddress(data)).address;
  }

  @override
  int blake256RIPEMD(int data) {
    return bindings.TWHashBlake256RIPEMD(Pointer.fromAddress(data)).address;
  }

  @override
  int blake2b(int data, int size) {
    return bindings.TWHashBlake2b(Pointer.fromAddress(data), size).address;
  }

  @override
  int blake2bPersonal(int data, int personal, int outlen) {
    return bindings.TWHashBlake2bPersonal(
            Pointer.fromAddress(data), Pointer.fromAddress(personal), outlen)
        .address;
  }

  @override
  int groestl512(int data) {
    return bindings.TWHashGroestl512(Pointer.fromAddress(data)).address;
  }

  @override
  int groestl512Groestl512(int data) {
    return bindings.TWHashGroestl512Groestl512(Pointer.fromAddress(data))
        .address;
  }

  @override
  int keccak256(int data) {
    return bindings.TWHashKeccak256(Pointer.fromAddress(data)).address;
  }

  @override
  int keccak512(int data) {
    return bindings.TWHashKeccak512(Pointer.fromAddress(data)).address;
  }

  @override
  int ripemd(int data) {
    return bindings.TWHashRIPEMD(Pointer.fromAddress(data)).address;
  }

  @override
  int sha1(int data) {
    return bindings.TWHashSHA1(Pointer.fromAddress(data)).address;
  }

  @override
  int sha256(int data) {
    return bindings.TWHashSHA256(Pointer.fromAddress(data)).address;
  }

  @override
  int sha256RIPEMD(int data) {
    return bindings.TWHashSHA256RIPEMD(Pointer.fromAddress(data)).address;
  }

  @override
  int sha256SHA256(int data) {
    return bindings.TWHashSHA256SHA256(Pointer.fromAddress(data)).address;
  }

  @override
  int sha3_256(int data) {
    return bindings.TWHashSHA3_256(Pointer.fromAddress(data)).address;
  }

  @override
  int sha3_256RIPEMD(int data) {
    return bindings.TWHashSHA3_256RIPEMD(Pointer.fromAddress(data)).address;
  }

  @override
  int sha3_512(int data) {
    return bindings.TWHashSHA3_512(Pointer.fromAddress(data)).address;
  }

  @override
  int sha512(int data) {
    return bindings.TWHashSHA512(Pointer.fromAddress(data)).address;
  }

  @override
  int sha512_256(int data) {
    return bindings.TWHashSHA512_256(Pointer.fromAddress(data)).address;
  }
}
