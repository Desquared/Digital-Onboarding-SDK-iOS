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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.7/DigitalOnboardingSDK-iOS-0.0.7.xcframework.zip",
            checksum: "853294db9f14e4c175a0212ea08fc44ac2ad0f0aeafb8af3e66d9df5c866f2a6"
        )
    ]
)
