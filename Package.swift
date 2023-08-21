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
    targets: [
        .target(
          name: "FrisbuyStories",
          dependencies: ["FrisbuyStoriesSDK"],
          path: "Sources",
          cSettings: [
              .headerSearchPath(""),
              ]
        ),
        .binaryTarget(name: "FrisbuyStoriesSDK",
                      path: "Artifacts/FrisbuyStoriesSDK.xcframework"),
        .binaryTarget(name: "SDWebImage",
                      path: "Artifacts/SDWebImage.xcframework"),
        .binaryTarget(name: "SDWebImageVideoCoder",
                      path: "Artifacts/SDWebImageVideoCoder.xcframework"),
    ]
)
