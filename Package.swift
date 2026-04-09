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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.12/DIVEsignSDK-0.1.12.xcframework.zip",
            checksum: "75794809acf563aef0880c7dbe1b3bf747ea2c960a2e181439e0585c31ecaed4"
        )
    ]
)
