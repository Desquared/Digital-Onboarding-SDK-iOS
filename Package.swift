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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.39/DIVEsignSDK-0.0.39.xcframework.zip",
            checksum: "ed59dd71b05af9bcaf870472fbae7906385e4b3d48d77bb8b59fa65db80f2d24"
        )
    ]
)
