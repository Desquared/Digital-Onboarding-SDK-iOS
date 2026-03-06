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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.41/DIVEsignSDK-0.0.41.xcframework.zip",
            checksum: "84c84fc16e9ff35bfbc4b21f77f009c79068468bc9443ad1a1a5ee86d1cd3c50"
        )
    ]
)
