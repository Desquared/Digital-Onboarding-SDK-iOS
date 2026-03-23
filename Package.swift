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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.68/DIVEsignSDK-0.0.68.xcframework.zip",
            checksum: "370aa6e9bb6416c1fc5f38060975755ff5d489a0fc0071e70f955f8ec94f4b3b"
        )
    ]
)
