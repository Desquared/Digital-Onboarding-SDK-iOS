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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.84/DIVEsignSDK-0.0.84.xcframework.zip",
            checksum: "169df3d2f14246c3712c20bdcaade08ee4d7d9d514ee96ed827d9064c432442e"
        )
    ]
)
