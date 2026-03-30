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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.76/DIVEsignSDK-0.0.76.xcframework.zip",
            checksum: "e344a4b989628e2efcdc6eae0dfd471c822a3ce7a5966ea8d726e4f627942f1a"
        )
    ]
)
