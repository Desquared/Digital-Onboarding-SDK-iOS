// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DIVEsignSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DIVEsignSDK",
            targets: ["DIVEsignSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DIVEsignSDK",
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.5/DIVEsignSDK.xcframework.zip",
            checksum: "48b5971de7fe525d6f3f0a6df51749cb10806ba658e48fd2507c91cf8d44a0ca"
        )
    ]
)
