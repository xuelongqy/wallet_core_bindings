// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "WalletCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WalletCore", targets: ["WalletCore"]),
        .library(name: "SwiftProtobuf", targets: ["SwiftProtobuf"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "WalletCore",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.2.11/WalletCore.xcframework.zip",
            checksum: "fed6169a57bdaabf9144c0b985ed20153538d7df538ddce361f124a47f4f9a00"
        ),
        .binaryTarget(
            name: "SwiftProtobuf",
            url: "https://github.com/trustwallet/wallet-core/releases/download/4.2.11/SwiftProtobuf.xcframework.zip",
            checksum: "773fe27a55c6076c120e024d0db45250a4117290ecd6d8ea8236fe62de997480"
        )
    ]
)
