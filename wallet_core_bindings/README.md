# wallet_core_bindings
[![License](https://img.shields.io/badge/license-AGPLv3-blue)](https://pub.dev/packages/wallet_core_bindings)

Dart bindings for [Trust Wallet Core](https://github.com/trustwallet/wallet-core), used in Flutter and Dart.

## Packages
|             Package              |                                                          Pub                                                           |
|:--------------------------------:|:----------------------------------------------------------------------------------------------------------------------:|
|       wallet_core_bindings       |       [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings)       |
|   wallet_core_bindings_native    |   [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_native)    |
|    wallet_core_bindings_wasm     |    [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_wasm)     |
|    wallet_core_bindings_libs     |    [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_libs)     |
| wallet_core_bindings_wasm_assets | [![Pub](https://img.shields.io/pub/v/wallet_core_bindings)](https://pub.dev/packages/wallet_core_bindings_wasm_assets) |

## Features

- TrustWalletCore include files and Protobuf file bindings.
- Provides Native and WebAssembly System Interface, supporting all platforms.
- APIs are repackaged for easier use.
- Combined with Dart GC, there is no need to control memory.
- Update the TrustWalletCore version synchronously and keep the APIs consistent.

## Getting Started
There are two ways to use wallet_core_bindings, Native and Web Assembly. Please follow the instructions below to make your choice.

| Platform | Native | Web Assembly | wallet_core_bindings_libs |
|:--------:|:------:|:------------:|:-------------------------:|
| Android  |   ✔️   |      ✔️      |            ✔️             |
|   iOS    |   ✔️   |      ✔️      |            ✔️             |
|  macOS   |   ✔️   |      ✔️      |            ✔️             |
|  Linux   |   ✔️   |      ✔️      |            ❌️             |
| Windows  |   ❌️   |      ✔️      |            ❌️             |
|   Web    |   ❌️   |      ✔️      |            ❌️             |

### Native
The native features of the platform rely on the dynamic library compiled by [Wallet Core](https://github.com/trustwallet/wallet-core), Binding with [dart:ffi](https://dart.dev/interop/c-interop).
* wallet_core_bindings_libs contains native dynamic libraries. Currently, only Android and iOS are supported. Due to the diversity of CPU architectures, Linux and macOS can be compiled and added to the project by themselves. It is possible that subsequent versions will find suitable ways to support them. Windows is not supported at present.
* For more information, see [wallet_core_bindings_libs](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings_libs).
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
### Web Assembly
Build WalletCore for WASM，Binding with [WASI](https://github.com/WebAssembly/WASI) [wasi_snapshot_preview1](https://github.com/WebAssembly/WASI/blob/main/legacy/preview1/docs.md) and [wasm_run](https://github.com/juancastillo0/wasm_run).
* It is suitable for use on platforms that do not support native, such as Web and Windows. However, wasm itself has strong cross-platform features and is not limited to these two platforms.
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
* [API reference](https://pub.dev/documentation/wallet_core_bindings/latest/wallet_core_bindings/)

wallet_core_bindings provides the complete test cases, you can find usage here. See [tests](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings/example/test). 

## Generate

### Protobuf
Refer to the TrustWalletCore build [documentation](https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building) and complete the steps to generate files. Extract proto files in src/proto and use [protoc_plugin](https://pub.dev/packages/protoc_plugin) to compile them into Dart code.

```shell
cd ../proto/TrustWalletCore/
protoc --dart_out=../../wallet_core_bindings/lib/proto/ ./*
```

## License

### Commercial license
If you want to use wallet_core_bindings in your commercial app, website or plugin, you need to obtain a commercial license from the author. Please contact [xuelongqy@qq.com](mailto:xuelongqy@qq.com) for more information.Once you obtain the license, your authorization information will appear in the [AUTHORIZED.md](https://github.com/xuelongqy/wallet_core_bindings/blob/main/AUTHORIZED.md).

### Open-source license
[GNU AGPLv3](https://github.com/xuelongqy/wallet_core_bindings/blob/main/LICENSE)
