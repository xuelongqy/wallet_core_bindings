library wallet_core_bindings_native;

import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';

import 'src/bindings/bindings.dart' as native_bindings;

part 'src/wallet_core_bindings_native_impl.dart';
part 'src/tw_data_impl.dart';
part 'src/tw_string_impl.dart';
part 'src/extensions/uint8_list_extension.dart';
