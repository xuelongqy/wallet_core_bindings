part of '../../wallet_core_bindings.dart';

/// [TWString] interface.
abstract class TWStringInterface {
  int create(String value);

  int createWithUTF8Bytes(Uint8List bytes);

  int createWithRawBytes(Uint8List bytes);

  int createWithHexData(int data);

  int size(int pointer);

  int get(int pointer, int index);

  Uint8List utf8Bytes(int pointer);

  bool equal(int lhs, int rhs);

  void delete(int pointer);
}
