// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "wallet_core_bindings_libs",
    platforms: [.iOS("15.0")],
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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.10.0/WalletCore.xcframework.zip",
            checksum: "edd5dc6d32ae674252c5f4f016939d325d0618afa30c278f71b47b3d93c97293"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.10.0/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "246a72cd03d4c470cc17b3e71be686e495fc40224baa3361ccfe6bae9c890f9f"
        )
    ]
)
