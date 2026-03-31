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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.78/DIVEsignSDK-0.0.78.xcframework.zip",
            checksum: "c4aa1cb2742fad825316cbb99041e88a262c961f10fce6f33f178b37268c8844"
        )
    ]
)
