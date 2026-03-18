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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.60/DIVEsignSDK-0.0.60.xcframework.zip",
            checksum: "da0b9c69e1f33566fadcb4f115aef2fe78507ba8b2d561122d44977ba3d9f996"
        )
    ]
)
