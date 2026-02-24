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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.28/DIVEsignSDK-0.0.28.xcframework.zip",
            checksum: "5188c890906c19d54d5b6d8818b017fcd1181c0b391a03e8afd3390f0052334e"
        )
    ]
)
