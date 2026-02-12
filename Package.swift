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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.9/DigitalOnboardingSDK-iOS-0.0.9.xcframework.zip",
            checksum: "c30ef0264f422b3ebe51aaaf2eedbf37708ca54b35e38b5074e1a093c719bba9"
        )
    ]
)
