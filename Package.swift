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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.36/DIVEsignSDK-0.0.36.xcframework.zip",
            checksum: "aa886ab3613b16f5bc61fdf63167c3a37f43ebed728829697ad9aa1888dc6d32"
        )
    ]
)
