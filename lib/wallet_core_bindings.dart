library wallet_core_bindings;

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'src/bindings/bindings.dart' as bindings;

part 'src/bindings/lib.dart';
part 'src/tw_account.dart';
part 'src/tw_aes.dart';
part 'src/tw_string.dart';
part 'src/tw_data.dart';
part 'src/tw_coin_type.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
