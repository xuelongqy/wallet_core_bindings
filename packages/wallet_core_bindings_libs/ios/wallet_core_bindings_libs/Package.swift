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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.5.0/WalletCore.xcframework.zip",
            checksum: "2eb9e73be3d90c1317663cc8bca2d8eeff6156fccbc5a8c6672c7534236b332c"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.5.0/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "5fb57b01ef018d9c5d25411a4e8e067d10ad69f6caad3321e1acced2bb08f3fd"
        )
    ]
)
