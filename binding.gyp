{
  "targets": [
    {
      "target_name": "tree_sitter_quarkdown_binding",
      "dependencies": [
        "<!(node -p \"require('node-addon-api').targets\"):node_addon_api_except",
      ],
      "include_dirs": [
        "tree-sitter-quarkdown/src",
      ],
      "sources": [
        "bindings/node/binding.cc",
        "tree-sitter-quarkdown/src/parser.c",
        "tree-sitter-quarkdown/src/scanner.c",
        "tree-sitter-quarkdown-inline/src/parser.c",
        "tree-sitter-quarkdown-inline/src/scanner.c",
      ],
      "cflags_c": [
        "-std=c11",
      ],
    }
  ]
}
