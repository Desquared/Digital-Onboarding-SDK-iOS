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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.62/DIVEsignSDK-0.0.62.xcframework.zip",
            checksum: "80e2259fda96f07e36206095e50e16b7d1d16a52776784722dcad30099cf850d"
        )
    ]
)
