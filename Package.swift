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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.20/DIVEsignSDK-0.1.20.xcframework.zip",
            checksum: "f95283479174b223a23a2c50ee176862cc754b8d8c64bda427a06bfe3d054ef6"
        )
    ]
)
