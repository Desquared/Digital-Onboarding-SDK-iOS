// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DIVEsignSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DIVEsignSDK",
            targets: ["DIVEsignSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DIVEsignSDK",
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.10/DIVEsignSDK-0.0.10.xcframework.zip",
            checksum: "7b20e29896363df18923978451541c4f7e0c3352e64e3bd65fe7a80e51a927d6"
        )
    ]
)
