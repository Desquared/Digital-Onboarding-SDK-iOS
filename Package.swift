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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.58/DIVEsignSDK-0.0.58.xcframework.zip",
            checksum: "1a3e60539a6f931930da874618e89a67d8952fedfb3110e3f5ab60ca4c72de9a"
        )
    ]
)
