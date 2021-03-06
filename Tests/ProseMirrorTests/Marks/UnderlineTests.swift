//
//  UnderlineTests.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import XCTest
@testable import ProseMirror

final class UnderlineTests: XCTestCase {
    
    func testUnderline() throws {

        let input = """
        {
            "type": "doc",
            "content": [
                {
                    "type": "text",
                    "text": "Example Text",
                    "marks": [
                        {
                            "type": "underline"
                        }
                    ]
                }
            ]
        }
        """

        let parser = Parser()
        let document = try parser.parse(input)
        
        XCTAssertEqual(document.content.count, 1)
        XCTAssertEqual(document.content, [
            .text(
                NodeText(text: "Example Text", marks: [.underline])
            )
        ])
    }

    static var allTests = [
        ("testUnderline", testUnderline)
    ]
}
