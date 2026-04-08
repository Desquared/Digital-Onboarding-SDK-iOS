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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.80/DIVEsignSDK-0.0.80.xcframework.zip",
            checksum: "823fbeda5b009b6aa67548067561d7f8966f0048cffd9a8acd0fe19768504a2f"
        )
    ]
)
