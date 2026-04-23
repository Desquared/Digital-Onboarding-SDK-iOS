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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.92/DIVEsignSDK-0.0.92.xcframework.zip",
            checksum: "d86f1c413d5a86a93f200e6adf142b1e5c30ae3dffa56a718b82656ba05da607"
        )
    ]
)
