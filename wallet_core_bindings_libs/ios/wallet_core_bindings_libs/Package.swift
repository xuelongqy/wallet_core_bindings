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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.9/WalletCore.xcframework.zip",
            checksum: "792b3c2f98c72f173828e5b769085e294de5bf7ee4b7dc40852b554a1732ffac"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.9/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "2cd5343ed1ef9d604fd8e75583384578bf31c06ca913f822e6ac60f0968db334"
        )
    ]
)
