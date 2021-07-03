// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Algorithms",
    products: [
        .library(name: "Algorithms", targets: ["Algorithms"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Algorithms", dependencies: [], path: "Sources/"),
        .testTarget(name: "BinarySearchTests", dependencies: ["Algorithms"]),
        .testTarget(name: "BubbleSortTests", dependencies: ["Algorithms"]),
        .testTarget(name: "InsertionSortTests", dependencies: ["Algorithms"]),
        .testTarget(name: "QuickSortTests", dependencies: ["Algorithms"]),
    ]
)
