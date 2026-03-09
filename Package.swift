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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.43/DIVEsignSDK-0.0.43.xcframework.zip",
            checksum: "b78814388d9f1d6efed97313bf895322a216cbe76a509c13dc50adf01865b598"
        )
    ]
)
