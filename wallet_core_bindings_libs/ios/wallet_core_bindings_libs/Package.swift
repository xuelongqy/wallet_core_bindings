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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.19/WalletCore.xcframework.zip",
            checksum: "194ff068e9df4d6f7b9d52c98eab01f2add7993db92ccab30e6b04718d91317b"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.19/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "f3ceb0925cfe43af610a0b84d9d71c9ee8cd1c7e9d9fe0cf867ab044aa9f57a4"
        )
    ]
)
