// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ProseMirror",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v7), .tvOS(.v14)],
    products: [
        .library(
            name: "ProseMirror",
            targets: ["ProseMirror"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ProseMirror",
            dependencies: []
        ),
        .testTarget(
            name: "ProseMirrorTests",
            dependencies: ["ProseMirror"]
        )
    ]
)
