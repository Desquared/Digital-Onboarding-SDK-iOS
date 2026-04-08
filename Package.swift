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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.11/DIVEsignSDK-0.1.11.xcframework.zip",
            checksum: "fabfe95cf1a7a7416cc2d7e2cbd2900b109b6bf5aaff535cb8c550090bb80e1e"
        )
    ]
)
