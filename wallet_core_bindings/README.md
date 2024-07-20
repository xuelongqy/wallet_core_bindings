# wallet_core_bindings
Dart bindings for [Trust Wallet Core](https://github.com/trustwallet/wallet-core), used in Flutter and Dart.

## Features

- TrustWalletCore include files and Protobuf file bindings.
- Provides Native and WebAssembly System Interface, supporting all platforms.
- APIs are repackaged for easier use.
- Combined with Dart GC, there is no need to control memory.
- Update the TrustWalletCore version synchronously and keep the APIs consistent.

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
