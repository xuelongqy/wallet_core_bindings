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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.4/WalletCore.xcframework.zip",
            checksum: "3d70d9d988c253e13e65c6fa9947f5ed7c9e31ca55ff719d055646f11dd0287a"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.4/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "387fa8e0aad9470ce50efc17d3b9e736a747ded225b9e190385ad13636a0d300"
        )
    ]
)
