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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.49/DIVEsignSDK-0.0.49.xcframework.zip",
            checksum: "edfd4874e4e87d61dd8c792a6851ec2c89187dd9a5ad6b154bc52240325d32f1"
        )
    ]
)
