use std::env::args;

use tree_sitter::{InputEdit, Point};
use tree_sitter_md::{QuarkdownParser, QuarkdownTree};

fn main() {
    let filename = args()
        .nth_back(1)
        .take_if(|f| f != "benchmark")
        .unwrap_or("README.md".to_string());
    let source = std::fs::read(filename).unwrap();

    let mut parser = QuarkdownParser::default();
    let mut tree = parser.parse(&source, None).unwrap();
    tree.edit(&InputEdit {
        start_byte: 0,
        old_end_byte: 1,
        new_end_byte: 0,
        start_position: Point::new(0, 0),
        old_end_position: Point::new(0, 1),
        new_end_position: Point::new(0, 0),
    });
    reparse(&mut parser, &source[1..], tree);
}

fn reparse(parser: &mut QuarkdownParser, source: &[u8], old_tree: QuarkdownTree) {
    parser.parse(source, Some(&old_tree)).unwrap();
}
