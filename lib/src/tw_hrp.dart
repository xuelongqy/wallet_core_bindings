part of '../wallet_core_bindings.dart';

///  Registered human-readable parts for BIP-0173
///
/// - SeeAlso: https://github.com/satoshilabs/slips/blob/master/slip-0173.md
typedef TWHRP = bindings.TWHRP;

String? stringForHRP(int hrp) {
  final nativeString = iTWBindings.stringForHRP(hrp);
  if (nativeString == nullptr) {
    return null;
  }
  return nativeString.cast<Utf8>().toDartString();
}

int hrpForString(String string) =>
    iTWBindings.hrpForString(TWString(string).utf8Bytes());