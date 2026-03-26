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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.69/DIVEsignSDK-0.0.69.xcframework.zip",
            checksum: "add4fcf7e70607467b61c3edcc1089ce8682cfa05da91d3f6f674d9d31a059a1"
        )
    ]
)
