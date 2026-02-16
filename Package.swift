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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.17/DIVEsignSDK-0.0.17.xcframework.zip",
            checksum: "814bbe115f6d847c9e747c59d9763805ac5015477747c570eb5c1bd2fb2337f4"
        )
    ]
)
