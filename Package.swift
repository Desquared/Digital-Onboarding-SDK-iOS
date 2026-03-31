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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.9/DIVEsignSDK-0.1.9.xcframework.zip",
            checksum: "26644b13d80a046b9f64f6beaeeb0e7436f9fa46d55e9fd504e5dd4f594d32b4"
        )
    ]
)
