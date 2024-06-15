// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OggDecoder",
    products: [
        .library(
            name: "OggDecoder",
            targets: ["OggDecoder"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OggDecoder",
            dependencies: ["ogg", "vorbis"],
            path: "Sources/OggDecoderObjC",
            cSettings: [
                .unsafeFlags(["-w"])
            ],
            cxxSettings: [
                .unsafeFlags(["-w"])
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"])
            ],
            linkerSettings: [
                .unsafeFlags(["-w"])
            ]
        ),
        .testTarget(
            name: "OggDecoderTests",
            dependencies: ["OggDecoder"],
            resources: [
                .copy("TestResources/")
            ]),
        .binaryTarget(name: "ogg",
                      path: "ogg.xcframework"),
        .binaryTarget(name: "vorbis",
                      path: "vorbis.xcframework"),

    ]
)
