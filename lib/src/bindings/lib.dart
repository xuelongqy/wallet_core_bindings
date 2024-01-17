part of '../../wallet_core_bindings.dart';

/// TrustWalletCore library and bindings.
class TrustWalletCoreLib {
  /// TrustWalletCore bindings.
  static TrustWalletCoreBindings? _bindings;

  /// Get TrustWalletCore bindings.
  static TrustWalletCoreBindings get bindings {
    _bindings ??= TrustWalletCoreBindings(_walletCoreLibrary);
    return _bindings!;
  }

  /// Set TrustWalletCore bindings.
  static set bindings(TrustWalletCoreBindings value) {
    _bindings = value;
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