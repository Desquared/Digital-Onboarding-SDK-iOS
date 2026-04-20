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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.87/DIVEsignSDK-0.0.87.xcframework.zip",
            checksum: "afe42e3054ce1eac58caed1e6c79b5bc72bd7693f1c535484f27a07d20ff085a"
        )
    ]
)
