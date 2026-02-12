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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.8/DigitalOnboardingSDK-iOS-0.0.8.xcframework.zip",
            checksum: "07e458cc1d069aaf76cbe65657e443ad6bc2c17077d9cce289d2fc89e2948ffb"
        )
    ]
)
