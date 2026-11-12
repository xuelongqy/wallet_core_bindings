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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.9.3/WalletCore.xcframework.zip",
            checksum: "3d818079cac68bdfbf30d853ff15e2281c3a126a4ca6a830a878873155700f82"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.9.3/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "90142ef3e7a1d4a257df172f507a3b766d6d9333c7fbc64af8e95fda30dd2f4a"
        )
    ]
)
