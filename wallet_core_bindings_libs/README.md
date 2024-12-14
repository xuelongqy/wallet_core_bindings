# wallet_core_bindings_libs

Dynamic library built by wallet core, used with [wallet_core_bindings_native](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_native).

## Packages
|             Package              |                                                          Pub                                                           |
|:--------------------------------:|:----------------------------------------------------------------------------------------------------------------------:|
|       wallet_core_bindings       |       [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings)       |
|   wallet_core_bindings_native    |   [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_native)    |
|    wallet_core_bindings_wasm     |    [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_wasm)     |
|    wallet_core_bindings_libs     |    [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_libs)     |
| wallet_core_bindings_wasm_assets | [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_wasm_assets) |

## Supported platforms
Currently supported platforms, other platforms will be added if suitable methods are found in the future.
- Android
- iOS

## Building
By default, wallet core does not expose interface methods. You need to make a small change and compile it before using it.

* Repository [wallet core](https://github.com/trustwallet/wallet-core).
* Build documentation, see [building](https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building).

Required modifications
```cmake
# File: /cmake/StandardSettings.cmake
set(CMAKE_CXX_VISIBILITY_PRESET hidden) -> set(CMAKE_CXX_VISIBILITY_PRESET default)
```

### macOS
After compiling on macOS, you get libTrustWalletCore.dylib, which does not meet the requirements for the current multi-CPU architecture. However, you can still import it into the project and run it on a device with a specified CPU architecture.

### Linux
After compiling on Linux, you get libTrustWalletCore.dylib, which does not meet the requirements for the current multi-CPU architecture. However, you can still import it into the project and run it on a device with a specified CPU architecture.

### Windows
Windows is not supported at present.

## Getting Started
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

## Usage
For comprehensive documentation, see [package repository](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings).
