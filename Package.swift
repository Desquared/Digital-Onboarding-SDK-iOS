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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.20/DIVEsignSDK-0.0.20.xcframework.zip",
            checksum: "2455ecb03dc812fdb0f4fb4637fc8dfb803d17af7299abc238e2fc54bf0eea6d"
        )
    ]
)
