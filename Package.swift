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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.14/DIVEsignSDK-0.0.14.xcframework.zip",
            checksum: "1e32e5a717b2051bfb238fe6ebb3390d0b13f65963c1d70ad59772b8412669ef"
        )
    ]
)
