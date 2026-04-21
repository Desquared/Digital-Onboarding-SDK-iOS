// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DIVEsignSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DIVEsignSDK",
            targets: ["DIVEsignSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DIVEsignSDK",
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.89/DIVEsignSDK-0.0.89.xcframework.zip",
            checksum: "7c41ba2f5d3d135f07e70f20265659c1572c28c1fbaec0ea0ac0a31c543a4f99"
        )
    ]
)
