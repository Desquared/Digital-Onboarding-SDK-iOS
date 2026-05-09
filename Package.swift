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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.93/DIVEsignSDK-0.0.93.xcframework.zip",
            checksum: "738b39639d355c5f92e0d5de78e42f489c410ba4e2c9ea47db42c09f16edbec0"
        )
    ]
)
