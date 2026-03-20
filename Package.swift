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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.63/DIVEsignSDK-0.0.63.xcframework.zip",
            checksum: "3d25860f30ec8f388d90b9da6d2fbb35726a57a8c20c12beb81fdf0263cb8a10"
        )
    ]
)
