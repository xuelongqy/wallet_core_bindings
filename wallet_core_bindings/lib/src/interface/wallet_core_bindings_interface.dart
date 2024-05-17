part of '../../wallet_core_bindings.dart';

abstract class WalletCoreBindingsInterface {
  final TWStringInterface string;

  WalletCoreBindingsInterface({required this.string});

  static WalletCoreBindingsInterface? _instance;

  static WalletCoreBindingsInterface get instance {
    assert(_instance != null, 'Please initialize the instance.');
    return _instance!;
  }

  static set instance(WalletCoreBindingsInterface instance) {
    _instance = instance;
  }
}
