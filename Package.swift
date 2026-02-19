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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.26/DIVEsignSDK-0.0.26.xcframework.zip",
            checksum: "83726816d5a326b5f688e6b28c4c2b10bd1f0de68aa02ec5382cb8ce5a5ce590"
        )
    ]
)
