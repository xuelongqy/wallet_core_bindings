part of '../../wallet_core_bindings.dart';

/// WalletCore bindings interface.
abstract class WalletCoreBindingsInterface {
  /// [TWBitcoinSigHashType] interface.
  late TWBitcoinSigHashTypeInterface bitcoinSigHashType;

  /// [TWCoinType] interface.
  late TWCoinTypeInterface coinType;

  /// [TWData] interface.
  late TWDataInterface data;

  /// [TWHash] interface.
  late TWHashInterface hash;

  /// [TWHDVersion] interface.
  late TWHDVersionInterface hdVersion;

  /// [TWHRP] interface.
  late TWHRPInterface hrp;

  /// [TWPrivateKey] interface.
  late TWPrivateKeyInterface privateKey;

  /// [TWPublicKey] interface.
  late TWPublicKeyInterface publicKey;

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

/// [TWBitcoinSigHashType] interface.
TWBitcoinSigHashTypeInterface get _bitcoinSigHashTypeImpl =>
    WalletCoreBindingsInterface.instance.bitcoinSigHashType;

/// [TWCoinType] interface.
TWCoinTypeInterface get _coinTypeImpl =>
    WalletCoreBindingsInterface.instance.coinType;

/// [TWData] interface.
TWDataInterface get _dataImpl => WalletCoreBindingsInterface.instance.data;

/// [TWHash] interface.
TWHashInterface get _hashImpl => WalletCoreBindingsInterface.instance.hash;

/// [TWHDVersion] interface.
TWHDVersionInterface get _hdVersionImpl =>
    WalletCoreBindingsInterface.instance.hdVersion;

/// [TWHRP] interface.
TWHRPInterface get _hrpImpl => WalletCoreBindingsInterface.instance.hrp;

/// [TWPrivateKey] interface.
TWPrivateKeyInterface get _privateKeyImpl =>
    WalletCoreBindingsInterface.instance.privateKey;

/// [TWPublicKey] interface.
TWPublicKeyInterface get _publicKeyImpl =>
    WalletCoreBindingsInterface.instance.publicKey;

/// [TWString] interface.
TWStringInterface get _stringImpl =>
    WalletCoreBindingsInterface.instance.string;
