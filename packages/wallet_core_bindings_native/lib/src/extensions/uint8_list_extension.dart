part of '../../wallet_core_bindings_native.dart';

extension Uint8ListExtension on Uint8List {
  /// Extension method for converting a [Uint8List] to a `Pointer<Uint8>`.
  Pointer<Uint8> toNativeUint8({Allocator allocator = malloc, bool gc = true}) {
    final Pointer<Uint8> result = allocator<Uint8>(length + 1);
    final Uint8List nativeString = result.asTypedList(
      length + 1,
      finalizer: gc ? malloc.nativeFree : null,
      token: gc ? result.cast() : null,
    );
    nativeString.setAll(0, this);
    nativeString[length] = 0;
    return result.cast();
  }
}
