// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "wallet_core_bindings_libs",
    platforms: [.macOS("12.0")],
    products: [
        .library(name: "wallet-core-bindings-libs", targets: ["wallet_core_bindings_libs"])
    ],
    dependencies: [],
    targets: [
        .target(name: "wallet_core_bindings_libs", dependencies: ["TrustWalletCore"]),
        .binaryTarget(
            name: "TrustWalletCore",
            url: "https://github.com/xuelongqy/wallet-core/releases/download/4.10.0/TrustWalletCore-macos.xcframework.zip",
            checksum: "6f532d9d073b86c0807156308a20109ed399c1ef2e986751676706027b41b12b"
        )
    ]
)
