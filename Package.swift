// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DIVEsignSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "DIVEsignSDK", targets: ["DIVEsignSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "DIVEsignSDK",
            path: "DIVEsignSDK.xcframework"
        )
    ]
)
