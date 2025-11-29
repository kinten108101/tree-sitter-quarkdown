// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterQuarkdown",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitterQuarkdown", targets: ["TreeSitterQuarkdown", "TreeSitterQuarkdownInline"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterQuarkdown",
            path: "tree-sitter-quarkdown",
            sources: [
                "src/parser.c",
                "src/scanner.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .target(
            name: "TreeSitterQuarkdownInline",
            path: "tree-sitter-quarkdown-inline",
            exclude: [
                "test",
                "grammar.js",
            ],
            sources: [
                "src/parser.c",
                "src/scanner.c",
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
                "TreeSitterQuarkdownInline",
            ],
            path: "bindings/swift/TreeSitterQuarkdownTests"
        )
    ],
    cLanguageStandard: .c11
)
