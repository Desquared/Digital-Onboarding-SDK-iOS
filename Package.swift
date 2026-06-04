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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.19/DIVEsignSDK-0.1.19.xcframework.zip",
            checksum: "1641c1cda77476ae01a68ca65d22349be38ef595eb77a9c644e4fc35d042bbcc"
        )
    ]
)
