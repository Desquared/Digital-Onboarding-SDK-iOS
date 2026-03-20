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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.2/DIVEsignSDK-0.1.2.xcframework.zip",
            checksum: "3993d076d8fd9808e1808824967d5cdb803865f62214dd48a4620c8c99a90765"
        )
    ]
)
