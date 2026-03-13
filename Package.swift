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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.51/DIVEsignSDK-0.0.51.xcframework.zip",
            checksum: "b3732b16249caf20752fd7c8281c737d42c5f686cf9ed9b6c6be7b94609c9c0d"
        )
    ]
)
