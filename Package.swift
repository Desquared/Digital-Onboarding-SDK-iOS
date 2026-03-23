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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.5/DIVEsignSDK-0.1.5.xcframework.zip",
            checksum: "771c16cea5ed8ed052ce106e77cf16a92599184fcbb503797439fc1500940e18"
        )
    ]
)
