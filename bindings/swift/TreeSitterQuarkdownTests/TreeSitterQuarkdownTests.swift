import XCTest
import SwiftTreeSitter
import TreeSitterQuarkdown
import TreeSitterQuarkdownInline

final class TreeSitterXMLTests: XCTestCase {
    func testCanLoadBlockGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_quarkdown())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Quarkdown block grammar")
    }

    func testCanLoadInlineGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_quarkdown_inline())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Quarkdown inline grammar")
    }
}
