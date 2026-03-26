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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.7/DIVEsignSDK-0.1.7.xcframework.zip",
            checksum: "b5d3a1180bf167a2cf626bdcd5c614947ebf2f2a5391a2ae59f3295e41bf0758"
        )
    ]
)
