part of '../../wallet_core_bindings.dart';

/// [TWHDVersion] interface.
abstract class TWHDVersionInterface {
  bool isPublic(int version);

  bool isPrivate(int version);
}
