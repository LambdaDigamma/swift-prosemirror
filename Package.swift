// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "ProseMirror",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
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
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ProseMirrorTests",
            dependencies: ["ProseMirror"]
        )
    ]
)
