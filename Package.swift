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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.77/DIVEsignSDK-0.0.77.xcframework.zip",
            checksum: "bf79cedd451e152f3bd9d05b4e9d3cd313d482d001c559f0d8413c16854a1fd5"
        )
    ]
)
