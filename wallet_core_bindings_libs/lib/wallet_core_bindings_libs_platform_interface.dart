import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wallet_core_bindings_libs_method_channel.dart';

abstract class WalletCoreBindingsLibsPlatform extends PlatformInterface {
  /// Constructs a WalletCoreBindingsLibsPlatform.
  WalletCoreBindingsLibsPlatform() : super(token: _token);

  static final Object _token = Object();

  static WalletCoreBindingsLibsPlatform _instance = MethodChannelWalletCoreBindingsLibs();

  /// The default instance of [WalletCoreBindingsLibsPlatform] to use.
  ///
  /// Defaults to [MethodChannelWalletCoreBindingsLibs].
  static WalletCoreBindingsLibsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WalletCoreBindingsLibsPlatform] when
  /// they register themselves.
  static set instance(WalletCoreBindingsLibsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
