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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.4/DIVEsignSDK-0.1.4.xcframework.zip",
            checksum: "5eb8d48dd0d3af6e74a6bcac0232c0e72e80b7a1c7ee15d6fa600b8a0dc1b7a3"
        )
    ]
)
