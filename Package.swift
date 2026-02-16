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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.19/DIVEsignSDK-0.0.19.xcframework.zip",
            checksum: "bae347fa2821b776be65c67f7a128a1e9290475583f15ca29336777f71508cd7"
        )
    ]
)
