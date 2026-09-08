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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.1/WalletCore.xcframework.zip",
            checksum: "872fa3c67460897d2a2685a73677140db4291e872df527d21c147d9cf297b645"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.8.1/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "ba60483570abe0579df97348aaf528d1dfd2d5bdc07a8d8e0e352313b0e413c8"
        )
    ]
)
