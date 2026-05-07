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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.15/DIVEsignSDK-0.1.15.xcframework.zip",
            checksum: "e29871e3b85de567c253a02751bfc5b103fe1ee1e9b96e4e660e012efb683a73"
        )
    ]
)
