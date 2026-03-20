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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.66/DIVEsignSDK-0.0.66.xcframework.zip",
            checksum: "7004747c171747b22910b1af77e49a5eea93695e9b014cdb34f07cecb654a8b2"
        )
    ]
)
