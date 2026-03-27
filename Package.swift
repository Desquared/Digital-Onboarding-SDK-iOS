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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.71/DIVEsignSDK-0.0.71.xcframework.zip",
            checksum: "2d016c91aa54dc3de56f57de871238425714143ffcee0bd8675ce6214e9f5811"
        )
    ]
)
