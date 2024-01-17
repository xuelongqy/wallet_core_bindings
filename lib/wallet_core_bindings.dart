library wallet_core_bindings;

import 'dart:ffi';
import 'dart:io';

import 'src/bindings/bindings.dart';

part 'src/bindings/lib.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
