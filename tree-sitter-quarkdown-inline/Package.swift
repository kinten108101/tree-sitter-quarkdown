// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterQuarkdownInline",
    products: [
        .library(name: "TreeSitterQuarkdownInline", targets: ["TreeSitterQuarkdownInline"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterQuarkdownInline",
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
            name: "TreeSitterQuarkdownInlineTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterQuarkdownInline",
            ],
            path: "bindings/swift/TreeSitterQuarkdownInlineTests"
        )
    ],
    cLanguageStandard: .c11
)
