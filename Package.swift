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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.17/DIVEsignSDK-0.1.17.xcframework.zip",
            checksum: "3eb2b9ca3239149987024eb4cec7ad510bec64336ae16e4fff288bf5543631ee"
        )
    ]
)
