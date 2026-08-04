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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.6.0/WalletCore.xcframework.zip",
            checksum: "689935aff413004b18c7b32ee955716868ebcd38328c5159c69f0d5f5bcfddf0"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.6.0/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "719b1ebc7ad174017e399cdd7fc60372b369d9712d646ebb8b4e264c4881d1d8"
        )
    ]
)
