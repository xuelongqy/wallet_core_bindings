# wallet_core_bindings_wasm_assets

Wasm file built by wallet core, used with [wallet_core_bindings_wasm](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_wasm).

## Packages
|             Package              |                                                                Pub                                                                 |
|:--------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------:|
|       wallet_core_bindings       |             [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings)             |
|   wallet_core_bindings_native    |      [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_native)](https://pub.dev/packages/wallet_core_bindings_native)      |
|    wallet_core_bindings_wasm     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm)](https://pub.dev/packages/wallet_core_bindings_wasm)        |
|    wallet_core_bindings_libs     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_libs)](https://pub.dev/packages/wallet_core_bindings_libs)        |
| wallet_core_bindings_wasm_assets | [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm_assets)](https://pub.dev/packages/wallet_core_bindings_wasm_assets) |

## Building
Different from the official Wasm of wallet core, we modified it to support universal wasi and run on all platforms.
* Modified repository [xuelongqy/wallet-core](https://github.com/xuelongqy/wallet-core/tree/STANDALONE_WASM).
* Build documentation, see [wasm-building](https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building#wasm-building).

## Getting Started
```yaml
dependencies:
  wasm_run_flutter: version
  wallet_core_bindings: version
  wallet_core_bindings_wasm: version
  wallet_core_bindings_wasm_assets: version
```
```dart
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings_wasm/wallet_core_bindings_wasm.dart';
import 'package:wasm_run_flutter/wasm_run_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WasmRunLibrary.setUp(override: false);
  await WalletCoreBindingsWasmImpl().initialize();
  runApp(const MyApp());
}
```

## Usage
For comprehensive documentation, see [package repository](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings).
