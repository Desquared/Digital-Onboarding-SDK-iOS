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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.55/DIVEsignSDK-0.0.55.xcframework.zip",
            checksum: "5e15c3ef3d53513d910dc9285a3a7f064d211b82859dfa2fe917cd81cd529fdc"
        )
    ]
)
