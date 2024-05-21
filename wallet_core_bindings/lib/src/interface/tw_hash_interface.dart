part of '../../wallet_core_bindings.dart';

/// [TWHash] interface.
abstract class TWHashInterface {
  int sha1(int data);

  int sha256(int data);

  int sha512(int data);

  int sha512_256(int data);

  int keccak256(int data);

  int keccak512(int data);

  int sha3_256(int data);

  int sha3_512(int data);

  int ripemd(int data);

  int blake256(int data);

  int blake2b(int data, int size);

  int blake2bPersonal(int data, int personal, int outlen);

  int groestl512(int data);

  int sha256SHA256(int data);

  int sha256RIPEMD(int data);

  int sha3_256RIPEMD(int data);

  int blake256Blake256(int data);

  int blake256RIPEMD(int data);

  int groestl512Groestl512(int data);
}
