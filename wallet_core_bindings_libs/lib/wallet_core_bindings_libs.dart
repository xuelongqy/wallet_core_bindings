
import 'wallet_core_bindings_libs_platform_interface.dart';

class WalletCoreBindingsLibs {
  Future<String?> getPlatformVersion() {
    return WalletCoreBindingsLibsPlatform.instance.getPlatformVersion();
  }
}
