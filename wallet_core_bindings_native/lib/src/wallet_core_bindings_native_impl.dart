part of '../wallet_core_bindings_native.dart';

/// WalletCore bindings native implementation.
/// Use WalletCore dynamic library. See [https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building].
class WalletCoreBindingsNativeImpl extends WalletCoreBindingsInterface {
  /// Default TrustWalletCore library.
  static final _defaultWalletCoreLibrary = Platform.isWindows
      ? DynamicLibrary.open('WalletCore.dll')
      : (Platform.isMacOS || Platform.isIOS)
          ? DynamicLibrary.open('WalletCore.xcframework')
          : DynamicLibrary.open('libTrustWalletCore.so');

  /// Default TrustWalletCore bindings.
  static final _defaultBindings =
      native_bindings.TrustWalletCoreBindings(_defaultWalletCoreLibrary);

  /// TrustWalletCore bindings.
  final native_bindings.TrustWalletCoreBindings _bindings;

  WalletCoreBindingsNativeImpl._(this._bindings);

  /// Creates a new WalletCore bindings native implementation.
  /// [bindings] is the TrustWalletCore dynamic library bindings.
  factory WalletCoreBindingsNativeImpl(
      [native_bindings.TrustWalletCoreBindings? bindings]) {
    return WalletCoreBindingsNativeImpl._(bindings ?? _defaultBindings);
  }

  @override
  Future initialize() async {
    string = TwStringImpl(_bindings);
    data = TwDataImpl(_bindings);
    WalletCoreBindingsInterface.instance = this;
  }
}
