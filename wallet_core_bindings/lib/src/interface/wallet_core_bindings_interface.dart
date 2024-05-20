part of '../../wallet_core_bindings.dart';

abstract class WalletCoreBindingsInterface {
  late TWDataInterface data;
  late TWStringInterface string;

  static WalletCoreBindingsInterface? _instance;

  static WalletCoreBindingsInterface get instance {
    assert(_instance != null, 'Please initialize the instance.');
    return _instance!;
  }

  static set instance(WalletCoreBindingsInterface instance) {
    _instance = instance;
  }

  Future initialize();
}

TWDataInterface get _dataImpl => WalletCoreBindingsInterface.instance.data;
TWStringInterface get _stringImpl =>
    WalletCoreBindingsInterface.instance.string;
