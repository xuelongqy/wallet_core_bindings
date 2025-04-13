// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "WalletCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WalletCore", targets: ["WalletCore"]),
        .library(name: "WalletCoreSwiftProtobuf", targets: ["WalletCoreSwiftProtobuf"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "WalletCore",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.0/WalletCore.xcframework.zip",
            checksum: "2b704cf5ba6717c1722cae3aa81eb13067c30eb456f53d980089dc9e43cca169"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.0/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "66158b3b2a22d7a6a08de25ad62bdff9c5c010adcc996c50028386dca38a0863"
        )
    ]
)
