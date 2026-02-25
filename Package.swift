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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.30/DIVEsignSDK-0.0.30.xcframework.zip",
            checksum: "e1771af9977e40a618aca31bb2ed7efa54449676ce04779ecad192b2abd88369"
        )
    ]
)
