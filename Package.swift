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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.31/DIVEsignSDK-0.0.31.xcframework.zip",
            checksum: "dbe7ba03c078a0e7c3c695d17117b23fb09352c25d1f1db20f6e5d650d4a49f7"
        )
    ]
)
