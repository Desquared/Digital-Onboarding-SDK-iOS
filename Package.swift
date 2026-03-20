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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.1/DIVEsignSDK-0.1.1.xcframework.zip",
            checksum: "38c69c1104706ea736df21937d4c04fc703e96a4d5de52f1886683206316dd79"
        )
    ]
)
