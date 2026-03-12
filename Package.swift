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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.50/DIVEsignSDK-0.0.50.xcframework.zip",
            checksum: "00b879dcca37a2b2553b795a9c9935c1bcaa7ec247b7ca948ced7651ad4a92d2"
        )
    ]
)
