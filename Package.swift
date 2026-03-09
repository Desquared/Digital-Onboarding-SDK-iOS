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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.44/DIVEsignSDK-0.0.44.xcframework.zip",
            checksum: "6c0dc4ab1f0c721f1fae61e4e6aa621940243e0a73dc0e12bbe7eaca00f3d52f"
        )
    ]
)
