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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.23/DIVEsignSDK-0.0.23.xcframework.zip",
            checksum: "cfdfce8291f8758eb2d944d17d5b986c78cdbcabf344955e9b7321d56e03667c"
        )
    ]
)
