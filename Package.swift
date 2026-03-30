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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.8/DIVEsignSDK-0.1.8.xcframework.zip",
            checksum: "a141ca4faed3524c15eb1cc0ead7e83ef9ef36d74b277def1a295ca79c306b34"
        )
    ]
)
