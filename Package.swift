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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.79/DIVEsignSDK-0.0.79.xcframework.zip",
            checksum: "4f68528022aa86892dd0bcbdf751cafabbccb4bfff90d585040c0f2825e6333c"
        )
    ]
)
