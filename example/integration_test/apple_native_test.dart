import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings_native/wallet_core_bindings_native.dart';

import 'wallet_core_public_symbols.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Apple host loads the complete Wallet Core C ABI',
      (tester) async {
    expect(Platform.isIOS || Platform.isMacOS, isTrue);
    final process = DynamicLibrary.process();
    final missing = walletCorePublicSymbols
        .where((name) => !process.providesSymbol(name))
        .toList();
    expect(missing, isEmpty,
        reason: 'Core must be linked into the Flutter host');

    // Exercise the production default loader without an injected library.
    await WalletCoreBindingsNativeImpl().initialize();
    final digest = TWHash.sha256(Uint8List.fromList(utf8.encode('abc')));
    expect(
      TWString.createWithHexBytes(digest).value,
      'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',
    );

    final ethereumKey = TWPrivateKey.createWithHexString(
      'afeefca74d9a325cf1d6b6911d61a65c32afa8e02bd5e78e2e4ac2910bab45f5',
    );
    expect(
      TWAnyAddress.createWithPublicKey(
        ethereumKey.getPublicKey(TWCoinType.Ethereum),
        TWCoinType.Ethereum,
      ).description,
      '0xAc1ec44E4f0ca7D172B7803f6836De87Fb72b309',
    );
    expect(
      TWAnyAddress.createWithPublicKey(
        TWPublicKey.createWithHexString(
          '18f9d8d877393bbbe8d697a8a2e52879cc7e84f467656d1cce6bab5a8d2637ec',
          TWPublicKeyType.ED25519,
        ),
        TWCoinType.Solana,
      ).description,
      '2gVkYWexTHR5Hb2aLeQN3tnngvWzisFKXDUPrgMHpdST',
    );

    final first = TWPrivateKey().data;
    final second = TWPrivateKey().data;
    expect(first, hasLength(32));
    expect(TWPrivateKey.isValid(first, TWCurve.SECP256k1), isTrue);
    expect(first, isNot(orderedEquals(second)));
    // This line is also retained in Flutter's device logs as runtime evidence.
    // ignore: avoid_print
    print('Wallet Core process: ${walletCorePublicSymbols.length} symbols, '
        'SHA256, Ethereum/Solana addresses and RNG passed');
  });
}
