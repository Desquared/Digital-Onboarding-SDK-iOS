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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.95/DIVEsignSDK-0.0.95.xcframework.zip",
            checksum: "fee24dbfea06eb14397a952bc4a23a6496d6b224e1fcdfdf6dbb3f71c735f90b"
        )
    ]
)
