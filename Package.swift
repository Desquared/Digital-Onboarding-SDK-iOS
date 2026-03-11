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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.47/DIVEsignSDK-0.0.47.xcframework.zip",
            checksum: "cfc149f10a270e9070bf17faf0008af31eb1db40416c1416ceddb9c65f4a7e35"
        )
    ]
)
