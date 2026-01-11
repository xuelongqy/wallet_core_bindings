# wallet_core_bindings_wasm
[![License](https://img.shields.io/badge/license-AGPLv3-blue)](https://pub.dev/packages/wallet_core_bindings)

WebAssembly System Interface implementation of wallet_core_bindings.

## Packages
|             Package              |                                                                Pub                                                                 |
|:--------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------:|
|       wallet_core_bindings       |             [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings)             |
|   wallet_core_bindings_native    |      [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_native)](https://pub.dev/packages/wallet_core_bindings_native)      |
|    wallet_core_bindings_wasm     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm)](https://pub.dev/packages/wallet_core_bindings_wasm)        |
|    wallet_core_bindings_libs     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_libs)](https://pub.dev/packages/wallet_core_bindings_libs)        |
| wallet_core_bindings_wasm_assets | [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm_assets)](https://pub.dev/packages/wallet_core_bindings_wasm_assets) |
## Getting Started
Usually, it needs to be used with [wallet_core_bindings_wasm_assets](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_wasm_assets).

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

If you want to modify wallet_core, see [wallet_core_bindings_wasm_assets](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_wasm_assets).

```yaml
dependencies:
  wasm_run_flutter: version
  wallet_core_bindings: version
  wallet_core_bindings_wasm: version
```
```dart
import 'package:flutter/services.dart';
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings_wasm/wallet_core_bindings_wasm.dart';
import 'package:wasm_run_flutter/wasm_run_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WasmRunLibrary.setUp(override: false);
  final wasmBytes = (await rootBundle.load('.../wallet-core.wasm')).buffer.asUint8List();
  await WalletCoreBindingsWasmImpl(wasmBytes).initialize();
  runApp(const MyApp());
}
```

## Usage
For comprehensive documentation, see [package repository](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings).

## License

### Commercial license
If you want to use wallet_core_bindings in your commercial app, website or plugin, you need to obtain a commercial license from the author. Please contact [xuelongqy@qq.com](mailto:xuelongqy@qq.com) for more information.Once you obtain the license, your authorization information will appear in the [AUTHORIZED.md](https://github.com/xuelongqy/wallet_core_bindings/blob/main/AUTHORIZED.md).

### Open-source license
[GNU AGPLv3](https://github.com/xuelongqy/wallet_core_bindings/blob/main/LICENSE)
