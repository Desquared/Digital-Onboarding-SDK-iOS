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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.48/DIVEsignSDK-0.0.48.xcframework.zip",
            checksum: "8b9a1ce1d9b13c1781573ad761b75f7710aae09c51aeea373a0ca5b3bd56d085"
        )
    ]
)
