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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.2/WalletCore.xcframework.zip",
            checksum: "4be14123975d3523b58aaa57e1370e482728c4147bab9a58428bbedcd59f1756"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.2/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "24b3cd4a0eecbe5ac69f448a6e64f1886aaa61c3c20c164f6a721c29ea02aa2e"
        )
    ]
)
