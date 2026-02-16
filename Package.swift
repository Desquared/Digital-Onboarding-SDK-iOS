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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/v0.0.16/DIVEsignSDK-0.0.16.xcframework.zip",
            checksum: "129e6d1f3a8e4ca1b4cb53549107344687f587f23ea3314927e223fdd5c4973d"
        )
    ]
)
