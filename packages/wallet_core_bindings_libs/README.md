# wallet_core_bindings_libs

Dynamic library built by wallet core, used with [wallet_core_bindings_native](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_native).

## Packages
|             Package              |                                                                Pub                                                                 |
|:--------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------:|
|       wallet_core_bindings       |             [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings)             |
|   wallet_core_bindings_native    |      [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_native)](https://pub.dev/packages/wallet_core_bindings_native)      |
|    wallet_core_bindings_wasm     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm)](https://pub.dev/packages/wallet_core_bindings_wasm)        |
|    wallet_core_bindings_libs     |        [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_libs)](https://pub.dev/packages/wallet_core_bindings_libs)        |
| wallet_core_bindings_wasm_assets | [![Pub](https://img.shields.io/pub/v/wallet_core_bindings_wasm_assets)](https://pub.dev/packages/wallet_core_bindings_wasm_assets) |

## Supported platforms
Currently supported platforms, other platforms will be added if suitable methods are found in the future.
- Android
- iOS
- macOS
- Linux
- Windows x64

## Building
By default, wallet core does not expose interface methods. You need to make a small change and compile it before using it.

* Repository [wallet core](https://github.com/trustwallet/wallet-core).
* Build documentation, see [building](https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building).

Required modifications
```cmake
# File: /cmake/StandardSettings.cmake
set(CMAKE_CXX_VISIBILITY_PRESET hidden) -> set(CMAKE_CXX_VISIBILITY_PRESET default)
```

### iOS and macOS

Wallet Core 4.9.3 requires iOS 15 or macOS 12. This plugin supports Apple
builds through Flutter's Swift Package Manager integration only (introduced in
Flutter 3.24). Recent Flutter SDKs support the per-project configuration used
by this repository's examples:

```yaml
flutter:
  config:
    enable-swift-package-manager: true
```

Earlier Flutter SDKs with Swift Package Manager support use
`flutter config --enable-swift-package-manager` instead of this pubspec field.
The current examples are validated with Flutter 3.47.2.

Swift Package Manager downloads and verifies checksum-pinned XCFramework
archives. iOS uses the official `WalletCore` and `WalletCoreSwiftProtobuf`
frameworks; macOS uses the fork's universal `TrustWalletCore` C framework.
The pub package contains no downloaded frameworks or CocoaPods podspecs.

The library example uses Swift Package Manager without CocoaPods. The root
example also enables Swift Package Manager for this plugin; it retains a
CocoaPods fallback only for its separate `wasm_run_flutter` test dependency,
which currently has no Swift package.

The plugin registers a direct Core call so the framework is linked and loaded
before `WalletCoreBindingsNativeImpl().initialize()` uses
`DynamicLibrary.process()`. No custom library path is needed in an Apple app.

The repository's Apple host test checks all 466 public C functions, SHA-256,
Ethereum and Solana addresses, and random private-key generation through the
default native backend:

```sh
cd example
flutter test integration_test/apple_native_test.dart -d macos
# Or use the ID of an iOS simulator with -d.
```

### Windows
Requires Windows 10 / Windows Server 2016 or later on x64, with the Microsoft
Visual C++ Redistributable (x64) installed. The DLL uses the MSVC ABI and dynamic
CRT (`/MD`). Windows ARM64 is not supported.

The Flutter plugin automatically bundles `libTrustWalletCore.dll` from its
version-pinned Windows archive, together with its licenses and runtime notes.
No DLL loader configuration is needed for the packaged Flutter app.

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
