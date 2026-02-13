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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.13/DIVEsignSDK-0.0.13.xcframework.zip",
            checksum: "fc31e521e344f883d047ffcabe98229a162eba74c9cba9a483464a111e194363"
        )
    ]
)
