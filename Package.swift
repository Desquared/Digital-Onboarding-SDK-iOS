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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.37/DIVEsignSDK-0.0.37.xcframework.zip",
            checksum: "8744a44f9f3adf762d07e53131623dac660b708f6f761457c9afdfee64dc5b0d"
        )
    ]
)
