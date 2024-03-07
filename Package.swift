// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "vapor-apns",
    platforms: [
       .macOS(.v13),
       .iOS(.v16)
    ],
    products: [
        .library(name: "VaporAPNS", targets: ["VaporAPNS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ah01e/APNSwift.git", branch: "main"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.2"),
    ],
    targets: [
        .target(name: "VaporAPNS", dependencies: [
            .product(name: "APNS", package: "APNSwift"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "VaporAPNSTests", dependencies: [
            .target(name: "VaporAPNS"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
