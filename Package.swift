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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.91/DIVEsignSDK-0.0.91.xcframework.zip",
            checksum: "3af6a40c9f770727f01fd22127bc01a04e4cad44986ac1a29125e57d9cd4729c"
        )
    ]
)
