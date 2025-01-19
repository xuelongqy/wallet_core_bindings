# wallet_core_bindings_native
[![License](https://img.shields.io/badge/license-AGPLv3-blue)](https://pub.dev/packages/wallet_core_bindings)

Native implementation of wallet_core_bindings.

## Packages
|             Package              |                                                                Pub                                                                 |
|:--------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------:|
|       wallet_core_bindings       |             [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings)             |
|   wallet_core_bindings_native    |      [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_native)](https://pub.dev/packages/wallet_core_bindings_native)      |
|    wallet_core_bindings_wasm     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm)](https://pub.dev/packages/wallet_core_bindings_wasm)        |
|    wallet_core_bindings_libs     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_libs)](https://pub.dev/packages/wallet_core_bindings_libs)        |
| wallet_core_bindings_wasm_assets | [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm_assets)](https://pub.dev/packages/wallet_core_bindings_wasm_assets) |

## Getting Started
Usually, it needs to be used with [wallet_core_bindings_libs](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_libs).

```yaml
dependencies:
  wallet_core_bindings: version
  wallet_core_bindings_native: version
  wallet_core_bindings_libs: version
```
```dart
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings_native/wallet_core_bindings_native.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WalletCoreBindingsNativeImpl().initialize();
  runApp(const MyApp());
}
```

wallet_core_bindings_libs currently only supports Android and iOS. If you want to support other platforms, you need to import the dynamic library of wallet core into the project. See [wallet_core_bindings_libs](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_libs).

```yaml
dependencies:
  wallet_core_bindings: version
  wallet_core_bindings_native: version
```
```dart
import 'package:wallet_core_bindings/wallet_core_bindings.dart';
import 'package:wallet_core_bindings_native/wallet_core_bindings_native.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bindings = TrustWalletCoreBindings(DynamicLibrary.open('libTrustWalletCore.dylib'));
  await WalletCoreBindingsNativeImpl(bindings).initialize();
  runApp(const MyApp());
}
```

## Usage
For comprehensive documentation, see [package repository](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings).

## Generate

### C Bindings

Extract header files in include/TrustWalletCore and generate Dart bindings code.

```shell
dart run ffigen
```

## License

### Commercial license
If you want to use wallet_core_bindings in your commercial app, website or plugin, you need to obtain a commercial license from the author. Please contact [xuelongqy@qq.com](mailto:xuelongqy@qq.com) for more information.Once you obtain the license, your authorization information will appear in the [AUTHORIZED.md](https://github.com/xuelongqy/wallet_core_bindings/blob/main/AUTHORIZED.md).

### Open-source license
[GNU AGPLv3](https://github.com/xuelongqy/wallet_core_bindings/blob/main/LICENSE)
