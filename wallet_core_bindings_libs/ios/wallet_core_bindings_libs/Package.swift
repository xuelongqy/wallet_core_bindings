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
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.4.4/WalletCore.xcframework.zip",
            checksum: "ddea62ecbb0b7d36f1daa1c4c98c3ac773872537467fbbc608b52bc374ca4465"
        ),
        .binaryTarget(
            name: "WalletCoreSwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.4.4/WalletCoreSwiftProtobuf.xcframework.zip",
            checksum: "b88c440c2a53eec0ede98b65a11cc240d43fcda99873ab1eff82f5659438f8bd"
        )
    ]
)
