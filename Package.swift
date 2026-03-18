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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.59/DIVEsignSDK-0.0.59.xcframework.zip",
            checksum: "3d58e6ceccf4b9b13bad9c4613027c353021b696f1035291a9e7d7bcde9970de"
        )
    ]
)
