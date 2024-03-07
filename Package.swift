// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "phoenix-apns",
    platforms: [
       .macOS(.v13),
       .iOS(.v16)
    ],
    products: [
        .library(name: "PhoenixAPNS", targets: ["PhoenixAPNS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ah01e/phoenixapns.git", branch: "main"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.2"),
    ],
    targets: [
        .target(name: "PhoenixAPNS", dependencies: [
            .product(name: "APNS", package: "phoenixapns"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "PhoenixAPNSTests", dependencies: [
            .target(name: "PhoenixAPNS"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
