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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.85/DIVEsignSDK-0.0.85.xcframework.zip",
            checksum: "01b93d7fd993aabecdfa220d48ae6d633bb90846674d795589d4aa63f3e94c82"
        )
    ]
)
