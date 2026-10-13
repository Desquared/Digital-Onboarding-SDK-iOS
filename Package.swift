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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.21/DIVEsignSDK-0.1.21.xcframework.zip",
            checksum: "e7aaea2c4d072c5a666924bb8872830d61d74427accf6bbc35c4c932312d61c7"
        )
    ]
)
