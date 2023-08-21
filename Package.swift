// swift-tools-version: 5.5.0

import PackageDescription

let package = Package(
    name: "FrisbuyStories",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FrisbuyStories",
            targets: ["FrisbuyStories"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.1.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageVideoCoder.git", from: "0.2.0")
    ],
    targets: [
        .target(
          name: "FrisbuyStories",
          dependencies: ["FrisbuyStoriesSDK"],
          path: "Sources",
          cSettings: [
              .headerSearchPath(""),
              ]
        ),
        .testTarget(
          name: "FrisbuyStoriesTests",
          dependencies: ["FrisbuyStories"]),
        .binaryTarget(name: "FrisbuyStoriesSDK",
                      path: "Artifacts/FrisbuyStoriesSDK.xcframework"),
    ]
)
