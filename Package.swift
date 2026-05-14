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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.94/DIVEsignSDK-0.0.94.xcframework.zip",
            checksum: "c8250fe82ae2c1424e73090929938f5ba7649682c79797f626e5f436a67292b5"
        )
    ]
)
