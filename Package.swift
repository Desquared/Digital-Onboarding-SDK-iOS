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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.25/DIVEsignSDK-0.0.25.xcframework.zip",
            checksum: "60ef39e39fd9892fbec201b8055d0f8bc244a03b92f4db1efdccf627feaf8cd3"
        )
    ]
)
