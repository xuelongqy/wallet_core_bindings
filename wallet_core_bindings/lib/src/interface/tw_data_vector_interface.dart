part of '../../wallet_core_bindings.dart';

/// [TWDataVector] interface.
abstract class TWDataVectorInterface {
  int create();

  int createWithData(int data);

  void add(int pointer, int data);

  int size(int pointer);

  int get(int pointer, int index);

  void delete(int pointer);
}
