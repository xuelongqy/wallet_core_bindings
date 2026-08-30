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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.0/WalletCore.xcframework.zip",
            checksum: "0c79df1a901a3abfbccee5052229984b1e743696483176b3cfb68eaf90f400bc"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.0/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "6098237d99dc609cc1ee5a8fe9c9cf0b90fb06ae739f42a51e3dbdbb1f18ec37"
        )
    ]
)
