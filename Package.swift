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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.81/DIVEsignSDK-0.0.81.xcframework.zip",
            checksum: "475f5658379ac3b21538140ca0f6626bbd5fff2f734acae3bbff37402e7d8ac6"
        )
    ]
)
