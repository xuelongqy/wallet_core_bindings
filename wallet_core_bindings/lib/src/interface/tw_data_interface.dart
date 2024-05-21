part of '../../wallet_core_bindings.dart';

/// [TWData] interface.
abstract class TWDataInterface {
  int createWithBytes(Uint8List bytes);

  int createWithSize(int size);

  int createWithData(int data);

  int createWithHexString(String hex);

  int size(int pointer);

  Uint8List bytes(int pointer);

  int get(int pointer, int index);

  void set(int pointer, int index, int byte);

  Uint8List copyBytes(int pointer, int start, int size);

  void replaceBytes(int pointer, int start, int size, Uint8List bytes);

  void appendBytes(int pointer, Uint8List bytes);

  void appendByte(int pointer, int byte);

  void appendData(int pointer, int append);

  void reverse(int pointer);

  void reset(int pointer);

  bool equal(int lhs, int rhs);

  void delete(int pointer);
}
