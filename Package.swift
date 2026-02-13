// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DigitalOnboardingSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DigitalOnboardingSDK",
            targets: ["DigitalOnboardingSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DigitalOnboardingSDK",
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/v0.0.12/DigitalOnboardingSDK-iOS-0.0.12.xcframework.zip",
            checksum: "53c27339350edf96b71a4163e709e4b8aeb79d0412cf51da705ac6f0312a955d"
        )
    ]
)
