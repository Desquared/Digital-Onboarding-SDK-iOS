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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.56/DIVEsignSDK-0.0.56.xcframework.zip",
            checksum: "1d0d15cfe870f24f16b540cdd1ae81595fcbe66df4eb6886e09ed41288fd5a36"
        )
    ]
)
