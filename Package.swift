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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.42/DIVEsignSDK-0.0.42.xcframework.zip",
            checksum: "01eed49a90fe25ac42056da98b41cef3acd12ef9635c0b5e08fd95e6a800081e"
        )
    ]
)
