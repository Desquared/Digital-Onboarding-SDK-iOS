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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.70/DIVEsignSDK-0.0.70.xcframework.zip",
            checksum: "cfcff39ed7932e98fdb8e7b0eb9a5cc62f5eeb2528e4028022b93b890b60bdf8"
        )
    ]
)
