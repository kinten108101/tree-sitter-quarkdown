package tree_sitter_quarkdown_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_quarkdown "github.com/tree-sitter/tree-sitter-quarkdown/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_quarkdown.Language())
	if language == nil {
		t.Errorf("Error loading Quarkdown grammar")
	}
}
