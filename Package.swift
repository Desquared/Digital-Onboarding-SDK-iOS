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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.21/DIVEsignSDK-0.0.21.xcframework.zip",
            checksum: "a45118e472d351f29b53e22b10e736bd739208f25038d55fa1bec39219d54f99"
        )
    ]
)
