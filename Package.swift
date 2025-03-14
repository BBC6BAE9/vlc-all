// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let vlcBinary = Target.binaryTarget(name: "vlc-all", url: "https://github.com/BBC6BAE9/vlc-all/releases/download/4.0.0a10/VLCKit.xcframework.zip", checksum: "978cb8e2497d15f7b8788b3bf42a40e85c95b47daa7b82bc797ba8bf4039c932")

let package = Package(
    name: "vlc-all",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "vlc-all",
            targets: ["vlc-all"]),
    ],
    targets: [
        vlcBinary,
        .target(
            name: "VLCKit",
            dependencies: [
                .target(name: "VLCKit")
            ], linkerSettings: [
                .linkedFramework("QuartzCore", .when(platforms: [.iOS])),
                .linkedFramework("CoreText", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("AVFoundation", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("Security", .when(platforms: [.iOS])),
                .linkedFramework("CFNetwork", .when(platforms: [.iOS])),
                .linkedFramework("AudioToolbox", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("OpenGLES", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("CoreGraphics", .when(platforms: [.iOS])),
                .linkedFramework("VideoToolbox", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("CoreMedia", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("c++", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("xml2", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("z", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("bz2", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("Foundation", .when(platforms: [.macOS])),
                .linkedLibrary("iconv")
            ]),
    ]
)
