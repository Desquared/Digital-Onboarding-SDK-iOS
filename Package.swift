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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.15/DIVEsignSDK-0.0.15.xcframework.zip",
            checksum: "0ee3fc370e8b42f2a16812b6f42fec0a9df152b2252ceb73dc08e42a2cb1f2a8"
        )
    ]
)
