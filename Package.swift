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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.88/DIVEsignSDK-0.0.88.xcframework.zip",
            checksum: "a1cab581e605a16bee09be33667e85742fb1f403720fcd0639891d1887cd5789"
        )
    ]
)
