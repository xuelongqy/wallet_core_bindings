part of '../../wallet_core_bindings.dart';

/// [TWHRP] interface.
abstract class TWHRPInterface {
  String? stringForHRP(int hrp);

  int hrpForString(String string);
}
