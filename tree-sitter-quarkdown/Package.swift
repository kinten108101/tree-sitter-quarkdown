// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterQuarkdown",
    products: [
        .library(name: "TreeSitterQuarkdown", targets: ["TreeSitterQuarkdown"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterQuarkdown",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterQuarkdownTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterQuarkdown",
            ],
            path: "bindings/swift/TreeSitterQuarkdownTests"
        )
    ],
    cLanguageStandard: .c11
)
