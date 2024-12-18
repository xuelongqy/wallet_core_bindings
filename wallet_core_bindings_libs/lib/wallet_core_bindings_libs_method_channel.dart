import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wallet_core_bindings_libs_platform_interface.dart';

/// An implementation of [WalletCoreBindingsLibsPlatform] that uses method channels.
class MethodChannelWalletCoreBindingsLibs
    extends WalletCoreBindingsLibsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wallet_core_bindings_libs');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
