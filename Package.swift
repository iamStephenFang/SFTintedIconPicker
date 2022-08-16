// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFTintedIconPicker",
    products: [
        .library(
            name: "SFTintedIconPicker",
            targets: ["SFTintedIconPicker"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SFTintedIconPicker",
            dependencies: [],
            path: "SFTintedIconPicker",
            resources: [
                .process("SFTintedIconPicker/Resource"),
            ]),
    ]
)
