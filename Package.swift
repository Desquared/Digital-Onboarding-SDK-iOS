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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.14/DIVEsignSDK-0.1.14.xcframework.zip",
            checksum: "1361234fbeaa192d22ba749ddf8c118237618bda89557505baabfa62db0a62f8"
        )
    ]
)
