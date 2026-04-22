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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.90/DIVEsignSDK-0.0.90.xcframework.zip",
            checksum: "3aa899dc573270ff43316bb635cb1abbcb45980a662036c5e732467235c0bfd3"
        )
    ]
)
