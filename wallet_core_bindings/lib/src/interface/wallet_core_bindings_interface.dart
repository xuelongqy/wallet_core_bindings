part of '../../wallet_core_bindings.dart';

/// WalletCore bindings interface.
abstract class WalletCoreBindingsInterface {
  /// [TWData] interface.
  late TWDataInterface data;

  /// [TWString] interface.
  late TWStringInterface string;

  /// WalletCore bindings instance.
  static WalletCoreBindingsInterface? _instance;

  /// Get WalletCore bindings instance.
  static WalletCoreBindingsInterface get instance {
    assert(_instance != null, 'Please initialize the instance.');
    return _instance!;
  }

  /// Set WalletCore bindings instance.
  static set instance(WalletCoreBindingsInterface instance) {
    _instance = instance;
  }

  /// Initializes the bindings.
  /// This should be called before using any of the bindings.
  ///
  /// example:
  /// ```dart
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await WalletCoreBindingsNativeImpl().initialize();
  ///   runApp(const MyApp());
  /// }
  /// ```
  Future initialize();
}

/// [TWData] interface.
TWDataInterface get _dataImpl => WalletCoreBindingsInterface.instance.data;

/// [TWString] interface.
TWStringInterface get _stringImpl =>
    WalletCoreBindingsInterface.instance.string;
