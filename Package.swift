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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.32/DIVEsignSDK-0.0.32.xcframework.zip",
            checksum: "254beeada7893f7007e2b798da3d6aa25fb75a7eb603b26f74ec99c3c12816ff"
        )
    ]
)
