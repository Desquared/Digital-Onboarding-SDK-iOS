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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.54/DIVEsignSDK-0.0.54.xcframework.zip",
            checksum: "a9b46140839378af801c78d5468d833260b993865634fd1696aa7e9d8f1b5d75"
        )
    ]
)
