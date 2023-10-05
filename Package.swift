// swift-tools-version: 5.5.0

import PackageDescription

let package = Package(
    name: "FrisbuyStories",
    platforms: [.iOS(.v14)],
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
    ]
)
