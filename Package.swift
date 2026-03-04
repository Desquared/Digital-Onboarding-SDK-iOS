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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.34/DIVEsignSDK-0.0.34.xcframework.zip",
            checksum: "07e23e17fb1f0a2858723bd1a3fdffb686961ab9aebab0ff1084af3196e9b4b8"
        )
    ]
)
