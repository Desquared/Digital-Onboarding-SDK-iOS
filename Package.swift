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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.67/DIVEsignSDK-0.0.67.xcframework.zip",
            checksum: "fd850b0a418d99d67a2bd323007f9d0a00512f48a374b0a5d0e176094f6befed"
        )
    ]
)
