import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings_libs/wallet_core_bindings_libs.dart';
import 'package:wallet_core_bindings_libs/wallet_core_bindings_libs_platform_interface.dart';
import 'package:wallet_core_bindings_libs/wallet_core_bindings_libs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWalletCoreBindingsLibsPlatform
    with MockPlatformInterfaceMixin
    implements WalletCoreBindingsLibsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WalletCoreBindingsLibsPlatform initialPlatform =
      WalletCoreBindingsLibsPlatform.instance;

  test('$MethodChannelWalletCoreBindingsLibs is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelWalletCoreBindingsLibs>());
  });

  test('getPlatformVersion', () async {
    WalletCoreBindingsLibs walletCoreBindingsLibsPlugin =
        WalletCoreBindingsLibs();
    MockWalletCoreBindingsLibsPlatform fakePlatform =
        MockWalletCoreBindingsLibsPlatform();
    WalletCoreBindingsLibsPlatform.instance = fakePlatform;

    expect(await walletCoreBindingsLibsPlugin.getPlatformVersion(), '42');
  });
}
