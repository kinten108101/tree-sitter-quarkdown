package tree_sitter_quarkdown

// #cgo CPPFLAGS: -I../../tree-sitter-quarkdown-inline
// #cgo CFLAGS: -std=c11 -fPIC
// #include "../../tree-sitter-quarkdown-inline/src/parser.c"
// #include "../../tree-sitter-quarkdown-inline/src/scanner.c"
import "C"

import "unsafe"

// Get the tree-sitter Language for the inline grammar.
func InlineLanguage() unsafe.Pointer {
	return unsafe.Pointer(C.tree_sitter_quarkdown_inline())
}
