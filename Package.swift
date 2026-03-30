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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.74/DIVEsignSDK-0.0.74.xcframework.zip",
            checksum: "bb9c14b75943f9a71701c7bc9b62594eabe65ab4f78b33e0875fe88ffd18971e"
        )
    ]
)
