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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.1.18/DIVEsignSDK-0.1.18.xcframework.zip",
            checksum: "898b97914d2dbcc77efec36a853df7d94e96a3fcc0b521fe3af0bc99f790cc85"
        )
    ]
)
