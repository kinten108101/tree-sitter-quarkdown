all install uninstall clean:
	$(MAKE) -C tree-sitter-quarkdown $@
	$(MAKE) -C tree-sitter-quarkdown-inline $@

.PHONY: all install uninstall clean
