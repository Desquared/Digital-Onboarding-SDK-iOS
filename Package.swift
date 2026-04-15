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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.86/DIVEsignSDK-0.0.86.xcframework.zip",
            checksum: "0d6f7220b03d4fa02b631de40e7028e28aaf4fae96d660656b9de08d537bf416"
        )
    ]
)
