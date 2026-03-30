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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.75/DIVEsignSDK-0.0.75.xcframework.zip",
            checksum: "5ce0ef30592f38e0350fac875fbe8b91046b5331e5aa9e6ff6a0412275c12300"
        )
    ]
)
