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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.13/DIVEsignSDK-0.1.13.xcframework.zip",
            checksum: "d101377f891c6a152a741574acfc35f3c6eea0ca55fc101c56fc498dd00eeff1"
        )
    ]
)
