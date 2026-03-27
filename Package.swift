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
            url: "https://github.com/Desquared/Digital-Onboarding-SDK-iOS/releases/download/0.0.73/DIVEsignSDK-0.0.73.xcframework.zip",
            checksum: "100e33733b1fd9ba17304e3f2a675095da33188bcdf8a852afc4aa70aafeabd1"
        )
    ]
)
