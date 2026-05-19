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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.96/DIVEsignSDK-0.0.96.xcframework.zip",
            checksum: "a28c05e81b13764c9838b72d8f751cd679f1180a41f40addfcaef5944acd260e"
        )
    ]
)
