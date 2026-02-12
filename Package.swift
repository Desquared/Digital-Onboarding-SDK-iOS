// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DIVEsignSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DIVEsignSDK",
            targets: ["DIVEsignSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DIVEsignSDK",
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/v0.0.11/DIVEsignSDK-0.0.11.xcframework.zip",
            checksum: "4a5ea417615608250e24580384833ce28599bc60b4cd96e5d7944a5693280ceb"
        )
    ]
)
