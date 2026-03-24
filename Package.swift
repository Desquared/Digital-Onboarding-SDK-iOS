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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.6/DIVEsignSDK-0.1.6.xcframework.zip",
            checksum: "acc6e100a4a495e36aca383343c254ccfc3d60f58b5a34a476aebe276ba157e0"
        )
    ]
)
