part of '../../wallet_core_bindings.dart';

abstract class TWStringInterface {
  int TWStringCreate(String value);
  int TWStringCreateWithUTF8Bytes(int bytes);
  int TWStringCreateWithRawBytes(Uint8List bytes);
  int TWStringCreateWithHexData(Uint8List data);
  int TWStringSize(int string);
  int TWStringGet(int string, int index);
  Uint8List TWStringUTF8Bytes(int string);
  bool TWStringEqual(int lhs, int rhs);
  int TWStringDelete(int delete);
}