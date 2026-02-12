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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/v0.0.3/DigitalOnboardingSDK-iOS-0.0.3.xcframework.zip",
            checksum: "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
        )
    ]
)
