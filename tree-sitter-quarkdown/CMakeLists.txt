set(PROJECT_DESCRIPTION "Quarkdown block grammar for tree-sitter")
set(TS_REQUIRES tree-sitter-quarkdown-inline)

add_parser(quarkdown)

add_custom_target(test "${TREE_SITTER_CLI}" test
                  WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
                  DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/parser.c"
                  COMMENT "tree-sitter test")
