part of '../../wallet_core_bindings.dart';

/// TrustWalletCore library and bindings.
class TrustWalletCoreLib {
  /// TrustWalletCore bindings.
  static bindings.TrustWalletCoreBindings? _bindingsInstance;

  /// Get TrustWalletCore bindings.
  static bindings.TrustWalletCoreBindings get bindingsInstance {
    _bindingsInstance ??= bindings.TrustWalletCoreBindings(_walletCoreLibrary);
    return _bindingsInstance!;
  }

  /// Set TrustWalletCore bindings.
  static set bindingsInstance(bindings.TrustWalletCoreBindings value) {
    _bindingsInstance = value;
  }

  /// TrustWalletCore library.
  static get _walletCoreLibrary {
    if (Platform.isWindows) {
      return DynamicLibrary.open('WalletCore.dll');
    } else if (Platform.isMacOS || Platform.isIOS) {
      return DynamicLibrary.open('WalletCore.xcframework');
    }
    return DynamicLibrary.open('libTrustWalletCore.so');
  }
}

bindings.TrustWalletCoreBindings get iTWBindings => TrustWalletCoreLib.bindingsInstance;
