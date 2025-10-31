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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.21/WalletCore.xcframework.zip",
            checksum: "1bb1e703f84fe8985d6f4ea2e2295ede0e9133df351ca1a99de0217b7d424733"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.21/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "fe691601df61bde69bda5f4997099e983ce2624074240c995e968afda9b6bf8c"
        )
    ]
)
