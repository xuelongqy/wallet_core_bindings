import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_core_bindings_libs/wallet_core_bindings_libs_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWalletCoreBindingsLibs platform = MethodChannelWalletCoreBindingsLibs();
  const MethodChannel channel = MethodChannel('wallet_core_bindings_libs');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
