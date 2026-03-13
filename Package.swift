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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.52/DIVEsignSDK-0.0.52.xcframework.zip",
            checksum: "ce1e11faa15768a5cd8f552e1d02aaeded5e78059b75292ccfe3471076e77162"
        )
    ]
)
