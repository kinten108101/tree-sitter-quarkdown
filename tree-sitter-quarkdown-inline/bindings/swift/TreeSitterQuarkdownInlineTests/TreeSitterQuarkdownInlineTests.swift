import XCTest
import SwiftTreeSitter
import TreeSitterQuarkdownInline

final class TreeSitterQuarkdownInlineTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_quarkdown_inline())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading QuarkdownInline grammar")
    }
}
