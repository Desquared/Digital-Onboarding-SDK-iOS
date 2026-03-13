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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.53/DIVEsignSDK-0.0.53.xcframework.zip",
            checksum: "ad2af0ef445e35b5f87a40797712dc214ca895175c2be7fde00927c7b5915e9c"
        )
    ]
)
