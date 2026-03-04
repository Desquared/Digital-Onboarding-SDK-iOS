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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.35/DIVEsignSDK-0.0.35.xcframework.zip",
            checksum: "d3eb553de5dcbf511301ed1f6d8d18a10c25a4762a2983a26f1f726c96be37a4"
        )
    ]
)
