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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.18/DIVEsignSDK-0.0.18.xcframework.zip",
            checksum: "95877c83f6b9212b95071e8453cdacb1e05d4300894df6b5cad51b88559dea79"
        )
    ]
)
