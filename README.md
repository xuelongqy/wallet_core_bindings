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

## Usage
For comprehensive documentation, see [package repository](https://github.com/xuelongqy/wallet_core_bindings/tree/main/wallet_core_bindings).

## Generate

We need to extract the files from [wallet-core](https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore) and generate the corresponding Dart code so that Dart can communicate with TrustWalletCore.

### C Bindings

Extract header files in include/TrustWalletCore and generate Dart bindings code.

```shell
cd wallet_core_bindings_native
dart run ffigen
```

### Protobuf
Refer to the TrustWalletCore build [documentation](https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building) and complete the steps to generate files. Extract proto files in src/proto and use [protoc_plugin](https://pub.dev/packages/protoc_plugin) to compile them into Dart code.

```shell
cd ./proto/TrustWalletCore/
protoc --dart_out=../../wallet_core_bindings/lib/proto/ ./*
```

## License

### Commercial license
If you want to use wallet_core_bindings in your commercial app, website or plugin, you need to obtain a commercial license from the author. Please contact [xuelongqy@qq.com](mailto:xuelongqy@qq.com) for more information.Once you obtain the license, your authorization information will appear in the [AUTHORIZED.md](https://github.com/xuelongqy/wallet_core_bindings/blob/main/AUTHORIZED.md).

### Open-source license
GNU AGPLv3
