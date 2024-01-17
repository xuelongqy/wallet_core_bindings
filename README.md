<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Generate

We need to extract the files from [wallet-core](https://dart.dev/guides/libraries/create-library-packages) and generate the corresponding Dart code so that Dart can communicate with TrustWalletCore.

### C Bindings

Extract header files in include/TrustWalletCore and generate Dart bindings code.

```shell
dart run ffigen
```

### Protobuf
Refer to the TrustWalletCore build [documentation](https://developer.trustwallet.com/developer/wallet-core/developing-the-library/building) and complete the steps to generate files. Extract proto files in src/proto and use [protoc_plugin](https://pub.dev/packages/protoc_plugin) to compile them into Dart code.

```shell
cd ./proto
protoc --dart_out=../../lib/src/proto/ ./*
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
