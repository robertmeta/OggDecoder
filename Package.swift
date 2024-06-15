// swift-tools-version:5.9
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
              .unsafeFlags(["", "-Wno-c++11-extensions"], .when(platforms: [.macOS]))
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"])
            ],
            linkerSettings: [
                .unsafeFlags([""])
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
