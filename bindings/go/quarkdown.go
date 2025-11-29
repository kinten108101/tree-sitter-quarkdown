package tree_sitter_quarkdown

// #cgo CPPFLAGS: -I../../tree-sitter-quarkdown
// #cgo CFLAGS: -std=c11 -fPIC
// #include "../../tree-sitter-quarkdown/src/parser.c"
// #include "../../tree-sitter-quarkdown/src/scanner.c"
import "C"

import "unsafe"

// Get the tree-sitter Language for the block grammar.
func Language() unsafe.Pointer {
	return unsafe.Pointer(C.tree_sitter_quarkdown())
}
