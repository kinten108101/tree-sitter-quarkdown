import XCTest
import SwiftTreeSitter
import TreeSitterQuarkdown

final class TreeSitterQuarkdownTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_quarkdown())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Quarkdown grammar")
    }
}
