// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "wallet_core_bindings_libs",
    platforms: [.iOS(.v13)],
    products: [
        // If the plugin name contains "_", replace with "-" for the library name.
        .library(name: "wallet-core-bindings-libs", targets: ["wallet_core_bindings_libs"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "wallet_core_bindings_libs",
            dependencies: ["WalletCore", "WalletCoreSwiftProtobuf"]
        ),
        .binaryTarget(
            name: "WalletCore",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.2/WalletCore.xcframework.zip",
            checksum: "267b79984a303ca233eb941816db9cab3a120fdde560bac326da69ececbc7c29"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.2/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "98f3664c2c45c3414be1ee53f9141e036d58e2e9a370aa61204e37c4a0dc071a"
        )
    ]
)
