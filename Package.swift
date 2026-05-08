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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.16/DIVEsignSDK-0.1.16.xcframework.zip",
            checksum: "c6ff0ae6eddefc1a4e198b939d29918a75e9ca4ab51d09121e2d55461cb00802"
        )
    ]
)
