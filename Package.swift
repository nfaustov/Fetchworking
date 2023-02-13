// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Fetchworking",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "Fetchworking",
            targets: ["Fetchworking"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Fetchworking",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "FetchworkingTests",
            dependencies: ["Fetchworking"]
        )
    ]
)
