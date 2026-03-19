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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.61/DIVEsignSDK-0.0.61.xcframework.zip",
            checksum: "b00414ff42c12181a13d4e9968af5f8c7415ff073dfd8bdcdcdc73a87638e0b5"
        )
    ]
)
