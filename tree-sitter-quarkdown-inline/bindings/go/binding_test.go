package tree_sitter_quarkdown_inline_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_quarkdown_inline "github.com/tree-sitter/tree-sitter-quarkdown_inline/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_quarkdown_inline.Language())
	if language == nil {
		t.Errorf("Error loading QuarkdownInline grammar")
	}
}
