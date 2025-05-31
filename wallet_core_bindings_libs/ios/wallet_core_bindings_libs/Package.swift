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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.4/WalletCore.xcframework.zip",
            checksum: "fa72d75394c4b86e4e2fa16a27fc89d23b74d392a5d8320c6aeec824bc6c1b28"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.3.4/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "7ed9ae81ddbe41f2433a5391edfbfef73d15274a1ef3e0c3e59a244de4eda1bc"
        )
    ]
)
