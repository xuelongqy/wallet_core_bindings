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
            url: "https://github.com/xuelongqy/wallet-core/releases/download/4.9.3/TrustWalletCore-macos.xcframework.zip",
            checksum: "3da40c8a83a4f0ffd63a09c683c06facb232216d0623cb7f2dae4c6adc63da06"
        )
    ]
)
